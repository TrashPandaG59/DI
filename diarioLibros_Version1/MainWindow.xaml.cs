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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace diarioLibros_Version1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        AccesoDatos ad = new AccesoDatos();
        //Perfil perfil = new Perfil();
        String nombreusu;
        public MainWindow()
        {
            InitializeComponent();
           
        }

        private void iniciar_sesion(object sender, RoutedEventArgs e)
        {
            String u = txtUsuario.Text;
            String p = txtPass.Password;
            int res = ad.inicioSesion(u, p);
            

            if (res == -1)
            {
               MessageBox.Show("Login Incorrecto. Revisa credenciales");
            }
            else if (res == 0)
            {
               MessageBox.Show("Bienvenido a la APP de libros");
                nombreusu = u;
                Perfil perfil = new Perfil(nombreusu);
                perfil.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Desgracia");
            }


        }

        private void btn_registro_Click(object sender, RoutedEventArgs e)
        {
            Registro ventanaRegistro = new Registro();
            ventanaRegistro.Show();
            this.Close();
        }

        public String devolverDatosPerfil()
        {
            String n = nombreusu;
            return n;
        }



    }
}
