using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace ElibraryManagement
{
    public partial class user_page : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("user_login.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        GetUserDetails();
                    }
                }
            }
            catch 
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("user_login.aspx");
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("user_login.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        UpdateUserDetail();
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("user_login.aspx");
            }
        }

        // User Defined Functions 

        void UpdateUserDetail()
        {
            string password = "";
            if (NewPasswBox.Text.Trim() == "")
            {
                password = PasswBox.Text.Trim();
            }
            else if (NewPasswBox.Text.Trim().Length > 7 && NewPasswBox.Text.Trim().Length < 17)
            {
                password = NewPasswBox.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Your Password has to be no shorter than 8 symbols and no longer than 16 symbols.');</script>");
            }


            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE meeber_master_tbl SET full_name=@full_name,dob=@dob,contact_no=@contact_no,email=@email,state=@state,city=@city,pincode=@pincode,full_address=@full_address,password=@password,account_status=@account_status WHERE meember_id='" + Session["username"].ToString().Trim() + "'", con);
                
                cmd.Parameters.AddWithValue("@full_name", FullNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DobBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ContactNoBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailBox.Text.Trim());
                cmd.Parameters.AddWithValue("@state", StateDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", CityBox.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", PinCodeBox.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", FullAdrsBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int res = cmd.ExecuteNonQuery();
                con.Close();
                
                if (res > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</sript>");
                    GetUserDetails();
                    GetUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Entry');</sript>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM meeber_master_tbl where meember_id='" + Session["username"].ToString() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                FullNameBox.Text = dt.Rows[0]["full_name"].ToString();
                DobBox.Text = dt.Rows[0]["dob"].ToString();
                ContactNoBox.Text = dt.Rows[0]["contact_no"].ToString();
                EmailBox.Text = dt.Rows[0]["email"].ToString();
                StateDropDownList.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                CityBox.Text = dt.Rows[0]["city"].ToString();
                PinCodeBox.Text = dt.Rows[0]["pincode"].ToString();
                FullAdrsBox.Text = dt.Rows[0]["full_address"].ToString();
                IdBox.Text = dt.Rows[0]["meember_id"].ToString();
                PasswBox.Text = dt.Rows[0]["password"].ToString();

                AccStatusLabel.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-info");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl where meember_id='" + Session["username"].ToString() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                UserIssuedGridView.DataSource = dt;
                UserIssuedGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void IssuedUserGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}