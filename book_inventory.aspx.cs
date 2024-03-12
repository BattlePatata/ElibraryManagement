using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.NetworkInformation;

namespace ElibraryManagement
{
    public partial class book_inventory : System.Web.UI.Page
    {
        string strconnect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

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
                    if (!IsPostBack)
                    {
                        fillAuthorPublisherValues();
                    }
                    InventoryGridView.DataBind();
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
            GetBookByID();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if(checkBookExists())
            {
                Response.Write("<script>alert('This Book ID Already Exists.');</script>");
            }
            else
            {
                AddNewBook();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            UpdateBookByID();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            DeleteBookById();
        }

        // User Defined Functions

        void DeleteBookById()
        {
            if (ChechBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strconnect);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + IdBox.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully.');</script>");
                    InventoryGridView.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('This Book ID does not Exist.');</script>");
            }
        }
        bool ChechBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl where book_id='" + IdBox.Text.Trim() + "';", con);

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
        void UpdateBookByID()
        {
            if (ChechBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(ActualStockBox.Text.Trim());
                    int current_stock = Convert.ToInt32(CurrStockBox.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock Value cannot be less than the Issued Books;</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            CurrStockBox.Text = "" + current_stock;
                        }
                    }

                    string genres = "";

                    foreach (int i in GenreListBox.GetSelectedIndices())
                    {
                        genres = genres + GenreListBox.Items[i] + ",";
                    }

                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory_img/books1";
                    string filename = Path.GetFileName(BookFileUpload.PostedFile.FileName);

                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    } 
                    else
                    {
                        BookFileUpload.SaveAs(Server.MapPath("book_inventory_img/" + filename));
                        filepath = "~/book_inventory_img/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strconnect);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link WHERE book_id='" + IdBox.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", BookNameBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", AuthorNameDropDownList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", PublisherNameDropDownList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", PublishDateBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", LanguageDropDownList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", EditionTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", BookCostBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", PagesBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", DescriptionBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock);
                    cmd.Parameters.AddWithValue("@current_stock", current_stock);
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    InventoryGridView.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully!');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID.');</script>");
            }
        }

        void GetBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + IdBox.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    BookNameBox.Text = dt.Rows[0]["book_name"].ToString().Trim();
                    PublishDateBox.Text = dt.Rows[0]["publish_date"].ToString().Trim();
                    EditionTextBox.Text = dt.Rows[0]["edition"].ToString().Trim();
                    BookCostBox.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    PagesBox.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    ActualStockBox.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    CurrStockBox.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    DescriptionBox.Text = dt.Rows[0]["book_description"].ToString();

                    IssuedBooksBox.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    LanguageDropDownList.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    AuthorNameDropDownList.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    PublisherNameDropDownList.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();

                    GenreListBox.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < GenreListBox.Items.Count; j++)
                        {
                            if (GenreListBox.Items[j].ToString() == genre[i])
                            {
                                GenreListBox.Items[j].Selected = true;
                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID.');</script>");
                }


            }
            catch (Exception ex)
            {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                AuthorNameDropDownList.DataSource = dt;
                AuthorNameDropDownList.DataValueField = "author_name";
                AuthorNameDropDownList.DataBind();
                
                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                PublisherNameDropDownList.DataSource = dt;
                PublisherNameDropDownList.DataValueField = "publisher_name";
                PublisherNameDropDownList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl where book_id='" + IdBox.Text.Trim() + "' OR book_name='" + BookNameBox.Text.Trim() + "';", con);

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

        void AddNewBook()
        {
            try
            {
                string genres = "";

                foreach(int i in GenreListBox.GetSelectedIndices())
                {
                    genres = genres + GenreListBox.Items[i] + ",";
                }

                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory_img/books1.png";
                string filename = Path.GetFileName(BookFileUpload.PostedFile.FileName);
                BookFileUpload.SaveAs(Server.MapPath("book_inventory_img/" + filename));
                filepath = "~/book_inventory_img/" + filename;

                SqlConnection con = new SqlConnection(strconnect);
                if (con.State == ConnectionState.Closed )
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", IdBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookNameBox.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", AuthorNameDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherNameDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", PublishDateBox.Text.Trim());
                cmd.Parameters.AddWithValue("@language", LanguageDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", EditionTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", BookCostBox.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", PagesBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", DescriptionBox.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", ActualStockBox.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", ActualStockBox.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Added Successfully.');</script>");
                InventoryGridView.DataBind();

            }
            catch ( Exception ex ) 
            {
                Response.Write("<script>alert('" +  ex.Message+ "');</script>");   
            }
        }
    }
}