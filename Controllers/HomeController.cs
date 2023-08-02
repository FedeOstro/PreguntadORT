using Microsoft.AspNetCore.Mvc;

namespace Tp07.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
