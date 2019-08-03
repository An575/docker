using System.Threading.Tasks;
using AnBook.Configuration.Dto;

namespace AnBook.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
