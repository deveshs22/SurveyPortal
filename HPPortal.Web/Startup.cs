using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HPPortal.Web.Startup))]
namespace HPPortal.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
