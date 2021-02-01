using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LMSProject.DATA.EF;
using LMSProject.UI.Models;
using LMSProject.UI.Utilities;
using Microsoft.AspNet.Identity;
using System.Net.Mail;

namespace LMSProject.UI.Controllers
{
    public class LessonsController : Controller
    {
        private LMSProjectEntities db = new LMSProjectEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            //original 
            var lessons = db.Lessons.Include(l => l.Cours).Where(x => x.IsActive);

            //2.Awesomeattempt
            //var lessons2 = db.Lessons.Include(l => l.Cours).Include(y => y.LessonViews.Where(z => z.UserId == User.Identity.GetUserId())).Where(x => x.IsActive);
            return View(lessons.ToList());
        }

        // GET: Inactive Lessons
        public ActionResult InactiveIndex()
        {
            var lessons = db.Lessons.Include(l => l.Cours).Where(x => !x.IsActive);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        
        public ActionResult Details(int? id)
        {
            #region original code
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            #endregion

            #region create a lessonView
            //get the current logged on user into a string
            //string user = 
            string user = User.Identity.Name;
            string theUsersID = User.Identity.GetUserId();
            //check is user is in the role of employee
            if (User.IsInRole("User"))
            {
                LessonView newLV = new LessonView();
                bool myLoop = false;
                int newId = id.Value;
                foreach (LessonView item in db.LessonViews)
                {
                    if (item.LessonId == newId && item.UserId == theUsersID)
                    {
                        myLoop = true;
                    }
                }

                //create the lessionview
                if (myLoop == false)
                {
                    newLV.LessonId = newId;
                    newLV.UserId = theUsersID;
                    newLV.DateViewed = DateTime.Now;
                    db.LessonViews.Add(newLV);
                    db.SaveChanges();
                }
            }
            //check to see if the employee has viewed this object before
            //create a lessonview var and go to lessonviews and see if any match current
            //set boolean value if they have viewed it or not, set as false (default is true)
            //loop through the lessonsViewed run an if to check id passed in lessonID. Will have to cast from ?int into int. if it matches, set bool to true

            //if they have not viewed lesson create a lessonView object userId, lessonId, dateview (datetime.now)

            //call lessonViews in the database and add this to it
            //dv.saveChanges()
            #endregion

            #region create a courseCompletion

            //grab user identity
            //we have user in the region above, outside of { } so we keep it here
            if (User.IsInRole("User"))
            {
                CourseCompletion cc = new CourseCompletion();
                bool myCourseLoop = false;
                //int newId = id.Value;
                int courseParentId = lesson.CourseId;

                //This will check if they have completed the course previously
                foreach (CourseCompletion item in db.CourseCompletions)
                {
                    if (item.CourseId == courseParentId && item.UserId == theUsersID)
                    {
                        myCourseLoop = true;
                    }
                }
                
                //loop through lessons getting number of total lessons in a course
                //int totalLessonsInThisCourse = 0;
                //foreach (Lesson item in db.Lessons)
                //{
                //    if (item.CourseId == courseParentId)
                //    {
                //        totalLessonsInThisCourse++;
                //    }
                //}

                int totalLessonsInThisCourse = db.Lessons.Where(x => x.CourseId == courseParentId).Count();

                //loop through lessonViews getting total number of lessons the user has completed
                //int totalLessonViewsTheUserHasFinished = 0;
                //foreach (LessonView item in db.LessonViews)
                //{
                //    if (item.Lesson.CourseId == courseParentId)
                //    {
                //        totalLessonViewsTheUserHasFinished++;
                //    }
                //}

                int totalLessonViewsTheUserHasFinished = db.LessonViews.Where(x => x.Lesson.CourseId == courseParentId).Where(y => y.UserId == theUsersID).Count();
                
                //This will save it if they have
                if (myCourseLoop == false && totalLessonViewsTheUserHasFinished == totalLessonsInThisCourse)
                {
                    cc.CourseId = courseParentId;
                    cc.UserId = theUsersID;
                    cc.DateCompleted = DateTime.Now;
                    db.CourseCompletions.Add(cc);
                    db.SaveChanges();

                    #region send an email upon course completion
                    ContactViewModel cvm = new ContactViewModel();
                    cvm.Name = User.Identity.Name;
                    cvm.Subject = "FINAL PROJECT COURSE COMPLETION - " + lesson.Cours.CourseName;
                    cvm.Email = User.Identity.Name;
                    cvm.Message = "I HAVE FINISHED THIS COURSE";

                    string emailBody = $"You have received a FINAL PROJECT email where {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response the following message: <br /><br /> {cvm.Message}";

                    MailMessage msg = new MailMessage
                    (
                        //From
                        "no-reply@johndavidswift.com",
                        //To(where the actual message is sent)
                        "jdavidswift@gmail.com",
                        //Subject
                        "Email from johndavidswift.com",
                        //Body
                        emailBody
                    );

                    msg.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient("mail.johndavidswift.com");

                    client.Credentials = new NetworkCredential("no-reply@johndavidswift.com", "LOL_NOPE");
                    client.Port = 8889;

                    try
                    {
                        client.Send(msg);
                    }
                    catch (Exception ex)
                    {
                        ViewBag.ErrorMessage = $"Sorry, something went wrong. Error message: {ex.Message}<br />{ex.StackTrace}";
                        return View(lesson);
                    }


                    #endregion   
                }
            }
            //create new courseCompletion item

            //check if user is in employee role

            //loop through courseCompletions like above with lessonViews

            #endregion

            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase lessonPDF)
        {
            if (ModelState.IsValid)
            {
                lesson.IsActive = true;
                #region PDF File Upload
                string file = "NoFile.pdf";

                if(lessonPDF != null)
                {
                    file = lessonPDF.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));

                    if(ext.ToLower() == ".pdf")
                    {
                        if(lessonPDF.ContentLength <= 4194304)
                        {
                            file = Guid.NewGuid() + ext;
                            string path = Server.MapPath("~/Content/pdfs/" + file);

                            lessonPDF.SaveAs(path);
                            //if (lesson.PdfFilename != "NoFile.pdf")
                            //{
                            //    System.IO.File.Delete(Server.MapPath("~/Content/pdfs/" + lesson.PdfFilename));

                            //}
                            lesson.PdfFilename = file;
                        }
                    }
                }


                #endregion

                #region Youtube Video upload
                if (lesson.VideoURL != null && lesson.VideoURL.Contains("/watch"))
                {
                    lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
                }
                #endregion

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase lessonPDF)
        {
            if (ModelState.IsValid)
            {
                #region PDF File Upload
                //string file = "NoFile.pdf";//Create code
                if (lessonPDF != null)
                {
                    string file = lessonPDF.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    //string[] goodExtensions = { ".pdf" };
                    if (ext.ToLower() == ".pdf")
                    {
                        //ASP.NET max in 1073741824 but I went with below becuase I didnot want to change max request length in web.config.
                        if (lessonPDF.ContentLength <= 4194304)
                        {
                            file = Guid.NewGuid() + ext;
                            string path = Server.MapPath("~/Content/pdfs/" + file);

                            lessonPDF.SaveAs(path);
                            if ( lesson.PdfFilename != "NoFile.pdf")
                            {
                                System.IO.File.Delete(Server.MapPath("~/Content/pdfs/" + lesson.PdfFilename));
                                
                            }
                            lesson.PdfFilename = file;
                        }
                        
                    }
                }
                #endregion

                #region Youtube Video upload
                if (lesson.VideoURL != null && lesson.VideoURL.Contains("/watch"))
                {
                    lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
                }
                #endregion

                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
