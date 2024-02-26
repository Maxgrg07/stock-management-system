<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StockManagementSystem.Registration.Registration" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
  <meta charset="utf-8" >
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Register Page">
  <meta name="author" content="Prakash Pun">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"  integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    
  <link href="../css/Auth.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" runat="server">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox ID="FullName" CssClass="form-control form-control-user" placeholder="Full Name" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="PhoneNumber" type="number" CssClass="form-control form-control-user" placeholder="Phone Number" runat="server" TextMode="Phone"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox ID="Email" CssClass="form-control form-control-user" placeholder="Email Address" runat="server" TextMode="Email"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12 mb-6 mb-sm-0">
                                        <asp:TextBox ID="Address" CssClass="form-control form-control-user" placeholder="Address" runat="server"></asp:TextBox>
                                    </div>
                               </div>

                               <div class="form-group row">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                       <asp:TextBox ID="Password" CssClass="form-control form-control-user" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                   </div>
                                   <div class="col-sm-6">
                                        <asp:TextBox ID="PasswordAgain" CssClass="form-control form-control-user" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
                                   </div> 
                                </div>
                                <asp:Button ID="RegisterButton" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Register Account" OnClick="RegisterButton_Click" />
                            </form>
                            <hr>
                            <div style="text-align: center;">
                                <asp:Label ID="Message" runat="server" ForeColor="Red" CssClass="text-center small"></asp:Label>                         
                            </div>
                            <div class="text-center">
                                <a class="small" runat="server" href="../Login.aspx">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceRegister" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([Name], [PhoneNumber], [Email], [Address], [MemberType], [Password]) VALUES (@Name, @PhoneNumber, @Email, @Address, @MemberType, @Password)" SelectCommand="SELECT * FROM [Users] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [Users] SET [Name] = @Name, [PhoneNumber] = @PhoneNumber, [Email] = @Email, [Address] = @Address, [MemberType] = @MemberType, [Password] = @Password WHERE [ID] = @ID">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" Type="String" />
        </SelectParameters>
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
    </body>
</html>
