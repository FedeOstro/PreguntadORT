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
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username, dificultad, categoria);
        Console.WriteLine(username, dificultad, categoria);
        if(Juego._preguntas.Count>0){
            return RedirectToAction("Jugar", new {usernames = username});
        }else{
            return RedirectToAction("ConfigurarJuego");
        }
    }

    public IActionResult Jugar(string usernames){
        ViewBag.Preguntas = Juego.ObtenerProximaPregunta();
        ViewBag.nombre = usernames;
        Juego._puntajeActual = 0;
        ViewBag.puntos = Juego._puntajeActual;
        if(Juego._preguntas==null){
         return RedirectToAction("Fin");
        }
        return View("Juego");
    }

    [HttpPost]public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
       ViewBag.Respuesta = Juego.VerificarRespuestas(idPregunta, idRespuesta);
       return View();
    }

    public IActionResult Creditos(){
        return View();
    }
}
