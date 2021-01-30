﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace LMSProject.DATA.EF//.Metadata
{
    //class Metadata
    //{
    #region Course Metadata
    public class CourseMetadata
    {
        //Below is coded out because it will be automatically generated by SSMS
        //public int CourseId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [StringLength(200, ErrorMessage = "* Course Name must be 200 characters or less. *")]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }

        [StringLength(500, ErrorMessage = "* Course Description must be 500 characters or less. *")]
        [Display(Name = "Description")]
        public string CourseDescription { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course { }

    #endregion

    #region CourseCompletion Metadata
    public class CourseCompletionMetadata
    {
        //public int CourseCompletionId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "User ID")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "Course ID")]
        public int CourseId { get; set; }

        //Probably don't need the requried if we wire this up correctly. Coding out now so it doesn't yell at me when I try and submit it blank.
        //[Required(ErrorMessage = "* Required *")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime DateCompleted { get; set; }

        //I don't think I need the below because there is already UserId and CourseId above
        // public virtual Course Course { get; set; }
        //public virtual UserDetail UserDetail { get; set; }
    }

    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion { }
    #endregion

    #region Lesson Metadata
    public class LessonMetadata
    {
        //public int LessonId { get; set; }
        [Required(ErrorMessage = "* Required *")]
        [StringLength(200, ErrorMessage = "* Lesson Title must be 200 characters or less. *")]
        [Display(Name = "Lesson Name")]
        public string LessonTitle { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "Course")]
        public int CourseId { get; set; }

        [StringLength(300, ErrorMessage = "* Lesson Title must be 200 characters or less. *")]
        [Display(Name = "Introduction")]
        [UIHint("MultilineText")]
        public string Introduction { get; set; }

        [StringLength(250, ErrorMessage = "* Lesson Title must be 200 characters or less. *")]
        [Display(Name = "Video URL")]
        public string VideoURL { get; set; }

        [StringLength(100, ErrorMessage = "* Lesson Title must be 200 characters or less. *")]
        [Display(Name = "PDF file name")]
        public string PdfFilename { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson { }
    #endregion

    #region LessonView Metadata
    public class LessonViewMetadata
    {
        //public int LessonViewId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "User ID")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [Display(Name = "Lesson")]
        public int LessonId { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime DateViewed { get; set; }
    }

    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView { }
    #endregion

    #region UserDetails Metadata
    public class UserDetailsMetadata
    {
        //Maybe no user create?
        [Required(ErrorMessage = "* Required *")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [StringLength(50, ErrorMessage = "* First Name must be 50 characters or less. *")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [StringLength(50, ErrorMessage = "* Last Name must be 50 characters or less. *")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }

    [MetadataType(typeof(UserDetailsMetadata))]
    public partial class UserDetail
    {

        [Display(Name = "User")]
        public string FullName { get { return LastName + ", " + FirstName; } }

    }
    #endregion
    //}
}
