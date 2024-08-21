using Bombones.Datos.Interfaces;
using Bombones.Entidades.Entidades;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bombones.Datos.Repositorios
{
    public class RepositorioFormasDeVentas : IRepositorioFormasDeVentas
    {
        public void Agregar(FormaDeVenta? forma,SqlConnection? conexion,SqlTransaction? tran)
        {
            string InsertQuery = @"INSERT INTO FormasDeVentas(Descripcion) VALUES (@Descripcion);
                                   SELECT SCOPE_IDENTITY()";
            int pk=conexion.QuerySingle<int>(InsertQuery, forma, tran);
            if (pk==0)throw new Exception("No fue posible agregar el tipo de venta");
            forma.FormaDeVentaId = pk;
        }

        public void Borrar(int formaId,SqlConnection? conexion, SqlTransaction? tran)
        {
            string DeleteQuery = "DELETE FROM FormasDeVentas WHERE FormaDeVentaId=@FormaDeVentaId";
            int rows = conexion.Execute(DeleteQuery, new { formaId }, tran);
            if (rows == 0) throw new Exception("No fue posible borrar el tipo de venta");
        }

        public void Editar(FormaDeVenta forma, SqlConnection conexion, SqlTransaction? tran)
        {
            string UpdateQuery = @"UPDATE FormasDeVentas SET(Descripcion=@Descripcion)
                                    WHERE FormaDeVentaId=@FormaDeVentaId";
            int rows = conexion.Execute(UpdateQuery, forma, tran);
            if (rows == 0) throw new Exception("No fue posible editar el tipo de venta");
        }

        public bool Existe(FormaDeVenta forma, SqlConnection conexion)
        {
            string SelectQuery = @"SELECT COUNT(*) FROM FormasDeVentas 
                                 WHERE Descripcion=@Descripcion";
            if (forma.FormaDeVentaId!=0)
            {
                SelectQuery += " AND FormaDeVentaId!=@FormaDeVentaId";
            }
            return conexion.Execute(SelectQuery, forma) > 0;
        }

        public List<FormaDeVenta> GetLista(SqlConnection conexion)
        {
            string SelectQuery = "SELECT FormaVentaId,Descripcion FROM FormasDeVentas";
            return conexion.Query<FormaDeVenta>(SelectQuery).ToList();
        }
    }
}
