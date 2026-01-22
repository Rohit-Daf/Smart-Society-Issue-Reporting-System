using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueService.Models
{
    [Table("ASSIGNMENT", Schema = "issues")]
    public class Assignment
    {
        [Key]
        public int AssignmentId { get; set; }

        [Required]
        public int IssueId { get; set; }

        [Required]
        public int StaffId { get; set; }

        public DateTime AssignedAt { get; set; }
    }
}
