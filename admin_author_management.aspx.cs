using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class admin_author_management : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("admin_login.aspx");
                }
                else
                {
                    AuthorGridView.DataBind();
                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("admin_login.aspx");
            }
        }

        protected void GoButton_Click(object sender, EventArgs e)
        {
            GetAuthorById();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already Exist. You cannot add another Author with the same Author ID.');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                UpdateAuthorName();
            }
            else
            {
                Response.Write("<script>alert('Author does not Exist.');</script>");
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not Exist.');</script>");
            }
        }

        // User Defined functions
        void GetAuthorById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl where author_id='" + IdBox.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    AuthorNameBox.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author Id');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void ClearForm()
        {
            IdBox.Text = "";
            AuthorNameBox.Text = "";
        }

        void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from author_master_tbl WHERE author_id='" + IdBox.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted Successfully.');</script>");
                ClearForm();
                AuthorGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateAuthorName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id='" + IdBox.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@author_name", AuthorNameBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully.');</script>");
                ClearForm();
                AuthorGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id, author_name) values(@author_id, @author_name)", con);

                cmd.Parameters.AddWithValue("@author_id", IdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", AuthorNameBox.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added Successfully.');</script>");
                ClearForm();
                AuthorGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl where author_id='" + IdBox.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }

                return false;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

    }
}