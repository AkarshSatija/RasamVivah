using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Xml;

public partial class admin_print_list : System.Web.UI.Page
{
    string command = "select * from logins";
    profileFunc p = new profileFunc();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["query"]!=null)
        command = Request.QueryString["query"].ToString();
        //Response.Write(Session["query"].ToString());
        connect c = new connect();
        //c.cmd.CommandText = "select * from logins";
        //Session["query"] = command;
        
        c.cmd.CommandText = command;
        c.adp.Fill(c.ds);
        lvprofiles.DataSource = c.ds;
        lvprofiles.DataBind();


        c.cn.Close();
        c.adp.Dispose();
        c.ds.Dispose();
    }

    protected void lvprofiles_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblID = e.Item.FindControl("lbid") as Label;


        ((Label)e.Item.FindControl("lbname")).Text = p.getAboutMeString(lblID.Text, Server.MapPath("xml//").ToString(), 2);

        ((Label)e.Item.FindControl("lbactive")).Text = (p.isActive(lblID.Text))?"Yes":"No";
        ((Label)e.Item.FindControl("lbapproved")).Text = (p.isApproved(lblID.Text))?"Yes":"No";
        ((Label)e.Item.FindControl("lbpaid")).Text = (p.isPaid(lblID.Text)==1)?"Yes":"No";
        ((Label)e.Item.FindControl("lbplan")).Text = p.paidplan(lblID.Text);
        ((Label)e.Item.FindControl("lbplanExpDate")).Text = p.getSED(lblID.Text);

    }




    public void ExportIntoExcel(ListView lvExport, string Header, string FileName)
    {
        try
        {
            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".xls");
            System.Web.HttpContext.Current.Response.Charset = "";
            System.Web.HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter stringWrite = new StringWriter();
            stringWrite.Write(Header);
            stringWrite.WriteLine();
            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            HtmlForm frm = new HtmlForm();
            lvExport.Parent.Controls.Add(frm);
            frm.Controls.Add(lvExport);
            frm.RenderControl(htmlWrite);
            System.Web.HttpContext.Current.Response.Write(stringWrite.ToString());

        }
        catch (Exception ex)
        {
        }
        finally
        {
            System.Web.HttpContext.Current.Response.End();
        }
    }

    protected void btnexcel_Click(object sender, EventArgs e)
    {

        ExportIntoExcel(lvprofiles, "", "file");


        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.Charset = "";
        this.EnableViewState = false;
        StringWriter stringWriter = new StringWriter();
        HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
        this.lvprofiles.RenderControl(htmlTextWriter);
        Response.Write(stringWriter.ToString());
        Response.End();
    }
}