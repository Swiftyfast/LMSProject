﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LMSProject.DATA.EF;
using LMSProject.UI.Utilities;

namespace LMSProject.UI.Controllers
{
    public class LessonsController : Controller
    {
        private LMSProjectEntities db = new LMSProjectEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Cours).Where(x => x.IsActive);
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
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
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
                #region File Upload
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
                            lesson.PdfFilename = file;
                            if ( lesson.PdfFilename != "NoFile.pdf")
                            {
                                System.IO.File.Delete(Server.MapPath("~/Content/pdfs/" + lesson.PdfFilename));
                                
                            }
                            //lesson.PdfFilename = file;
                        }
                        
                    }
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