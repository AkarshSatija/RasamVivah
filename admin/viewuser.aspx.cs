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


public partial class viewuser : System.Web.UI.Page
{
    public string user;
    
    public profileFunc p = new profileFunc();

    protected void Page_Load(object sender, EventArgs e)
    {



        if (Request.QueryString["id"] != null)
            user = Request.QueryString["id"].ToString();

            


        if (!IsPostBack)
        {

            BindMotherTongue();
            bindReligion();
            bindMarital();
            bindWorking_with();
            bindCity();
            bindDegree();
            bindCountry();



            for (int i = 18; i <= 65; i++)
            {


                ListItem l = new ListItem();
                l = new ListItem(i.ToString() + " Yrs", i.ToString());
                drpadvlwrage.Items.Add(l);
                //drpadvuprage.Items.Add(l);

            }

            for (int i = 18; i <= 65; i++)
            {


                ListItem l = new ListItem();
                l = new ListItem(i.ToString() + " Yrs", i.ToString());
                // drpadvlwrage.Items.Add(l);
                drpadvuprage.Items.Add(l);

            }

            drpadvlwrage.SelectedValue = "18";
            drpadvuprage.SelectedValue = "30";
            

        }

        
        prof_image.ImageUrl = "~/image.ashx?id=" + user;
        retrieve_sidebar();
        retrieveData();
        retrieve_rightbar();
    }

    protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = " SELECT top 1 [gender] FROM [p_details] WHERE ([id] = '" + user + "')";

        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            // Session["CId"] = c.dr["user_id"].ToString();

            string gender = c.dr["gender"].ToString();
            //   (e.Item.FindControl("genderLabel") as Label).Text = "Female";
            if (gender.Equals("True"))
                (e.Item.FindControl("genderLabel") as Label).Text = "Male";

