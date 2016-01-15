using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class QuestionResponseMap : EntityTypeConfiguration<QuestionResponse>
    {
        public QuestionResponseMap()
        {
            // Primary Key
            this.HasKey(t => t.QuestionResponseId);

            // Properties
            // Table & Column Mappings
            this.ToTable("QuestionResponse");
            this.Property(t => t.QuestionResponseId).HasColumnName("QuestionResponseId");
            this.Property(t => t.SurveyResponseId).HasColumnName("SurveyResponseId");
            this.Property(t => t.QuestionOptionId).HasColumnName("QuestionOptionId");
            this.Property(t => t.ResponseText).HasColumnName("ResponseText");
            this.Property(t => t.QuestionId).HasColumnName("QuestionId");

            // Relationships
            this.HasOptional(t => t.Question)
                .WithMany(t => t.QuestionResponses)
                .HasForeignKey(d => d.QuestionId);
            this.HasOptional(t => t.QuestionOption)
                .WithMany(t => t.QuestionResponses)
                .HasForeignKey(d => d.QuestionOptionId);
            this.HasOptional(t => t.SurveyResponse)
                .WithMany(t => t.QuestionResponses)
                .HasForeignKey(d => d.SurveyResponseId);

        }
    }
}
