<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="view_books.aspx.cs" Inherits="ElibraryManagement.view_books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Book Inventory List</h4>
                                    </center>
                                </div>
                            </div>
  
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="InventorySqlDataSource" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ebobalibraryDBConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:ebobalibraryDBConnectionString.ProviderName %>"
                                    SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView ID="InventoryGridView" runat="server"
                                        DataSourceID="InventorySqlDataSource"
                                        class="table table-striped table-bordered" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID"
                                                            ReadOnly="true" SortExpression="book_id"
                                                            ><itemstyle Font-Bold="true"></itemstyle></asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <%-- Book Name --%>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <asp:Label ID="BookLabel" runat="server" 
                                                                                    Text='<%# Eval("book_name")%>' 
                                                                                    Font-Bold="true" Font-Size="X-Large">
                                                                        </asp:Label>
                                                                    </div>
                                                                </div>

                                                                <%-- Author Name, Genre, Language --%>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span>Author - </span>
                                                                        <asp:Label ID="AuthorLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("author_name")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Genre - </span>
                                                                        <asp:Label ID="GenreLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("genre")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Genre - </span>
                                                                        <asp:Label ID="LangLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("language")%>'>
                                                                        </asp:Label>
                                                                    </div>
                                                                </div>

                                                                <%-- Publisher Name, Publish Date, Pages, Edition --%>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span>Publisher - </span>
                                                                        <asp:Label ID="PublishLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("publisher_name")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Publish date - </span>
                                                                        <asp:Label ID="PublishDateLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("publish_date")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Pages - </span>
                                                                        <asp:Label ID="PagesLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("no_of_pages")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Edition - </span>
                                                                        <asp:Label ID="EditionLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("edition")%>'>
                                                                        </asp:Label>
                                                                    </div>
                                                                </div>

                                                                <%-- Cost, Actual Stock, Available --%>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span>Cost - </span>
                                                                        <asp:Label ID="CostLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("book_cost")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Actual Stock - </span>
                                                                        <asp:Label ID="ActualStockLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("actual_stock")%>'>
                                                                        </asp:Label>

                                                                        &nbsp;| <span><span></span>Available - </span>
                                                                        <asp:Label ID="AvailableLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Text='<%# Eval("current_stock")%>'>
                                                                        </asp:Label>
                                                                    </div>
                                                                </div>

                                                                <%-- Description --%>
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <span>Description- </span>
                                                                        <asp:Label ID="DescriptionLabel" runat="server" 
                                                                                    Font-Bold="true" Font-Size="Small"
                                                                                    Font-Italic="true"
                                                                                    Text='<%# Eval("book_description")%>'>
                                                                        </asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-2">
                                                                <asp:Image class="img-fluid p-2" ID="BookImage" 
                                                                            runat="server" ImageUrl='<%# Eval("book_img_link") %>'/> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="homepage.aspx"><< Back To Home</a><span class="clearfix"></span><br />
    </center>
</asp:Content>
