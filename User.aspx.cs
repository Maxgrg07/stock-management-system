using System;
using System.Data;
using System.Web.UI;

namespace StockManagementSystem
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userType = (string)Session["MemberType"];
            if (userType == "Admin")
            {
                return;
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void SaveUser_Click(object sender, EventArgs e)
        {
            if (FullName.Text != "" && PhoneNumber.Text != "" && Email.Text != "" && Address.Text != "" && Password.Text != "")
            {
                DataView dataView = (DataView)SqlDataSourceUserData.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataView.Table.Rows.Count > 0;

                if (duplicate)
                {
                    string title = "Invalid User!";
                    string message = "User is already available!";
                    string icon = "warning";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowUserAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                else
                {
                    SqlDataSourceUsers.InsertParameters["Name"].DefaultValue = FullName.Text;
                    SqlDataSourceUsers.InsertParameters["PhoneNumber"].DefaultValue = PhoneNumber.Text;
                    SqlDataSourceUsers.InsertParameters["Email"].DefaultValue = Email.Text;
                    SqlDataSourceUsers.InsertParameters["Address"].DefaultValue = Address.Text;
                    SqlDataSourceUsers.InsertParameters["MemberType"].DefaultValue = "User";
                    SqlDataSourceUsers.InsertParameters["Password"].DefaultValue = Password.Text;
                    SqlDataSourceUsers.Insert();

                    string title = "User Added!";
                    string message = "User is successfully added!";
                    string icon = "success";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowUserAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                FullName.Text = ""; PhoneNumber.Text = ""; Email.Text = ""; Address.Text = ""; Password.Text = "";
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Customer Details First!";
                string icon = "warning";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowUserAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }
    }
}