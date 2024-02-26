<%@ Page Title="Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StockManagementSystem.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-12 col-xl-12">
            <div class="card card-body shadow-sm mb-4">
                <h2 class="h5 mb-4">Add Category</h2>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div>
                            <label for="first_name">Category Name</label>
                            <asp:TextBox ID="CategoryName" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label for="address">Description</label>
                            <asp:TextBox ID="Description" CssClass="form-control" placeholder="Enter Category Description" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="mt-3" style="text-align: center;">
                    <asp:Button ID="AddCategory" CssClass="btn btn-primary" runat="server" Text="Add Category" OnClick="AddCategory_Click" />
                </div>
            </div>
        </div>
         </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold">Category Data</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="GridViewCategory" CssClass="table table-bordered" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceCategories" OnRowCommand="GridViewCategory_RowCommand">
                    <Columns>
                        <asp:ButtonField CommandName="ViewCategory"  Text="View" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Category] ([Name], [Description]) VALUES (@Name, @Description)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Category] ([Name], [Description]) VALUES (@Name, @Description)" SelectCommand="SELECT * FROM [Category] WHERE ([Name] = @Name)" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryName" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Message" runat="server" ForeColor="Red"></asp:Label>
    <asp:Label ID="CategoryLabel" runat="server" Text=""></asp:Label>


    <div class="modal-wrapper" style="width:800px;" id="modal">
		<section class="modal-window">
			<header class="modal-header" style="border-bottom:none;">
				<h4 class="modal-title">Category Detail</h4>
				<button type="button" class="close-modal-button btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
			</header>
			<div class="modal-body" style="padding:0;">
				<div class="row">
                    <div class="col-12 mb-4">
                        <div class="card border-light shadow-sm">
                            <div class="table-responsive">
                                <asp:GridView ID="GridViewCategoryDetail" CssClass="table align-items-center table-flush" runat="server" DataSourceID="SqlDataSourceCategoryDetail"></asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceCategoryDetail" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([CategoryID] = @CategoryID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="CategoryLabel" Name="CategoryID" PropertyName="Text" Type="Int32" />
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

        function ShowCategoryDetail() {
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
