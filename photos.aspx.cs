using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;

public partial class photos : System.Web.UI.Page
{
    string s;
    SqlTransaction tx;
    protected void Page_Load(object sender, EventArgs e)
    {
        s = Session["id"].ToString();
        if (Request.QueryString["imgid"] != null)
        {
            string dsl = Request.QueryString["imgid"].ToString();
            imgalbum.ImageUrl = "~/albumHandler.ashx?id=" + Request.QueryString["imgid"].ToString();
            divpic.Visible = true;
            //divlvalbum.Visible = false;
        }
        else
        {
            //divlvalbum.Visible = true;
            divpic.Visible = false;

        }
        if (!IsPostBack)
        {

            bind_listview();



        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {

        try
        {
            connect c = new connect();
            tx = c.cn.BeginTransaction();
            c.cmd.Transaction = tx;
            c.cmd.CommandText = "select count(*) as countImg from album where user_id='" + s + "'";
            c.dr = c.cmd.ExecuteReader();
            c.dr.Read();
            string sdf=c.dr["countImg"].ToString();
            if (Int32.Parse(c.dr["countImg"].ToString()) >= 8)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<script>");

                sb.Append("window.alert(\"You have reached the Max Image Limit. Please Delete one or more image(s) to upload new. \");");
                //sb.Append("window.alert(\"The code could not be send on your Mobile! Please try again later.\");");

                sb.Append("</script>");

                Page.RegisterStartupScript("test", sb.ToString());

                c.dr.Close();
                

            }
            else
            {
                c.dr.Close();
                if (flupldalbum.PostedFile != null && flupldalbum.PostedFile.FileName != "")
                {

                    int size = flupldalbum.PostedFile.ContentLength;  // This line will tell the actual size of image

                    if (size <= 2000000) // Here u can compare that do wanna insert less then 65 KB
                    {


                        // i m directly doing code here to save the time u do it in .cs file ok


                        c.cmd.CommandText = "insert into album(user_id) values('" + s + "')";
                        c.cmd.ExecuteNonQuery();

                        c.cmd.CommandText = "select top 1 * from album where user_id='" + s + "' order by imgdatetime desc";
                        // c.cmd.Parameters.Add("@image", SqlDbType.Binary, myimage.Length).Value = myimage;
                        c.dr = c.cmd.ExecuteReader();
                        c.dr.Read();
                        c.dr["id"].ToString();
                        //  string path = Server.MapPath("datafiles/album/" + s + "_" + c.dr["id"].ToString());
                        string ext = System.IO.Path.GetExtension(this.flupldalbum.PostedFile.FileName).ToString();
                        flupldalbum.SaveAs(Server.MapPath("datafiles/album/" + s + "_" + c.dr["id"].ToString()) + ".jpg");
                       // bind_listview();
                        c.dr.Close();


                    }
                    else
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("<script>");

                        sb.Append("window.alert(\"Too Large File! File Size should be less than 2 MB \");");

                        sb.Append("</script>");

                        Page.RegisterStartupScript("test", sb.ToString());
                    }
                }
            }
           
            tx.Commit();
            c.cn.Close();
        }
        catch (Exception ex)
        {

            tx.Rollback();
            
        }
        finally
        {
            bind_listview();

           // Response.Redirect("~/photos.aspx");
        
        }
    }
    protected void lnknext_Click(object sender, EventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = "select id from album  where [user_id]=(select [user_id] from album where id ='"+Request.QueryString["imgid"].ToString()+"')  order by imgdatetime";
        c.dr = c.cmd.ExecuteReader();
        SqlDataReader dr = c.dr;
        while (dr.Read())
        {

            if (dr["id"].ToString().Equals(Request.QueryString["imgid"].ToString()))
            {

                if (dr.Read())
                    Response.Redirect("photos.aspx?imgid=" + dr["id"].ToString());
                else
                {
                    dr.Close();
                    dr = c.cmd.ExecuteReader();
                    
                    if (dr.Read())
                        Response.Redirect("photos.aspx?imgid=" + dr["id"].ToString());
                
                }
            
            }
        
        }
        c.cn.Close();
    }
    protected void lnkprev_Click(object sender, EventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = "select id from album  where [user_id]=(select [user_id] from album where id ='" + Request.QueryString["imgid"].ToString() +
            "')  order by imgdatetime desc";
        c.dr = c.cmd.ExecuteReader();
        SqlDataReader dr = c.dr;
        while (dr.Read())
        {

            if (dr["id"].ToString().Equals(Request.QueryString["imgid"].ToString()))
            {

                if (dr.Read())
                    Response.Redirect("photos.aspx?imgid=" + dr["id"].ToString());
                else
                {
                    dr.Close();
                    dr = c.cmd.ExecuteReader();

                    if (dr.Read())
                        Response.Redirect("photos.aspx?imgid=" + dr["id"].ToString());

                }

            }

        }
        c.cn.Close();
    }
    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = "delete from album where id='" + Request.QueryString["imgid"].ToString() + "' and user_id='"+s+"'";
        if (c.cmd.ExecuteNonQuery() == 1)
        {
            Response.Redirect("~/photos.aspx");
        
        }
        c.cn.Close();
    }

    protected void bind_listview()
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from album where user_id='" + s + "'";
        c.adp.Fill(c.ds);
        int i = c.ds.Tables[0].Rows.Count;

        lvalbum.DataSource = c.ds;
        lvalbum.DataBind();
        c.cn.Close();
    }
}