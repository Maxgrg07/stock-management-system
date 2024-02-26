<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="StockManagementSystem.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Profile</h3>
    <div class="row">
        <div class="col-12 col-sm-6 col-xl-6 mb-4">
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="card shadow-sm text-center p-0">
                        <div class="profile-cover rounded-top" data-background="../assets/img/profile-cover.jpg"></div>
                        <div class="card-body pb-5">
                            <img src="../images/profile.svg" class="user-avatar large-avatar rounded-circle mx-auto mt-n7 mb-4" alt="Profile" style="width: 100px;"><br />
                            <asp:Label ID="Name" class="h3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="Email" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="Address" runat="server"  class="text-gray mb-4" Text=""></asp:Label><br />
                            <asp:TextBox ID="UserID" runat="server" Visible="false"></asp:TextBox>
                         <!--   <a class="btn btn-sm btn-dark me-2" href="#"><span class="fas fa-user-plus me-1"></span> Connect</a>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-12 col-sm-6 col-xl-6 mb-4">
            <div class="card card-body shadow-sm mb-4">
                <h2 class="h5 mb-4">Change Password</h2>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div>
                            <label for="old_password">Old Password</label>
                            <asp:TextBox ID="OldPassword" runat="server" class="form-control" placeholder="Enter Old Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <div>
                            <label for="new_password">New Password</label>
                            <asp:TextBox ID="NewPassword" runat="server" class="form-control" placeholder="Enter New Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-12 mb-3">
                        <div>
                            <label for="confirm_password">Confirm New Password</label>
                            <asp:TextBox ID="ConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <asp:Label ID="Message" runat="server" Text=""></asp:Label>
                <div class="mt-3" style="text-align: center;">
                    <asp:Button ID="ChangePassword" class="btn btn-dark" runat="server" Text="Change Password" OnClick="ChangePassword_Click" />
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceProfile" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([ID] = @ID) AND ([Password] = @Password))">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserID" Name="ID" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="OldPassword" Name="Password" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <script>
        function ShowUserBlockedAlert(title, message, icon) {
            swal({
                title: title,
                text: message,
                icon: icon,
            });
        }
        function ShowProfileAlert(title, message, icon) {
            swal({
                title: title,
                text: message,
                icon: icon,
            });
        }
    </script>
</asp:Content>
