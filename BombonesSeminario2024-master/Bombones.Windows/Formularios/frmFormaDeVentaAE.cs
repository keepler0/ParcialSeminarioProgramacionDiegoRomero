using Bombones.Entidades.Entidades;
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
    public partial class frmFormaDeVentaAE : Form
    {
        private FormaDeVenta? forma;
        public frmFormaDeVentaAE()
        {
            InitializeComponent();
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (forma is not null)
            {
                txtForma.Text = forma.Descripcion;
            }
        }
        internal FormaDeVenta GetFormaDeVenta() => forma;

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (Validar())
            {
                if (forma is null)
                {
                    forma = new FormaDeVenta();
                }
                forma.Descripcion = txtForma.Text.Trim();
                DialogResult = DialogResult.OK;
            }
        }

        private bool Validar()
        {
            if (string.IsNullOrEmpty(txtForma.Text.Trim()))
            {
                MessageBox.Show("Debe ingresar una descripcion");
                return false;
            }
            return true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        internal void SetFormaDeVenta(FormaDeVenta? forma)
        {
            this.forma = forma;
        }
    }
}
