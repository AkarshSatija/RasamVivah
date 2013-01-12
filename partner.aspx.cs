using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Xml;

public partial class partner : System.Web.UI.Page
{
    string s;
    int i;
    SqlTransaction trans;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        s = Session["id"].ToString();
        
        if (!IsPostBack)
        {
            BindDataToGridviewDropdownlist();

            BindDataToGridviewDropdownlist1();

            bindIncome();

            bindReligion();

            bindMarital();
            bindHeight();
            bindAge();
            


        }
        retrieveData();
      
       


    }

    
    protected void btnsave_Click(object sender, EventArgs e)
    {
        int go = 0;
        //connect c = new connect();
        //trans = c.cn.BeginTransaction();
        //c.cmd.Transaction = trans;
        try
        {
            connect c = new connect();
            trans = c.cn.BeginTransaction();
            c.cmd.Transaction = trans;
            // uncomment if data retrieving
            //c.cmd.CommandText = "delete from partner where id='"+ s +"'";
            //c.cmd.ExecuteNonQuery();
            c.cmd.CommandText = "delete from pref_m_status where user_id='" + s + "'";
            c.cmd.ExecuteNonQuery();
            c.cmd.CommandText = "delete from pref_mthr_tongue where user_id='" + s + "'";
            c.cmd.ExecuteNonQuery();
            c.cmd.CommandText = "delete from pref_religion where user_id='" + s + "'";
            c.cmd.ExecuteNonQuery();

            c.cmd.CommandText = "update partner set age_u=@age_u,age_l=@age_l,height_u=@height_u,height_l=@height_l,income_u=@income_u,income_l=@income_l,other=@other";
            

            c.cmd.Parameters.Add("@age_u", SqlDbType.Int).Value = drpuprage.SelectedValue;
            c.cmd.Parameters.Add("@age_l", SqlDbType.Int).Value = drplwrage.SelectedValue;
            c.cmd.Parameters.Add("@height_u", SqlDbType.Int).Value = drpupprheight.SelectedValue;
            c.cmd.Parameters.Add("@height_l", SqlDbType.Int).Value = drplwrheight.SelectedValue;
            c.cmd.Parameters.Add("@income_u", SqlDbType.Money).Value = drpupperincome.SelectedValue;
            c.cmd.Parameters.Add("@income_l", SqlDbType.Money).Value = drplwrincome.SelectedValue;
            c.cmd.Parameters.Add("@other", SqlDbType.Text).Value = txtdesired.Text;
            c.cmd.ExecuteNonQuery();

            foreach (ListItem li in chkpartnermarital.Items)
            {
                if (li.Selected == true)
                {
                    c.cmd.CommandText = "insert into pref_m_status values('" + s + "','" + li.Value.ToString() + "')";

                    c.cmd.ExecuteNonQuery();

                    
                }
            }


            foreach (ListItem li in chkmthrtongue.Items)
            {
                if (li.Selected == true)
                {
                    c.cmd.CommandText = "insert into pref_mthr_tongue values('" + s + "','" + li.Value.ToString() + "')";

                    c.cmd.ExecuteNonQuery();
                }
            }


            foreach (ListItem li in chkreligion.Items)
            {
                if (li.Selected == true)
                {
                    c.cmd.CommandText = "insert into pref_religion values('" + s + "','" + li.Value.ToString() + "')";

                    c.cmd.ExecuteNonQuery();
                }
            }




            trans.Commit();
            c.cn.Close();



        }
        catch (Exception ex)
        {
            Response.Write("ERROR IN CONNECTION:" + ex.Message);
            trans.Rollback();
            go = 1;
        }

        finally
        {
            if (go != 1)
                Response.Redirect("profile.aspx");

        }

    }

    protected void BindDataToGridviewDropdownlist()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//height.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drplwrheight.DataSource = ds;
                drplwrheight.DataTextField = "feet";
                drplwrheight.DataValueField = "value";
                drplwrheight.DataBind();

                drpupprheight.DataSource = ds;
                drpupprheight.DataTextField = "feet";
                drpupprheight.DataValueField = "value";
                drpupprheight.DataBind();




            }

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
                drplwrincome.DataSource = ds;
                drplwrincome.DataTextField = "Text";
                drplwrincome.DataValueField = "Value";
                drplwrincome.DataBind();

                drpupperincome.DataSource = ds;
                drpupperincome.DataTextField = "Text";
                drpupperincome.DataValueField = "Value";
                drpupperincome.DataBind();
            }

            drplwrincome.Items.Insert(0, new ListItem("Doesn't matter", "-1"));
            drpupperincome.Items.Insert(0, new ListItem("Doesn't matter", "-1"));
            // drpadvlwrincome.Items.RemoveAt(0);

            //foreach (ListItem li in chkadvmthrtongue.Items)
            //{

            //    if (li.Value == "0")
            //    {

            //        chkadvmthrtongue.Items.Remove(li.Value);

            //    }


            //}

        }
        catch (Exception ex)
        {


        }


    }

    protected void BindDataToGridviewDropdownlist1()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//mother_tongue.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                chkmthrtongue.DataSource = ds;
                chkmthrtongue.DataTextField = "Text";
                chkmthrtongue.DataValueField = "Value";
                chkmthrtongue.DataBind();

                chkmthrtongue.Items.RemoveAt(0);


            }

        }
        catch (Exception ex)
        {


        }


    }

    protected void bindReligion()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//religion.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                chkreligion.DataSource = ds;
                chkreligion.DataTextField = "Text";
                chkreligion.DataValueField = "Value";
                chkreligion.DataBind();

                chkreligion.Items.RemoveAt(0);



            }

        }
        catch (Exception ex)
        {


        }


    }

    protected void bindMarital()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//marital.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                chkpartnermarital.DataSource = ds;
                chkpartnermarital.DataTextField = "Text";
                chkpartnermarital.DataValueField = "Value";
                chkpartnermarital.DataBind();

                //chkpartnermarital.Items.Insert(1, new ListItem("Doesn't matter", "-1"));
                chkpartnermarital.Items.RemoveAt(0);


            }

        }
        catch (Exception ex)
        {


        }


    }

    protected void bindHeight()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//height.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drplwrheight.DataSource = ds;
                drplwrheight.DataTextField = "Text";
                drplwrheight.DataValueField = "Value";
                drplwrheight.DataBind();

                drpupprheight.DataSource = ds;
                drpupprheight.DataTextField = "Text";
                drpupprheight.DataValueField = "Value";
                drpupprheight.DataBind();

                //chkpartnermarital.Items.Insert(1, new ListItem("Doesn't matter", "-1"));
               

            }

        }
        catch (Exception ex)
        {


        }


    }
    protected void bindAge() 
    {

        ListItem l = new ListItem();
        for (int i = 18; i <= 65; i++)
        {


            //  ListItem l = new ListItem(i.ToString(), i.ToString());
            l = new ListItem(i.ToString(), i.ToString());
            drplwrage.Items.Add(l);


        }

        l = new ListItem("Select", "0");
        drplwrage.Items.Insert(0, l);



        ListItem l2 = new ListItem();
        for (int i = 18; i <= 65; i++)
        {


            //  ListItem l = new ListItem(i.ToString(), i.ToString());
            l2 = new ListItem(i.ToString(), i.ToString());
            drpuprage.Items.Add(l2);


        }

        l2 = new ListItem("Select", "0");

        drpuprage.Items.Insert(0, l2);

            
    
    
    
    }

    protected void retrieveData()
    {
        connect c = new connect();
        try
        {
            c.cmd.CommandText = " INSERT INTO partner(id) VALUES('" + s + "')";
            c.cmd.ExecuteNonQuery();
        }

        catch
        {

        }


        c.cmd = new SqlCommand("select partner.* from partner where partner.id='" + s + "' ", c.cn);

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
                string age_u = c.dr["age_u"].ToString();
                drpuprage.SelectedValue = age_u;
                string age_l = c.dr["age_l"].ToString();
                drplwrage.SelectedValue = age_l;
                string height_u = c.dr["height_u"].ToString();
                drpupprheight.SelectedValue = height_u;
                string height_l = c.dr["height_l"].ToString();
                drplwrheight.SelectedValue = height_l;
                string income_u = c.dr["income_u"].ToString();
                drpupperincome.SelectedValue = income_u;
                string income_l = c.dr["income_l"].ToString();
                drplwrincome.SelectedValue = income_l;
                txtdesired.Text = c.dr["other"].ToString();
            }
        }
        c.dr.Close();

        c.cmd = new SqlCommand("select pref_m_status.* from pref_m_status where pref_m_status.user_id ='" + s + "'", c.cn);
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            foreach (ListItem li in chkpartnermarital.Items)
            {
                if (li.Value.ToString().Equals(c.dr["m_status"].ToString()))
                {
                    li.Selected = true;
                }
            }
        }
        c.dr.Close();



        c.cmd = new SqlCommand("select pref_religion.* from pref_religion where pref_religion.user_id ='" + s + "'", c.cn);
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            foreach (ListItem li in chkreligion.Items)
            {
                if (li.Value.ToString().Equals(c.dr["religion"].ToString()))
                {
                    li.Selected = true;
                }
            }
        }
        c.dr.Close();


        c.cmd = new SqlCommand("select pref_mthr_tongue.* from pref_mthr_tongue where pref_mthr_tongue.user_id ='" + s + "'", c.cn);
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            foreach (ListItem li in chkmthrtongue.Items)
            {
                if (li.Value.ToString().Equals(c.dr["mthr_tongue"].ToString()))
                {
                    li.Selected = true;
                }
            }
        }
        c.dr.Close();
        c.cn.Close();


    
    }
}