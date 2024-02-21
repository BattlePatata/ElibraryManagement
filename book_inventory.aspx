<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="book_inventory.aspx.cs" Inherits="ElibraryManagement.book_inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <img width="100" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <%--Book ID and Book name--%>
                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <label>Book ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                            CssClass="form-control" placeholder="ID"></asp:TextBox>
                                              <asp:LinkButton class="btn btn-primary" ID="Button2" 
                                                          runat="server" Text="Aboba"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                    
                            <div class="col-md-9 mx-auto">
                                <label>Book Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"
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
                                    <asp:DropDownList ID="DropDownList2" runat="server"
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
                                        <asp:DropDownList ID="DropDownList3" runat="server"
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
                                    <asp:DropDownList ID="DropDownList4" runat="server"
                                                      placeholder="Select" class="form-control">
                                        <asp:ListItem Text="Aboba Boobovich" Value="Aboba Boobovich"></asp:ListItem>
                                        <asp:ListItem Text="Andrius Krollus" Value="Andrius Krollus"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox12" runat="server" 
                                                CssClass="form-control" placeholder="dd-mm-yyyy"
                                                TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                    
                            <div class="col-md-4">
                                <label>Genre</label>
                                    <div class="form-group">
                                        <asp:ListBox class="form-control" ID="ListBox1" runat="server"
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
                                       <asp:TextBox ID="TextBox3" runat="server"
                                                    CssClass="form-control" placeholder="Edition"
                                                    ></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Book Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox6" runat="server"
                                                     CssClass="form-control" placeholder="Book Cost(per unit)"
                                                     TextMode="Number"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox7" runat="server"
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
                                       <asp:TextBox ID="TextBox4" runat="server"
                                                    CssClass="form-control" placeholder="Actual Stock"
                                                    ></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox8" runat="server"
                                                     CssClass="form-control" placeholder="Current Stock"
                                                     TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Issued Books</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox9" runat="server"
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
                                    <asp:TextBox ID="TextBox5" runat="server"
                                                    CssClass="form-control" placeholder="Book Description"
                                                    TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                </div>
                        </div>
                    </div>
                    <%--Delete user button--%>
                    <div class="row">
                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" 
                                            runat="server" Text="Add" />
                            </div>
                        </div>

                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button3" 
                                            runat="server" Text="Update" />
                            </div>
                        </div>

                        <div class="col-4 mx-auto">
                            <div class="form-group">
                                <asp:Button class="btn btn-danger btn-block btn-lg" ID="Button4" 
                                            runat="server" Text="Delete" />
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
                                   <h4>Meember List</h4>
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
