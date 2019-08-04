using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using AnBook.Configuration;

namespace AnBook.Web.Host.Startup
{
    [DependsOn(
       typeof(AnBookWebCoreModule))]
    public class AnBookWebHostModule: AbpModule
    {
        private readonly IHostingEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public AnBookWebHostModule(IHostingEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(AnBookWebHostModule).GetAssembly());
        }
    }
}
