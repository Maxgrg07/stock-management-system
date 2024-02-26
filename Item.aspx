<%@ Page Title="Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="StockManagementSystem.Item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-12 col-xl-12">
            <div class="card card-body shadow-sm mb-4">
                <h2 class="h5 mb-4">Add Item</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="item_name">Item Name</label>
                               <asp:TextBox ID="ItemName" runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="price">Price</label>
                            <asp:TextBox ID="ItemPrice" CssClass="form-control" runat="server" TextMode="Number" min="1"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8 mb-3">
                        <div class="form-group">
                            <label for="Description">Description</label>
                            <asp:TextBox ID="ItemDescription" CssClass="form-control" placeholder="Description of the Item" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6 mb-3">
                        <div class="form-group">
                            <label for="address">Purchase Date</label>
                            <asp:TextBox ID="PurchaseDate" CssClass="form-control date" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="category">Category</label>
                        <asp:DropDownList ID="CategoryList" CssClass="form-control form-select mb-0" runat="server" AutoPostBack="true" DataSourceID="DataSourceCategoryList" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="DataSourceCategoryList" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-2 mb-3">
                        <div class="form-group">
                            <label for="address">Quantity</label>
                            <asp:TextBox ID="Quantity" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="phone">Manufactured Date</label>
                            <asp:TextBox ID="ManufacturedDate" CssClass="form-control date" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="phone">Expiry Date</label>
                            <asp:TextBox ID="ExpiryDate" CssClass="form-control date" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="mt-3" style="text-align: center;">
                    <asp:Button ID="AddItem" runat="server" CssClass="btn btn-primary" Text="Add Item" OnClick="AddItem_Click" />
                </div>
            </div>
        </div>
   </div>

   <div class="card shadow mb-4">
       <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold">Items</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="ItemsView" CssClass="table table-bordered" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceItems" OnRowCommand="ItemsView_RowCommand">
                    <Columns>
                        <asp:ButtonField CommandName="ViewItem"  Text="View" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Items] ([ItemName], [Price], [Description], [PurchaseDate], [CategoryID], [Quantity], [ManufacturedDate], [ExpiryDate]) VALUES (@ItemName, @Price, @Description, @PurchaseDate, @CategoryID, @Quantity, @ManufacturedDate, @ExpiryDate)" SelectCommand="SELECT Items.ID, Items.ItemName, items.Description, Items.PurchaseDate, Items.Price, Items.Quantity, Items.CategoryID, Category.Name as CategoryName FROM Items join Category on Category.ID = Items.CategoryID" UpdateCommand="UPDATE [Items] SET [ItemName] = @ItemName, [Price] = @Price, [Description] = @Description, [PurchaseDate] = @PurchaseDate, [CategoryID] = @CategoryID, [Quantity] = @Quantity, [ManufacturedDate] = @ManufacturedDate, [ExpiryDate] = @ExpiryDate WHERE [ID] = @ID">
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
    <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Items] WHERE ([ItemName] = @ItemName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ItemName" Name="ItemName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Label ID="LabelItem" runat="server" Text=""></asp:Label>
    
    <div class="modal-wrapper" style="width:800px;" id="modal">
		<section class="modal-window">
			<header class="modal-header" style="border-bottom:none;">
				<h4 class="modal-title">Item Detail</h4>
				<button type="button" class="close-modal-button btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
			</header>
			<div class="modal-body" style="padding:0;">
				<div class="row">
                    <div class="col-12 mb-4">
                        <div class="card border-light shadow-sm">
                            <div class="table-responsive">
                                <asp:GridView ID="GridViewItemDetail" CssClass="table align-items-center table-flush"  runat="server" AutoGenerateColumns="False" DataKeyNames="ID,CategoryID" DataSourceID="SqlDataSourceItemDetail">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                                        <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                                        <asp:BoundField DataField="ManufacturedDate" HeaderText="ManufacturedDate" SortExpression="ManufacturedDate" />
                                        <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceItemDetail" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="select Items.ID, Items.ItemName, Items.Price, Items.Quantity, Items.Description, Category.ID as CategoryID, Category.Name as CategoryName, Items.PurchaseDate, Items.ManufacturedDate, Items.ExpiryDate from Items join Category on Items.CategoryID=Category.ID where Items.ID = @ID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelItem" Name="ID" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			<div class="content-button-wrapper" style="text-align:center;">
				<button class="btn btn-primary continue" >Close</button>
			</div>
		</section>
	</div>

    <div class="overlay-app"></div>

   <script>
        const overlay = document.querySelector(".overlay-app");
        const modalWrapper = document.getElementById('modal');

        function ShowItemDetail() {
            modalWrapper.classList.add("visible");
            overlay.classList.add("is-active");
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
        function ShowItemAlert(title, message, icon) {
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
