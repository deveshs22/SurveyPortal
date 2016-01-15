using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class SurveyTitleMap : EntityTypeConfiguration<SurveyTitle>
    {
        public SurveyTitleMap()
        {
            // Primary Key
            this.HasKey(t => t.SurveyTitleId);

            // Properties
            this.Property(t => t.SurveyTitle1)
                .HasMaxLength(1000);

            this.Property(t => t.FirendlyUrl)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("SurveyTitle");
            this.Property(t => t.SurveyTitleId).HasColumnName("SurveyTitleId");
            this.Property(t => t.SurveyTitle1).HasColumnName("SurveyTitle");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.FirendlyUrl).HasColumnName("FirendlyUrl");
        }
    }
}
