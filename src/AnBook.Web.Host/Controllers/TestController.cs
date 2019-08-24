using AnBook.Controllers;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace AnBook.Web.Host.Controllers
{
    [Route("api/[controller]/[action]")]
    public class TestController : AnBookControllerBase
    {
        private readonly IHostingEnvironment _env;

        public TestController(IHostingEnvironment env)
        {
            _env = env;
        }

        [HttpPost]
        public ActionResult Env()
        {
            var appName = _env.ApplicationName;
            var envName = _env.EnvironmentName;
            return Json(JsonConvert.SerializeObject(new { appName, envName }));
        }
    }
}