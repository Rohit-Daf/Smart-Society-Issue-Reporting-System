using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueService.Models
{
    [Table("COMMENT", Schema = "issues")]
    public class Comment
    {
        [Key]
        public int CommentId { get; set; }

        [Required]
        public int IssueId { get; set; }

        [Required]
        public int UserId { get; set; }

        public string Message { get; set; }

        public DateTime CreatedAt { get; set; }
    }
}
