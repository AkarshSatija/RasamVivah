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

public partial class editdetails : System.Web.UI.Page
{
    string s;
    //int rowaffectd2 = 0;
    SqlTransaction tx;





    protected void Page_Load(object sender, EventArgs e)
    {
        
        s = Session["id"].ToString();
        //  s = "1000021";

        if (!IsPostBack)
        {
            BindDataToGridviewDropdownlist();
           
            bindReligion();
            
        }

        //drpheight.SelectedValue="2";

        connect c = new connect();

        try
        {
            c.cmd.CommandText = "INSERT INTO physical(id) VALUES('" + s + "')";
            c.cmd.ExecuteNonQuery();
           


        }
        catch
        {

        }
        try
        {
            c.cmd.CommandText = "INSERT INTO religion(id) VALUES('" + s + "')";
            c.cmd.ExecuteNonQuery();
           
        }
        catch
        {


        }



        c.cmd = new SqlCommand("select physical.* from physical where physical.id='" + s + "' ", c.cn);

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
                string height = c.dr["height"].ToString();
                drpheight.SelectedValue = height;
                string weight = c.dr["weight"].ToString();
                txtweight.Text = weight;
                string body_type = c.dr["body_type"].ToString();
                rbtnbodytype.SelectedValue = body_type;
                string smoke = c.dr["smoke"].ToString();
                rbtnsmoke.SelectedValue = smoke;
                string drink = c.dr["drink"].ToString();
                rbtndrink.SelectedValue = drink;
                string diet = c.dr["diet"].ToString();
                rbtndiet.SelectedValue = diet;
                string complexion = c.dr["complexion"].ToString();
                rbtncomplexion.SelectedValue = complexion;
                string blood_group = c.dr["blood_group"].ToString();
                drpbloodgrp.SelectedValue = blood_group;
                string HIV = c.dr["HIV"].ToString();
                if (HIV.Equals("True"))
                    rbtnhiv.SelectedValue = "1";
                else if (HIV.Equals("False"))
                    rbtnhiv.SelectedValue = "0";

                string challenged = c.dr["challenged"].ToString();
                drpspecialcase.SelectedValue = challenged;
                txtother.Text = c.dr["other"].ToString();

            }

            c.dr.Close();

            c.cmd = new SqlCommand("select religion.* from religion where religion.id='" + s + "' ", c.cn);

            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                string religion = c.dr["religion"].ToString();
                drpreligion.SelectedValue = religion;
                bindCaste(drpreligion.SelectedValue.ToString());
                string caste = c.dr["caste"].ToString();
                drpcaste.SelectedValue = caste;
                txtsubcaste.Text = c.dr["sub1"].ToString();
            }

        }
        c.cn.Close();
    }
    protected void btncreate_Click(object sender, EventArgs e)
    {
        int go = 0;

        try
        {

            connect c = new connect();
            tx = c.cn.BeginTransaction();
            c.cmd.Transaction = tx;
            string body_type = rbtnbodytype.SelectedValue;
            string smoke = rbtnsmoke.SelectedValue;
            string drink = rbtndrink.SelectedValue;
            string diet = rbtndiet.SelectedValue;
            string complexion = rbtncomplexion.SelectedValue;
            string HIV = rbtnhiv.SelectedValue;
            c.cmd.CommandText = "update physical set height = @height, weight=@weight, body_type='" + body_type + "',smoke='" + smoke + "',drink='" + drink + "',diet='" + diet + "',complexion='" + complexion +
                "',other=@other,challenged=@challenged,blood_group=@blood_group,HIV='" + HIV + "'";

            c.cmd.Parameters.Add("@height", SqlDbType.Int).Value = drpheight.SelectedValue;
            c.cmd.Parameters.Add("@weight", SqlDbType.Int).Value = txtweight.Text;
            c.cmd.Parameters.Add("@challenged", SqlDbType.Int).Value = drpspecialcase.SelectedValue;
            c.cmd.Parameters.Add("@blood_group", SqlDbType.Int).Value = drpbloodgrp.SelectedValue;
            c.cmd.Parameters.Add("@other", SqlDbType.Text).Value = txtother.Text;

            c.cmd.ExecuteNonQuery();//execute


            //c.cmd.CommandText = "INSERT INTO RELEGION(id,caste,religion,sub1,sub2,sub3,sub4) VALUES('" + s + "',@religion,@caste,@sub1,@sub2,@sub3,@sub4 )";
            c.cmd.CommandText = "update religion set religion=@religion,caste=@caste,sub1=@sub1";
            c.cmd.Parameters.Add("@religion", SqlDbType.Int).Value = drpreligion.SelectedValue;

            c.cmd.Parameters.Add("@caste", SqlDbType.Int).Value = drpcaste.SelectedValue;
            c.cmd.Parameters.Add("@sub1", SqlDbType.VarChar).Value = txtsubcaste.Text;
            //c.cmd.Parameters.Add("@sub2", SqlDbType.VarChar).Value = null;
            //c.cmd.Parameters.Add("@sub3", SqlDbType.VarChar).Value = null;
            //c.cmd.Parameters.Add("@sub4", SqlDbType.VarChar).Value = null;

            c.cmd.ExecuteNonQuery(); //execute

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
                Response.Redirect("editdetails1.aspx");
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
                drpheight.DataSource = ds;
                drpheight.DataTextField = "Text";
                drpheight.DataValueField = "Value";
                drpheight.DataBind();



            }
        }
        catch (Exception ex)
        {


        }


    }


    //protected void bindChristian()
    //{

    //    try
    //    {
    //        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//christian.xml"));
    //        DataSet ds = new DataSet();
    //        ds.ReadXml(xmlreader);
    //        xmlreader.Close();
    //        if (ds.Tables.Count != 0)
    //        {
    //            drpchristiansect.DataSource = ds;
    //            drpchristiansect.DataTextField = "text";
    //            drpchristiansect.DataValueField = "value";
    //            drpchristiansect.DataBind();



    //        }
    //    }
    //    catch (Exception ex)
    //    {


    //    }


    //}

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
                drpreligion.DataSource = ds;
                drpreligion.DataTextField = "Text";
                drpreligion.DataValueField = "Value";
                drpreligion.DataBind();



            }
        }
        catch (Exception ex)
        {

        }
    }
    

    protected void bindCaste( string religion )
    {

        try
        {
            XmlTextReader xmlreader;


            if (religion.Equals("1"))
            {
                trcaste.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//hindu.xml"));
            }
            else if (religion.Equals("2"))
            {
                trcaste.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//muslim.xml"));
            }
            else if (religion.Equals("3"))
            {
                trcaste.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//christian.xml"));
            }
            else if (religion.Equals("4"))
            {
                trcaste.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//sikh.xml"));
            }
            else if (religion.Equals("5"))
            {
                trcaste.Visible = false;
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            }
            else if (religion.Equals("6"))
            {
                trcaste.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//jain.xml"));
            }
            else if (religion.Equals("7"))
            {
                trcaste.Visible = false;
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            }
            else if (religion.Equals("8"))
            {
                trcaste.Visible = false;
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            }
            else
            {
                trcaste.Visible = false;
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            }
            
            
            
            
            
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            //if (ds.Tables.Count != 0)
            //{
                drpcaste.DataSource = ds;
                drpcaste.DataTextField = "Text";
                drpcaste.DataValueField = "Value";
                drpcaste.DataBind();

               




            //--------------

           // }
        }
        catch (Exception ex)
        {


        }


    }

   

    protected void drpreligion_SelectedIndexChanged(object sender, EventArgs e)
    {

        bindCaste(drpreligion.SelectedValue.ToString());
        // Reset 
        //drphinducaste.SelectedIndex = -1;
        //drpmuslimsect.SelectedIndex = -1;
        //drpsikhcaste.SelectedIndex = -1;
        //drpchristiansect.SelectedIndex = -1;
        //drpjaincaste.SelectedIndex = -1;
        // Dynamically enable the dropdowns based on religion selection

    }

}

