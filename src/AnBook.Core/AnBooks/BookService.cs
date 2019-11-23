using System.Threading.Tasks;
using Abp.AutoMapper;
using Abp.Domain.Repositories;
using Abp.Domain.Services;
using Abp.Runtime.Session;
using AnBook.AnBooks.Books;
using AnBook.AnBooks.Books.Dto;

namespace AnBook.AnBooks
{
    public class BookService:DomainService,IBookService
    {
        private readonly IRepository<Book> _bookResRepository;

        private readonly IAbpSession _abpSession;

        public BookService(IRepository<Book> bookResRepository,IAbpSession abpSession)
        {
            _bookResRepository = bookResRepository;
            _abpSession = abpSession;
        }

        public async Task<int> AddBookAsync(AddBookInput input)
        {
            var model = input.MapTo<Book>();
            model.TenantId = _abpSession.TenantId;
            var id = await _bookResRepository.InsertAndGetIdAsync(model);
            return id;
        }
    }
}