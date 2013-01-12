using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    
    
    
    }
    protected void btnrecover_Click(object sender, EventArgs e)
    {
        string id, emailid;
        connect c = new connect();
        c.cmd.CommandText = "Select * from logins where (id=(select id from logins where emailid='" +
                    tbunameforgot.Text.ToString() + "') or emailid='" + tbunameforgot.Text.ToString() + "') ";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            id = c.dr["id"].ToString();
            emailid = c.dr["emailid"].ToString();
            myverify myv = new myverify();
            int reply = myv.recoverpassword(id);
            if (reply != 1)
            {

                reply = myv.recoverpassword(id);

            }

            if (reply != 1)
            {

                lbmessage.Text = "An email including your account details could not be sent right now. please try again after some time";
                divgetemail.Visible = false;
                divmessage.Visible = true;
            }
            else
            {

                lbmessage.Text = "An email including your account details has been sent on youe email id: " + emailid;
                divgetemail.Visible = false;
                divmessage.Visible = true;


            }


        }
        else
        {

            lbmessage.Text = "No related account found! please check the emailid or id given";
            divgetemail.Visible = false;
            divmessage.Visible = true;

        }
        c.dr.Close();
        c.cn.Close();

    }
}