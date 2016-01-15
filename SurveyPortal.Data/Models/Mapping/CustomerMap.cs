using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SurveyPortal.Data.Models.Mapping
{
    public class CustomerMap : EntityTypeConfiguration<Customer>
    {
        public CustomerMap()
        {
            // Primary Key
            this.HasKey(t => t.CustomerId);

            // Properties
            this.Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(150);

            this.Property(t => t.Email)
                .HasMaxLength(150);

            this.Property(t => t.Phone)
                .HasMaxLength(50);

            this.Property(t => t.Gender)
                .HasMaxLength(10);

            this.Property(t => t.Pwd)
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("Customer");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.Name).HasColumnName("Name");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.Phone).HasColumnName("Phone");
            this.Property(t => t.DOB).HasColumnName("DOB");
            this.Property(t => t.Gender).HasColumnName("Gender");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.Pwd).HasColumnName("Pwd");
        }
    }
}
