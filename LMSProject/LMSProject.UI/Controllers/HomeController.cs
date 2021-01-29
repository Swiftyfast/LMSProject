using LMSProject.UI.Models;
using System.Web.Mvc;
using System;
using System.Net;
using System.Net.Mail;

namespace LMSProject.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        //[HttpGet]
        //[Authorize]
        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your app description page.";

        //    return View();
        //}

        public ActionResult Contact()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string emailBody = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response the following message: <br /><br /> {cvm.Message}";

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

            client.Credentials = new NetworkCredential("no-reply@johndavidswift.com", "Ravens75!");
            client.Port = 8889;

            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = $"Sorry, something went wrong. Error message: {ex.Message}<br />{ex.StackTrace}";
                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }
    }
}
