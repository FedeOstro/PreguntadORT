using Microsoft.AspNetCore.Mvc;

public class Juego{
    private static string _username {get; set;}
    private static int _puntajeActual {get; set;}
    private static int  _cantidadPreguntasCorrectas {get; set;}
    public static List<Pregunta> _preguntas {get; set;}
    private static List<Respuesta> _respuestas {get; set;}

    public static void InicializarJuego(){
        _username = "";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
    }

    public static List<Categoria> ObtenerCategorias(){
        return(BD.ObtenerCategorias());
    }

    public static List<Dificultad> ObtenerDificultades(){
        return(BD.ObtenerDificultades());
    }

    public static void CargarPartida(string username, int dificultad, int categorias){
        _preguntas = BD.ObtenerPreguntas(dificultad, categorias);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
        _username = username;
    }

    public static Pregunta ObtenerProximaPregunta(){
        int n = -1;
        if(n > -1){
            _preguntas.RemoveAt(n);
            _respuestas.RemoveAt(n);
            n = random(0, _preguntas.Count);
        }else{
            n = random(0, _preguntas.Count);
        }
        return(_preguntas[n]);
    }

    private static int random(int inicio, int fin){
        int n;
        Random random = new Random();
        n = random.Next(inicio, fin);
        return n;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
        List<Respuesta> responsas = null;
        foreach(Respuesta R in _respuestas){
        if(R.IdPregunta == idPregunta){
            responsas.Add(R);
        }
        }
        return responsas;
    }

    public static bool VerificarRespuestas(int idPregunta, int idRespuesta){
        bool Correcta = BD.ObtenerRespuesta(idRespuesta);
        if(Correcta == true){
            _puntajeActual++;
            _cantidadPreguntasCorrectas++;
            BD.BorrarPregunta(idPregunta);
        }
        return Correcta;
    }




}
