using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string s;
    string unread;
    protected override void  OnInit(EventArgs e)
    {
 	 base.OnInit(e);
     if (Session["id"] == null)
     {
         string url = HttpContext.Current.Request.Url.AbsoluteUri;
         Response.Redirect("login.aspx?goto=" + url);
     }
     else
         s = Session["id"].ToString();


        
    }
   


    protected void Page_Load(object sender, EventArgs e)
    {

        lbid.Text = s;
        connect cx2 = new connect();
        cx2.cmd.CommandText = "select count(*) as unread from (select distinct convid from messages where convid in (select convid from conv_users where user1='" +
            s + "' or user2='" + s + "') and sender !='" + s + "' and status_read='0') a";
        cx2.dr = cx2.cmd.ExecuteReader();
        if (cx2.dr.Read())
        {
            unread = cx2.dr["unread"].ToString();
            lbmessages.Text = unread;
        }
        cx2.dr.Close();
        cx2.cn.Close();

        mylogin ml = new mylogin(); // update last login tym
        ml.updatelastlogin(s);

    }
    protected void signout_Click(object sender, EventArgs e)
    {
        //Session["id"] = null;
        //Session.Abandon();
        Session.Abandon();
        Session.Clear();
        
        
        HttpRuntime.Close();

        HttpContext.Current.Session.Clear();
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        HttpContext.Current.Response.Cache.SetNoStore();
        HttpContext.Current.Response.AppendHeader("Pragma", "no-cache");

        //====
        foreach (System.Collections.DictionaryEntry entry in HttpRuntime.Cache)
        {

            HttpRuntime.Cache.Remove(entry.Key.ToString());

        }

        /////




       

        Response.Redirect("Login.aspx?logout=1");
        
        
                
    }

}
