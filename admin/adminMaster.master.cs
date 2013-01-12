using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminMaster : System.Web.UI.MasterPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if (Session["admin"] == null)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect("Default.aspx?goto=" + url);
        }
       



    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
       
    }
    protected void signout_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        Session.Clear();

        Response.Redirect("./");
    }
}
