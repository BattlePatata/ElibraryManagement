<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="book_inventory.aspx.cs" Inherits="ElibraryManagement.book_inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        };

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150" width="100" src="book_inventory_img/books1.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload OnChange="readURL(this);" class="form-control" ID="BookFileUpload" runat="server" />
                            </div>
                        </div>
                        <%--Book ID and Book name--%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="IdBox" runat="server" 
                                                            CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                                            <asp:Button Class="btn btn-primary" ID="GoButton" OnClick="GoButton_Click"
                                                        runat="server" Text="Go" />
                                        </div>
                                    </div>
                            </div>
                    
                            <div class="col-md-8 mx-auto">
                                <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="BookNameBox" runat="server"
                                                        CssClass="form-control" placeholder="Book Name"
                                                        ></asp:TextBox>
                                    </div>
                            </div>

                        </div>
                        <%-- Language, Publisher Name--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="LanguageDropDownList" runat="server"
                                                        placeholder="English" class="form-control">
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Russian" Value="Russian"></asp:ListItem>
                                        <asp:ListItem Text="Turkmen" Value="Turkmen"></asp:ListItem>
                                        <asp:ListItem Text="Turkish" Value="Turkish"></asp:ListItem>
                                        <asp:ListItem Text="Krollish" Value="Krollish"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                <label>Publisher Name</label>
                                <div class="form-group">
                                        <asp:DropDownList ID="PublisherNameDropDownList" runat="server"
                                                          placeholder="Select" class="form-control">
                                        <asp:ListItem Text="Aboba Ventures" Value="Aboba Ventures"></asp:ListItem>
                                        <asp:ListItem Text="Krollus Inc" Value="Krollus Inc"></asp:ListItem>
                                        <asp:ListItem Text="Predictor Entertaintment" Value="Predictor Entertaintment"></asp:ListItem>
                                        <asp:ListItem Text="Lumbego Memecorporated" Value="Lumbego Memecorporated"></asp:ListItem>
                                        <asp:ListItem Text="Captain Alex Corp" Value="Captain Alex Corp"></asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="AuthorNameDropDownList" runat="server"
                                                      placeholder="Select" class="form-control">
                                        <asp:ListItem Text="Aboba Boobovich" Value="Aboba Boobovich"></asp:ListItem>
                                        <asp:ListItem Text="Andrius Krollus" Value="Andrius Krollus"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PublishDateBox" runat="server" 
                                                CssClass="form-control" placeholder="dd-mm-yyyy"
                                                TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                    
                            <div class="col-md-4">
                                <label>Genre</label>
                                    <div class="form-group">
                                        <asp:ListBox class="form-control" ID="GenreListBox" runat="server"
                                                     SelectionMode="Multiple" Rows="5">
                                            <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                            <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                            <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                            <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                            <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                            <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                            <asp:ListItem Text="Wellness" Value="Wellness"></asp:ListItem>
                                            <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                            <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                            <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                            <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                            <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                            <asp:ListItem Text="Personal Development" Value="Personal Development"></asp:ListItem>
                                            <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                            <asp:ListItem Text="Science Fiction" Value="Science Fiction"></asp:ListItem>
                                            <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                            <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                            <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                            <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>
                                            <asp:ListItem Text="Encyclopedia" Value="Encyclopedia"></asp:ListItem>
                                            <asp:ListItem Text="Health" Value="Health"></asp:ListItem>
                                            <asp:ListItem Text="History" Value="History"></asp:ListItem>
                                            <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                            <asp:ListItem Text="Textbook" Value="Textbook"></asp:ListItem>
                                            <asp:ListItem Text="Science" Value="Science"></asp:ListItem>
                                            <asp:ListItem Text="Travel" Value="Travel"></asp:ListItem>
                                        </asp:ListBox>
                                    </div>
                            </div>
                        <%--Edition, Book Cost, Pages --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>Edition</label>
                                    <div class="form-group">
                                       <asp:TextBox ID="EditionTextBox" runat="server"
                                                    CssClass="form-control" placeholder="Edition"
                                                    ></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Book Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="BookCostBox" runat="server"
                                                     CssClass="form-control" placeholder="Book Cost(per unit)"
                                                     TextMode="Number"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="PagesBox" runat="server"
                                                    CssClass="form-control" placeholder="Pages"
                                                    ></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        
                        <%--Actual Stock, Current Stock, Issued Books--%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>Actual Stock</label>
                                    <div class="form-group">
                                       <asp:TextBox ID="ActualStockBox" runat="server"
                                                    CssClass="form-control" placeholder="Actual Stock"
                                                    ></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="CurrStockBox" runat="server"
                                                     CssClass="form-control" placeholder="Current Stock"
                                                     TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Issued Books</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="IssuedBooksBox" runat="server"
                                                    CssClass="form-control" placeholder="Issued Books"
                                                    TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                
                    </div>
                
                    <%--Book Address --%>
                    <div class="row">
                        <div class="col-12">
                            <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox ID="DescriptionBox" runat="server"
                                                    CssClass="form-control" placeholder="Book Description"
                                                    TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                        </div>
                    </div>
                    <%--Delete user button--%>
                    <div class="row">
                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-success btn-block btn-lg" ID="AddButton" 
                                            runat="server" Text="Add" OnClick="AddButton_Click"/>
                            </div>
                        </div>

                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-block btn-lg" ID="UpdateButton" 
                                            runat="server" Text="Update" OnClick="UpdateButton_Click"/>
                            </div>
                        </div>

                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-danger btn-block btn-lg" ID="DeleteButton" 
                                            runat="server" Text="Delete" OnClick="DeleteButton_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
        
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>

        </div>
        <div class="col-md-7">
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
</asp:Content>
