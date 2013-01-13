using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Net;
using System.Xml;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls; 
public partial class admin_changepass : System.Web.UI.Page
{
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        s = Session["admin"].ToString();

    }


    protected void btnchangepass_Click(object sender, EventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from admins where id='" + s + "' and pass='" + txtcurrentpwd.Text.ToString() + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();

            try
            {
                c.cmd.CommandText = "update admins set pass='" + txtnewpwd.Text.ToString() + "' where id='" + s + "'";
                if (c.cmd.ExecuteNonQuery() == 1)
                {
                    divchangepass.Visible = false;

                    divpasschanged.Visible = true;



                }
                else
                {
                    //throw exception

                }


            }
            catch
            {




            }

        }

        else
        {


            lbwrongpass.Visible = true;


        }
        c.cn.Close();

    }
}

