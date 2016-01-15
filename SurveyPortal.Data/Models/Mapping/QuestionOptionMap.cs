using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class QuestionOptionMap : EntityTypeConfiguration<QuestionOption>
    {
        public QuestionOptionMap()
        {
            // Primary Key
            this.HasKey(t => t.QuestionOptionId);

            // Properties
            this.Property(t => t.QuestionOption1)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("QuestionOption");
            this.Property(t => t.QuestionOptionId).HasColumnName("QuestionOptionId");
            this.Property(t => t.QuestionOption1).HasColumnName("QuestionOption");
            this.Property(t => t.QuestionId).HasColumnName("QuestionId");
            this.Property(t => t.Value).HasColumnName("Value");
            this.Property(t => t.Active).HasColumnName("Active");

            // Relationships
            this.HasRequired(t => t.Question)
                .WithMany(t => t.QuestionOptions)
                .HasForeignKey(d => d.QuestionId);

        }
    }
}
