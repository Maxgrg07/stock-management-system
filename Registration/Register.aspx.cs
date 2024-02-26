using System;
using System.Data;
using System.Web.UI;

namespace StockManagementSystem.Registration
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // If the text fields are not empty
            if (FullName.Text != "" && PhoneNumber.Text != "" && Email.Text != "" && Address.Text != "" && Password.Text != "" && PasswordAgain.Text != "")
            {
                if (Password.Text == PasswordAgain.Text)
                {
                    DataView dataView = (DataView)SqlDataSourceRegister.Select(DataSourceSelectArguments.Empty);
                    bool emailTaken = dataView.Table.Rows.Count > 0;

                    //if duplicate email
                    if (emailTaken)
                    {
                        Message.Text = "Email is already in use. Please try with different Email.";
                    }
                    else
                    {
                        SqlDataSourceRegister.InsertParameters["Name"].DefaultValue = FullName.Text;
                        SqlDataSourceRegister.InsertParameters["PhoneNumber"].DefaultValue = PhoneNumber.Text;
                        SqlDataSourceRegister.InsertParameters["Email"].DefaultValue = Email.Text;
                        SqlDataSourceRegister.InsertParameters["Address"].DefaultValue = Address.Text;
                        SqlDataSourceRegister.InsertParameters["MemberType"].DefaultValue = "User";
                        SqlDataSourceRegister.InsertParameters["Password"].DefaultValue = Password.Text;
                        SqlDataSourceRegister.Insert();
                        Response.Redirect("../Login.aspx");
                    }
                }
                else
                {
                    Message.Text = "Password Didn't Match";
                }
            }
            else
            {
                Message.Text = "Please Enter Registration Credential!";
            }
        }
    }
}