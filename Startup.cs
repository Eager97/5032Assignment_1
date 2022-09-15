using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_5032Assignment_1.Startup))]
namespace _5032Assignment_1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
