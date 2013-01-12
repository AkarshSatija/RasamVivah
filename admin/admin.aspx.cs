using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindList();

        
    }



    protected void bindList()
    {

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