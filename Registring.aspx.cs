using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registring : System.Web.UI.Page
{
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["reload"] != null)
        {
            if (Session["id"] != null)
            {
                s = Session["id"].ToString();
                myverify ver = new myverify();
                int e_verify = ver.verifyemail(s);
                if (e_verify != 1)
                    e_verify = ver.verifyemail(s);

                int m_verify = ver.verifymob(s);
                if (e_verify != 1)
                    e_verify = ver.verifymob(s);
            }
            Session["reload"] = null;
            Response.Redirect("editdetails.aspx");
        }

        Session["reload"] = "1";



    }
}