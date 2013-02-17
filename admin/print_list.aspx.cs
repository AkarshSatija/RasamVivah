using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_print_list : System.Web.UI.Page
{
    string command = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(Request.QueryString["query"].ToString() + "<br>");
        Response.Write(Session["query"].ToString());
    }
}