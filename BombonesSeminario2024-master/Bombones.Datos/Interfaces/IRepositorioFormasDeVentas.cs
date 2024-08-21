using Bombones.Entidades.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bombones.Datos.Interfaces
{
    public interface IRepositorioFormasDeVentas
    {
        void Agregar(FormaDeVenta? forma,SqlConnection? conexion,SqlTransaction? tran=null);
        void Borrar(int formaId, SqlConnection? conexion, SqlTransaction? tran = null);
        void Editar(FormaDeVenta? forma, SqlConnection conexion, SqlTransaction? tran = null);
        bool Existe(FormaDeVenta? forma, SqlConnection conexion);
        List<FormaDeVenta> GetLista(SqlConnection conexion);
    }
}
