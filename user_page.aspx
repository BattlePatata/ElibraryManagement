<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_page.aspx.cs" Inherits="ElibraryManagement.user_page" %>
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
                                    <img width="100" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label CssClass="badge badge-pill badge-info" ID="Label1" runat="server" Text="Pending"></asp:Label>
                                </center>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <%--Full Name and Date of Birth --%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox1" runat="server" 
                                                     CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-6 mx-auto">
                                <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"
                                                     CssClass="form-control" placeholder="dd-mm-yyyy"
                                                     TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%-- Contact num, Email--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox3" runat="server" 
                                                 CssClass="form-control" placeholder="Contact Number"
                                                 TextMode="Phone"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-6 mx-auto">
                                <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox4" runat="server"
                                                 CssClass="form-control" placeholder="Email ID"
                                                 TextMode="Email"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--State, City, Pin code --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server"
                                                          CssClass="form-control">
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
                                                 CssClass="form-control" placeholder="City"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-4 mx-auto">
                                <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox7" runat="server"
                                                 CssClass="form-control" placeholder="Pin Code"
                                                 TextMode="Number"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Full Address --%>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox5" runat="server"
                                                     CssClass="form-control" placeholder="Full Address"
                                                     TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                    
                        <%--Pill badge--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info mx-auto">Login Credentials</span><br><br>
                                </center>
                            </div>
                        </div>

                        <%--User ID, Password--%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>User ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox8" runat="server" 
                                                     placeholder="User ID"
                                                     ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                                     
                                    </div>
                            </div>
    
                            <div class="col-md-4 mx-auto">
                                <label>Old Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox9" runat="server"
                                                     CssClass="form-control" placeholder="Old Password"
                                                     ReadOnly="true" TextMode="Password"></asp:TextBox>
                                    </div>
                            </div>
    
                            <div class="col-md-4 mx-auto">
                                <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox10" runat="server"
                                                     CssClass="form-control" placeholder="New Password"
                                                     TextMode="Password"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Sign up button--%>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" 
                                                    runat="server" Text="Update" />
                                    </center>
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
                                  <img width="100" src="imgs/books1.png" />
                              </center>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col">
                              <center>
                                  <h4>Your Issued Books</h4>
                                  <asp:Label CssClass="badge badge-pill badge-info" ID="Label2" 
                                             runat="server" Text="Info about book due date"></asp:Label>
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
