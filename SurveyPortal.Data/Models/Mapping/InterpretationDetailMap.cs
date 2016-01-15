using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class InterpretationDetailMap : EntityTypeConfiguration<InterpretationDetail>
    {
        public InterpretationDetailMap()
        {
            // Primary Key
            this.HasKey(t => t.InterpretationDetailId);

            // Properties
            this.Property(t => t.Result)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("InterpretationDetail");
            this.Property(t => t.InterpretationDetailId).HasColumnName("InterpretationDetailId");
            this.Property(t => t.SurveyInterpretationId).HasColumnName("SurveyInterpretationId");
            this.Property(t => t.ScoreRangeStart).HasColumnName("ScoreRangeStart");
            this.Property(t => t.ScoreRangeEnd).HasColumnName("ScoreRangeEnd");
            this.Property(t => t.Result).HasColumnName("Result");
            this.Property(t => t.Action).HasColumnName("Action");

            // Relationships
            this.HasRequired(t => t.SurveyInterpretation)
                .WithMany(t => t.InterpretationDetails)
                .HasForeignKey(d => d.SurveyInterpretationId);

        }
    }
}
