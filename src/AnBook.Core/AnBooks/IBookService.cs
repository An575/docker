using System.Threading.Tasks;
using Abp.Domain.Services;
using AnBook.AnBooks.Books.Dto;

namespace AnBook.AnBooks
{
    public interface IBookService:IDomainService
    {
        Task<int> AddBookAsync(AddBookInput input);

    }
}