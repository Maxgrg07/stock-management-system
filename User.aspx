<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="StockManagementSystem.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-12 col-xl-12">
            <div class="card card-body shadow-sm mb-4">
                <h2 class="h5 mb-4">User information</h2>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="first_name">Full Name</label>
                            <asp:TextBox ID="FullName" CssClass="form-control form-control-user" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <asp:TextBox ID="PhoneNumber" type="number" CssClass="form-control form-control-user" placeholder="+977 98134332343" runat="server" TextMode="Phone"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="Email" CssClass="form-control form-control-user" placeholder="name@company.com" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-3">
                        <div class="form-group">
                            <label for="address">Address</label>
                            <asp:TextBox ID="Address" CssClass="form-control form-control-user" placeholder="Address" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="form-group">
                            <label for="phone">Password</label>
                            <asp:TextBox ID="Password" CssClass="form-control form-control-user" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="mt-3" style="text-align:center;">
                    <asp:Button ID="SaveUser" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Save User" OnClick="SaveUser_Click" />
                </div>
            </div>
        </div>
         <div class="col-12 mb-4">
            <div class="card border-light shadow-sm">
                <div class="card-header" style="background:transparent;">
                    <div class="row align-items-center">
                        <div class="col">
                            <h2 class="h5">Users</h2>
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewUsers" class="table table-centered table-nowrap mb-0 rounded" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceUsers">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="MemberType" HeaderText="MemberType" SortExpression="MemberType" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />

                        </Columns>
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([Name], [PhoneNumber], [Email], [Address], [MemberType], [Password]) VALUES (@Name, @PhoneNumber, @Email, @Address, @MemberType, @Password)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [Name] = @Name, [PhoneNumber] = @PhoneNumber, [Email] = @Email, [Address] = @Address, [MemberType] = @MemberType, [Password] = @Password WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="MemberType" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>

                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceUserData" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE ([Email] = @Email)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
         </div>
    </div>

    <script type="text/javascript">
        function ShowUserAlert(title, message, icon) {
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
