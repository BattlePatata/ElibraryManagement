<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="book_issuing.aspx.cs" Inherits="ElibraryManagement.book_issuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>

                        <%--Meember ID and Book ID input area --%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Meember ID</label>
                                    <div class="form-group">
                                            <asp:TextBox ID="TextBox3" runat="server" 
                                                         CssClass="form-control" placeholder="Meember ID"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox4" runat="server"
                                                            CssClass="form-control" placeholder="Book ID">
                                            </asp:TextBox>
                                            
                                            <asp:Button class="btn btn-primary" ID="Button1" 
                                                        runat="server" Text="Go" />
                                        </div>
                                   </div>
                            </div>
                        </div>

                        <%--Meember Name and Book Name--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Meember Name</label>
                                    <div class="form-group">
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                         CssClass="form-control" placeholder="Meember Name"
                                                         ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"
                                                     CssClass="form-control" placeholder="Book Name"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <%--Start Date and End Date input area --%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Start Date</label>
                                    <div class="form-group">
                                            <asp:TextBox Date="TextBox5" runat="server" 
                                                         CssClass="form-control" placeholder="Start Date"
                                                         TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>End Date</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox6" runat="server"
                                                     CssClass="form-control" placeholder="End Date"
                                                     TextMode="Date">
                                        </asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <%--Buttons--%>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button3" 
                                                    runat="server" Text="Issue" />
                                    </center>
                                </div>
                            </div>
                    
                            <div class="col-6">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button4" 
                                                    runat="server" Text="Return" />
                                    </center>
                                </div>
                            </div>
                        </div>
                    
                    
                    </div>
                </div>
    
                <a href="homepage.aspx"><< Back to Home</a><br><br>
            </div>
            <%--Issued Book List--%>
            <div class="col-md-7">
              <div class="card">
                  <div class="card-body">
                      <div class="row">
                          <div class="col">
                              <center>
                                  <h4>Issued Book List</h4>
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
