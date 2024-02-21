<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="meember_management.aspx.cs" Inherits="ElibraryManagement.Meember_management" %>
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
                                    <h4>Meember Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <%--Full Name and Date of Birth --%>
                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <label>Meember ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                            CssClass="form-control" placeholder="ID"></asp:TextBox>
                                              <asp:LinkButton class="btn btn-primary" ID="Button2" 
                                                          runat="server" Text="Aboba"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"
                                                        CssClass="form-control" placeholder="Meember Name"
                                                        ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>

                            <div class="col-md-5 mx-auto">
                                <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox10" runat="server" 
                                                         CssClass="form-control mr-1" placeholder="Pending"
                                                         ReadOnly="true"></asp:TextBox>
                                            
                                            <asp:LinkButton class="btn btn-success mr-1" ID="Button3" 
                                                        runat="server" Text="S"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                            
                                            <asp:LinkButton class="btn btn-warning mr-1" ID="Button4" 
                                                        runat="server" Text="P"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                            
                                            <asp:LinkButton class="btn btn-danger" ID="Button5" 
                                                        runat="server" Text="D"><i class="fa-solid fa-circle-xmark"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <%-- Contact num, Email--%>
                        <div class="row">
                            <div class="col-md-3 mx-auto">
                                <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox3" runat="server" 
                                                    CssClass="form-control" placeholder="dd-mm-yyyy"
                                                    TextMode="Date" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>

                            <div class="col-md-4 mx-auto">
                                <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox12" runat="server" 
                                                    CssClass="form-control" placeholder="Contact No"
                                                    TextMode="Phone" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-5 mx-auto">
                                <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox4" runat="server"
                                                    CssClass="form-control" placeholder="Email ID"
                                                    TextMode="Email" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--State, City, Pin code --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server"
                                                            CssClass="form-control" ReadOnly="true">
                                            <asp:ListItem Text="Select" Value="select" />
                                            <asp:ListItem Text="Illinois" Value="Illinois" />
                                            <asp:ListItem Text="D.C. Washington" Value="D.C. Washington" />
                                            <asp:ListItem Text="New-York" Value="New-York" />
                                            <asp:ListItem Text="California" Value="California" />
                                            <asp:ListItem Text="Texas" Value="Texas" />
                                            <asp:ListItem Text="Florida" Value="Florida" />
                                            <asp:ListItem Text="Albuquerke" Value="Albuquerke" />
                                            <asp:ListItem Text="Pensilvania" Value="Pensilvania" />
                                            <asp:ListItem Text="Alaska" Value="Alaska" />
                                            <asp:ListItem Text="Montana" Value="Montana" />
                                            <asp:ListItem Text="Colorado" Value="Colorado" />
                                            <asp:ListItem Text="Boston" Value="Boston" />
                                            <asp:ListItem Text="Kentucky" Value="Kentucky" />
                                            <asp:ListItem Text="Iowa" Value="Iowa" />
                                            <asp:ListItem Text="Aboba" Value="Aboba" />
                                            <asp:ListItem Text="Booba" Value="Booba" />
                                            <asp:ListItem Text="Biba" Value="Biba" />
                                            <asp:ListItem Text="Boba" Value="Boba" />
                                            <asp:ListItem Text="Kroll" Value="Kroll" />
                                            <asp:ListItem Text="Lumbego" Value="Lumbego" />
                                            <asp:ListItem Text="Cringe" Value="Cringe" />
                                            <asp:ListItem Text="Skill Issue" Value="Skill Issue" />
                                            <asp:ListItem Text="Memeistan" Value="Memeistan" />
                                            <asp:ListItem Text="Rofland" Value="Rofland" />
                                            <asp:ListItem Text="Lmaofornia" Value="Lmaofornia" />
                                            <asp:ListItem Text="Retardexon" Value="Retardexon" />
                                            <asp:ListItem Text="Tripperton" Value="Tripperton" />
                                            <asp:ListItem Text="Washingtown" Value="Washingtown" />
                                            <asp:ListItem Text="Vioming" Value="Vioming" />
                                            <asp:ListItem Text="Sam Lake" Value="Sam Lake" />
                                        </asp:DropDownList>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox6" runat="server"
                                                     CssClass="form-control" placeholder="City"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                    
                            <div class="col-md-4 mx-auto">
                                <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox7" runat="server"
                                                    CssClass="form-control" placeholder="Pin Code"
                                                    TextMode="Number" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Full Address --%>
                        <div class="row">
                            <div class="col">
                                <label>Full Postal Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox5" runat="server"
                                                        CssClass="form-control" placeholder="Product Description"
                                                        TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                
                        <%--Delete user button--%>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-block btn-lg" ID="Button1" 
                                                runat="server" Text="Delete User Permanently" />
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
