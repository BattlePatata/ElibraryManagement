<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="book_issuing.aspx.cs" Inherits="ElibraryManagement.book_issuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
     </script>
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
                                            <asp:TextBox ID="MeemberIdBox" runat="server" 
                                                         CssClass="form-control" placeholder="Meember ID"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="BookIdBox" runat="server"
                                                            CssClass="form-control" placeholder="Book ID">
                                            </asp:TextBox>
                                            
                                            <asp:Button class="btn btn-primary" ID="GoButton" 
                                                        runat="server" Text="Go" OnClick="GoButton_Click" />
                                        </div>
                                   </div>
                            </div>
                        </div>

                        <%--Meember Name and Book Name--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Meember Name</label>
                                    <div class="form-group">
                                            <asp:TextBox ID="MeemberNameBox" runat="server" 
                                                         CssClass="form-control" placeholder="Meember Name"
                                                         ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="BookNameBox" runat="server"
                                                     CssClass="form-control" placeholder="Book Name"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <%--Start Date and End Date input area --%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Issue Date</label>
                                    <div class="form-group">
                                            <asp:TextBox ID="IssueDateBox" runat="server" 
                                                         CssClass="form-control" placeholder="Issue Date"
                                                         TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                
                            <div class="col-md-6 mx-auto">
                                <label>Due Date</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="DueDateBox" runat="server"
                                                     CssClass="form-control" placeholder="Due Date"
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
                                        <asp:Button class="btn btn-lg btn-block btn-primary" ID="IssueButton" 
                                                    runat="server" Text="Issue" OnClick="IssueButton_Click"/>
                                    </center>
                                </div>
                            </div>
                    
                            <div class="col-6">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="ReturnButton" 
                                                    runat="server" Text="Return" OnClick="ReturnButton_Click"/>
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
                          <asp:SqlDataSource ID="IssuedBookSqlDataSource" runat="server"
                              ConnectionString="<%$ ConnectionStrings:ebobalibraryDBConnectionString %>"
                              ProviderName="<%$ ConnectionStrings:ebobalibraryDBConnectionString.ProviderName %>"
                              SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                          <div class="col">
                              <asp:GridView ID="IssuedBooksGridView" runat="server"
                                            class="table table-striped table-bordered"
                                            DataSourceID="IssuedBookSqlDataSource" AutoGenerateColumns="False" 
                                            OnRowDataBound="IssuedBooksGridView_RowDataBound">
                                  <Columns>
                                      <asp:BoundField DataField="meember_id" HeaderText="Meember ID" SortExpression="meember_id"></asp:BoundField>
                                      <asp:BoundField DataField="meember_name" HeaderText="Meember Name" SortExpression="meember_name"></asp:BoundField>
                                      <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
                                      <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                      <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
                                      <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
                                  </Columns>
                              </asp:GridView>
                          </div>
                      </div>
                 </div>
              </div>
           </div>
        </div>
    </div>
</asp:Content>
