using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystem
{
    public partial class Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddItem_Click(object sender, EventArgs e)
        {
            // if the input fields are not empty
            if (ItemName.Text != "" && ItemPrice.Text != "" && ItemDescription.Text != "" && PurchaseDate.Text != "" && Quantity.Text != "")
            {
                DataView dataView = (DataView)SqlDataSourceItem.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataView.Table.Rows.Count > 0;
                // if item name already exists
                if (duplicate)
                {
                    string title = "Duplicate Item!";
                    string message = "Item already in the Table!";
                    string icon = "warning";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                else
                {
                    SqlDataSourceItems.InsertParameters["ItemName"].DefaultValue = ItemName.Text;
                    SqlDataSourceItems.InsertParameters["Price"].DefaultValue = ItemPrice.Text;
                    SqlDataSourceItems.InsertParameters["Description"].DefaultValue = ItemDescription.Text;
                    SqlDataSourceItems.InsertParameters["PurchaseDate"].DefaultValue = PurchaseDate.Text;
                    SqlDataSourceItems.InsertParameters["CategoryID"].DefaultValue = CategoryList.SelectedItem.Value;
                    SqlDataSourceItems.InsertParameters["Quantity"].DefaultValue = Quantity.Text;
                    SqlDataSourceItems.InsertParameters["ManufacturedDate"].DefaultValue = ManufacturedDate.Text;
                    SqlDataSourceItems.InsertParameters["ExpiryDate"].DefaultValue = ExpiryDate.Text;
                    SqlDataSourceItems.Insert();

                    string title = "Item Successfully Added!";
                    string message = "Item is successfully added in the Table!";
                    string icon = "success";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
                ItemName.Text = ""; ItemPrice.Text = ""; ItemDescription.Text = ""; PurchaseDate.Text = ""; Quantity.Text = ""; ManufacturedDate.Text = ""; ExpiryDate.Text = "";
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Item Details First!";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        // method to display Item Details in Popup Modal
        protected void ItemsView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewItem")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string data = ItemsView.Rows[index].Cells[3].Text;

                LabelItem.Text = data;
                LabelItem.Visible = false;
                GridViewItemDetail.Visible = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowItemDetail();", true);
            }
        }
    }
}