            //  string ckj = (e.Item.FindControl("genderLabel") as Label).Text;

        }

        c.dr.Close();
        c.cn.Close();
    }
   
    public void retrieve_sidebar()
    {
        //=======

        myverify mv = new myverify();
        int verify = mv.checkemail(user) + mv.checkmobile(user);
        if (verify == 2)
        {

            lbverified.Text = "Verified";

        }
        else
        {

            lbverified.Text = "Not Verified";



        }
        //=======
        try
        {
            connect c = new connect();
            c.cmd.CommandText = "Select fname,lname,dbo.fn_GetAge(dob, GetDate()) as myage,gender,city,country from p_details WHERE([id]='" + user + "')";

            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbname.Text = c.dr["fname"].ToString() + " " + c.dr["lname"].ToString();
                lbgender.Text = c.dr["gender"].ToString();
                if (c.dr["gender"].ToString() == "True")
                {
                    lbgender.Text = "Male";
                }
                else
                {
                    lbgender.Text = "Female";
                }
                //lbcountry.Text = c.dr["country"].ToString();
                lbcity.Text = p.getTextXml(Server.MapPath("..//xml//cities.xml"), "option", c.dr["city"].ToString());
                lbage.Text = c.dr["myage"].ToString();

            }
            c.dr.Close();

            c.cmd.CommandText = "Select religion,caste from religion WHERE([id]='" + user + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbreligion.Text = p.getTextXml(Server.MapPath("..//xml//religion.xml"), "option", c.dr["religion"].ToString());
                lbcaste.Text = p.getCaste(c.dr["religion"].ToString(), c.dr["caste"].ToString(), Server.MapPath("..//xml//"));

            }
            c.dr.Close();

            c.cmd.CommandText = "Select work_area,other from education WHERE([id]='" + user + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbprofession.Text = p.getTextXml(Server.MapPath("..//xml//occupation.xml"), "occupation", c.dr["work_area"].ToString());
                lbabouteducation.Text = c.dr["other"].ToString();
            }
            c.dr.Close();
            c.cmd.CommandText = "Select other from family WHERE([id]='" + user + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbaboutfamily.Text = c.dr["other"].ToString();

            }
            c.dr.Close();
            c.cmd.CommandText = "Select other from physical WHERE([id]='" + user + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbaboutme.Text = c.dr["other"].ToString();

            }
            c.dr.Close();
            c.cn.Close();
        }

        catch (Exception ex)
        {

        }


    }
    protected void lv1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = " SELECT top 1 [liv_with] FROM [family] WHERE ([id] = '" + user + "')";

        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            // Session["CId"] = c.dr["user_id"].ToString();

            string liv_with = c.dr["liv_with"].ToString();
            //   (e.Item.FindControl("liv_with") as Label).Text = "Yes";
            if (liv_with.Equals("False"))
                (e.Item.FindControl("liv_withlabel") as Label).Text = "No";


        }
        c.dr.Close();
        c.cn.Close();

    }
    protected void lv4_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        connect c = new connect();
        c.cmd.CommandText = " SELECT top 1 [HIV] FROM [physical] WHERE ([id] = '" + user + "')";

        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            // Session["CId"] = c.dr["user_id"].ToString();

            string HIV = c.dr["HIV"].ToString();
            //   (e.Item.FindControl("liv_with") as Label).Text = "Yes";
            if (HIV.Equals("False"))
                (e.Item.FindControl("HIVlabel") as Label).Text = "Negative";
        }
        c.dr.Close();
        c.cn.Close();
    }
    
    protected void retrieveData()
    {
        connect c = new connect();
        try
        {
            c.cmd.CommandText = " INSERT INTO partner(id) VALUES('" + user + "')";
            c.cmd.ExecuteNonQuery();
        }

        catch
        {

        }


        c.cmd.CommandText = "select partner.* from partner where partner.id='" + user + "' ";
        c.cmd.Connection = c.cn;
        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
                string age_u = c.dr["age_u"].ToString();
                string age_l = c.dr["age_l"].ToString();

                lbPartnerAge.Text = age_l + " to " + age_u + " Years";

                string height_u = c.dr["height_u"].ToString();
                //p.getTextXml(Server.MapPath("..//xml//height.xml"), "height", )
                string height_l = c.dr["height_l"].ToString();
                lbPartnerHeight.Text = p.getTextXml(Server.MapPath("..//xml//height.xml"), "height", height_l) + " to "
                    + p.getTextXml(Server.MapPath("..//xml//height.xml"), "height", height_u);

                string income_u = c.dr["income_u"].ToString();
                string income_l = c.dr["income_l"].ToString();
                lbPartnerIncome.Text = p.getTextXml(Server.MapPath("..//xml//income.xml"), "rupee", income_l) + " to "
                    + p.getTextXml(Server.MapPath("..//xml//income.xml"), "rupee", income_u);

                lbPartnerDesc.Text = c.dr["other"].ToString();
                lblogindetails.Text = p.lastlogindetails(user);
                
            }
        }
        c.dr.Close();

        c.cmd.CommandText = "select pref_m_status.* from pref_m_status where pref_m_status.user_id ='" + user + "'";
        c.dr = c.cmd.ExecuteReader();

        string lb_p_m_status = "";
        int i = 0;

        while (c.dr.Read())
        {

            if (i > 0)
                lb_p_m_status += ", ";
            lb_p_m_status += p.getTextXml(Server.MapPath("..//xml//marital.xml"), "status", c.dr["m_status"].ToString());
            i++;
        }
        c.dr.Close();
        lbPartnerM_Status.Text = lb_p_m_status;



        c.cmd.CommandText = "select pref_religion.* from pref_religion where pref_religion.user_id ='" + user + "'";
        c.dr = c.cmd.ExecuteReader();

        string lb_p_religion = "";
        i = 0;

        while (c.dr.Read())
        {

            if (i > 0)
                lb_p_religion += ", ";
            lb_p_religion += p.getTextXml(Server.MapPath("..//xml//religion.xml"), "option", c.dr["religion"].ToString());
            i++;
        }
        c.dr.Close();
        lbPartnerReligion.Text = lb_p_religion;




        c.cmd.CommandText = "select pref_mthr_tongue.* from pref_mthr_tongue where pref_mthr_tongue.user_id ='" + user + "'";
        c.dr = c.cmd.ExecuteReader();

        string lb_p_m_tongue = "";
        i = 0;

        while (c.dr.Read())
        {

            if (i > 0)
                lb_p_m_tongue += ", ";
            lb_p_m_tongue += p.getTextXml(Server.MapPath("..//xml//mother_tongue.xml"), "language", c.dr["mthr_tongue"].ToString());
            i++;
        }
        c.dr.Close();
        lbPartnerMotherTongue.Text = lb_p_m_tongue;


        c.dr.Close();
        c.cn.Close();



    }
    
    protected void btsearch_Click(object sender, EventArgs e)
    {
        string search_url = "search.aspx?result=1";


        if (!rbtnlooking.SelectedValue.ToString().Equals("")) // is type se
        {
            search_url += "&gender=" + rbtnlooking.SelectedValue.ToString();
        }


        if (!drpadvlwrage.SelectedValue.Equals("0"))
        {
            search_url += "&agel=" + drpadvlwrage.SelectedValue.ToString();
        }

        if (!drpadvuprage.SelectedValue.Equals("0"))
        {
            search_url += "&ageu=" + drpadvuprage.SelectedValue.ToString();
        }


        if (!drpadvmarital.SelectedValue.Equals("0")) //like this
        {
            search_url += "&m_status1=" + drpadvmarital.SelectedValue.ToString();
        }

        if (!drpadvreligion.SelectedValue.Equals("0"))
        {
            search_url += "&religion1=" + drpadvreligion.SelectedValue.ToString();
        }

        if (!drpadvmthrtongue.SelectedValue.Equals("0"))
        {
            search_url += "&m_tongue1=" + drpadvmthrtongue.SelectedValue.ToString();
        }

        if (!drpadvcountry.SelectedValue.Equals("0"))
        {
            search_url += "&country1=" + drpadvcountry.SelectedValue.ToString();
        }

        if (!drpcity.SelectedValue.Equals("0"))
        {
            search_url += "&city1=" + drpcity.SelectedValue.ToString();
        }

        if (!drpadveducation.SelectedValue.Equals("0"))
        {
            search_url += "&edu1=" + drpadveducation.SelectedValue.ToString();
        }

        //if (!drpadvoccupation.SelectedValue.Equals("0"))
        //{
        //    search_url += "&occ1=" + drpadvoccupation.SelectedValue.ToString();
        //}

        if (!drpadvworkstatus.SelectedValue.Equals("0"))
        {
            search_url += "&work_s1=" + drpadvworkstatus.SelectedValue.ToString();
        }

        if (chkphotos.Checked == true)
        {
            search_url += "&photos=1";
        }

        Response.Redirect(search_url);


    }

    protected void BindMotherTongue()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//mother_tongue.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpadvmthrtongue.DataSource = ds;
                drpadvmthrtongue.DataTextField = "Text";
                drpadvmthrtongue.DataValueField = "Value";
                drpadvmthrtongue.DataBind();
            }

            //drpadvmthrtongue.Items.Insert(0, new ListItem("Mother Tongue", "0"));
            drpadvmthrtongue.Items.RemoveAt(0);
            drpadvmthrtongue.Items.Insert(0, new ListItem("Mother Tongue", "0"));
        }
        catch (Exception ex)
        {


        }


    }

    protected void bindReligion()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//religion.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpadvreligion.DataSource = ds;
                drpadvreligion.DataTextField = "Text";
                drpadvreligion.DataValueField = "Value";
                drpadvreligion.DataBind();
            }
            drpadvreligion.Items.RemoveAt(0);
            drpadvreligion.Items.Insert(0, new ListItem("Religion", "0"));
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void drpadvcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCity(drpadvcountry.SelectedValue.ToString());






    }

    protected void bindCity(string country = "")
    {

        try
        {
            XmlTextReader xmlreader;


            if (country.Equals("356"))
            {

                xmlreader = new XmlTextReader(Server.MapPath("..//xml//cities.xml"));
            }
            else if (country.Equals("840"))
            {

                xmlreader = new XmlTextReader(Server.MapPath("..//xml//UScities.xml"));
            }

            else
            {

                xmlreader = new XmlTextReader(Server.MapPath("..//xml//other.xml"));

            }




            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            //if (ds.Tables.Count != 0)
            //{
            drpcity.DataSource = ds;
            drpcity.DataTextField = "Text";
            drpcity.DataValueField = "Value";
            drpcity.DataBind();


            drpcity.Items.RemoveAt(0);
            drpcity.Items.Insert(0, new ListItem("City", "0"));

            //00000
            //string xmlFile = Server.MapPath("..//xml//country.xml");
            //XmlReaderSettings settings = new XmlReaderSettings();
            //settings.IgnoreComments = true;
            //settings.IgnoreWhitespace = true;
            //try
            //{
            //    using (XmlReader reader = XmlReader.Create(xmlFile, settings))
            //    {

            //        while (reader.Read())
            //        {
            //            if (reader.NodeType == XmlNodeType.Element)
            //            {

            //                //<option Text="Anguilla" Value="660" iso="AI" isd="264" ></option>
            //                if (reader.Name == "option")
            //                {
            //                    if (reader.GetAttribute("Value").ToString().Equals(drpadvcountry.SelectedValue.ToString()))
            //                    {
            //                        //xmlContent = reader.GetAttribute("isd").ToString();

            //                    }

            //                }


            //            }
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{

            //}


            //--------------

            // }
        }
        catch (Exception ex)
        {


        }


    }

    protected void bindCountry()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//country.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpadvcountry.DataSource = ds;
                drpadvcountry.DataTextField = "Text";
                drpadvcountry.DataValueField = "Value";
                drpadvcountry.DataBind();
            }
            drpadvcountry.Items.RemoveAt(0);
            drpadvcountry.Items.Insert(0, new ListItem("Country", "0"));
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void bindMarital()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//marital.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpadvmarital.DataSource = ds;
                drpadvmarital.DataTextField = "Text";
                drpadvmarital.DataValueField = "Value";
                drpadvmarital.DataBind();
            }
            drpadvmarital.Items.RemoveAt(0);
            drpadvmarital.Items.Insert(0, new ListItem("Marital Status", "0"));
            //chkadvmarital.Items.RemoveAt(0);
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void bindWorking_with()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//working_with.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpadvworkstatus.DataSource = ds;
                drpadvworkstatus.DataTextField = "Text";
                drpadvworkstatus.DataValueField = "Value";
                drpadvworkstatus.DataBind();

            }
            drpadvworkstatus.Items.RemoveAt(0);
            drpadvworkstatus.Items.Insert(0, new ListItem("Work Status", "0"));
            // chkadvworkstatus.Items.RemoveAt(0);
            xmlreader.Close();

        }
        catch (Exception ex)
        {


        }


    }

    protected void bindDegree()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("..//xml//degree.xml"));

            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpadveducation.DataSource = ds;
                drpadveducation.DataTextField = "Text";
                drpadveducation.DataValueField = "Value";
                drpadveducation.DataBind();



            }

            drpadveducation.Items.Insert(0, new ListItem("Education", "0"));
            //chkadveducation.Items.Insert(0, new ListItem("Doesn't matter", "0"));
            xmlreader.Close();

        }
        catch (Exception ex)
        {


        }

    }

    protected void bindCaste(string religion)
    {

        try
        {
            XmlTextReader xmlreader;


            if (religion.Equals("1"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//hindu.xml"));
            else if (religion.Equals("2"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//muslim.xml"));
            else if (religion.Equals("3"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//christian.xml"));
            else if (religion.Equals("4"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//sikh.xml"));
            else if (religion.Equals("5"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//other.xml"));
            else if (religion.Equals("6"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//jain.xml"));
            else if (religion.Equals("7"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//other.xml"));
            else if (religion.Equals("8"))
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//other.xml"));
            else
                xmlreader = new XmlTextReader(Server.MapPath("..//xml//other.xml"));






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

    protected void drpadvreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCaste(drpadvreligion.SelectedValue.ToString());
    }

    protected void retrieve_rightbar()
    {
        if (p.isActive(user))
        {
            lbactive.Text = "Active";
        }
        else
        {

            lbactive.Text = "Deactive";

        }

        if (p.isApproved(user))
        {
            lbApproved.Text = "Approved";
        }
        else
        {

            lbApproved.Text = "Unapprroved";

        }
    
    
    
    }
    protected void btngo_Click(object sender, EventArgs e)
    {
        string mycmd = "update userinfo set ";
        string action_string = "";
        
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

        



        connect c = new connect();

        c.cmd.CommandText = mycmd + action_string + " where id='"+user+"'";

        c.cmd.ExecuteNonQuery();

        c.cn.Dispose();
        c.cn.Close();



    }
}