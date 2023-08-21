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
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username, dificultad, categoria);
        if(Juego._preguntas.Count>0){
            return RedirectToAction("Jugar");
        }else{
            return RedirectToAction("ConfigurarJuego");
        }
    }

    public IActionResult Jugar(){
        ViewBag.Preguntas = Juego.ObtenerProximaPregunta();
    if(Juego._preguntas==null){
    return RedirectToAction("Fin");
    }
        return View("Juego");
    }

    [HttpPost]public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
       ViewBag.Respuesta = Juego.VerificarRespuestas(idPregunta, idRespuesta);
       return View();
    }
}
