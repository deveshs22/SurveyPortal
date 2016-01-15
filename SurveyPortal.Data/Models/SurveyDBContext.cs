using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using SurveyPortal.Data.Models.Mapping;

namespace SurveyPortal.Data.Models
{
    public partial class SurveyDBContext : DbContext
    {
        static SurveyDBContext()
        {
            Database.SetInitializer<SurveyDBContext>(null);
        }

        public SurveyDBContext()
            : base("Name=SurveyDBContext")
        {
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<InterpretationDetail> InterpretationDetails { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<QuestionOption> QuestionOptions { get; set; }
        public DbSet<QuestionResponse> QuestionResponses { get; set; }
        public DbSet<QuestionType> QuestionTypes { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<SectionType> SectionTypes { get; set; }
        public DbSet<SurveyInterpretation> SurveyInterpretations { get; set; }
        public DbSet<SurveyResponse> SurveyResponses { get; set; }
        public DbSet<SurveySection> SurveySections { get; set; }
        public DbSet<SurveyTitle> SurveyTitles { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CustomerMap());
            modelBuilder.Configurations.Add(new InterpretationDetailMap());
            modelBuilder.Configurations.Add(new QuestionMap());
            modelBuilder.Configurations.Add(new QuestionOptionMap());
            modelBuilder.Configurations.Add(new QuestionResponseMap());
            modelBuilder.Configurations.Add(new QuestionTypeMap());
            modelBuilder.Configurations.Add(new RoleMap());
            modelBuilder.Configurations.Add(new SectionTypeMap());
            modelBuilder.Configurations.Add(new SurveyInterpretationMap());
            modelBuilder.Configurations.Add(new SurveyResponseMap());
            modelBuilder.Configurations.Add(new SurveySectionMap());
            modelBuilder.Configurations.Add(new SurveyTitleMap());
            modelBuilder.Configurations.Add(new UserMap());
        }
    }
}
