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



public partial class messages : System.Web.UI.Page
{
    string s;
    string query_user="0";
   // string unread;


    protected void Page_Load(object sender, EventArgs e)
    {
       
        s = Session["Id"].ToString();

   



        //if (!IsPostBack)
        //{
        Stubind();
      //  Stubind2();
      //  }

        if (Request.QueryString["user"] != null)
        {
           
            if (Request.QueryString["user"] != null)
                query_user = Request.QueryString["user"].ToString();
            divmsgs.Visible = true;
            divemptymsg.Visible = false;
            Stubind2();

        }
        else
        {
            lv.Visible = true;
            divmsgs.Visible = false;
            divemptymsg.Visible = true;
           // divmsgs.Visible = false;

        }

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
    }
   


    public void Stubind()
    {
        connect c = new connect();

        SqlConnection cn = c.cn; //======
        SqlCommand cmd;
        SqlDataAdapter adp;
        DataSet ds;
        //  cn = new SqlConnection("server=.; database=ie; user id=sa; password=ieweb;");
        // cn.Open();
        cmd = new SqlCommand("");
        cmd.Connection = cn;


        adp = new SqlDataAdapter();
        adp.SelectCommand = cmd;
        ds = new DataSet();


        cmd.CommandText = " select * from(select convid, user1,user2,"+
            "(select max(msgtime) from messages where messages.convid=conv_users.convid) as conv_time from conv_users " +
"where ((user1='" + s + "' or user2='" + s + "'))) as a where conv_time is not null order by conv_time desc";
        adp.Fill(ds);
        // gvEmp.DataSource = ds;
        //  gvEmp.DataBind();
        lv.DataSource = ds;
        lv.DataBind();
        c.adp.Dispose();
        c.ds.Dispose();
        c.cn.Close();
        
        //if (Request.QueryString["user"] != null)
        //{
        //    lv.Visible = false;
        //    query_user = Request.QueryString["user"].ToString();
        //    divmsgs.Visible = true;
        //    Stubind2();
        //}
        //else
        //{
        //    lv.Visible = true;
        //    divmsgs.Visible = false;

        //}


        //c.cmd.CommandText = "select messages.*," +
        //"(select top 1 fname from p_details where p_details.id=messages.sender ) as fname," +
        //"(select top 1 lname from p_details where p_details.id=messages.sender ) as lname " +
        //"from messages where convid=(select top 1 convid from conv_users" +
        //" where ((user1='" + s + "' and user2='" + query_user + "') or (user2='" + s + "' and user1='" + query_user + "'))) order by msgtime desc";


        //c.adp.Fill(c.ds);
        //lvallmsg.DataSource = c.ds;
        //lvallmsg.DataBind();


    }
    public void Stubind2()
    {
        connect c = new connect();
        c.cmd.CommandText = "select messages.*," +
   "(select top 1 fname from p_details where p_details.id=messages.sender ) as fname," +
   "(select top 1 lname from p_details where p_details.id=messages.sender ) as lname " +
   "from messages where convid=(select top 1 convid from conv_users" +
   " where ((user1=@s and user2=@query_user) or (user2=@s and user1=@query_user))) order by msgtime desc";
        c.cmd.Parameters.Add("@s", SqlDbType.VarChar).Value = s;
        c.cmd.Parameters.Add("@query_user", SqlDbType.VarChar).Value =  query_user;

        c.adp.Fill(c.ds);
        lvallmsg.DataSource = c.ds;
        lvallmsg.DataBind();




        c.cn.Close();
        c.cn.Open();
        c.cmd.CommandText = "update messages set status_read='1' where convid=(select top 1 convid from conv_users" +
" where ((user1=@s and user2=@query_user) or (user2=@s and user1=@query_user))) and sender !=@s";
        //hav to work here
        
        int x = c.cmd.ExecuteNonQuery();
        c.adp.Dispose();
        c.ds.Dispose();
        c.cn.Close();
    }


