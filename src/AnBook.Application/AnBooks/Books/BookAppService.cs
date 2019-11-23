using AnBook.AnBooks.Books.Dto;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace AnBook.AnBooks.Books
{
    public class BookAppService: AnBookAppServiceBase, IBookAppService
    {
        private readonly IBookService _bookService;
        private readonly ILogger<BookAppService> _logger;

        public BookAppService(IBookService bookService,ILogger<BookAppService> logger)
        {
            _bookService = bookService;
            _logger = logger;
        }

        public async Task<int> AddBookAsync(AddBookInput input)
        {
           var result= await _bookService.AddBookAsync(input);
           return result;
        }
    }
}