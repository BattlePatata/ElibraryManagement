using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ElibraryManagement
{
    public partial class book_issuing : System.Web.UI.Page
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
                    IssuedBooksGridView.DataBind();
                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("admin_login.aspx");
            }
        }

        protected void IssueButton_Click(object sender, EventArgs e)
        {
            if (CheckBookExist() && CheckMeemberExist())
            {
                if (CheckIssueEntryExist())
                {
                    Response.Write("<script>alert('This Meember Already Has this Book.');</script>");
                }
                else
                {
                    IssueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book or User ID.');</script>");
            }
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            if (CheckBookExist() && CheckMeemberExist())
            {
                if (CheckIssueEntryExist())
                {
                    ReturnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry Does not exist.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book or User ID.');</script>");
            }
        }

        protected void GoButton_Click(object sender, EventArgs e)
        {
            GetNames();
        }

        // User Defined Function

        void ReturnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE book_id='" + BookIdBox.Text.Trim() + "' AND meember_id='" + MeemberIdBox.Text.Trim() + "'", con);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                { 

                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id='" + BookIdBox.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    IssuedBooksGridView.DataBind();
                    
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE meember_id='" + MeemberIdBox.Text.Trim() + "' AND book_id='" + BookIdBox.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }

                return false;
            }
            catch
            {
                return false;
            }
        }

        void IssueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(meember_id,meember_name,book_id,book_name,issue_date,due_date) values(@meember_id,@meember_name,@book_id,@book_name,@issue_date,@due_date)", con);

                cmd.Parameters.AddWithValue("@meember_id", MeemberIdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@meember_name", MeemberNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", BookIdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", IssueDateBox.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", DueDateBox.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1 WHERE book_id='" + BookIdBox.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book Issued Successfully.');</script>");


                IssuedBooksGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckBookExist()
        {
            try
            {

                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id='" + BookIdBox.Text.Trim() + "' AND current_stock>0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                
                return false;
            }
            catch
            {
                return false;
            }
        }

        bool CheckMeemberExist()
        {
            try 
            { 
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM meeber_master_tbl WHERE meember_id='" + MeemberIdBox.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
     
                return false;
            }
            catch 
            {
                return false; 
            }
        }

        void GetNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id='" + BookIdBox.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) 
                {
                    BookNameBox.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }
                
                cmd = new SqlCommand("SELECT full_name FROM meeber_master_tbl WHERE meember_id='" + MeemberIdBox.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) 
                {
                    MeemberNameBox.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong User ID');</script>");
                }
            }
            catch (Exception ex) 
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void IssuedBooksGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch ( Exception ex )
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}