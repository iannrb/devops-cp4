using Microsoft.AspNetCore.Mvc;

namespace DevOpsCp4.Controllers
{
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet("api/health")]
        public IActionResult Health()
        {
            return Ok("DevOps CP4 .NET Application is running!");
        }
    }
} 