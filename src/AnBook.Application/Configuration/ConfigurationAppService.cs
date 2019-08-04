using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using AnBook.Configuration.Dto;

namespace AnBook.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : AnBookAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
