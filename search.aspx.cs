using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;

public partial class search : System.Web.UI.Page
{
    public profileFunc p = new profileFunc();
    public string s;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id"] != null)
        {
            s = Session["Id"].ToString();
            
        }

        if (!IsPostBack)
        {
            BindDataToGridviewDropdownlist();

            BindDataToGridviewDropdownlist1();

            bindIncome();

            bindOccupation();

            bindDegree();
            bindMarital();
            bindReligion();
            bindWorking_with();
            bindCountry();

            ListItem l = new ListItem();
            for (int i = 18; i <= 65; i++)
            {


              //  ListItem l = new ListItem(i.ToString(), i.ToString());
                l=new ListItem(i.ToString(), i.ToString());
                drpadvlwrage.Items.Add(l);
                drpadvuprage.Items.Add(l);
            
            }

            l = new ListItem("Select", "0");
            drpadvlwrage.Items.Insert(0, l);
            drpadvuprage.Items.Insert(0, l);

        }
        if ((Request.QueryString["result"] != null) && (Request.QueryString["result"].ToString().Equals("1")))
        {

            divfilldetails.Visible = false;
            divresult.Visible = true;
            //////////
/* *******/  prepare_search(); ////////
            //func call here

        }
        else
        {

            divfilldetails.Visible = true;
            divresult.Visible = false;
        
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
                drpadvlwrheight.DataSource = ds;
                drpadvlwrheight.DataTextField = "Text";
                drpadvlwrheight.DataValueField = "Value";
                drpadvlwrheight.DataBind();

                drpadvupprheight.DataSource = ds;
                drpadvupprheight.DataTextField = "Text";
                drpadvupprheight.DataValueField = "Value";
                drpadvupprheight.DataBind();




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

            if (ds.Tables.Count != 0)
            {
                chkadvmarital.DataSource = ds;
                chkadvmarital.DataTextField = "Text";
                chkadvmarital.DataValueField = "Value";
                chkadvmarital.DataBind();
            }
            chkadvmarital.Items.RemoveAt(0);
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void chkadvcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        // bindCity(chkadvcountry.SelectedValue.ToString());
        foreach (ListItem li in chkadvcountry.Items)
        {
            if (li.Selected==true)
            {

                bindCity(li.Value);

            }


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
           chkadvcity.DataSource = ds;
           chkadvcity.DataTextField = "Text";
           chkadvcity.DataValueField = "Value";
           chkadvcity.DataBind();


           chkadvcity.Items.RemoveAt(0);
           
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
                chkadvcountry.DataSource = ds;
                chkadvcountry.DataTextField = "Text";
                chkadvcountry.DataValueField = "Value";
                chkadvcountry.DataBind();
            }
            chkadvcountry.Items.RemoveAt(0);
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

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
                chkadvreligion.DataSource = ds;
                chkadvreligion.DataTextField = "Text";
                chkadvreligion.DataValueField = "Value";
                chkadvreligion.DataBind();
            }
            chkadvreligion.Items.RemoveAt(0);
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

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
                chkadvmthrtongue.DataSource = ds;
                chkadvmthrtongue.DataTextField = "Text";
                chkadvmthrtongue.DataValueField = "Value";
                chkadvmthrtongue.DataBind();

            }

            chkadvmthrtongue.Items.RemoveAt(0);

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
               drpadvlwrincome.DataSource = ds;
               drpadvlwrincome.DataTextField = "Text";
               drpadvlwrincome.DataValueField = "Value";
               drpadvlwrincome.DataBind();

               drpadvupperincome.DataSource = ds;
               drpadvupperincome.DataTextField = "Text";
               drpadvupperincome.DataValueField = "Value";
               drpadvupperincome.DataBind();
           }

           drpadvlwrincome.Items.Insert(0, new ListItem("Doesn't matter", "-1"));
           drpadvupperincome.Items.Insert(0, new ListItem("Doesn't matter", "-1"));
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

   protected void bindOccupation()
   {

       try
       {
           XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//occupation.xml"));

           DataSet ds = new DataSet();
           ds.ReadXml(xmlreader);
           xmlreader.Close();
           if (ds.Tables.Count != 0)
           {
               chkadvoccupation.DataSource = ds;
               chkadvoccupation.DataTextField = "Text";
               chkadvoccupation.DataValueField = "Value";
               chkadvoccupation.DataBind();

               
           }

           //chkadvoccupation.Items.Insert(0, new ListItem("Doesn't matter", "0"));
         

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
               chkadvworkstatus.DataSource = ds;
               chkadvworkstatus.DataTextField = "Text";
               chkadvworkstatus.DataValueField = "Value";
               chkadvworkstatus.DataBind();

           }

           chkadvworkstatus.Items.RemoveAt(0);
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
               chkadveducation.DataSource = ds;
               chkadveducation.DataTextField = "Text";
               chkadveducation.DataValueField = "Value";
               chkadveducation.DataBind();


           }

           //chkadveducation.Items.Insert(0, new ListItem("Doesn't matter", "0"));


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
       
        if (!drpadvlwrheight.SelectedValue.Equals("0")) // is type se
        {
            search_url += "&heightl=" + drpadvlwrheight.SelectedValue.ToString();
        }

        if (!drpadvupprheight.SelectedValue.Equals("0"))
        {
            search_url += "&heightu=" + drpadvupprheight.SelectedValue.ToString();
        }

        if (!drpadvlwrage.SelectedValue.Equals("0"))
        {
            search_url += "&agel=" + drpadvlwrage.SelectedValue.ToString();
        }

        if (!drpadvuprage.SelectedValue.Equals("0"))
        {
            search_url += "&ageu=" + drpadvuprage.SelectedValue.ToString();
        }
        int i = 0;
        foreach (ListItem li in chkadvmarital.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&m_status"+i + "=" + li.Value.ToString();
            }
        }
        i = 0;
        foreach (ListItem li in chkadvreligion.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&religion" + i + "=" + li.Value.ToString();
            }
        }


        i = 0;
        foreach (ListItem li in chkadvmthrtongue.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&m_tongue" + i + "=" + li.Value.ToString();
            }
        }

        i = 0;
        foreach (ListItem li in chkadvworkstatus.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&work_s" + i + "=" + li.Value.ToString();
            }
        }



        i = 0;
        foreach (ListItem li in chkadvoccupation.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&occ" + i + "=" + li.Value.ToString();
            }
        }


        i = 0;
        foreach (ListItem li in chkadveducation.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&edu" + i + "=" + li.Value.ToString();
            }
        }


        if (!drpadvlwrincome.SelectedValue.Equals("-1"))
        {
            search_url += "&incomel=" + drpadvlwrincome.SelectedValue.ToString();
        }

        if (!drpadvupperincome.SelectedValue.Equals("-1"))
        {
            search_url += "&incomeu=" + drpadvupperincome.SelectedValue.ToString();
        }

        i = 0;
        foreach (ListItem li in chkadvcountry.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&country" + i + "=" + li.Value.ToString();
            }
        }


        i = 0;
        foreach (ListItem li in chkadvdiet.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&diet" + i + "=" + li.Value.ToString();
            }
        }

        if (!rbtnadvsmoke.SelectedValue.Equals("0"))
        {
            search_url += "&smoke=" + rbtnadvsmoke.SelectedValue.ToString();
        }

        if (!rbtnadvdrink.SelectedValue.Equals("0"))
        {
            search_url += "&drink=" + rbtnadvdrink.SelectedValue.ToString();
        }

        i = 0;
        foreach (ListItem li in chkadvbodytype.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&body_type" + i + "=" + li.Value.ToString();
            }
        }




        i = 0;
        foreach (ListItem li in chkadvcomplexion.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&complexion" + i + "=" + li.Value.ToString();
            }
        }

        if (!rbtnadvhiv.SelectedValue.Equals("-1"))
        {
            search_url += "&hiv=" + rbtnadvhiv.SelectedValue.ToString();
        }


        i = 0;
        foreach (ListItem li in chkadvspecialcase.Items)
        {
            if (li.Selected == true)
            {
                i++;
                search_url += "&special_case" + i + "=" + li.Value.ToString();
            }
        }




        Response.Redirect(search_url);


    }



   protected void prepare_search()
   {
       string def = "select * from p_details where (id is not null) ";

       string q1 = null;
       string q2 = null;
       

       string gender = "0";
       string city = null;
       string heightl = null;
       string heightu = null;
       string agel = null;
       string ageu = null;
       string incomel = null;
       string incomeu = null;
       string smoke = null;
       string drink = null;
       string hiv = null;

       List<string> m_status = new List<string>();
       List<string> religion = new List<string>();
       List<string> m_tongue = new List<string>();
       List<string> work_s = new List<string>();
       List<string> occ = new List<string>();
       List<string> edu = new List<string>();
       List<string> country = new List<string>();
       List<string> diet = new List<string>();
       List<string> body_type = new List<string>();
       List<string> complexion = new List<string>();
       List<string> special_case = new List<string>();

       connect c = new connect();
       


       if (Request.QueryString["gender"] != null)
       {
           gender = Request.QueryString["gender"].ToString();
           q1 = " and gender='"+ gender +"' ";
           //c.cmd.Parameters.Add("@gender", SqlDbType.Bit).Value = gender;

       }
       if (Request.QueryString["city1"] != null)
       {
           city = Request.QueryString["city1"].ToString();
           q1+= " and city='" + city + "' ";
           //c.cmd.Parameters.Add("@gender", SqlDbType.Bit).Value = gender;

       }

       if (Request.QueryString["heightl"] != null) // is type se
       {
           heightl = Request.QueryString["heightl"].ToString();
           q1 += "and (id in (select id from physical where height>@heightl)) ";
           c.cmd.Parameters.Add("@heightl", SqlDbType.Int).Value = heightl;
       }

       if (Request.QueryString["heightu"] != null) // is type se
       {
           heightu = Request.QueryString["heightu"].ToString();
           q1 += "and (id in (select id from physical where height<@heightu)) ";
           c.cmd.Parameters.Add("@heightu", SqlDbType.Int).Value = heightu;
       }
       if (Request.QueryString["agel"] != null) // is type se
       {
           agel = Request.QueryString["agel"].ToString();
           q1 += "and (id in (select id from p_details where dbo.fn_GetAge(dob, GetDate()) > =@agel )) ";
           c.cmd.Parameters.Add("@agel", SqlDbType.Int).Value = agel;


       }
       if (Request.QueryString["ageu"] != null) // is type se
       {
           ageu = Request.QueryString["ageu"].ToString();
           q1 += "and (id in (select id from p_details where dbo.fn_GetAge(dob, GetDate()) < =@ageu )) ";
           c.cmd.Parameters.Add("@ageu", SqlDbType.Int).Value = ageu;



       }
       if (Request.QueryString["incomel"] != null) // is type se
       {
           incomel = Request.QueryString["incomel"].ToString();
           q1 += "and (id in (select id from education where Annual_salary >= @incomel))";
           c.cmd.Parameters.Add("@incomel", SqlDbType.Int).Value = incomel;
       
       
       }
       if (Request.QueryString["incomeu"] != null) // is type se
       {
           incomeu = Request.QueryString["incomeu"].ToString();
           q1 += "and (id in (select id from education where Annual_salary <= @incomeu))";
           c.cmd.Parameters.Add("@incomeu", SqlDbType.Int).Value = incomeu;
       

       }
       if (Request.QueryString["smoke"] != null) // is type se
       {
           smoke = Request.QueryString["smoke"].ToString();
           q1 += "and (id in (select id from physical where smoke= @smoke))";
           c.cmd.Parameters.Add("@smoke", SqlDbType.Int).Value = smoke;
         
       }
       if (Request.QueryString["drink"] != null) // is type se
       {
           drink = Request.QueryString["drink"].ToString();
           q1 += "and (id in (select id from physical where drink= @drink))";
           c.cmd.Parameters.Add("@drink", SqlDbType.Int).Value = drink;
       }
       if (Request.QueryString["hiv"] != null) // is type se
       {
           hiv = Request.QueryString["hiv"].ToString();
           q1 += "and (id in (select id from physical where hiv= @hiv))";
           c.cmd.Parameters.Add("@hiv", SqlDbType.Int).Value = hiv;
       }
       if (Request.QueryString["photos"] != null) // is type se
       {
           if ((Request.QueryString["photos"].ToString().Equals("1")))
           q1 += "and (id in (select id from userinfo where prof_img is not null))";
       }



       int i = 1;
       if (Request.QueryString["m_status" + i] != null)
       {
           q1 += "and (id in (";
           q2 = "select id from p_details where (id is null) ";
           while (Request.QueryString["m_status" + i] != null)
           {
               //if (i == 1)
               //    q2 += "";
               m_status.Add(Request.QueryString["m_status" + i].ToString());
              
               q2 += "or m_status='" + Request.QueryString["m_status" + i].ToString() + "'";
               i++;
           }

           q1 += q2;
           q1 += ")) ";
       }
//-----------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["religion" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from religion where(id is null) ";
           while (Request.QueryString["religion" + i] != null)
           {
               religion.Add(Request.QueryString["religion" + i].ToString());

               q2 += "or religion='" + Request.QueryString["religion" + i].ToString() + "'";
               i++;

           }
           q1 += q2;
           q1 += ")) ";
       }
