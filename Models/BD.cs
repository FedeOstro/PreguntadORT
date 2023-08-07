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
        if(Dificultad >= 0 && Categoria >= 0){
            string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria AND IdDificultad = @pDificultad";
        }else if(Dificultad == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria";
        }else if(Categoria == -1){
            string sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pDificultad";
        }
        using(SqlConnection db = new SqlConnection(_connectionString)){
            ListaPregunta = db.Query<Pregunta>(sql).ToList();      
        }
        return ListaPregunta;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas){
        List<Respuesta> ListaRespuestas = null;
        foreach (Pregunta pregunta in preguntas)
        {
            
        }
        return ListaRespuestas;
    }
}