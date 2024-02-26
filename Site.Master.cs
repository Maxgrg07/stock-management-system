using System;
using System.Web.UI;

namespace StockManagementSystem
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserEmail"].ToString() == "")
            {
                Response.Redirect("~/Login.aspx");

            }
            else
            {
                if (Session["UserEmail"] != null && Session["UserEmail"].ToString() != "")
                {
                    UserEmail.Text = Session["UserEmail"].ToString();
                }
                else
                {
                    UserEmail.Text = "Anonymus User";
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Clear();
                Response.Redirect("~/Login.aspx");
            }
            catch
            {
                string message = "Something went Wrong";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowAlert('" + message + "');", true);
            }
        }

        // access only to admin to User Page
        protected void UsersPage_Click(object sender, EventArgs e)
        {
            string userType = (string)Session["MemberType"];
            if (userType == "Admin")
            {
                Response.Redirect("~/User.aspx");
            }
            else
            {
                string title = "Blocked!";
                string message = "Users Cannot Enter User Page!";
                string icon = "warning";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowUserBlockedAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }
    }
}