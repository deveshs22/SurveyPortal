using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class SurveyInterpretationMap : EntityTypeConfiguration<SurveyInterpretation>
    {
        public SurveyInterpretationMap()
        {
            // Primary Key
            this.HasKey(t => t.SurveyInterpretationId);

            // Properties
            this.Property(t => t.Title)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("SurveyInterpretation");
            this.Property(t => t.SurveyInterpretationId).HasColumnName("SurveyInterpretationId");
            this.Property(t => t.SurveyTitleId).HasColumnName("SurveyTitleId");
            this.Property(t => t.Title).HasColumnName("Title");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.ScoreTitle).HasColumnName("ScoreTitle");
            this.Property(t => t.ResultTitle).HasColumnName("ResultTitle");
            this.Property(t => t.ActionTitle).HasColumnName("ActionTitle");
            this.Property(t => t.Footer).HasColumnName("Footer");

            // Relationships
            this.HasRequired(t => t.SurveyTitle)
                .WithMany(t => t.SurveyInterpretations)
                .HasForeignKey(d => d.SurveyTitleId);

        }
    }
}
