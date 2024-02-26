<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StockManagementSystem.Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="utf-8" >
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Login Page">
  <meta name="author" content="Prakash Pun">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="css/Auth.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox ID="Email" CssClass="form-control form-control-user" aria-describedby="emailHelp" placeholder="Enter Email Address..." runat="server" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="Password" CssClass="form-control form-control-user" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <asp:Button ID="LoginButton" CssClass="btn btn-primary btn-user btn-block" runat="server" Text="Login" OnClick="LoginButton_Click" />
                                    </form>
                                    <hr>
                                    <div style="text-align:center">
                                        <asp:Label ID="Message" runat="server" ForeColor="Red" CssClass="text-center small message"></asp:Label>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" runat="server" href="~/Registration/Register.aspx">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementSystemConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([Email] = @Email) AND ([Password] = @Password))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
