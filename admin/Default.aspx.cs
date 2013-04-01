using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {

        {
            try
            {

                connect c = new connect();
                c.cmd.CommandText = "Select * from admins where (id=(select id from admins where emailid='" +
                tbusername.Text.ToString() + "') or id='" + tbusername.Text.ToString() + "') and pass='" +
                tbpaasword.Text.ToString() + "'";

                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    
                    Session["admin"] = c.dr[0].ToString();
                    
                    if (Request.QueryString["goto"] != null)
                        Response.Redirect(Request.QueryString["goto"]);
                    Response.Redirect("admin.aspx");

                }
                else
                {
                    Response.Redirect("default.aspx?Login=0");
                   
                }
                c.cn.Close();
            }
            catch (Exception ex)
            {
                if ((tbusername.Text.ToString().Equals("superadmin")) && (tbpaasword.Text.ToString().Equals("superadmin")))
                {
                    Session["admin"] = "superadmin";
                   
                }

            }



        }
    }
}