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

public partial class editdetails1 : System.Web.UI.Page
{
    string s;
    // int rowaffectd2 = 0;
    SqlTransaction tx;
    protected void Page_Load(object sender, EventArgs e)
    {
           s = Session["id"].ToString();

            if (!IsPostBack)
            {
                BindDataToGridviewDropdownlist();
                bindIncome();
                BindDataToGridviewDropdownlist2();
                bindWorking_with();

            }


        connect c = new connect();
        try
        {
            c.cmd.CommandText = "INSERT INTO education(id) VALUES('" + s + "')";
            c.cmd.ExecuteNonQuery();



        }
        catch
        {



        }

        try
        {
            c.cmd.CommandText = "INSERT INTO family(id) VALUES('" + s + "')";
            c.cmd.ExecuteNonQuery();
        }

        catch
        {
        }

        c.cmd = new SqlCommand("select education.* from education where education.id='" + s + "' ", c.cn);

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
                string highest_degree = c.dr["highest_deg"].ToString();
                drpeducation.SelectedValue = highest_degree;
                string working = c.dr["work_status"].ToString();
                drpworking.SelectedValue = working;
                string work_area = c.dr["work_area"].ToString();
                drpedufield.SelectedValue = work_area;
                string annual_income = c.dr["Annual_salary"].ToString();
                drpincome.SelectedValue = annual_income;
                string work_prefer = c.dr["work_prefer"].ToString();
                rbtnprefer.SelectedValue = work_prefer;
                txtotheredu.Text = c.dr["other"].ToString();

            }
        }

        c.dr.Close();
        c.cmd = new SqlCommand("select family.* from family where family.id='" + s + "' ", c.cn);

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
                string f_values = c.dr["f_values"].ToString();
                rbtnfamilyvalues.SelectedValue = f_values;
                string f_type = c.dr["f_type"].ToString();
                rbtnfamilytype.SelectedValue = f_type;
                string f_status = c.dr["f_status"].ToString();
                rbtnfamilystatus.SelectedValue = f_status;
                string father_occ = c.dr["father_occ"].ToString();
                drpfather.SelectedValue = father_occ;
                string mother_occ = c.dr["mother_occ"].ToString();
                drpmother.SelectedValue = mother_occ;
                string brother = c.dr["brothers"].ToString();
                drpbrothr.SelectedValue = brother;
                string sister = c.dr["sisters"].ToString();
                drpsister.SelectedValue = sister;
                string residency = c.dr["residency_status"].ToString();
                drpresidency.SelectedValue = residency;
                string liv_with = c.dr["liv_with"].ToString();
                if (liv_with.Equals("True"))
                    rbtnliving.SelectedValue = "1";
                else if (liv_with.Equals("False"))
                    rbtnliving.SelectedValue = "0";
                txtotherfamily.Text = c.dr["other"].ToString();

            }
        }
        c.cn.Close();


    }
    protected void btnsave_Click(object sender, EventArgs e)
    {

        int go = 0;
        try
        {

                connect c = new connect();
                tx = c.cn.BeginTransaction();
                c.cmd.Transaction = tx;

                string work_prefer = rbtnprefer.SelectedValue;
                c.cmd.CommandText = "update education set highest_deg= @highest_deg,work_status= @work_status,work_area=@work_area,other=@other,work_prefer='" 
                    + work_prefer + "',Annual_salary=@Annual_salary";
                c.cmd.Parameters.Add("@highest_deg", SqlDbType.Int).Value = drpeducation.SelectedValue;
                c.cmd.Parameters.Add("@work_status", SqlDbType.Int).Value = drpworking.SelectedValue;
                c.cmd.Parameters.Add("@work_area", SqlDbType.Int).Value = drpedufield.SelectedValue;
                c.cmd.Parameters.Add("@other", SqlDbType.Text).Value = txtotheredu.Text;
                c.cmd.Parameters.Add("@Annual_salary", SqlDbType.Int).Value = drpincome.SelectedValue;
                c.cmd.ExecuteNonQuery();



                string f_values = rbtnfamilyvalues.SelectedValue;
                string f_type = rbtnfamilytype.SelectedValue;
                string f_status = rbtnfamilystatus.SelectedValue;
                string liv_with = rbtnliving.SelectedValue;
                
            c.cmd.CommandText = "update family set f_values='" + f_values + "',f_type='" + f_type + "',f_status='" + f_status +
                    "',father_occ=@father_occ,mother_occ=@mother_occ,brothers=@brothers,sisters=@sisters,liv_with='" + liv_with 
                    +"',other=@other2,residency_status=@residency_status";
                c.cmd.Parameters.Add("@father_occ", SqlDbType.Int).Value = drpfather.SelectedValue;
                c.cmd.Parameters.Add("@mother_occ", SqlDbType.Int).Value = drpmother.SelectedValue;
                c.cmd.Parameters.Add("@brothers", SqlDbType.Int).Value = drpbrothr.SelectedValue;
                c.cmd.Parameters.Add("@sisters", SqlDbType.Int).Value = drpsister.SelectedValue;
                c.cmd.Parameters.Add("@other2", SqlDbType.Text).Value = txtotherfamily.Text.ToString();
                c.cmd.Parameters.Add("@residency_status", SqlDbType.Int).Value = drpresidency.SelectedValue;
                
            c.cmd.ExecuteNonQuery();

                tx.Commit();
                c.cn.Close();
        }


        catch (Exception ex)
        {
            Response.Write("ERROR IN CONNECTION:" + ex.Message);
            tx.Rollback();
            go = 1;
        }
        finally
        {
            if (go != 1)
                Response.Redirect("editdetails2.aspx");

        }
    }

    protected void BindDataToGridviewDropdownlist()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//degree.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
              drpeducation.DataSource = ds;
              drpeducation.DataTextField = "Text";
              drpeducation.DataValueField = "Value";
              drpeducation.DataBind();

            }

            ListItem li = new ListItem("Please Select", "0");
            drpeducation.Items.Insert(0, li);

            
           
        }
        catch (Exception ex)
        {


        }


    }

    protected void bindIncome()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//income.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpincome.DataSource = ds;
                drpincome.DataTextField = "Text";
                drpincome.DataValueField = "Value";
                drpincome.DataBind();

            }

            ListItem li = new ListItem("Please Select", "-1");
            drpincome.Items.Insert(0, li);



        }
        catch (Exception ex)
        {


        }


    }

    protected void BindDataToGridviewDropdownlist2()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//occupation.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                 drpedufield.DataSource = ds;
                 drpedufield.DataTextField = "Text";
                 drpedufield.DataValueField = "Value";
                 drpedufield.DataBind();

            }

            ListItem li = new ListItem("Please Select", "0");
            drpedufield.Items.Insert(0, li);



        }
        catch (Exception ex)
        {
        }


    }

    protected void bindWorking_with()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//working_with.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpworking.DataSource = ds;
                drpworking.DataTextField = "Text";
                drpworking.DataValueField = "Value";
                drpworking.DataBind();

            }
        }
        catch (Exception ex)
        {
            
        }
    }    
}