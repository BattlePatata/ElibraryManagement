<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_login.aspx.cs" Inherits="ElibraryManagement.user_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Meember Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <%-- Login Password input--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="MeemberIdBox" 
                                                 runat="server" placeholder="Meember ID"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="PasswrdBox" 
                                                    runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1"
                                        runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>

                                <div class="form-group">
                                    <a href="sign_up.aspx"><input class="btn btn-info btn-block btn-lg" id="Button2" 
                                           type="button" value="Sign Up" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
