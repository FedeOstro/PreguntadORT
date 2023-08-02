using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

public class BD{
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";
    public static void ObtenerCategorias(){
        List<string> ListaCategorias = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Categorias";
            ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
    }

    public static void ObtenerDificultades(){
        list<string> ListaDificultades = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Dificultades";
            ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }     
    }
}