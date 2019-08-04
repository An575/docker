using System.Threading.Tasks;
using Abp.Application.Services;
using AnBook.Authorization.Accounts.Dto;

namespace AnBook.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
