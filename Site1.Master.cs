using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LoginButton.Visible = true; // Login LinkButton
                    SignUpButton.Visible = true; // Sign Up LinkButton

                    LogoutButton.Visible = false; // Logout LinkButton
                    UserPageButton.Visible = false; // Hello User LinkButton

                    AdminButton.Visible = true; // Admin login LinkButton
                    AuthorMngmt.Visible = false; // Author Management  LinkButton
                    PublisherMngmt.Visible = false; // Publisher Management LinkButton
                    BookInventory.Visible = false; // Book Inventory LinkButton
                    BookIssuing.Visible = false; // Book Issuing LinkButton
                    MeemberMngmt.Visible = false; // Meember Management LinkButton
                }
                else if (Session["role"].Equals("user")) 
                {
                    LoginButton.Visible = false; // Login LinkButton
                    SignUpButton.Visible = false; // Sign Up LinkButton

                    LogoutButton.Visible = true; // Logout LinkButton
                    UserPageButton.Visible = true; // Hello User LinkButton
                    UserPageButton.Text =  "Hello " + Session["username"].ToString();

                    AdminButton.Visible = true; // Admin login LinkButton
                    AuthorMngmt.Visible = false; // Author Management  LinkButton
                    PublisherMngmt.Visible = false; // Publisher Management LinkButton
                    BookInventory.Visible = false; // Book Inventory LinkButton
                    BookIssuing.Visible = false; // Book Issuing LinkButton
                    MeemberMngmt.Visible = false; // Meember Management LinkButton
                }
                else if (Session["role"].Equals("admin")) 
                {
                    LoginButton.Visible = false; // Login LinkButton
                    SignUpButton.Visible = false; // Sign Up LinkButton

                    LogoutButton.Visible = true; // Logout LinkButton
                    UserPageButton.Visible = true; // Hello User LinkButton
                    UserPageButton.Text =  "Hello " + Session["username"].ToString() + " Admin";

                    AdminButton.Visible = false; // Admin login LinkButton
                    AuthorMngmt.Visible = true; // Author Management  LinkButton
                    PublisherMngmt.Visible = true; // Publisher Management LinkButton
                    BookInventory.Visible = true; // Book Inventory LinkButton
                    BookIssuing.Visible = true; // Book Issuing LinkButton
                    MeemberMngmt.Visible = true; // Meember Management LinkButton
                }
            }
            catch 
            {
                    LoginButton.Visible = true; // Login LinkButton
                    SignUpButton.Visible = true; // Sign Up LinkButton

                    LogoutButton.Visible = false; // Logout LinkButton
                    UserPageButton.Visible = false; // Hello User LinkButton

                    AdminButton.Visible = true; // Admin login LinkButton
                    AuthorMngmt.Visible = false; // Author Management  LinkButton
                    PublisherMngmt.Visible = false; // Publisher Management LinkButton
                    BookInventory.Visible = false; // Book Inventory LinkButton
                    BookIssuing.Visible = false; // Book Issuing LinkButton
                    MeemberMngmt.Visible = false; // Meember Management LinkButton
            }
        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_login.aspx");
        }

        protected void AuthorMngmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_author_management.aspx");
        }

        protected void PublisherMngmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_publisher_management.aspx");
        }

        protected void BookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("book_inventory.aspx");
        }

        protected void BookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("book_issuing.aspx");
        }

        protected void MeemberMngmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("meember_management.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_login.aspx");
        }

        protected void Sign_Up_Click(object sender, EventArgs e)
        {
            Response.Redirect("sign_up.aspx");
        }

        protected void ViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_books.aspx");
        }

        protected void UserPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_page.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Response.Redirect("homepage.aspx");
        }
    }
}