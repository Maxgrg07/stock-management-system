using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Serialization;
using System.Web.UI;
namespace StockManagementSystem
{
    public partial class Home : System.Web.UI.Page
    {
        // on page load show message if the item stock is less than 10
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> itemList = new List<string>();
            DataView itemData = (DataView)SqlDataSourceStockQuantity.Select(DataSourceSelectArguments.Empty);
            if (!Page.IsPostBack)
            {

                if (itemData.Table.Rows.Count > 0)
                {

                    foreach (DataRowView drvSql in itemData)
                    {

                        itemList.Add(drvSql["itemName"].ToString());

                    }
                    string title = "Low Stock!";
                    string[] itemListArray = itemList.ToArray();
                    string serializedItems = (new JavaScriptSerializer()).Serialize(itemListArray);
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowUp('" + title + "', '" + serializedItems + "');", true);
                }
            }

            // displaying the total count of category, item, sales, customers, orders
            DataView category = (DataView)SqlDataSourceCategoryCount.Select(DataSourceSelectArguments.Empty);
            DataView item = (DataView)SqlDataSourceItemCount.Select(DataSourceSelectArguments.Empty);
            DataView sales = (DataView)SqlDataSourceSalesCount.Select(DataSourceSelectArguments.Empty);
            DataView customers = (DataView)SqlDataSourceCustomerCount.Select(DataSourceSelectArguments.Empty);
            DataView orders = (DataView)SqlDataSourceOrderCount.Select(DataSourceSelectArguments.Empty);

            foreach (DataRowView countCategory in category)
            {
                string categoryCount = countCategory["CategoryCount"].ToString();
                LabelCategoryCount.Text = categoryCount;
            }

            foreach (DataRowView countItem in item)
            {
                string itemCount = countItem["ItemCount"].ToString();
                LabelItemCount.Text = itemCount;
            }

            foreach (DataRowView countSales in sales)
            {
                string salesCount = countSales["SalesCount"].ToString();
                LabelSalesCount.Text = salesCount;
            }

            foreach (DataRowView countCustomer in customers)
            {
                string customerCount = countCustomer["CustomersCount"].ToString();
                LabelCustomerCount.Text = customerCount;
            }

            foreach (DataRowView countOrders in orders)
            {
                string ordersCount = countOrders["Orders"].ToString();
                LabelOrderCount.Text = ordersCount;
            }
        }
    }
}