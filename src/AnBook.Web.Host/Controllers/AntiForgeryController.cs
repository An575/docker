using Microsoft.AspNetCore.Antiforgery;
using AnBook.Controllers;

namespace AnBook.Web.Host.Controllers
{
    public class AntiForgeryController : AnBookControllerBase
    {
        private readonly IAntiforgery _antiforgery;

        public AntiForgeryController(IAntiforgery antiforgery)
        {
            _antiforgery = antiforgery;
        }

        public void GetToken()
        {
            _antiforgery.SetCookieTokenAndHeader(HttpContext);
        }
    }
}
