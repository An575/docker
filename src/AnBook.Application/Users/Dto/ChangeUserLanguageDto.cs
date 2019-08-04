using System.ComponentModel.DataAnnotations;

namespace AnBook.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}