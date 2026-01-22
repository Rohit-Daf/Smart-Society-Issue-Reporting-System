using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueService.Models
{
    [Table("ISSUE", Schema = "issues")]
    public class Issue
    {
        [Key]
        public int IssueId { get; set; }

        [Required]
        [MaxLength(200)]
        public string Title { get; set; }

        public string Description { get; set; }

        [MaxLength(50)]
        public string Category { get; set; }

        [MaxLength(20)]
        public string Priority { get; set; }

        [MaxLength(20)]
        public string Status { get; set; }

        [MaxLength(20)]
        public string FlatNo { get; set; }

        public DateTime CreatedAt { get; set; }

        public int CreatedBy { get; set; }
    }
}
