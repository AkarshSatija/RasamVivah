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

public partial class editbasicdetails : System.Web.UI.Page
{
    string s;

    SqlTransaction tx;

    protected void Page_Load(object sender, EventArgs e)
    {
        {

            s = Session["id"].ToString();
            //  s = "1000021";

            if (!IsPostBack)
            {
                BindDataToGridviewDropdownlist();

                bindCountry();

                bindMarital();

                //bindstate();
            }
        }
        connect c= new connect();
        c.cmd.CommandText = "select fname, mname, lname,dbo.format_date(dob,'DD/MM/YYYY') as dob,gender,m_status,mother_tongue,address,city,country,have_children from p_details where p_details.id='" + s + "'";

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {



                //DateTime birth_time = DateTime.Parse(c.dr["birth_time"].ToString());

                //string hrs = birth_time.Hour.ToString();
                //string mins = birth_time.Minute.ToString();
                //drphour.SelectedValue = hrs;
                //drpmin.SelectedValue = mins;
                txtfstname.Text = c.dr["fname"].ToString();
                txtmidname.Text = c.dr["mname"].ToString();
                txtlastname.Text = c.dr["lname"].ToString();
               txtdob.Text = c.dr["dob"].ToString();
               // DateTime dt = DateTime.Parse(c.dr["dob"].ToString());
               // txtdob.Text = dt.ToString();
                //string tempdate;
                //tempdate = dt.Day + "/" + dt.Month + "/" + dt.Year;
                //txtdob.Text = tempdate;
                string gender = c.dr["gender"].ToString();
                if (gender.Equals("True"))
                    rbtngender.SelectedValue = "1";
                else if (gender.Equals("False"))
                    rbtngender.SelectedValue = "0";
                string m_status = c.dr["m_status"].ToString();
                drpmarital.SelectedValue = m_status;
                string mother_tongue = c.dr["mother_tongue"].ToString();
                drpmthrtongue.SelectedValue = mother_tongue;
                txtaddress.Text = c.dr["address"].ToString();
                string city = c.dr["city"].ToString();
                drpcity.SelectedValue = city;
                string country = c.dr["country"].ToString();
                drpcountry.SelectedValue = country;
                
                string have_children = c.dr["have_children"].ToString();
                drpchildren.SelectedValue = have_children;

                bindCity(drpcountry.SelectedValue.ToString());
                bindChildren(drpmarital.SelectedValue.ToString());
              //  string state = c.dr["state"].ToString();
                //drpstate.SelectedValue = state;


            }
        }
        c.cn.Close();
        c.cn.Close();
    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        
        try
        {


            connect c = new connect();
            tx = c.cn.BeginTransaction();
            c.cmd.Transaction = tx;
            string gender = rbtngender.SelectedValue;
           

            c.cmd.CommandText = " update p_details set fname=@fname,mname=@mname,lname=@lname,dob=@dob,address=@address,gender='" + gender + "',m_status=@m_status,mother_tongue=@mother_tongue,city=@city,country=@country,have_children=@have_children where id="+s+"";



            DateTime dt = DateTime.ParseExact(txtdob.Text, "dd/MM/yyyy", null);
            //DateTime dt = new DateTime();
            //dt.AddHours(13);
            //dt.AddMinutes(45);
            //string dtt = "1/1/2001 " + drphour.SelectedValue + ":" + drpmin.SelectedValue + ":00";

            //     string dtt = "1/1/0001 00:00:00";
            //DateTime DOB = DateTime.Parse(dtt);

            //  Response.Write(DOB.ToString());

            //  string dv=drphour.SelectedValue + drpmin.SelectedValue;
            c.cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtfstname.Text;
            c.cmd.Parameters.Add("@mname", SqlDbType.VarChar).Value = txtmidname.Text;
            c.cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = txtlastname.Text;
            c.cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = dt;
            c.cmd.Parameters.Add("@address", SqlDbType.Text).Value = txtaddress.Text;
            c.cmd.Parameters.Add("@m_status", SqlDbType.Int).Value = drpmarital.SelectedValue;
            c.cmd.Parameters.Add("@mother_tongue", SqlDbType.Int).Value = drpmthrtongue.SelectedValue;
            c.cmd.Parameters.Add("@city", SqlDbType.VarChar).Value =drpcity.SelectedValue;
            c.cmd.Parameters.Add("@country", SqlDbType.Int).Value = drpcountry.SelectedValue;
            c.cmd.Parameters.Add("@have_children", SqlDbType.Int).Value = drpchildren.SelectedValue;
           // c.cmd.Parameters.Add("@state", SqlDbType.Int).Value =drpstate.SelectedValue;

            c.cmd.ExecuteNonQuery();
            tx.Commit();
            lbmsg.Text = "Basic Info Updated! ";
            c.cn.Close();

        }

