using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class QuestionTypeMap : EntityTypeConfiguration<QuestionType>
    {
        public QuestionTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.QuestionTypeId);

            // Properties
            this.Property(t => t.QuestionTypeId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.QuestionTypeDesc)
                .IsRequired()
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("QuestionType");
            this.Property(t => t.QuestionTypeId).HasColumnName("QuestionTypeId");
            this.Property(t => t.QuestionTypeDesc).HasColumnName("QuestionTypeDesc");
            this.Property(t => t.Active).HasColumnName("Active");
        }
    }
}