    protected void lv_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblID = e.Item.FindControl("lbid") as Label;
        Label lblu1 = e.Item.FindControl("lbu1") as Label;
        Label lblu2 = e.Item.FindControl("lbu2") as Label;
       // Label lblID4 = e.Item.FindControl("lbdesc") as Label;
        Label lblreadstatus = e.Item.FindControl("lbread_status") as Label;
        //(e.Item.FindControl("Label2") as Label).Text = "   "+ lblID.Text.ToString() + " " + lblID2.Text + " " + lblID3.Text + " " + lblID4.Text;
       // lblreadstatus.Text = "cklsw";
        //connect c = new connect();
        //c.cmd.CommandText = "select top 1 messages.msgtext,(select top 1 fname from userinfo where userinfo.user_id=messages.sender) as sender  from messages where convid='" + lblID.Text + "' order by msgtime desc";
        //c.dr = c.cmd.ExecuteReader();
        //if (c.dr.Read())

        //(e.Item.FindControl("Label2") as Label).Text = c.dr["sender"].ToString();

        //(e.Item.FindControl("lbdesc") as Label).Text = c.dr["msgtext"].ToString();


        //  name_tab.Text = fname + " " + lname;
        string convuser;

        if (lblu1.Text.ToString().Equals(s))
        {

            convuser = lblu2.Text.ToString();
        }
        else
        {
            convuser = lblu1.Text.ToString();
        }

        //   (e.Item.FindControl("anchor") as HtmlAnchor).HRef = "~/messages.aspx?user=" + convuser;

        (e.Item.FindControl("linkbtn") as LinkButton).PostBackUrl = "~/messages.aspx?user=" + convuser;
        
        connect c = new connect();

        c.cmd.CommandText = "select top 1 messages.*," +
"(select top 1 fname from p_details where p_details.id=" + convuser + ") as conv_fname," +
"(select top 1 lname from p_details where p_details.id=" + convuser + ") as conv_lname" +
" from messages where convid=" + lblID.Text.ToString() + " order by msgtime desc";

        c.dr = c.cmd.ExecuteReader();

        if (c.dr.Read())
        {
            string imagevis = c.dr["sender"].ToString();
            if (imagevis.Equals(s))
            {

                (e.Item.FindControl("imgreply") as Image).Visible = true;
            }
            string read_s = c.dr["status_read"].ToString();
            (e.Item.FindControl("lbread_status") as Label).Text = read_s;

            (e.Item.FindControl("lbmsg") as Label).Text = c.dr["msgtext"].ToString();
            (e.Item.FindControl("lbconvname") as Label).Text = c.dr["conv_fname"].ToString() + " " + c.dr["conv_lname"].ToString();
            (e.Item.FindControl("lbdatetime") as Label).Text = c.dr["msgtime"].ToString();


        }
        c.dr.Close();
        c.cn.Close();
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        int rowa;
        string sendmsg = txtsendmsg.Text.ToString();

        connect btnop = new connect();

        btnop.cmd.CommandText = "select top 1 convid from conv_users where ((user1='" + s + "' and user2='" + query_user + "') or (user1='" + query_user + "' and user2='" + s + "'))";
        btnop.dr = btnop.cmd.ExecuteReader();

        if (btnop.dr.Read())
        {
            connect c2 = new connect();
            string convid = btnop.dr["convid"].ToString();

            c2.cmd.CommandText = "insert into messages (sender,msgtext,convid) values ('" + s + "', @text,'" + convid + "')";
            c2.cmd.Parameters.Add("@text", SqlDbType.Text).Value = txtsendmsg.Text.ToString();

            rowa = c2.cmd.ExecuteNonQuery();
            Response.Redirect(Request.Url.AbsoluteUri);
            btnop.cn.Close();
        }
            
        else
        {

            connect insconvid = new connect();

            insconvid.cmd.CommandText = "insert into conv_users(user1,user2) values('" + query_user + "','" + s + "')";
            int ins = insconvid.cmd.ExecuteNonQuery();

            btnsend_Click(sender, e);
            //c2.cmd.CommandText = "insert into messages (sender,msgtext,convid) values ('" + s + "', '" + txtsendmsg.Text.ToString() + "','" + convid + "')";
            //rowa = c2.cmd.ExecuteNonQuery();
            //Response.Redirect(Request.Url.AbsoluteUri);
            insconvid.cn.Close();


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

    protected void drpadvreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCaste(drpadvreligion.SelectedValue.ToString());
    }
}
