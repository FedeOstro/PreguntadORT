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
        if(Juego._preguntas.Count>0){
            return RedirectToAction("Jugar");
        }else{
            return RedirectToAction("ConfigurarJuego");
        }
    }

    public IActionResult Jugar(){
        if(Juego.n > -1){
            Juego._preguntas.RemoveAt(Juego.n);
            Juego._respuestas.RemoveAt(Juego.n);
        }
        if(Juego._preguntas.Count == 0){
         return RedirectToAction("Fin");
        }
        ViewBag.Preguntas = Juego.ObtenerProximaPregunta();
        ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Preguntas.IdPregunta);
        ViewBag.nombre = Juego._username;
        ViewBag.puntos = Juego._puntajeActual;
        return View("Juego");
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
       bool rta = Juego.VerificarRespuestas(idPregunta, idRespuesta);
       ViewBag.nombre = Juego._username;
       ViewBag.puntos = Juego._puntajeActual;
       if(rta == true){
         return View("RespuestaCorrecta");
       }else{
         return View("RespuestaIncorrecta");
       }
    }

    public IActionResult Creditos(){
        return View();
    }

    public IActionResult Fin(){
        ViewBag.nombre = Juego._username;
        ViewBag.puntos = Juego._puntajeActual;
        return View();
    }
}
