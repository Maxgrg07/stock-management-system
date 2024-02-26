using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;

namespace StockManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // if email and password are not empty
            if (Email.Text != "" && Password.Text != "")
            {
                DataView dataView = (DataView)SqlDataSourceLogin.Select(DataSourceSelectArguments.Empty);
                bool authentincated = dataView.Table.Rows.Count > 0;
                if (authentincated)
                {
                    FormsAuthentication.RedirectFromLoginPage(Email.Text, false);
                    Session["UserEmail"] = Email.Text.ToString();
                    // store user detail in session
                    foreach (DataRowView dataRowView in dataView)
                    {
                        Session["ID"] = dataRowView["ID"].ToString();
                        Session["Name"] = dataRowView["Name"].ToString();
                        Session["PhoneNumber"] = dataRowView["PhoneNumber"].ToString();
                        Session["Address"] = dataRowView["Address"].ToString();
                        Session["MemberType"] = dataRowView["MemberType"].ToString();
                    }
                }
                else
                {
                    Message.Text = "Credential Invalid";
                }
            }
            else
            {
                Message.Text = "Please enter login credential!";
            }
        }
    }
}