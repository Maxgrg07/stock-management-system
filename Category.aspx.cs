using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystem
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddCategory_Click(object sender, EventArgs e)
        {
            if (CategoryName.Text != "" && Description.Text != "")
            {
                DataView dataView = (DataView)SqlDataSourceCategory.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataView.Table.Rows.Count > 0;

                if (duplicate)
                {
                    string title = "Duplicate Category!";
                    string message = "Category already in the Table!";
                    string icon = "warning";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                else
                {
                    SqlDataSourceCategories.InsertParameters["Name"].DefaultValue = CategoryName.Text;
                    SqlDataSourceCategories.InsertParameters["Description"].DefaultValue = Description.Text;
                    SqlDataSourceCategories.Insert();

                    string title = "Category Successfully Added!";
                    string message = "Category is successfully added in the Table!";
                    string icon = "success";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                CategoryName.Text = ""; Description.Text = "";
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Category and Description!";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        //method to shold category detail in popup modal
        protected void GridViewCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewCategory")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string data = GridViewCategory.Rows[index].Cells[3].Text;

                CategoryLabel.Text = data;
                CategoryLabel.Visible = false;
                GridViewCategoryDetail.Visible = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowCategoryDetail();", true);
            }
        }
    }
}