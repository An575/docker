using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace AnBook.Controllers
{
    public abstract class AnBookControllerBase: AbpController
    {
        protected AnBookControllerBase()
        {
            LocalizationSourceName = AnBookConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
