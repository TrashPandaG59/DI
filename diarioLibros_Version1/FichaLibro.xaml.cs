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
    /// Lógica de interacción para FichaLibro.xaml
    /// </summary>
    public partial class FichaLibro : Window
    {
        AccesoDatos ad = new AccesoDatos();
        public FichaLibro()
        {
            InitializeComponent();
        }

    }
}
