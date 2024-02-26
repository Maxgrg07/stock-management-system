using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace StockManagementSystem
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // get user detail from session
            if (Session["UserEmail"] != null && Session["UserEmail"].ToString() != "")
            {
                Name.Text = Session["Name"].ToString();
                Email.Text = Session["UserEmail"].ToString();
                Address.Text = Session["Address"].ToString();
                UserID.Text = Session["ID"].ToString();
            }
            else
            {
                Email.Text = "Anonymus User";
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            // if the password field are not empty 
            if (OldPassword.Text != "" && NewPassword.Text != "" && ConfirmPassword.Text != "")
            {
                try
                {
                    DataView data = (DataView)SqlDataSourceProfile.Select(DataSourceSelectArguments.Empty);
                    bool passwordMatched = data.Table.Rows.Count > 0;

                    // if password matches with the user
                    if (passwordMatched)
                    {
                        // if new password and confirm password didn't matches
                        if (NewPassword.Text != ConfirmPassword.Text)
                        {
                            string title = "Password Invalid!";
                            string message = "Old Password and New Password Didnot Matched!";
                            string icon = "warning";
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                        }
                        else
                        {
                            // query to update password
                            string query = "Update Users set password = '" + NewPassword.Text + "' where ID = '" + UserID.Text + "'";

                            using (SqlConnection connection = new SqlConnection(SqlDataSourceProfile.ConnectionString))
                            {
                                connection.Open();
                                try
                                {

                                    SqlCommand cmd = new SqlCommand(query, connection);
                                    cmd.ExecuteNonQuery();
                                    string title = "Password Changed!";
                                    string message = "Password Sucessfully Changed!";
                                    string icon = "success";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);

                                }
                                catch
                                {
                                    string title = "Error!";
                                    string message = "Something Went Wrong!";
                                    string icon = "error";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                                }

                            }
                        }
                    }
                    else
                    {
                        string title = "Password Invalid!";
                        string message = "Old Password Didnot Matched!";
                        string icon = "warning";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                    }
                }
                catch
                {
                    string title = "Error!";
                    string message = "Something Went Wrong!";
                    string icon = "error";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Password Credential First!";
                string icon = "warning";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }
    }
}