//------------------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["mother_tongue" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from p_details where(id is null) ";
           while (Request.QueryString["mother_tongue" + i] != null)
           {

               m_tongue.Add(Request.QueryString["mother_tongue" + i].ToString());
               q2 += "or mother_tongue='" + Request.QueryString["mother_tongue" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += ")) ";
       }
//----------------------------------------------------------------------------------------------------------------
       i = 1;
       if(Request.QueryString["work_status"+i]!=null)
       {
           q1 += "and(id in(";
           q2 = "select id from education where(id is null)";
           while (Request.QueryString["work_s" + i] != null)
           {

               work_s.Add(Request.QueryString["work_s" + i].ToString());
               q2 += "or work_status='" + Request.QueryString["work_status" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += "))";
       }
//----------------------------------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["occ" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from education where(id is null)";
           while (Request.QueryString["occ" + i] != null)
           {

               occ.Add(Request.QueryString["occ" + i].ToString());

               q2 += "or work_area='" + Request.QueryString["occ" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += "))";
       }
//--------------------------------------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["highest_deg" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from education where(id is null)";
           while (Request.QueryString["highest_deg" + i] != null)
           {

               edu.Add(Request.QueryString["highest_deg" + i].ToString());
               q2 += "or highest_deg='" + Request.QueryString["highest_deg" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += "))";
       }

//-------------------------------------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["country" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from p_details where(id is null)";
           while (Request.QueryString["country" + i] != null)
           {
               country.Add(Request.QueryString["country" + i].ToString());
               q2 += "or country='" + Request.QueryString["country" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += "))";
       }
//-----------------------------------------------------------------------------------------------------------------------
       i = 1;
       if (Request.QueryString["diet" + i] != null)
       {
           q1 += "and(id in(";
           q2 = "select id from physical where(id is null)";
           while (Request.QueryString["diet" + i] != null)
           {

               diet.Add(Request.QueryString["diet" + i].ToString());
               q2 += "or diet='" + Request.QueryString["diet" + i].ToString() + "'";
               i++;
           }
           q1 += q2;
           q1 += "))";
       }
//------------------------------------------------------------------------------------------------------------------------------
       i = 1;
       if(Request.QueryString["body_type"+i]!=null)
       {
           q1 += "and(id in(";
           q2 = "select id from physical where(id is null)";
       while (Request.QueryString["body_type" + i] != null)
       {

           body_type.Add(Request.QueryString["body_type" + i].ToString());
           q2 += "or body_type='" +Request.QueryString["body_type"+i].ToString()+"'";
           i++;
       }
       q1 += q2;
       q1 += "))";
       }
//----------------------------------------------------------------------------------------------------------------------------------
       i = 1;
       if(Request.QueryString["complexion" + i]!=null)
       {
           q1 += "and(id in(";
           q2= "select id from physical where(id is null)";
       while (Request.QueryString["complexion" + i] != null)
       {

           complexion.Add(Request.QueryString["complexion" + i].ToString());
           q2 += "or complexion='" +Request.QueryString["complexion"+i].ToString()+"'";
           i++;
       }
           q1 +=q2;
           q1 += "))";
       }
//------------------------------------------------------------------------------------------------------------------------------------
       i = 1;
       if(Request.QueryString["special_case" + i]!=null)
       
           {
               q1 += "and(id in(";
               q2 = "select id from physical where(id is null) ";
               while (Request.QueryString["special_case" + i] != null)
                   {
                       special_case.Add(Request.QueryString["special_case" + i].ToString());
                       q2 += "or challenged='" + Request.QueryString["special_case" + i].ToString() + "'";
                       i++;
                   }
                   q1 += q2;
                   q1 += ")) ";
       }
           
       
       string defcount = "select count(*) as res_count from p_details where (id is not null) ";
       c.cmd.CommandText = def + q1;
       c.adp.Fill(c.ds);

       lvsearch.DataSource = c.ds;
       lvsearch.DataBind();

       c.cmd.CommandText = defcount + q1;
       c.dr=c.cmd.ExecuteReader();
       c.dr.Read();
       lbnosresults.Text = "Displaying " + c.dr["res_count"].ToString() + " results:";
       lbnosresults.Visible = true;
       c.dr.Close();
       c.adp.Dispose();
       c.ds.Dispose();
       c.cn.Close();
       
}


   protected void btnsavesearch_Click(object sender, EventArgs e)
   {
       if (Session["Id"] != null)
       {
         
           string query=Request.QueryString.ToString();
           connect c = new connect();
           c.cmd.CommandText = "INSERT INTO saved_searches(user_id,search_link,search_name) VALUES (" + s + ", @query,@name)";
           c.cmd.Parameters.Add("@query", SqlDbType.Text).Value = query;
           c.cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtsavesearch.Text.ToString();
          
           c.cmd.ExecuteNonQuery();
           c.cn.Close();

           System.Text.StringBuilder sb = new System.Text.StringBuilder();
           sb.Append("<script>");

           sb.Append("window.alert(\"Your Search Saved! \");");

           sb.Append("</script>");

           Page.RegisterStartupScript("test", sb.ToString());
       }
       else
       {

           System.Text.StringBuilder sb = new System.Text.StringBuilder();
           sb.Append("<script>");

           sb.Append("window.alert(\"Login To Proceed! \");");

           sb.Append("</script>");

           Page.RegisterStartupScript("test", sb.ToString());

       
       }
       
   }



   protected void lnkrefine_Click(object sender, EventArgs e)
   {
       s = Session["id"].ToString();
       if (Request.QueryString["result"].ToString().Equals("1"))
       {
           string country = Request.QueryString["country"];
           for (int i = 0; i < chkadvcountry.Items.Count; i++)
           {
               if (chkadvcountry.Items[i].Selected)
               {
                   country += chkadvcountry.Items[i].Value + ";";
               }
           }
       }
   }
}
