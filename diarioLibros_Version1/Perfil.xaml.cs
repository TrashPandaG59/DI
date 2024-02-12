using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using System.Diagnostics;

namespace diarioLibros_Version1
{
    /// <summary>
    /// Lógica de interacción para Perfil.xaml
    /// </summary>
    public partial class Perfil : Window
    {

        String nombreusu;
        MainWindow login = new MainWindow();
        AccesoDatos ad = new AccesoDatos();
        String rutaPerfil;

        public Perfil(string n)
        {
            InitializeComponent();
            //nombreusu = "@" + n;
            // MessageBox.Show("Bienvenido "  + nombreusu);
            txt_nombreUsuario.Text = "@" + n;

            nombreusu = n.ToString();

            rutaPerfil = ad.cogerFotoPerfil(nombreusu);

            fotoPerfil.ImageSource = CargarImagenDesdeRuta(rutaPerfil);

            int libros = ad.totalLibros(n);

            cantidadLibrosLeidos.Text = libros.ToString();

            mensajitoOLibros(0);

        }

        static ImageSource CargarImagenDesdeRuta(string ruta)
        {
            try
            {
                // Crea un nuevo objeto BitmapImage y asigna la ruta como origen
                BitmapImage bitmapImage = new BitmapImage(new Uri(ruta));

                // Devuelve el objeto BitmapImage como ImageSource
                return bitmapImage;
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción que pueda ocurrir al cargar la imagen
                Console.WriteLine($"Error al cargar la imagen: {ex.Message}");
                return null;
            }
        }

        public void mensajitoOLibros(int num)
        {

            if (num == 0)
            {
                Contenedor1.Visibility = Visibility.Hidden;
            }
            else
            {
                MensajeDeInicio.Visibility = Visibility.Hidden;
            }
        }

        private void btn_Configuracion_Click(object sender, RoutedEventArgs e)
        {
            Configuracion nuevaPestana = new Configuracion();
            nuevaPestana.Show();
        }

        private void btn_MiBiblioteca_Click(object sender, RoutedEventArgs e)
        {
            // ESTA ES LA FUNCIÓN PARA ABRIR UN PUTO PDF
            String rutaPDF = @"C:\DI\mark II\mark I\imagenes\Harry Potter y la Piedra Filosofal.pdf";
            try
            {
                System.Diagnostics.Process.Start("explorer.exe", rutaPDF);
                MessageBox.Show("Todo bien");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al abrir el PDF: {ex.Message}");
                MessageBox.Show("Todo Mal: " + ex.Message);
            }
        }

    }
}
