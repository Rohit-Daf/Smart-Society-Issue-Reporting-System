using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IssueService.Models
{
    [Table("AUDITLOG", Schema = "issues")]
    public class AuditLog
    {
        [Key]
        public int LogId { get; set; }

        [Required]
        public int UserId { get; set; }

        public string Action { get; set; }

        public string EntityType { get; set; }

        public int EntityId { get; set; }

        public DateTime Timestamp { get; set; }
    }
}
