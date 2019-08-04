using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using AnBook.Authorization;

namespace AnBook
{
    [DependsOn(
        typeof(AnBookCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class AnBookApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<AnBookAuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(AnBookApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddProfiles(thisAssembly)
            );
        }
    }
}
