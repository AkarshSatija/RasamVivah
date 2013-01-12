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
using System.Text;

public partial class verify : System.Web.UI.Page
{
    
    myverify mvf = new myverify();
    public string s;
    public profileFunc p = new profileFunc();

    protected void Page_Load(object sender, EventArgs e)
    {
        s = Session["id"].ToString();
        retrieve_sidebar();
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
            //drpadvlwrage.SelectedValue = "21";
            //l = new ListItem("Min", "0");
            //drpadvlwrage.Items.Insert(0, l);
            //drpadvuprage.Items.Insert(0, l);

        }
        string querymobilecode=null;
        string queryemailcode=null;
        if (Request.QueryString["type"] != null)
        {
            if (Request.QueryString["type"].ToString().Equals("email"))
            {
                divmobile.Visible = false;
               
                                      
            }
            if (Request.QueryString["type"].ToString().Equals("mobile"))
            {
                divemail.Visible = false;
            }


        }


        if (Request.QueryString["mobile"] != null)
            querymobilecode = Request.QueryString["mobile"].ToString();

        if (Request.QueryString["email"] != null)
            queryemailcode = Request.QueryString["email"].ToString();
        emailprocess(queryemailcode);
        mobileprocess(querymobilecode);

    }

    protected void emailprocess(string emailcode) 
    {

        if (mvf.checkemail(s) == 1)
        {

            lbemailmsg.Text = "Your email is already verified! Thank You!";
            divrecievecode.Visible = false;
        }
        else
        {
            divrecievecode.Visible = true;
            if (emailcode==null)
            {

                
                lbemailmsg.Text = "Your email is not verified yet! verify now! ";
                //btnemail.Text = "verify Now";
                btnemail.Visible = true;
                divrecievecode.Visible = true;
            
            
            }
            else
            {
                connect c = new connect();
                c.cmd.CommandText = "select * from userinfo where id='" + s + "'";

                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    if (c.dr["email_verified"].ToString().ToLower().Equals(emailcode.ToLower()))
                    {

                        c.dr.Close();
                        c.cmd.CommandText = "update userinfo set email_verified='1' where id='"+s+"'";
                        if (c.cmd.ExecuteNonQuery() == 1)
                        { lbemailmsg.Text = "Your email verified successfuly";
                        divrecievecode.Visible = false;

                                               }
                        else
                            lbemailmsg.Text = "Your email could not be verified! Contact customer care Thank You!";

                    }
                    else
                    {

                        lbemailmsg.Text = "Your email could not be verified! Contact customer care Thank You!";
                    
                    }
                
                }
                c.cn.Close();
            }
        
        }
        
    
    
    }

    protected void mobileprocess(string mobilecode)
    {

        if (mvf.checkmobile(s) == 1)
        {
            divrecievemobilecode.Visible = false;
            lbmobilemsg.Text = "Your mobile is already verified! Thank You!";

        }
        else
        {

            divrecievemobilecode.Visible = true;
            if (mobilecode == null)
            {

                lbmobilemsg.Text = "Your mobile is not verified yet! verify now! ";
                //btnemail.Text = "verify Now";
                btnmobile.Visible = true;


            }
            else
            {
                connect c = new connect();
                c.cmd.CommandText = "select * from userinfo where id='" + s + "'";

                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    if (c.dr["mob_verified"].ToString().ToLower().Equals(mobilecode.ToLower()))
                    {

                        c.dr.Close();
                        c.cmd.CommandText = "update userinfo set mob_verified='1' where id='" + s + "'";
                        if (c.cmd.ExecuteNonQuery() == 1)
                        { 
                        lbmobilemsg.Text = "Your mobile verified successfuly";
                        divrecievemobilecode.Visible = false;
                        }
                        else
                            lbmobilemsg.Text = "Your mobile could not be verified! Contact customer care Thank You!";
                     //   lbmobilemsg.Text = "Your mobile verified successfuly";
                    }
                    else
                    {

                        lbmobilemsg.Text = "Your mobile could not be verified! Contact customer care Thank You!";

                    }

                }
                c.cn.Close();
            }

        }



    }

    protected void btnemail_Click(object sender, EventArgs e)
    {
        if ((btnemail.Text.Equals("Go")) && (btnemail.Visible == true))
            Response.Redirect("~/verify.aspx?type=email&email=" + txtemail.Text);

        lbemailmsg.Text = "Enter verification code sent to your email";
        btnemail.Text = "Go";
        btnemail.Visible = true;
        txtemail.Visible=true;
        lbresendcode.Visible = true;
        lnkresendemail.Visible = true;
    }
    
    protected void lnkresendemail_Click(object sender, EventArgs e)
    {
      
        myverify myv = new myverify();
        int ret =myv.verifyemail(s);

        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
       // sb.Append("window.open('popup.aspx',null,'height=250,width=250,status=no,resizable=no,scrollbar=no,toolbar=no,location=5,menubar=no');");
        if(ret==1)
            sb.Append("window.alert(\"The code has been sent on your email id\");");
        else
            sb.Append("window.alert(\"Mail could not be sent right now! please try again later \");");

        sb.Append("</script>");

        Page.RegisterStartupScript("test", sb.ToString());

    }
    
    protected void btnmobile_Click(object sender, EventArgs e)
    {
        if ((btnmobile.Text.Equals("Go")) && (btnmobile.Visible == true))
            Response.Redirect("~/verify.aspx?type=mobile&mobile=" + txtmobile.Text);

        lbmobilemsg.Text = "Enter verification code sent to your mobile";
        btnmobile.Text = "Go";
        btnmobile.Visible = true;
        txtmobile.Visible = true;
        lbresendmobile.Visible = true;
        lnkresendmobile.Visible = true;

    }
    
    protected void lnkresendmobile_Click(object sender, EventArgs e)
    {
        myverify myv = new myverify();
        int ret =myv.verifymob(s);

        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
        // sb.Append("window.open('popup.aspx',null,'height=250,width=250,status=no,resizable=no,scrollbar=no,toolbar=no,location=5,menubar=no');");
        if (ret == 1)
            sb.Append("window.alert(\"The code has been sent on your Mobile number\");");
        else
            sb.Append("window.alert(\"The code could not be send on your Mobile! Please try again later.\");");

        sb.Append("</script>");

        Page.RegisterStartupScript("test", sb.ToString());
        
        //popup here with text= "an email has been sent to ur email id"

    }

    protected void retrieve_sidebar()
    {
        prof_image.ImageUrl = "~/image.ashx?id=" + s;
        //=======

        myverify mv = new myverify();
        int verify = mv.checkemail(s) + mv.checkmobile(s);
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
            c.cmd.CommandText = "Select fname,lname,dbo.fn_GetAge(dob, GetDate()) as myage,gender,city,country from p_details WHERE([id]='" + s + "')";

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
                lbcountry.Text = p.getTextXml(Server.MapPath("xml//country.xml"), "option", c.dr["country"].ToString());
                lbcity.Text = p.getCity(c.dr["country"].ToString(), c.dr["city"].ToString(), Server.MapPath("xml//"));
                lbage.Text = c.dr["myage"].ToString();

            }
            c.dr.Close();

            c.cmd.CommandText = "Select religion,caste from religion WHERE([id]='" + s + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbreligion.Text = p.getTextXml(Server.MapPath("xml//religion.xml"), "option", c.dr["religion"].ToString());
                lbcaste.Text = p.getCaste(c.dr["religion"].ToString(), c.dr["caste"].ToString(), Server.MapPath("xml//"));

            }
            c.dr.Close();

            c.cmd.CommandText = "Select work_area,other from education WHERE([id]='" + s + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                lbprofession.Text = p.getTextXml(Server.MapPath("xml//occupation.xml"), "occupation", c.dr["work_area"].ToString());
                
            }
            c.dr.Close();
           
            
            c.cn.Close();

        }

        catch (Exception ex)
        {

        }


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
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//mother_tongue.xml"));

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
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//religion.xml"));
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

    protected void bindCountry()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//country.xml"));
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
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//marital.xml"));
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
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//working_with.xml"));

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
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//degree.xml"));

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
                xmlreader = new XmlTextReader(Server.MapPath("xml//hindu.xml"));
            else if (religion.Equals("2"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//muslim.xml"));
            else if (religion.Equals("3"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//christian.xml"));
            else if (religion.Equals("4"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//sikh.xml"));
            else if (religion.Equals("5"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            else if (religion.Equals("6"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//jain.xml"));
            else if (religion.Equals("7"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            else if (religion.Equals("8"))
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));
            else
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));






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

    protected void bindCity(string country = "")
    {

        try
        {
            XmlTextReader xmlreader;


            if (country.Equals("356"))
            {

                xmlreader = new XmlTextReader(Server.MapPath("xml//cities.xml"));
            }
            else if (country.Equals("840"))
            {

                xmlreader = new XmlTextReader(Server.MapPath("xml//UScities.xml"));
            }

            else
            {

                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));

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
            //string xmlFile = Server.MapPath("xml//country.xml");
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

    protected void drpadvreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCaste(drpadvreligion.SelectedValue.ToString());
    }

    protected void drpadvcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCity(drpadvcountry.SelectedValue.ToString());






    }




}