using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using AnBook.Roles.Dto;
using AnBook.Users.Dto;

namespace AnBook.Users
{
    public interface IUserAppService : IAsyncCrudAppService<UserDto, long, PagedUserResultRequestDto, CreateUserDto, UserDto>
    {
        Task<ListResultDto<RoleDto>> GetRoles();

        Task ChangeLanguage(ChangeUserLanguageDto input);
    }
}
