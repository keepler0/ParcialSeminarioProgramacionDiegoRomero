using Bombones.Entidades.Entidades;
using Bombones.Servicios.Intefaces;
using Bombones.Windows.Helpers;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bombones.Windows.Formularios
{
    public partial class frmFormasDeVenta : Form
    {
        private readonly IServiceProvider? _serviceProvider;
        private readonly IServiciosFormasDeVentas? _servicios;
        private List<FormaDeVenta> lista;
        public frmFormasDeVenta(IServiceProvider serviceProvider)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            _servicios = _serviceProvider.GetService<IServiciosFormasDeVentas>();
        }

        private void tsbNuevo_Click(object sender, EventArgs e)
        {
            var frm = new frmFormaDeVentaAE() { Text = "Agregando nueva forma de venta" };
            var dr = frm.ShowDialog();
            if (dr == DialogResult.Cancel) return;
            try
            {
                var nuevaForma = frm.GetFormaDeVenta();
                if (!_servicios.Existe(nuevaForma))
                {
                    _servicios.Guardar(nuevaForma);
                    var r = GridHelper.ConstruirFila(dgvDatos);
                    GridHelper.SetearFila(r, nuevaForma);
                    GridHelper.AgregarFila(r, dgvDatos);
                    MessageBox.Show("Agregado!!", "Nuevo registro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void frmFormasDeVenta_Load(object sender, EventArgs e)
        {
            lista = _servicios.GetLista();
            llenarGrilla();
        }

        private void llenarGrilla()
        {
            GridHelper.LimpiarGrilla(dgvDatos);
            foreach (var item in lista)
            {
                var r = GridHelper.ConstruirFila(dgvDatos);
                GridHelper.SetearFila(r, item);
                GridHelper.AgregarFila(r, dgvDatos);
            }
        }

        private void tsbBorrar_Click(object sender, EventArgs e)
        {
            if (dgvDatos.SelectedRows.Count == 0) return;
            var r = dgvDatos.SelectedRows[0];
            var forma = r.Tag as FormaDeVenta;
            var dr = MessageBox.Show("Está seguro de borrar el registro?", "confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);
            if (dr == DialogResult.No) return;
            _servicios.Borrar(forma.FormaDeVentaId);
            MessageBox.Show("Registro borrado");
        }

        private void tsbEditar_Click(object sender, EventArgs e)
        {
            if (dgvDatos.SelectedRows.Count == 0) return;
            var r = dgvDatos.SelectedRows[0];
            var forma = r.Tag as FormaDeVenta;
            var frm = new frmFormaDeVentaAE() { Text = "Editando" };
            frm.SetFormaDeVenta(forma);
            var dr = frm.ShowDialog();
            if (dr == DialogResult.Cancel) return;
            try
            {
                var formaEditada = frm.GetFormaDeVenta();
                _servicios.Guardar(formaEditada);
                GridHelper.SetearFila(r, formaEditada);
                MessageBox.Show("Registro editado");

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
