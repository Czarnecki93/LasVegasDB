using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace LasVegasDB
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            SqlConnection connectionString = new SqlConnection(@"data source = localhost; integrated security = true; database = LasVegas");
            SqlCommand cmd = null;

            string selectString =
            "SELECT realname, password " +
            "FROM Magician " +
            "WHERE realname = '" + TextBoxUsername.Text + "' AND password = '" + TextBoxPassword.Text + "'";

            cmd = new SqlCommand(selectString, connectionString);

            connectionString.Open();
            string strResult = (string)cmd.ExecuteScalar();
            connectionString.Close();

            if (strResult == null)
            {
                LabelLogin.Text = "Username or password is incorrect!";
            }
            else
            {
                Response.Redirect("Admin.aspx");
            }
        }
    }
}