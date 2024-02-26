using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystem
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddDefaultFirstRecord();
            }
        }

        protected void DropDownItemList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetQuantityPrice();

        }
        protected void Quantity_TextChanged(object sender, EventArgs e)
        {
            GetQuantityPrice();
        }

        // get the total quantity and price
        public void GetQuantityPrice()
        {
            decimal lineTotal;
            DataView dvSql = (DataView)SqlDataSourceQuantity.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                try
                {
                    LabelPrice.Text = drvSql["Price"].ToString();
                    ItemQuantity.Text = drvSql["Quantity"].ToString();
                    lineTotal = Decimal.Parse(drvSql["Price"].ToString()) * Decimal.Parse(Quantity.Text);
                    LineTotal.Text = lineTotal.ToString();
                    SelectedItem.Text = drvSql["ItemName"].ToString();
                    SelectedItemPrice.Text = drvSql["Price"].ToString();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
        }

        protected void AddCart_Click(object sender, EventArgs e)
        {
            try
            {
                AddNewRecordRowToGrid();
            }
            catch
            {
                string title = "Error!";
                string message = "Something went wrong while adding items to cart!";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        public void AddDefaultFirstRecord()
        {
            try
            {
                if (Session["Cart"] == null)
                {
                    DataTable dataTable = new DataTable();
                    DataRow dr;
                    dataTable.TableName = "Cart";
                    dataTable.Columns.Add(new DataColumn("ItemID", typeof(int)));
                    dataTable.Columns.Add(new DataColumn("ItemName", typeof(string)));
                    dataTable.Columns.Add(new DataColumn("Category", typeof(string)));
                    dataTable.Columns.Add(new DataColumn("Price", typeof(decimal)));
                    dataTable.Columns.Add(new DataColumn("Quantity", typeof(int)));
                    dataTable.Columns.Add(new DataColumn("LineTotal", typeof(decimal)));

                    dr = dataTable.NewRow();
                    dataTable.Rows.Add(dr);

                    Session["Cart"] = dataTable;

                    CartItem.DataSource = dataTable;
                    CartItem.DataBind();
                }
                else
                {
                    DataTable dt = (DataTable)Session["Cart"];
                    CartItem.DataSource = dt;
                    CartItem.DataBind();
                }
            }
            catch
            {
                LabelMessage.Text = "Something went wrong";
                LabelMessage.Visible = true;
            }
        }

        // function to add new item to table
        public void AddNewRecordRowToGrid()
        {
            if (Quantity.Text != "")
            {
                if (Int32.Parse(ItemQuantity.Text) < Int32.Parse(Quantity.Text))
                {
                    string title = "Quantity out of Stock!";
                    string message = "Item Quantity is out of Stock!";
                    string icon = "error";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                    return;
                }

                if (CustomerLabel.Text == "Customer" || DropDownListCustomers.SelectedValue == CustomerLabel.Text)
                {
                    CustomerLabel.Text = DropDownListCustomers.SelectedValue;
                    Message.Visible = false;
                    if (Session["Cart"] != null)
                    {
                        DataTable dtCurrentTable = (DataTable)Session["Cart"];
                        DataRow drCurrentRow = null;

                        if (dtCurrentTable.Rows.Count > 0)
                        {

                            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                            {
                                drCurrentRow = dtCurrentTable.NewRow();
                                drCurrentRow["ItemID"] = Int32.Parse(DropDownItemList.SelectedValue);
                                drCurrentRow["ItemName"] = SelectedItem.Text;
                                drCurrentRow["Category"] = DropDownCategoryList.SelectedItem.Text;
                                drCurrentRow["Price"] = SelectedItemPrice.Text;
                                drCurrentRow["Quantity"] = Int32.Parse(Quantity.Text);
                                drCurrentRow["LineTotal"] = Decimal.Parse(LineTotal.Text);
                            }
                            if (dtCurrentTable.Rows[0][0].ToString() == "")
                            {
                                dtCurrentTable.Rows[0].Delete();
                                dtCurrentTable.AcceptChanges();

                            }
                            dtCurrentTable.Rows.Add(drCurrentRow);
                            Session["Cart"] = dtCurrentTable;
                            CartItem.DataSource = dtCurrentTable;
                            CartItem.DataBind();

                            decimal total = TotalAmount();
                            LabelMessage.Text = total.ToString();
                        }
                    }
                }
                else
                {
                    string title = "Customer Invalid!";
                    string message = "The customer selected is different from customer in the card!";
                    string icon = "warning";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
            }
            else
            {
                string title = "Empty Field!";
                string message = "Please Enter Required Field!";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        protected void OrderButton_Click(object sender, EventArgs e)
        {
            try
            {
                decimal totalAmount = 0;
                DataTable cartData = (DataTable)Session["Cart"];

                foreach (DataRow dr in cartData.Rows)
                {
                    if (dr["ItemID"].ToString() == "")
                    {
                        string title = "Cart Empty!";
                        string message = "Cart is empty for Order!";
                        string icon = "warning";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                        return;

                    }
                    else
                    {
                        totalAmount += Decimal.Parse(dr["LineTotal"].ToString());

                    }
                }
                Message.Visible = false;

                String conf = ConfigurationManager.ConnectionStrings["StockManagementSystemConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conf);
                String query = "Insert into Sales values (@CustomerID, @BillingDate, @TotalAmount); Select SCOPE_IDENTITY();";
                String quantityQuery = "Update Items Set Quantity = Quantity - @selectedQuantity where ID = @ItemID";

                connection.Open();

                try
                {
                    if (BillingDate.Text != "")
                    {
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@CustomerID", CustomerLabel.Text);
                        command.Parameters.AddWithValue("@BillingDate", BillingDate.Text);
                        command.Parameters.AddWithValue("@TotalAmount", totalAmount.ToString());

                        int SalesID = Convert.ToInt32(command.ExecuteScalar());

                        CustomerLabel.Text = SalesID.ToString();
                        CustomerLabel.Visible = true;

                        foreach (DataRow dataRow in cartData.Rows)
                        {
                            SqlDataSourceOrderDetails.InsertParameters["ItemID"].DefaultValue = dataRow["ItemID"].ToString();
                            SqlDataSourceOrderDetails.InsertParameters["Quantity"].DefaultValue = dataRow["Quantity"].ToString();
                            SqlDataSourceOrderDetails.InsertParameters["SalesID"].DefaultValue = SalesID.ToString();
                            SqlDataSourceOrderDetails.InsertParameters["LineTotal"].DefaultValue = dataRow["LineTotal"].ToString();

                            SqlDataSourceOrderDetails.Insert();

                            command = new SqlCommand(quantityQuery, connection);
                            command.Parameters.AddWithValue("@selectedQuantity", dataRow["Quantity"].ToString());
                            command.Parameters.AddWithValue("@ItemID", dataRow["ItemID"].ToString());
                            command.ExecuteNonQuery();
                        }

                        // connection.Close();

                        string title = "Order Sucessfull!";
                        string message = "Order is successfully inserted!";
                        string icon = "success";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);

                        CustomerLabel.Text = "Customer";
                        CustomerLabel.Visible = false;
                        ClearCart();
                        BillingDate.Text = ""; Quantity.Text = "";
                    }
                    else
                    {
                        string title = "Error";
                        string message = "Please Enter Billing Date";
                        string icon = "warning";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                    }
                }
                catch
                {
                    string title = "Error!";
                    string message = "Something Went Wrong";
                    string icon = "error";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                }
            }
            catch
            {
                // transaction.Rollback();
                string title = "Error!";
                string message = "Something Went Wrong";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        // method to clear cart after order
        public void ClearCart()
        {
            Session["Cart"] = null;
            CustomerLabel.Text = "Customer";
            Message.Text = "0";
            if (Session["Cart"] == null)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.TableName = "Cart";
                dt.Columns.Add(new DataColumn("ItemID", typeof(int)));
                dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
                dt.Columns.Add(new DataColumn("Category", typeof(string)));
                dt.Columns.Add(new DataColumn("Price", typeof(decimal)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
                dt.Columns.Add(new DataColumn("LineTotal", typeof(decimal)));

                dr = dt.NewRow();
                dt.Rows.Add(dr);

                Session["Cart"] = dt;

                CartItem.DataSource = dt;
                CartItem.DataBind();
            }
        }

        protected void CartItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveCart")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                RemoveItemFromCart(index);
            }
        }

        // function to remove item from cart
        public void RemoveItemFromCart(int index)
        {
            try
            {
                DataTable cartTable = (DataTable)Session["Cart"];

                foreach (DataRow dr in cartTable.Rows)
                {
                    if (dr["ItemId"].ToString() == "")
                    {
                        string title = "Cart is Empty!";
                        string message = "No item in the cart to delete!";
                        string icon = "warning";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
                        return;
                    }
                }

                cartTable.Rows[index].Delete();

                decimal total = TotalAmount();
                Message.Text = total.ToString();
                if (cartTable.Rows.Count < 1)
                {
                    ClearCart();
                    CustomerLabel.Text = "Customer";
                }
                else
                {
                    CartItem.DataSource = cartTable;
                    CartItem.DataBind();
                }
            }
            catch
            {
                string title = "Something went Wrong!";
                string message = "Something went wrong while removing item from cart!";
                string icon = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowSalesAlert('" + title + "', '" + message + "', '" + icon + "');", true);
            }
        }

        // method to calculate total amount
        private decimal TotalAmount()
        {
            decimal totalAmount = 0;
            DataTable cartTable = (DataTable)Session["Cart"];
            foreach (DataRow dr in cartTable.Rows)
            {
                if (dr["ItemID"].ToString() == "")
                {
                    totalAmount = 0;
                }
                else
                {
                    totalAmount += Decimal.Parse(dr["LineTotal"].ToString());

                }
            }
            return totalAmount;
        }
    }
}