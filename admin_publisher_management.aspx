<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_publisher_management.aspx.cs" Inherits="ElibraryManagement.imgs.admin_publisher_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Deatils</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/publisher.png" />
                                </center>
                            </div>
                        </div>
                        <%--Publisher input area --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>Publisher ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                            CssClass="form-control" placeholder="Publisher ID"></asp:TextBox>
                                        
                                            <asp:Button class="btn btn-primary" ID="Button1" 
                                                        runat="server" Text="Go" />
                                        </div>
                                    </div>
                            </div>
                    
                            <div class="col-md-8 mx-auto">
                                <label>Publisher Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"
                                                        CssClass="form-control" placeholder="Publisher Name">
                                        </asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        
                        <%--Buttons --%>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button3" 
                                                    runat="server" Text="Add" />
                                    </center>
                                </div>
                            </div>
                        
                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button4" 
                                                    runat="server" Text="Update" />
                                    </center>
                                </div>
                            </div>
                        
                            <div class="col-4">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button5" 
                                                    runat="server" Text="Delete" />
                                    </center>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
        
                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
            <%--Publisher list --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>
      
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server"
                                            class="table table-striped table-bordered"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