        catch (Exception ex)
        {
            Response.Write("ERROR IN CONNECTION:" + ex.Message);
            tx.Rollback();
            lbmsg.Text = "Updation Failed! ";
        }
        
    }
    
    protected void BindDataToGridviewDropdownlist()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml/mother_tongue.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpmthrtongue.DataSource = ds;
                drpmthrtongue.DataTextField = "Text";
                drpmthrtongue.DataValueField = "Value";
                drpmthrtongue.DataBind();
                //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));



            }
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
            string sssss = Server.MapPath("xml//country.xml");
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//country.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpcountry.DataSource = ds;
                drpcountry.DataTextField = "Text";
                drpcountry.DataValueField = "Value";
                drpcountry.DataBind();
                //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            }
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            // throw ex;

        }

        
    }
    protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCity(drpcountry.SelectedValue.ToString());



        //    txtcode.Text = drpcountry.SelectedValue[0].ToString() + drpcountry.SelectedValue[1].ToString() + drpcountry.SelectedValue[2].ToString();


    }

    protected void bindCity(string country)
    {

        try
        {
            XmlTextReader xmlreader;


            if (country.Equals("356"))
            {
                trcity.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//cities.xml"));
            }
            else if (country.Equals("840"))
            {
                trcity.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//UScities.xml"));
            }

            else
            {
                trcity.Visible = false;
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






            //--------------

            // }
        }
        catch (Exception ex)
        {


        }



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
        //                    if (reader.GetAttribute("Value").ToString().Equals(drpcountry.SelectedValue.ToString()))
        //                    {
        //                        lbcode.Text = "+" + reader.GetAttribute("isd").ToString();

        //                    }

        //                }


        //            }
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{

        //}

    }

 //  protected void bindstate()
 //   {

 //       try
 //       {
 //           XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml/state.xml"));
 //           DataSet ds = new DataSet();
 //           ds.ReadXml(xmlreader);
 //           xmlreader.Close();
 //           if (ds.Tables.Count != 0)
 //           {
 //               drpstate.DataSource = ds;
 //               drpstate.DataTextField = "Text";
 //               drpstate.DataValueField = "Value";
 //               drpstate.DataBind();
 //               //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));



 //           }
 //       }
 //       catch (Exception ex)
 //       {
 //           throw ex;

 //       }


 //   }
    protected void bindMarital()
    {

        try
        {
            string sssss = Server.MapPath("xml//marital.xml");
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//marital.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpmarital.DataSource = ds;
                drpmarital.DataTextField = "Text";
                drpmarital.DataValueField = "Value";
                drpmarital.DataBind();
            }
            xmlreader.Close();
        }
        catch (Exception ex)
        {
            throw ex;

        }


    }




    protected void drpmarital_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindChildren(drpmarital.SelectedValue.ToString());
    }

    protected void bindChildren(string marital)
    {

        try
        {
            XmlTextReader xmlreader;


            if (marital.Equals("2") || marital.Equals("3") || marital.Equals("4") || marital.Equals("5") || marital.Equals("6"))
            {
                trchildren.Visible = true;
                xmlreader = new XmlTextReader(Server.MapPath("xml//children.xml"));
            }


            else
            {
                trchildren.Visible = false;
                xmlreader = new XmlTextReader(Server.MapPath("xml//other.xml"));

            }




            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            //if (ds.Tables.Count != 0)
            //{
            drpchildren.DataSource = ds;
            drpchildren.DataTextField = "Text";
            drpchildren.DataValueField = "Value";
            drpchildren.DataBind();






            //--------------

            // }
        }
        catch (Exception ex)
        {


        }
    }

   
}
