using System;
using System.Data;
using System.Web.UI;

namespace StockManagementSystem
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveCustomer_Click(object sender, EventArgs e)
        {
            // if input fields are not empty
            if (FullName.Text != "" && Email.Text != "" && Address.Text != "" && PhoneNumber.Text != "")
            {
                DataView dataView = (DataView)SqlDataSourceCustomerValid.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataView.Table.Rows.Count > 0;

                if (duplicate)
                {
                    string title = "Invalid Customer!";
                    string message = "Customer is already available!";
                    string icon = "warning";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowCustomerAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                else
                {
                    SqlDataSourceCustomers.InsertParameters["Name"].DefaultValue = FullName.Text;
                    SqlDataSourceCustomers.InsertParameters["Email"].DefaultValue = Email.Text;
                    SqlDataSourceCustomers.InsertParameters["Address"].DefaultValue = Address.Text;
                    SqlDataSourceCustomers.InsertParameters["PhoneNumber"].DefaultValue = PhoneNumber.Text;
                    SqlDataSourceCustomers.InsertParameters["MemberType"].DefaultValue = DropDownListType.SelectedItem.Text;
                    SqlDataSourceCustomers.Insert();

                    string title = "Customer Added!";
                    string message = "Customer is successfully Added!";
                    string icon = "success";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowCustomerAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                FullName.Text = ""; Email.Text = ""; Address.Text = ""; PhoneNumber.Text = "";
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Customer Details First!";
                string icon = "warning";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowCustomerAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }
    }
}