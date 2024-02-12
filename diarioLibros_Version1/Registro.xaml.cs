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
    /// Lógica de interacción para Registro.xaml
    /// </summary>
    public partial class Registro : Window
    {

        AccesoDatos ad = new AccesoDatos();

        public Registro()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            
        }

        public void QuitarTexto(int num)
        {
            if (txtNombre.Text == "Nombre")
            {
                txtNombre.Text = "";
            }

            if (txtApellido.Text == "Apellido")
            {
                txtApellido.Text = "";
            }

            if (txtUsuario.Text == "Usuario")
            {
                txtUsuario.Text = "";
            }

            if (txtEmail.Text == "Email")
            {
                txtEmail.Text = "";
            }
 

        }

        private void btn_registro_Click(object sender, RoutedEventArgs e)
        {   
            MainWindow incioSesion = new MainWindow();
            incioSesion.Show();
            this.Close();
        }

        private void btn_registrar_Click(object sender, RoutedEventArgs e)
        {
            

            if (txtPass.Password != txtConfPass.Password)
            {
                MessageBox.Show("Las constraseñas deben coincidir");
            }
            else
            {
                int res = ad.registrarUsuario(txtNombre.Text, txtApellido.Text, txtUsuario.Text, txtEmail.Text,
                                            txtPass.Password);
                if (res == 0)
                {
                    MessageBox.Show("Se ha dado de alta correctamente");
                    //this.Close();
                }
                else if (res == -1)
                {
                    MessageBox.Show("El email no es válido");
                }
                else if (res == -2)
                {
                    MessageBox.Show("El usuario ya existe");
                }
                else if (res == -3)
                {
                    MessageBox.Show("El email ya existe");
                }
            }
        }

    }
}
