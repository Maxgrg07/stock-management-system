<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="StockManagementSystem.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-12 col-xl-12">
            <div class="card card-body shadow-sm mb-4">
                <h2 class="h5 mb-4">Customer information</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="first_name">Full Name</label>
                            <asp:TextBox ID="FullName" CssClass="form-control form-control-user" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="Email" CssClass="form-control form-control-user" placeholder="name@company.com" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-8 mb-3">
                        <div class="form-group">
                            <label for="address">Address</label>
                            <asp:TextBox ID="Address" CssClass="form-control form-control-user" placeholder="Address" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="type">Member Type</label>
                        <asp:DropDownList ID="DropDownListType" CssClass="form-select form-control"  runat="server">
                            <asp:ListItem Value="VIP Customer" Selected="True">VIP Customer</asp:ListItem>
                            <asp:ListItem Value="Customer">Customer</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <asp:TextBox ID="PhoneNumber" type="number" CssClass="form-control form-control-user" placeholder="+977 98134332343" runat="server" TextMode="Phone"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="mt-3" style="text-align:center;">
                    <asp:Button ID="SaveCustomer" CssClass="btn btn-primary" runat="server" Text="Save Customer" OnClick="SaveCustomer_Click" />
                </div>
            </div>
        </div>

         <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">Customers</h2>
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewCustomers" class="table align-items-center table-flush" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSourceCustomers">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                            <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [Email], [Address], [PhoneNumber], [MemberType]) VALUES (@Name, @Email, @Address, @PhoneNumber, @MemberType)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Email] = @Email, [Address] = @Address, [PhoneNumber] = @PhoneNumber, [MemberType] = @MemberType WHERE [CustomerID] = @CustomerID">
                        <DeleteParameters>
                            <asp:Parameter Name="CustomerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                            <asp:Parameter Name="CustomerID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceCustomerValid" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [Email], [Address], [PhoneNumber], [MemberType]) VALUES (@Name, @Email, @Address, @PhoneNumber, @MemberType)" SelectCommand="SELECT * FROM [Customers] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Email] = @Email, [Address] = @Address, [PhoneNumber] = @PhoneNumber, [MemberType] = @MemberType WHERE [CustomerID] = @CustomerID">
                        <DeleteParameters>
                            <asp:Parameter Name="CustomerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                            <asp:Parameter Name="CustomerID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowCustomerAlert(title, message, icon) {
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
