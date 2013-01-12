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


public partial class editdetails2 : System.Web.UI.Page
{
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
            s = Session["id"].ToString();
            prof_image.ImageUrl = "~/image.ashx?id=" + s;
    }
    protected void btnupld_Click(object sender, EventArgs e)
    {

        if (fuplddp.PostedFile != null && fuplddp.PostedFile.FileName != "")
        {
            int size = fuplddp.PostedFile.ContentLength;  // This line will tell the actual size of image

            if (size <= 4000000) // Here u can compare that do wanna insert less then 65 KB
            {

                
                string filename = DateTime.Now.ToString("ddMMyyyyHHmmssfff") + "_" + s+".jpg";
                fuplddp.SaveAs(Server.MapPath("datafiles/profile/" + filename ));
                connect c = new connect();
                c.cmd.CommandText = "update userinfo set prof_img='"+filename.ToString()+"' where id='"+s+"'";
                c.cmd.ExecuteNonQuery();
                c.cn.Close();
            }
            else
            {
                //LblUpload1.Text = "Photo size is too large. Please upload photo less than 3 MB or Equal.";
                //LblUpload1.Visible = true;
            }
        }

        
    }







    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("editdetails3.aspx");
    }
}