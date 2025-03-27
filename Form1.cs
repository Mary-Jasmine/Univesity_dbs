using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace University_DB_CC226
{
    public partial class Form1 : Form
    {
        private MySqlConnection connection;

        public Form1()
        {
            InitializeComponent();
            string connectionString = "Server=localhost;Database=user_db;Uid=root;Pwd=;";
            connection = new MySqlConnection(connectionString);
            
        }

        private void signInButton_Click(object sender, EventArgs e)
        {
            {
                sign_in sign_in = new sign_in();
                sign_in.ShowDialog();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void logInButton_Click(object sender, EventArgs e)
        {
            string studentNum = Stud_num.Text;
            string password = Password.Text;

            try
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM user WHERE studentNum = @studentNum AND password = @password";
                MySqlCommand cmd = new MySqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@studentNum", studentNum);
                cmd.Parameters.AddWithValue("@password", password);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    MessageBox.Show("Login successful!");
                    index Index = new index();
                    this.Hide();
                    Index.Show();
                }
                else
                {
                    MessageBox.Show("Invalid studentNum or password.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
 }

