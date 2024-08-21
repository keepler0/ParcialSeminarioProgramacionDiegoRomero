using Bombones.Entidades.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bombones.Servicios.Intefaces
{
    public interface IServiciosFormasDeVentas
    {
        void Guardar(FormaDeVenta forma);
        void Borrar(int formaId);
        bool Existe(FormaDeVenta forma);
        List<FormaDeVenta> GetLista();
    }
}