//protected void bindMuslim()
//{

//    try
//    {
//        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//muslim.xml"));
//        DataSet ds = new DataSet();
//        ds.ReadXml(xmlreader);
//        xmlreader.Close();
//        if (ds.Tables.Count != 0)
//        {
//            drpmuslimsect.DataSource = ds;
//            drpmuslimsect.DataTextField = "text";
//            drpmuslimsect.DataValueField = "value";
//            drpmuslimsect.DataBind();



//        }
//    }
//    catch (Exception ex)
//    {


//    }
//}

//protected void bindSikh()
//{

//    try
//    {
//        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//sikh.xml"));
//        DataSet ds = new DataSet();
//        ds.ReadXml(xmlreader);
//        xmlreader.Close();
//        if (ds.Tables.Count != 0)
//        {
//            drpsikhcaste.DataSource = ds;
//            drpsikhcaste.DataTextField = "text";
//            drpsikhcaste.DataValueField = "value";
//            drpsikhcaste.DataBind();



//        }
//    }
//    catch (Exception ex)
//    {


//    }

//}



    //protected void drphinducaste_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drphinducaste.SelectedValue == "Select")
    //    {
    //        // Reset religion menu and disable the hinduDDL menu
    //        drpreligion.SelectedIndex
    //            = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Select"));
    //       drphinducaste.Enabled = false;
    //    }
    //    else
    //    {
    //        drpreligion.SelectedIndex
    //             = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Hindu"));
    //    }
    //}
    //protected void drpmuslimsect_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpmuslimsect.SelectedValue == "Select")
    //    {
    //        // Reset religion menu and disable the hinduDDL menu
    //        drpreligion.SelectedIndex
    //            = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Select"));
    //       drpmuslimsect.Enabled = false;
    //    }
    //    else
    //    {
    //        drpreligion.SelectedIndex
    //             = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Muslim"));
    //    }
    //}
    //protected void drpsikhcaste_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpsikhcaste.SelectedValue == "Select")
    //    {
    //        // Reset religion menu and disable the hinduDDL menu
    //        drpreligion.SelectedIndex
    //            = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Select"));
    //        drpsikhcaste.Enabled = false;
    //    }
    //    else
    //    {
    //        drpreligion.SelectedIndex
    //             = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Sikh"));
    //    }
    //}
    //protected void drpchristiansect_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpchristiansect.SelectedValue == "Select")
    //    {
    //        // Reset religion menu and disable the hinduDDL menu
    //        drpreligion.SelectedIndex
    //            = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Select"));
    //        drpchristiansect.Enabled = false;
    //    }
    //    else
    //    {
    //        drpreligion.SelectedIndex
    //             = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Christian"));
    //    }
    //}
    //protected void drpjaincaste_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (drpjaincaste.SelectedValue == "Select")
    //    {
    //        // Reset religion menu and disable the hinduDDL menu
    //        drpreligion.SelectedIndex
    //            = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Select"));
    //        drpjaincaste.Enabled = false;
    //    }
    //    else
    //    {
    //        drpreligion.SelectedIndex
    //             = drpreligion.Items.IndexOf(drpreligion.Items.FindByText("Jain"));
    //    }
    //}
