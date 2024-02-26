<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="StockManagementSystem.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Sales</h3>

    <div class="col-12 col-xl-12">
        <div class="card card-body shadow-sm mb-4">
            <h2 class="h5 mb-4">Sales Information</h2>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="gender">Category</label>
                    <asp:DropDownList ID="DropDownCategoryList" runat="server" AppendDataBoundItems="True" CssClass="form-select mb-0" AutoPostBack="true" DataSourceID="SqlDataSourceCategory" DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>          
                </div>
                <div class="col-md-6 mb-3">
                    <label for="gender">Item</label>
                    <asp:DropDownList ID="DropDownItemList" runat="server" CssClass="form-select" AutoPostBack="true" DataSourceID="SqlDataSourceItems" DataTextField="ItemName" DataValueField="ID" OnSelectedIndexChanged="DropDownItemList_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([CategoryID] = @CategoryID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownCategoryList" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div>
                        <label for="item_name">Quantity</label>
                        <asp:TextBox ID="Quantity" CssClass="form-control" runat="server" TextMode="Number" AutoPostBack="True" OnTextChanged="Quantity_TextChanged" min="1"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="form-group">
                        <label for="price">Customer</label>
                        <asp:DropDownList ID="DropDownListCustomers" CssClass="form-select mb-0" runat="server" AutoPostBack="true" DataSourceID="SqlDataSourceCustomers" DataTextField="Name" DataValueField="CustomerID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="mt-3" style="text-align:center;">
                <asp:Button ID="AddCart" runat="server" CssClass="btn btn-primary" Text="Add to Cart" OnClick="AddCart_Click" />
            </div>
        </div>
    </div>

    <asp:TextBox ID="ItemQuantity" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="LineTotal" runat="server" AutoPostBack="True"  Visible="false"></asp:TextBox>
    <asp:Label ID="LabelPrice" runat="server" Text=""  Visible="false"></asp:Label>
    <asp:Label ID="SelectedItem" runat="server" Text="Label"  Visible="false"></asp:Label>
    <asp:Label ID="SelectedItemPrice" runat="server" Text="Label"  Visible="false"></asp:Label>
    <asp:Label ID="CustomerLabel" runat="server" Text="Customer"  Visible="false"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSourceQuantity" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownItemList" Name="ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="CartItem" CssClass="table table-bordered" Width="100%" runat="server" OnRowCommand="CartItem_RowCommand">
                    <Columns>
                        <asp:ButtonField CommandName="RemoveCart" ControlStyle-CssClass="remove-cart" Text="Remove" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <div>
                <label for="item_name">Billing Date</label>
                <asp:TextBox ID="BillingDate" CssClass="datepicker-input form-control" runat="server" TextMode="Date"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="mt-3" style="text-align:center;">
        <asp:Button ID="OrderButton" runat="server" CssClass="btn btn-primary" Text="Order Now" OnClick="OrderButton_Click" />
    </div>

    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    <asp:Label ID="LabelMessage" runat="server" Text="Label" Visible="false"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Sales] WHERE [SalesID] = @SalesID" InsertCommand="INSERT INTO [Sales] ([CustomerID], [BillingDate], [TotalAmount]) VALUES (@CustomerID, @BillingDate, @TotalAmount)" SelectCommand="SELECT * FROM [Sales]" UpdateCommand="UPDATE [Sales] SET [CustomerID] = @CustomerID, [BillingDate] = @BillingDate, [TotalAmount] = @TotalAmount WHERE [SalesID] = @SalesID">
        <DeleteParameters>
            <asp:Parameter Name="SalesID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="BillingDate" />
            <asp:Parameter Name="TotalAmount" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="BillingDate" />
            <asp:Parameter Name="TotalAmount" Type="Decimal" />
            <asp:Parameter Name="SalesID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

    <asp:SqlDataSource ID="SqlDataSourceOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [OrderDetails] ([ItemID], [Quantity], [SalesID], [LineTotal]) VALUES (@ItemID, @Quantity, @SalesID, @LineTotal)" SelectCommand="SELECT * FROM [OrderDetails]" UpdateCommand="UPDATE [OrderDetails] SET [ItemID] = @ItemID, [Quantity] = @Quantity, [SalesID] = @SalesID, [LineTotal] = @LineTotal WHERE [OrderID] = @OrderID">
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="SalesID" Type="Int32" />
            <asp:Parameter Name="LineTotal" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="SalesID" Type="Int32" />
            <asp:Parameter Name="LineTotal" Type="Decimal" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <script>
        function ShowSalesAlert(title, message, icon) {
            swal({
                title: title,
                text: message,
                icon: icon,
            });
        }
        function ShowUserBlockedAlert(title, message, icon) {
            swal({
                title: title,
                text: message,
                icon: icon,
            });
        }
    </script>
</asp:Content>
