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


public partial class viewpdf : System.Web.UI.Page
{
    string id="0";  
    protected void Page_Load(object sender, EventArgs e)
    {
        connect c = new connect();

        // string id = context.Request.QueryString["id"];
        //string id = "1000021";
        if(Session["id"]!=null)
        id = Session["id"].ToString();

        if (Request.QueryString["id"] != null)
            id = Request.QueryString["id"].ToString();

        c.cmd.CommandText = "Select file_name,file_ext from horoscope where id='"+id+"'";
        

        c.dr= c.cmd.ExecuteReader();
        bool ret = c.dr.Read();

          
        if (ret == true)
        {
            //context.Response.ContentType = dr["ImgType"].ToString();
           // string type = c.dr["file_ext"].ToString();
           // if (type.ToLower().Equals(".jpeg") || type.ToLower().Equals(".jpg"))
           //     {
           //         Response.ContentType = "image/jpeg";   
           //     }
           //  else if (type.ToLower().Equals(".pdf"))
           //  {
           //      Response.ContentType = "application/pdf";
           //  }
           // else
           // {
           //     Response.ContentType = "image/jpeg";
           // }

           // Response.AddHeader("Content-Disposition", "inline; filename="+s+"_" + c.dr["file_name"].ToString());
           //// Response.BinaryWrite((byte[])c.dr["Data"]);
            Response.Redirect("~/datafiles//kundli//" + id + "_"+ c.dr["file_name"].ToString());

        }

        c.cn.Close();
    }


}