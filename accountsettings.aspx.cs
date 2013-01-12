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

public partial class accountsettings : System.Web.UI.Page
{
    string s;
    SqlTransaction tx;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        s=Session["id"].ToString();

        connect c = new connect();

     //c.cmd.CommandText = "select emailid from logins where logins.id='" + s + "'";
     //c.dr = c.cmd.ExecuteReader();
     //if (!IsPostBack)
     //{
     //    if (c.dr.Read())
     //    {
     //        lboldemail.Text = c.dr["emailid"].ToString();
     //       // lboldmobile.Text = c.dr["mobile"].ToString();
     //    }
     //}
     //c.dr.Close();

     c.cmd.CommandText = "select mobile from p_details where p_details.id='" + s + "'";

      c.dr = c.cmd.ExecuteReader();
      if (!IsPostBack)
      {
          if (c.dr.Read())
          {
            // lboldemail.Text = c.dr["emailid"].ToString();
             lboldmobile.Text = c.dr["mobile"].ToString();
          }
      }
      c.cn.Close();
    }

    protected void btnchangepass_Click(object sender, EventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from logins where id='" + s + "' and pass='" + txtcurrentpwd.Text.ToString() + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();
           
            try
            {
                c.cmd.CommandText = "update logins set pass='" + txtnewpwd.Text.ToString() + "' where id='" + s + "'";
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
    protected void savemobile_Click(object sender, EventArgs e)
    {
        try
        {
            connect c = new connect();
            c.cmd.CommandText = "select * from logins where id='" + s + "' and pass='" + txtpassword.Text.ToString() + "'";
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                c.dr.Close();
                tx = c.cn.BeginTransaction();
                c.cmd.Transaction = tx;

                c.cmd.CommandText = "update p_details set mobile='" + txtnewmobileno.Text.ToString() + "' where id='" + s + "'";
                if (c.cmd.ExecuteNonQuery() == 1)
                {
                    divchangemobileno.Visible = false;

                    lbmobilechanged.Visible = true;

                    c.cmd.CommandText = "update userinfo set mob_verified=(right(CONVERT([varchar](50),newid(),0),(10))) where id='" + s + "'";
                    c.cmd.ExecuteNonQuery();
                    if (c.cmd.ExecuteNonQuery() != 1)
                    {
                        ;// throw exception
                    }

                }

            }
            else
            {


                lbincorrectpassword.Visible = true;


            }
            tx.Commit();
            c.cn.Close();
        }
        catch
        {

            tx.Rollback();
        
        }
    }
}