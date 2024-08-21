using Bombones.Datos.Interfaces;
using Bombones.Entidades.Entidades;
using Bombones.Servicios.Intefaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bombones.Servicios.Servicios
{
    public class ServiciosFormasDeVentas : IServiciosFormasDeVentas
    {
        private readonly IRepositorioFormasDeVentas _repositorio;
        private readonly string _cadenaConexion;

        public ServiciosFormasDeVentas(IRepositorioFormasDeVentas repositorio, string cadenaConexion)
        {
            _repositorio = repositorio;
            _cadenaConexion = cadenaConexion;
        }

        public void Borrar(int fvId)
        {
            using (var conexion=new SqlConnection(_cadenaConexion))
            {
                conexion.Open();
                using (var tran=conexion.BeginTransaction())
                {
                    try
                    {
                        _repositorio.Borrar(fvId,conexion,tran);
                        tran.Commit();
                    }
                    catch (Exception)
                    {
                        tran.Rollback();
                        throw;
                    }
                }
            }
        }

        public bool Existe(FormaDeVenta fv)
        {
            using (var conexion=new SqlConnection(_cadenaConexion))
            {
                conexion.Open();
                return _repositorio.Existe(fv,conexion);
            }
        }

        public List<FormaDeVenta> GetLista()
        {
            using (var conexion=new SqlConnection(_cadenaConexion))
            {
                conexion.Open();
                return _repositorio.GetLista(conexion).ToList();
            }
        }

        public void Guardar(FormaDeVenta forma)
        {
            using (var conexion=new SqlConnection(_cadenaConexion))
            {
                conexion.Open();
                using (var tran=conexion.BeginTransaction())
                {
                    try
                    {
                        if (forma.FormaDeVentaId == 0)
                        {
                            _repositorio.Agregar(forma, conexion,tran);
                        }
                        else
                        {
                            _repositorio.Editar(forma,conexion,tran);
                        }
                        tran.Commit();
                    }
                    catch (Exception)
                    {
                        tran.Rollback();
                        throw;
                    } 
                }
                
            }
        }
    }
}
