using System.Threading.Tasks;
using Abp.Application.Services;
using AnBook.AnBooks.Books.Dto;

namespace AnBook.AnBooks.Books
{
    public interface IBookAppService:IApplicationService
    {
        Task<int> AddBookAsync(AddBookInput input);
    }
}