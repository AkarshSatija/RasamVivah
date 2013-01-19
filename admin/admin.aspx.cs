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
            bindlvprofiles("active");


    }



    protected void bindlvprofiles(string type)
    {
        {
            string command = "";
            //work here!!!!!
            if (type.ToLower().Equals("active"))
            {

                command = "select * from userinfo where active='1'";


            }

            else if (type.ToLower().Equals("deactive"))
            {
                command = "select * from userinfo where active='0'";

            }
            //select * from userinfo where last_login < DATEADD(day,-15,getdate()) order by last_login desc
            else if (type.ToLower().Equals("inactive"))
            {
                command = "select * from userinfo where last_login < DATEADD(day,-15,getdate()) order by last_login desc";

            }
            
            else if (type.ToLower().Equals("expiring"))
            {
                //expiring in next 15 days
                command = "select * from userinfo where ((sed > getdate()) AND (sed < DATEADD(day,15,getdate()))) order by sed asc";

            }

            else if (type.ToLower().Equals("expired"))
            {
                //expirwed in last 30 days
                command = "select * from userinfo where ((sed < DATEADD(day,0,getdate())) and (sed > DATEADD(day,-30,getdate()))) order by sed desc";

            }
            else if (type.ToLower().Equals("paid"))
            {
                command = "select * from userinfo where sed > getdate() and sed > CONVERT( DATETIME, '1 JAN 2013', 106 )  order by sed asc";

            }
            
            
            else if (type.ToLower().Equals("approved"))
            {
                command = "select * from userinfo where approved='1'";

            }
            else if (type.ToLower().Equals("unapproved"))
            {
                command = "select * from userinfo where approved='0'";

            }
            else if (type.ToLower().Equals("newusers"))
            {
                // new users in last 15 days
                command = "select * from logins where created_at> DATEADD(day,-15,getdate()) order by created_at desc";


            }
            else
            {
                command = "select * from logins where created_at> DATEADD(day,-15,getdate()) order by created_at desc";

            }
            
            
            connect c = new connect();
            //c.cmd.CommandText = "select * from logins";
            c.cmd.CommandText = command;
            c.adp.Fill(c.ds);
            lvprofiles.DataSource = c.ds;
            lvprofiles.DataBind();



            c.cn.Close();
            c.adp.Dispose();
            c.ds.Dispose();

        }
    }
}