using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_makepaid : System.Web.UI.Page
{
    public string user;
    public profileFunc p = new profileFunc();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["whom"] != null)
            user = Request.QueryString["whom"].ToString();
        else
            Response.Redirect("invalid.aspx");

            
    }
    protected void btngo_Click(object sender, EventArgs e)
    {
        SqlTransaction txn;
        connect c = new connect();
        txn = c.cn.BeginTransaction();
        

        try
        {

            
            
            c.cmd.Transaction = txn;
            c.cmd.CommandText = "INSERT INTO [membership] ([user_id],[months_added] ,[admin] ,[comment]) VALUES ('"+user+"',@months ,'" + Session["admin"].ToString() + "' ,@comment)";
            c.cmd.Parameters.Add("@months", SqlDbType.Int).Value = Convert.ToInt32(ddlplans.SelectedValue);
            c.cmd.Parameters.Add("@comment", SqlDbType.Text).Value = tbcomment.Text;
            c.cmd.ExecuteNonQuery();

            c.cmd.CommandText = "update userinfo set sed=DATEADD(month,@months,getdate()) where id='"+user+"'";
            c.cmd.ExecuteNonQuery();

            txn.Commit();
            lbnotif.Text = "Action completed successfully!!";

            lbnotif.Visible = true;
            divnotif.Visible = false;
            c.cn.Close();
        }
        catch(Exception ex)
        {
            //Response.Write(ex.ToString());
            txn.Rollback();
            lbnotif.Text = "Something went Wrong! Action not completed!!";
            lbnotif.Visible = true;
        }
       
    }

}