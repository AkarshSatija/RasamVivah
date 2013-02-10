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

public partial class statistics : System.Web.UI.Page
{
    profileFunc p = new profileFunc();
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            connect c = new connect();

            DateTime dtstart = DateTime.ParseExact("15/02/2013", "dd/MM/yyyy", null);
           

            c.cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = dtstart;
           // c.cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = dtend;

            c.cmd.CommandText = "select * from logins where created_at>=@start";
            c.adp.Fill(c.ds);
            lvprofiles.DataSource = c.ds;
            lvprofiles.DataBind();


            c.cn.Close();
            c.adp.Dispose();
            c.ds.Dispose();
        }
      
    }



    
    protected void lvprofiles_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblID = e.Item.FindControl("lbid") as Label;
        

        ((Label)e.Item.FindControl("lbname")).Text = p.getAboutMeString(lblID.Text, Server.MapPath("xml//").ToString(),2);

        ((CheckBox)e.Item.FindControl("cbactive")).Checked = p.isActive(lblID.Text);
        ((CheckBox)e.Item.FindControl("cbapproved")).Checked = p.isApproved(lblID.Text);
        
        bool paid;
        if (p.isPaid(lblID.Text) == 1)
            paid = true;
        else
            paid = false;

        ((CheckBox)e.Item.FindControl("cbpaid")).Checked = paid;
    
    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in lvprofiles.Items)
        {
            if (item.ItemType == ListViewItemType.DataItem)
            {
                string transaction_id = ((Label)item.FindControl("lbid")).Text;
                int active_status = ((CheckBox)item.FindControl("cbactive")).Checked ? 1 : 0;
                int approved_status = ((CheckBox)item.FindControl("cbapproved")).Checked ? 1 : 0 ;



                connect c = new connect();
               

                c.cmd.CommandText = "update userinfo set approved='"+approved_status+"' where id='"+transaction_id+"'";
                c.cmd.ExecuteNonQuery();

                c.cmd.CommandText = "update userinfo set active='" + active_status + "' where id='" + transaction_id + "'";
                c.cmd.ExecuteNonQuery();

                c.cn.Dispose();
                c.cn.Close();
                
                // Process changed data here...
            }
        }
    }
    protected void btngo_Click(object sender, EventArgs e)
    {
        string mycmd = "update userinfo set ";
        string action_string="";
        string users="id='1' ";
        if (ddlactions.SelectedValue == "1")
        {
            action_string = "active='1' ";
        }
        else if (ddlactions.SelectedValue == "2")
        {
            action_string = "active='0' ";
        }
        else if (ddlactions.SelectedValue == "3")
        {
            action_string = "approved='1' ";
        }
        else if (ddlactions.SelectedValue == "4")
        {
            action_string = "approved='0' ";
        }
        //more actions

        foreach (ListViewItem item in lvprofiles.Items)
        {
            if (item.ItemType == ListViewItemType.DataItem)
            {

                string transaction_id = ((Label)item.FindControl("lbid")).Text;
                if (((CheckBox)item.FindControl("cbselect")).Checked)
                {
                    users += " or id='" + transaction_id + "'";
                
                }

            }

        }



        connect c = new connect();

        c.cmd.CommandText = mycmd + action_string+" where " + users;

        c.cmd.ExecuteNonQuery();

        c.cn.Dispose();
        c.cn.Close();



    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri.ToString());
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        connect c = new connect();

        DateTime dtstart=DateTime.ParseExact("15/02/2013", "dd/MM/yyyy", null);
        DateTime dtend = DateTime.Now;

        if (tbstartdt.Text != "")
            dtstart = DateTime.ParseExact(tbstartdt.Text, "dd/MM/yyyy", null);

        if (tbenddt.Text !="")
        {
             dtend = DateTime.ParseExact(tbenddt.Text, "dd/MM/yyyy", null);
        }

        

        c.cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = dtstart;
        c.cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = dtend;

        c.cmd.CommandText = "select * from logins where created_at>=@start and created_at<=@end";
        c.adp.Fill(c.ds);
        lvprofiles.DataSource = c.ds;
        lvprofiles.DataBind();


        c.cn.Close();
        c.adp.Dispose();
        c.ds.Dispose();
    }
}