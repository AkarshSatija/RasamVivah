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
using System.Xml;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["type"] != null)
            bindlvprofiles(Request.QueryString["type"].ToString());
        else
            bindlvprofiles("");


    }



    protected void bindlvprofiles(string type)
    {
        {
            string command = "";
            //work here!!!!!
            if (type.ToLower().Equals("active"))
            {
                command = "";

            }

            else if (type.ToLower().Equals("deactive"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("search"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("expiring"))
            {
                command = "";

            }

            else if (type.ToLower().Equals("expired"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("paid"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("manage"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("email"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("approved"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("unapproved"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("newusers"))
            {
                command = "";

            }
            else if (type.ToLower().Equals("banners"))
            {
                command = "";

            }
            else
            {
                command = "";

            }
            connect c = new connect();
            c.cmd.CommandText = "select * from logins";

            c.adp.Fill(c.ds);
            lvprofiles.DataSource = c.ds;
            lvprofiles.DataBind();





            c.cn.Close();
            c.adp.Dispose();
            c.ds.Dispose();

        }
    }
}