<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_page.aspx.cs" Inherits="ElibraryManagement.user_page" %>
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
                                    <img width="100" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="AccStatusLabel" runat="server"></asp:Label>
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
                                        <asp:TextBox ID="FullNameBox" runat="server" 
                                                     Class="form-control" placeholder="Full Name"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-6 mx-auto">
                                <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="DobBox" runat="server"
                                                     class="form-control" placeholder="dd-mm-yyyy"
                                                     TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%-- Contact num, Email--%>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                                <label>Contact Number</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="ContactNoBox" runat="server" 
                                                 class="form-control" placeholder="Contact Number"
                                                 TextMode="Phone"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-6 mx-auto">
                                <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="EmailBox" runat="server"
                                                 class="form-control" placeholder="Email ID"
                                                 TextMode="Email"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--State, City, Pin code --%>
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                                <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="StateDropDownList" runat="server"
                                                          class="form-control">
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
                                        <asp:TextBox ID="CityBox" runat="server"
                                                 class="form-control" placeholder="City"></asp:TextBox>
                                    </div>
                            </div>
                        
                            <div class="col-md-4 mx-auto">
                                <label>Pin Code</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="PinCodeBox" runat="server"
                                                 class="form-control" placeholder="Pin Code"
                                                 TextMode="Number"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Full Address --%>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="FullAdrsBox" runat="server"
                                                     class="form-control" placeholder="Full Address"
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
                                        <asp:TextBox ID="IdBox" runat="server" 
                                                     placeholder="User ID"
                                                     ReadOnly="true" class="form-control"></asp:TextBox>
                                                     
                                    </div>
                            </div>
    
                            <div class="col-md-4 mx-auto">
                                <label>Old Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="PasswBox" runat="server"
                                                     class="form-control" placeholder="Old Password"
                                                     ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
    
                            <div class="col-md-4 mx-auto">
                                <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="NewPasswBox" runat="server"
                                                     class="form-control" placeholder="New Password"
                                                     TextMode="Password"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                        <%--Sign up button--%>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="UpdateButton" 
                                                    runat="server" Text="Update" OnClick="UpdateButton_Click" />
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
                                  <asp:Label Class="badge badge-pill badge-info" ID="UserIssuedLabel" 
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
                          <asp:SqlDataSource ID="IssuedBookSqlDataSource" runat="server"
                              ConnectionString="<%$ ConnectionStrings:ebobalibraryDBConnectionString %>"
                              ProviderName="<%$ ConnectionStrings:ebobalibraryDBConnectionString.ProviderName %>"
                              SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                          <div class="col">
                              <asp:GridView ID="UserIssuedGridView" runat="server"
                                  class="table table-striped table-bordered"
                                  OnRowDataBound="IssuedUserGridView_RowDataBound" 
                                  DataSourceID="IssuedBookSqlDataSource">
                              </asp:GridView>
                          </div>
                      </div>
                 </div>
              </div>
           </div>
        </div>
    </div>

</asp:Content>
