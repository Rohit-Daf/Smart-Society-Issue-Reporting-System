using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueService.Models
{
    [Table("STAFF", Schema = "issues")]
    public class Staff
    {
        [Key]
        public int StaffId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [MaxLength(50)]
        public string Role { get; set; }

        [MaxLength(15)]
        public string Phone { get; set; }
    }
}
