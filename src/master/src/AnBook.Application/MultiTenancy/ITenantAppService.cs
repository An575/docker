using Abp.Application.Services;
using Abp.Application.Services.Dto;
using AnBook.MultiTenancy.Dto;

namespace AnBook.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

