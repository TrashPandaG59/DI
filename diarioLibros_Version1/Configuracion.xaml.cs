using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace diarioLibros_Version1
{
    /// <summary>
    /// Lógica de interacción para Configuracion.xaml
    /// </summary>
    public partial class Configuracion : Window
    {
        public Configuracion()
        {
            InitializeComponent();
        }

        private void btn_SalirConfiguracion_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_CambiarNombreUsuario_Click(object sender, RoutedEventArgs e)
        {
            VentanaConfiguracion nueva = new VentanaConfiguracion();
            nueva.Show();
        }

        private void btn_CambiarEmail_Click(object sender, RoutedEventArgs e)
        {
            VentanaConfiguracion nueva = new VentanaConfiguracion();
            nueva.Show();
        }

        private void CambiarPassword_Click(object sender, RoutedEventArgs e)
        {
            VentanaConfiguracion nueva = new VentanaConfiguracion();
            nueva.Show();
        }
    }
}
