using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LMSProject.UI.Startup))]
namespace LMSProject.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
