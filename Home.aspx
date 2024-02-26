<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StockManagementSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--Point 8-->
    <div class="row justify-content-md-center">
        <div class="col-12 col-sm-4 col-xl-4 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-body">
                    <div class="row d-block d-xl-flex align-items-center">
                        <div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
                            <div class="icon icon-shape icon-md icon-shape-primary rounded me-4 me-sm-0"><span class="fas fa-chart-line"></span></div>
                        </div>
                        <div class="col-12 col-xl-7 px-xl-0">
                            <div class="d-none d-sm-block">
                                <h2 class="h5">Category</h2>
                                <asp:Label ID="LabelCategoryCount" class="mb-1 count" runat="server" Text=""></asp:Label>
                            </div>
                            <small>Total Category in Table</small> 
                             <div class="small mt-2">                               
                                <a runat="server"  class="btn btn-dark btn-sm me-2 dropdown-toggle" href="~/Category.aspx">Navigate</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceCategoryCount" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select COUNT(*) as CategoryCount from Category"></asp:SqlDataSource>
                
        <div class="col-12 col-sm-4 col-xl-4 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-body">
                    <div class="row d-block d-xl-flex align-items-center">
                        <div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
                            <div class="icon icon-shape icon-md icon-shape-secondary rounded me-4"><span class="fas fa-cash-register"></span></div>
                        </div>
                        <div class="col-12 col-xl-7 px-xl-0">
                            <div class="d-none d-sm-block">
                                <h2 class="h5">Items</h2>
                                <asp:Label ID="LabelItemCount" class="mb-1 count" runat="server" Text=""></asp:Label>
                            </div>
                            <small>Total Items in Table</small>
                            <div class="small mt-2">
                                <a runat="server" class="btn btn-dark btn-sm me-2 dropdown-toggle" href="~/Item.aspx">Navigate</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceItemCount" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select count(*) as ItemCount from Items"></asp:SqlDataSource>

        <div class="col-12 col-sm-4 col-xl-4 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-body">
                    <div class="row d-block d-xl-flex align-items-center">
                        <div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
                            <div class="icon icon-shape icon-md icon-shape-secondary rounded me-4"><span class="fas fa-cart-arrow-down"></span></div>
                        </div>
                        <div class="col-12 col-xl-7 px-xl-0">
                            <div class="d-none d-sm-block">
                                <h2 class="h5">Sales</h2>
                                <asp:Label ID="LabelSalesCount" class="mb-1 count" runat="server" Text=""></asp:Label>
                            </div>
                            <small>Total No. of Sales</small>
                            <div class="small mt-2">                               
                                 <a runat="server" class="btn btn-dark btn-sm me-2 dropdown-toggle" href="~/Sales.aspx">Navigate</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceSalesCount" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select COUNT(*) as SalesCount from Sales"></asp:SqlDataSource>
    </div>

    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-body">
                    <h2 class="h5">Stock</h2>
                    <p>Total No. of Customer and Total No. of Orders Made by ther User</p>
                    <div class="d-block">
                        <div class="d-flex align-items-center pt-3 me-5">
                            <div class="icon icon-shape icon-sm icon-shape-danger rounded me-3"><span class="fas fa-chart-bar"></span></div>
                            <div class="d-block">
                                <label class="mb-0">Total No. of Customer</label><br />
                                <asp:Label ID="LabelCustomerCount" class="mb-1 count" runat="server" Text=""></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSourceCustomerCount" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select count(*) as CustomersCount from Customers"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="d-flex align-items-center pt-3">
                            <div class="icon icon-shape icon-sm icon-shape-quaternary rounded me-3"><span class="fas fa-archive"></span></div>
                            <div class="d-block">
                                <label class="mb-0">Total No. of Orders</label><br />
                                <asp:Label ID="LabelOrderCount" class="mb-1 count" runat="server" Text=""></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSourceOrderCount" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select count(*) as Orders from OrderDetails"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <h2 class="h5">Customer Purchase Detail in last 31 Days</h2>
                        </div>
                        <div class="col-4 text-right">
                            <asp:DropDownList ID="DropDownListCustomers"  CssClass="form-select mb-0" runat="server" DataSourceID="SqlDataSourceCustomers" AutoPostBack="true" DataTextField="Name" DataValueField="CustomerID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                        	<asp:SqlDataSource ID="SqlDataCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT Customers.Name, Sales.BillingDate as PurchasedDate, Sales.TotalAmount, Items.ItemName, OrderDetails.Quantity, OrderDetails.LineTotal FROM [Sales] join Customers on Sales.CustomerId = Customers.CustomerID join OrderDetails on Sales.SalesId = OrderDetails.salesId join Items on Items.ID = OrderDetails.ItemID where Sales.CustomerID = @CustomerID and DateDiff(dd, Sales.BillingDate, Convert(date, getDate())) &lt; 31">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListCustomers" DefaultValue="" Name="CustomerID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewCustomers" CssClass="table align-items-center table-flush" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataCustomers">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="PurchasedDate" HeaderText="PurchasedDate" SortExpression="PurchasedDate" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="LineTotal" HeaderText="LineTotal" SortExpression="LineTotal" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <!--Point 10-->
    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">List of Items which are on stock for long time.</h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewStock" CssClass="table align-items-center table-flush" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceStock">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="ManufacturedDate" HeaderText="ManufacturedDate" SortExpression="ManufacturedDate" />
                            <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceStock" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Items] ([ItemName], [Price], [Description], [PurchaseDate], [CategoryID], [Quantity], [ManufacturedDate], [ExpiryDate]) VALUES (@ItemName, @Price, @Description, @PurchaseDate, @CategoryID, @Quantity, @ManufacturedDate, @ExpiryDate)" SelectCommand="Select * from Items where DateDiff(dd, purchaseDate, Convert(date, getDate())) &gt; 365;" UpdateCommand="UPDATE [Items] SET [ItemName] = @ItemName, [Price] = @Price, [Description] = @Description, [PurchaseDate] = @PurchaseDate, [CategoryID] = @CategoryID, [Quantity] = @Quantity, [ManufacturedDate] = @ManufacturedDate, [ExpiryDate] = @ExpiryDate WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DbType="Date" Name="PurchaseDate" />
                            <asp:Parameter Name="CategoryID" Type="Int32" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="ManufacturedDate" />
                            <asp:Parameter DbType="Date" Name="ExpiryDate" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemName" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DbType="Date" Name="PurchaseDate" />
                            <asp:Parameter Name="CategoryID" Type="Int32" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="ManufacturedDate" />
                            <asp:Parameter DbType="Date" Name="ExpiryDate" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <!--Point 11-->
    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">List of Item currently out of stock or less than 5.</h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewItemStock" CssClass="table align-items-center table-flush" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceItemOutofStock">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="ManufacturedDate" HeaderText="ManufacturedDate" SortExpression="ManufacturedDate" />
                            <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceItemOutofStock" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select * from Items where Quantity&lt;5"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <!--Point 12-->
    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">List of Customers who have not bought any item in last 31 days.</h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewItemNotPurchase" CssClass="table align-items-center table-flush" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSourceNotPurchase">
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                            <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" />
                        </Columns>
                    </asp:GridView>
	                <asp:SqlDataSource ID="SqlDataSourceNotPurchase" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="Select * from Customers where CustomerID not in (Select CustomerID from Sales where DateDiff(dd, BillingDate, Convert(date, getDate()))&lt;=31)"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <!--Point 13-->
    <div class="row">
        <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">List of Items in the stock where no item has been sold in last 31 days.</h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                     <asp:GridView ID="GridViewNoItemSold" CssClass="table align-items-center table-flush" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceNoItemSold">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="ManufacturedDate" HeaderText="ManufacturedDate" SortExpression="ManufacturedDate" />
                            <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                        </Columns>
                    </asp:GridView>

	                <asp:SqlDataSource ID="SqlDataSourceNoItemSold" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="Select * from Items where ID not in(Select OrderDetails.ItemID from OrderDetails join Sales on OrderDetails.SalesID = Sales.SalesID where DateDiff(dd, Sales.BillingDate, Convert(date, getDate()))&lt;=31)"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

   
	<div class="modal-wrapper" id="modal">
		<section class="modal-window">
			<header class="modal-header">
				<h3 class="modal-title"></h3>
				<button type="button" class="close-modal-button btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
			</header>
			<div class="modal-body">
				<span>List of Items stocks below 10:</span><br />
				<ul>
					<li class="stock-lists"></li>
				</ul>
			</div>
			<div class="content-button-wrapper" style="text-align:center;">
				<button class="btn btn-primary continue" >Close</button>
			</div>
		</section>
	</div>

	<div class="overlay-app"></div>

    <asp:SqlDataSource ID="SqlDataSourceStockQuantity" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select * from items where quantity &lt; 10"></asp:SqlDataSource>
	
	<script>
        const overlay = document.querySelector(".overlay-app");
        const modalWrapper = document.getElementById('modal');

		function ShowUp(title, body) {
            modalWrapper.classList.add("visible");
			overlay.classList.add("is-active");
			var message_title = document.querySelector(".modal-title");
            var message_body = document.querySelector(".stock-lists");
            message_title.innerHTML = title;
            const itemlist = body.split(',');
            var output = '';
            for (var i in itemlist) {
                output += '<li>' + itemlist[i] + '</li>';
            }
            message_body.innerHTML = output;
        }

        function ShowUserBlockedAlert(title, message, icon) {
            swal({
                title: title,
                text: message,
                icon: icon,
            });
        }

        document.querySelectorAll(".continue").forEach(continueButtons => {
            continueButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });
        document.querySelectorAll(".close").forEach(closeModalButtons => {
            closeModalButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });
        document.querySelectorAll(".overlay-app").forEach(closeModalButtons => {
            closeModalButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });
    </script>
</asp:Content>