using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class sign_up : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Sign up Button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMeemberExists())
            {
                Response.Write("<script>alert('Meember Already Exist with this ID. Try another ID')</script>");
            }
            else
            {
                SignUpNewuser();
            }
        }

        // User Defined method

        bool checkMeemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM meeber_master_tbl where meember_id='" + MeemberIdBox.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                DataTable dt = new DataTable();
                
                da.Fill(dt);   

                if (dt.Rows.Count >= 1 ) 
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

        void SignUpNewuser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO meeber_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,meember_id,password,account_status) values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@meember_id,@password,@account_status)", con);
                
                if (PasswrdBox.Text.Trim().Length > 7 && PasswrdBox.Text.Trim().Length < 17)
                {
                    cmd.Parameters.AddWithValue("@password", PasswrdBox.Text.Trim());
                }
                else
                {
                    Response.Write("<script>alert('Your Password has to be no shorter than 8 symbols and no longer than 16 symbols.');</script>");
                }

                cmd.Parameters.AddWithValue("@full_name", FullNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DobBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ContactNoBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailIdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@state", StateDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", CityBox.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", PinCodeBox.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", FullAdrsBox.Text.Trim());
                cmd.Parameters.AddWithValue("@meember_id", MeemberIdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}