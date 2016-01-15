using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class SurveyResponseMap : EntityTypeConfiguration<SurveyResponse>
    {
        public SurveyResponseMap()
        {
            // Primary Key
            this.HasKey(t => t.SurveyResponseId);

            // Properties
            // Table & Column Mappings
            this.ToTable("SurveyResponse");
            this.Property(t => t.SurveyResponseId).HasColumnName("SurveyResponseId");
            this.Property(t => t.SurveyTitleId).HasColumnName("SurveyTitleId");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.ApproverUserId).HasColumnName("ApproverUserId");
            this.Property(t => t.ResponseDate).HasColumnName("ResponseDate");
            this.Property(t => t.ApprovalDate).HasColumnName("ApprovalDate");

            // Relationships
            this.HasOptional(t => t.Customer)
                .WithMany(t => t.SurveyResponses)
                .HasForeignKey(d => d.CustomerId);
            this.HasOptional(t => t.SurveyTitle)
                .WithMany(t => t.SurveyResponses)
                .HasForeignKey(d => d.SurveyTitleId);
            this.HasOptional(t => t.User)
                .WithMany(t => t.SurveyResponses)
                .HasForeignKey(d => d.ApproverUserId);

        }
    }
}
