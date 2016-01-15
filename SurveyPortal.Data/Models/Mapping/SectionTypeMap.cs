using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class SectionTypeMap : EntityTypeConfiguration<SectionType>
    {
        public SectionTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.SectionTypeId);

            // Properties
            this.Property(t => t.SectionTypeId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.SectionTypeDesc)
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("SectionType");
            this.Property(t => t.SectionTypeId).HasColumnName("SectionTypeId");
            this.Property(t => t.SectionTypeDesc).HasColumnName("SectionTypeDesc");
            this.Property(t => t.Active).HasColumnName("Active");
        }
    }
}
