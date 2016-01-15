using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class QuestionMap : EntityTypeConfiguration<Question>
    {
        public QuestionMap()
        {
            // Primary Key
            this.HasKey(t => t.QuestionId);

            // Properties
            this.Property(t => t.Question1)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("Question");
            this.Property(t => t.QuestionId).HasColumnName("QuestionId");
            this.Property(t => t.Question1).HasColumnName("Question");
            this.Property(t => t.QuestionTypeId).HasColumnName("QuestionTypeId");
            this.Property(t => t.SurveySectionId).HasColumnName("SurveySectionId");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.DependentQuestionId).HasColumnName("DependentQuestionId");
            this.Property(t => t.EnabledValue).HasColumnName("EnabledValue");

            // Relationships
            this.HasOptional(t => t.DependentonQuestion)
                .WithMany(t => t.QuestionsDependent)
                .HasForeignKey(d => d.DependentQuestionId);
            this.HasRequired(t => t.QuestionType)
                .WithMany(t => t.Questions)
                .HasForeignKey(d => d.QuestionTypeId);
            this.HasRequired(t => t.SurveySection)
                .WithMany(t => t.Questions)
                .HasForeignKey(d => d.SurveySectionId);

        }
    }
}
