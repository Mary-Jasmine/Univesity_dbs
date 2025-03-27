using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace University_DB_CC226
{
    public partial class sign_in : Form
    {
        private MySqlConnection connection;
        public sign_in()
        {
            InitializeComponent();
            string connectionString = "Server=localhost;Database=user_db;Uid=root;Pwd=;";
            connection  = new MySqlConnection(connectionString);
        }

        private void sign_in_Load(object sender, EventArgs e)
        {

        }

        private void guna2ImageButton1_Click(object sender, EventArgs e)
        {

        }

        private void registerButton_Click(object sender, EventArgs e)
        {
            string studentNum = txtNewstudentNum.Text;
            string password = txtNewPassword.Text;

            if (string.IsNullOrEmpty(studentNum) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Student Number and password cannot be empty.");
                return;
            }

            try
            {
                connection.Open();

                string checkQuery = "SELECT COUNT(*) FROM user WHERE studentNum = @studentNum";
                MySqlCommand checkCmd = new MySqlCommand(checkQuery, connection);
                checkCmd.Parameters.AddWithValue("@studentNum", studentNum);
                int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    MessageBox.Show("Student Number already exists.");
                }
                else
                {

                    string insertQuery = "INSERT INTO user (studentNum, password) VALUES (@studentNum, @password)";
                    MySqlCommand cmd = new MySqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@studentNum", studentNum);
                    cmd.Parameters.AddWithValue("@password", password);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Account created successfully!");
                    this.Close();
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



        private void cancelButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
