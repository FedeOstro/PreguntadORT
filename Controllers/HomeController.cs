using Microsoft.AspNetCore.Mvc;

namespace Tp07.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Dificultades = Dificultades;
        ViewBag.Categorias = Categorias;
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username, dificultad, categoria);
        if(Juego.Preguntas.Count>0){
            return RedirectToAction("Jugar")
        }else{
            return RedirectToAction("ConfigurarJuego")
        }
    }

    public IActionResult Jugar(){
        
    }
}
