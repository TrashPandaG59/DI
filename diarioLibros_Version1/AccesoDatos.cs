using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;

namespace diarioLibros_Version1
{
    class AccesoDatos
    {
        MySqlConnection _conn;
        MySqlCommand _cmd;
        string _connectionString = "server=localhost;" +
                                   "user=root;" +
                                   "port = 3309;" +
                                   "database=app_libros;" +
                                   "password=joyfe;";


        public AccesoDatos()
        {
            _conn = new MySqlConnection(_connectionString); //establece conexión con SQL
            try
            {
                _conn = new MySqlConnection(_connectionString);//Lo hace con la String que hemos creado anteriormente

                _conn.Open();// Abrimos la conexión
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }


        public int registrarUsuario(string nomb, string ape, string usuario, string emaill, string passw)
        {
            int resultado = -99;
            try
            {
                _cmd = new MySqlCommand();
                _cmd.Connection = _conn;

                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "InsertarUsuario"; //Es literalmente el nombre del procedimiento almacenado que quiero meter
                                                    //pero este tiene que estar creado previamente

                _cmd.Parameters.AddWithValue("nom", nomb);
                _cmd.Parameters["nom"].Direction = ParameterDirection.Input;

                _cmd.Parameters.AddWithValue("apell", ape);
                _cmd.Parameters["apell"].Direction = ParameterDirection.Input;

                _cmd.Parameters.AddWithValue("usu", usuario);
                _cmd.Parameters["usu"].Direction = ParameterDirection.Input;

                _cmd.Parameters.AddWithValue("em", emaill);
                _cmd.Parameters["em"].Direction = ParameterDirection.Input;

                //string paswordHash = CreateMD5(passw).Substring(0, 20);

                string paswordHash = CreateMD5(passw).Substring(0, 20);

                _cmd.Parameters.AddWithValue("pass", paswordHash);
                _cmd.Parameters["pass"].Direction = ParameterDirection.Input;

                _cmd.Parameters.Add(new MySqlParameter("resul", MySqlDbType.Int32)); //Esto importante que sea 32
                _cmd.Parameters["resul"].Direction = ParameterDirection.Output;

                _cmd.ExecuteNonQuery();
                resultado = (int)_cmd.Parameters["resul"].Value;

            }

            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return resultado;
        }


        //Para HASEAR LA CONTRASEÑA
        public string CreateMD5(string input)
        {
            // Use input string to calculate MD5 hash
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                return Convert.ToHexString(hashBytes); // .NET 5 +

            }
        }


        public int inicioSesion(string usuario, string pass)
        {
            int resultado = -99;

            //Console.WriteLine("ESTOS SON LOS PARÁMETROS: " + usuario+" "+pass);

            try
            {
                _cmd = new MySqlCommand();
                _cmd.Connection = _conn;
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "Login";

                _cmd.Parameters.AddWithValue("_username", usuario);
                _cmd.Parameters["_username"].Direction = ParameterDirection.Input;

                string paswordHash = CreateMD5(pass).Substring(0, 20);

                _cmd.Parameters.AddWithValue("_password", paswordHash);
                _cmd.Parameters["_password"].Direction = ParameterDirection.Input;

                _cmd.Parameters.Add(new MySqlParameter("_res", MySqlDbType.Int32));
                _cmd.Parameters["_res"].Direction = ParameterDirection.Output;

                _cmd.ExecuteNonQuery();

                resultado = (int)_cmd.Parameters["_res"].Value;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Desgracia foto perfil");
            }
            return resultado;

        }
        public int bloqueoCuenta(string usuario, string pass)
        {
            int resultado = -99;

            //Console.WriteLine("ESTOS SON LOS PARÁMETROS: " + usuario+" "+pass);

            try
            {
                _cmd = new MySqlCommand();
                _cmd.Connection = _conn;
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "bloqueo_de_cuenta";

                _cmd.Parameters.AddWithValue("_username", usuario);
                _cmd.Parameters["_username"].Direction = ParameterDirection.Input;

                string paswordHash = CreateMD5(pass).Substring(0, 20);

                _cmd.Parameters.AddWithValue("_password", paswordHash);
                _cmd.Parameters["_password"].Direction = ParameterDirection.Input;

                _cmd.Parameters.Add(new MySqlParameter("_res", MySqlDbType.Int32));
                _cmd.Parameters["_res"].Direction = ParameterDirection.Output;

                _cmd.ExecuteNonQuery();

                resultado = (int)_cmd.Parameters["_res"].Value;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Maaal, ta mal");
            }
            return resultado;

        }


        public String cogerFotoPerfil(string usuario)
        {
            String resultado = " ";

            //Console.WriteLine("ESTOS SON LOS PARÁMETROS: " + usuario+" "+pass);

            try
            {
                _cmd = new MySqlCommand();
                _cmd.Connection = _conn;
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "cogerFotoPerfil";

                _cmd.Parameters.AddWithValue("_nomusuario", usuario);
                _cmd.Parameters["_nomusuario"].Direction = ParameterDirection.Input;

                _cmd.Parameters.Add(new MySqlParameter("resul", MySqlDbType.String));
                _cmd.Parameters["resul"].Direction = ParameterDirection.Output;

                _cmd.ExecuteNonQuery();

                resultado = _cmd.Parameters["resul"].Value.ToString();
            }
            catch (Exception ex)
            {
                return resultado;
            }
            return resultado;

        }


        public int totalLibros(string usuario)
        {
            int resultado = -99;

            //Console.WriteLine("ESTOS SON LOS PARÁMETROS: " + usuario+" "+pass);

            try
            {
                _cmd = new MySqlCommand();
                _cmd.Connection = _conn;
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "totalLibrosLeidos";

                _cmd.Parameters.AddWithValue("_usu", usuario);
                _cmd.Parameters["_usu"].Direction = ParameterDirection.Input;

                _cmd.Parameters.Add(new MySqlParameter("resul", MySqlDbType.Int32));
                _cmd.Parameters["resul"].Direction = ParameterDirection.Output;

                _cmd.ExecuteNonQuery();

                resultado = (int)_cmd.Parameters["resul"].Value;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Desgracia total libros leídos");
            }
            return resultado;

        }





        /* public String librosLeyendo(string usuario)
         {
             String resultado = " ";

             //Console.WriteLine("ESTOS SON LOS PARÁMETROS: " + usuario+" "+pass);

             try
             {
                 _cmd = new MySqlCommand();
                 _cmd.Connection = _conn;
                 _cmd.CommandType = CommandType.StoredProcedure;
                 _cmd.CommandText = "cantidadLibrosLeyendo";

                 _cmd.Parameters.AddWithValue("_nomusuario", usuario);
                 _cmd.Parameters["_nomusuario"].Direction = ParameterDirection.Input;

                 _cmd.Parameters.Add(new MySqlParameter("resul", MySqlDbType.String));
                 _cmd.Parameters["resul"].Direction = ParameterDirection.Output;

                 _cmd.ExecuteNonQuery();

                 resultado = _cmd.Parameters["resul"].Value.ToString();
             }
             catch (Exception ex)
             {
                 return resultado;
             }
             return resultado;

         }*/






    }
    

}
