using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

public class BD{
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias(){
        List<Categoria> ListaCategorias = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Categorias";
            ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
        return ListaCategorias;
    }

    public static List<Dificultad> ObtenerDificultades(){
        List<Dificultad> ListaDificultades = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Dificultades";
            ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }     
        return ListaDificultades;
    }

    public static List<Pregunta> ObtenerPreguntas(int Dificultad, int Categoria){
        List<Pregunta> ListaPregunta = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
        if(Dificultad >= 0 && Categoria >= 0){
            string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria AND IdDificultad = @pDificultad";
            ListaPregunta = db.Query<Pregunta>(sql, new {pCategoria = Categoria, pDificultad = Dificultad}).ToList();   
        }else if(Dificultad == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria";
            ListaPregunta = db.Query<Pregunta>(sql, new {pCategoria = Categoria}).ToList();
        }else if(Categoria == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pDificultad";
            ListaPregunta = db.Query<Pregunta>(sql, new {pDificultad = Dificultad}).ToList();
        }
        }
        return ListaPregunta;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas){
        List<Respuesta> ListaRespuestas = null;
        List<Respuesta> respuestan = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
        foreach (Pregunta pregunta in preguntas)
        {
            string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pIdPregunta";
            respuestan = db.Query<Respuesta>(sql, new{pIdPregunta = pregunta.IdPregunta}).ToList();
            ListaRespuestas.AddRange (respuestan);
        }
        }
        return ListaRespuestas;
    }

    public static bool ObtenerRespuesta(int IdRespuesta){
        bool Correcta = false;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT Correcta FROM Respuesta WHERE IdRespuesta = @pIdRespuesta";
            Correcta = db.QueryFirstOrDefault<bool>(sql, new{pIdRespuesta = IdRespuesta});
        }
        return Correcta;
    }

    public static void BorrarPregunta(int IdPregunta){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "DELETE FROM Preguntas WHERE IdPregunta = @pIdPregunta";
            db.Execute(sql, new{pIdPregunta = IdPregunta});
        }
    }
}