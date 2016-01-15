using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class SurveySectionMap : EntityTypeConfiguration<SurveySection>
    {
        public SurveySectionMap()
        {
            // Primary Key
            this.HasKey(t => t.SurveySectionId);

            // Properties
            // Table & Column Mappings
            this.ToTable("SurveySection");
            this.Property(t => t.SurveySectionId).HasColumnName("SurveySectionId");
            this.Property(t => t.SurveySectionTtile).HasColumnName("SurveySectionTtile");
            this.Property(t => t.SurveySectionDesc).HasColumnName("SurveySectionDesc");
            this.Property(t => t.SurveyTitleId).HasColumnName("SurveyTitleId");
            this.Property(t => t.SectionTypeId).HasColumnName("SectionTypeId");
            this.Property(t => t.DisplaySectionHeader).HasColumnName("DisplaySectionHeader");
            this.Property(t => t.Active).HasColumnName("Active");

            // Relationships
            this.HasRequired(t => t.SectionType)
                .WithMany(t => t.SurveySections)
                .HasForeignKey(d => d.SectionTypeId);
            this.HasRequired(t => t.SurveyTitle)
                .WithMany(t => t.SurveySections)
                .HasForeignKey(d => d.SurveyTitleId);

        }
    }
}
