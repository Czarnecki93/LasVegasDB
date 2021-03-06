﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace LasVegasDB
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownListLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListLevel.SelectedValue.Equals("Magician"))
            {
                TextBoxSignupArtistName.Visible = true;
            }
            else
            {
                TextBoxSignupArtistName.Visible = false;
            }
        }

        protected void ButtonCreateUser_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = localhost; integrated security = true; database = LasVegas");
            SqlCommand cmd = null;

            if (DropDownListLevel.SelectedValue.Equals("Manager"))
            {
                string sqlins = "insert into Magician values (@Name, @Artistname, @Password, @Level)";

                try
                {
                    conn.Open();

                    cmd = new SqlCommand(sqlins, conn);
                    cmd.Parameters.Add("@Name", SqlDbType.Text);
                    cmd.Parameters.Add("@Artistname", SqlDbType.Text);
                    cmd.Parameters.Add("@Password", SqlDbType.Text);
                    cmd.Parameters.Add("@Level", SqlDbType.Int);

                    cmd.Parameters["@Name"].Value = TextBoxSignupName.Text;
                    cmd.Parameters["@Artistname"].Value = DBNull.Value;
                    cmd.Parameters["@Password"].Value = TextBoxSignupPassword.Text;
                    cmd.Parameters["@Level"].Value = 1;

                    cmd.ExecuteNonQuery();

                    LabelSignupMessage.Text = "Manager added";

                    TextBoxSignupName.Text = "";
                    TextBoxSignupPassword.Text = "";
                }
                catch (Exception ex)
                {
                    LabelSignupMessage.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else if (DropDownListLevel.SelectedValue.Equals("Secretary"))
            {
                string sqlins = "insert into Magician values (@Name, @Artistname, @Password, @Level)";

                try
                {
                    conn.Open();

                    cmd = new SqlCommand(sqlins, conn);
                    cmd.Parameters.Add("@Name", SqlDbType.Text);
                    cmd.Parameters.Add("@Artistname", SqlDbType.Text);
                    cmd.Parameters.Add("@Password", SqlDbType.Text);
                    cmd.Parameters.Add("@Level", SqlDbType.Int);

                    cmd.Parameters["@Name"].Value = TextBoxSignupName.Text;
                    cmd.Parameters["@Artistname"].Value = DBNull.Value;
                    cmd.Parameters["@Password"].Value = TextBoxSignupPassword.Text;
                    cmd.Parameters["@Level"].Value = 2;

                    cmd.ExecuteNonQuery();

                    LabelSignupMessage.Text = "Secretary added";

                    TextBoxSignupName.Text = "";
                    TextBoxSignupPassword.Text = "";
                }
                catch (Exception ex)
                {
                    LabelSignupMessage.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            // Dropdown value is "Magician"
            else
            {
                string sqlins = "insert into Magician values (@Name, @Artistname, @Password, @Level)";

                try
                {
                    conn.Open();

                    cmd = new SqlCommand(sqlins, conn);
                    cmd.Parameters.Add("@Name", SqlDbType.Text);
                    cmd.Parameters.Add("@Artistname", SqlDbType.Text);
                    cmd.Parameters.Add("@Password", SqlDbType.Text);
                    cmd.Parameters.Add("@Level", SqlDbType.Int);

                    cmd.Parameters["@Name"].Value = TextBoxSignupName.Text;
                    cmd.Parameters["@Artistname"].Value = TextBoxSignupArtistName.Text;
                    cmd.Parameters["@Password"].Value = TextBoxSignupPassword.Text;
                    cmd.Parameters["@Level"].Value = 3;


                    cmd.ExecuteNonQuery();

                    LabelSignupMessage.Text = "Magician added";

                    TextBoxSignupName.Text = "";
                    TextBoxSignupPassword.Text = "";
                    TextBoxSignupArtistName.Text = "";
                }
                catch (Exception ex)
                {
                    LabelSignupMessage.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = localhost; integrated security = true; database = LasVegas");
            SqlCommand cmd = null;

            // Get the id
            string id = GridViewUsers.DataKeys[e.RowIndex].Value.ToString();

            // Create the delete query
            string sqldel = @"delete from Magician where id = @id";

            try
            {
                conn.Open();
                cmd = new SqlCommand(sqldel, conn);
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = id;
                cmd.ExecuteNonQuery();
            }
            catch (ConstraintException conex)
            {
                LabelUserTable.Text = conex.Message;
            }
            catch (SqlException sqlex)
            {
                LabelUserTable.Text = sqlex.Message;
            }
            catch (Exception ex)
            {
                LabelUserTable.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            LabelUserTable.Text = "User has been deleted.";

        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}