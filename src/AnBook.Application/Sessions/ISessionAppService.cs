using System.Threading.Tasks;
using Abp.Application.Services;
using AnBook.Sessions.Dto;

namespace AnBook.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
