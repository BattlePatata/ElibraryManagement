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
    public partial class Meember_management : System.Web.UI.Page
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
                    MeemberGridView.DataBind();
                }
            }
            catch
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("admin_login.aspx");
            }
        }

        protected void IdButton_Click(object sender, EventArgs e)
        {
            GetMeemberById();
        }

        protected void ActiveButton_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("active");
        }

        protected void PengindButton_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("pending");
        }

        protected void DeactiveButton_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("deactive");
        }

        protected void DeleteUserButton_Click(object sender, EventArgs e)
        {
            DeleteMeember();
        }

        // User Defined Functions

        bool CheckMeemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM meeber_master_tbl where meember_id='" + IdBox.Text.Trim() + "';", con);

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
                return false;
            }
        }

        void ClearForm()
        {
            IdBox.Text = "";
            FullNameBox.Text = "";
            AccStatusBox.Text = "";
            DobBox.Text = "";
            ContactNoBox.Text = "";
            EmailIdBox.Text = "";
            StateBox.Text = "";
            CityBox.Text = "";
            PinCodeBox.Text = "";
            FullAdresBox.Text = "";
        }
        void DeleteMeember()
        {
            if (CheckMeemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strconnect);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from meeber_master_tbl WHERE meember_id='" + IdBox.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Meember Deleted Successfully.');</script>");
                    ClearForm();
                    MeemberGridView.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('This Meember ID does not Exist.');</script>");     
            }
        }

        void UpdateStatusByID(string status)
        {
            if (CheckMeemberExists()) 
            {
                try
                {
                    SqlConnection con = new SqlConnection(strconnect);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE meeber_master_tbl SET account_status='" + status + "' WHERE meember_id='" + IdBox.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    MeemberGridView.DataBind();
                    Response.Write("<script>alert('Meember Status Updated');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Meember ID.');</script>");
            }
            
        }

        void GetMeemberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM meeber_master_tbl where meember_id='" + IdBox.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        FullNameBox.Text = dr.GetValue(0).ToString();
                        AccStatusBox.Text = dr.GetValue(10).ToString();
                        DobBox.Text = dr.GetValue(1).ToString();
                        ContactNoBox.Text = dr.GetValue(2).ToString();
                        EmailIdBox.Text = dr.GetValue(3).ToString();
                        StateBox.Text = dr.GetValue(4).ToString();
                        CityBox.Text = dr.GetValue(5).ToString();
                        PinCodeBox.Text = dr.GetValue(6).ToString();
                        FullAdresBox.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials you moron!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}