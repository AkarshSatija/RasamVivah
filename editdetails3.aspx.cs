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
using System.Globalization;


public partial class editdetails3 : System.Web.UI.Page
{
    string s;
    SqlTransaction tx;
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
        s = Session["id"].ToString();
        if (!IsPostBack)
        {
        
        bindNakshtra();
        bindSun();
        bindMoon();
        }


        connect c = new connect();
        try
        {

            c.cmd.CommandText = "insert into horoscope(id) values('" + s + "')";
            c.cmd.ExecuteNonQuery();
        }
        catch
        {
            ;
        }
        c.cmd.CommandText = "select horoscope.*, dbo.format_date(birth_time,'24HH') as b_time_HH,"
            +" dbo.format_date(birth_time,'mi') as b_time_mi from horoscope where horoscope.id='" + s + "'";

        c.dr = c.cmd.ExecuteReader();
        if (!IsPostBack)
        {
            if (c.dr.Read())
            {
               // CultureInfo provider = CultureInfo.InvariantCulture;


               // DateTime birth_time = DateTime.ParseExact(c.dr["birth_time"].ToString(), " hh:mm tt ", provider);
                    //c.dr["birth_time"].ToString());
                //string dtt= c.dr["birth_time"].ToString();
               // DateTime dt = dtt.ToString("MM/dd/yyyy hh:mm tt");
              //  DateTime dt = c.cmd.Parameters.Add("@date", SqlDbType.DateTime);
                //string hrs = birth_time.Hour.ToString();
                //string mins = birth_time.Minute.ToString();
                //drphour.SelectedValue = hrs;
                //drpmin.SelectedValue = mins;
               // DateTime dtt;
               //bool abc= DateTime.TryParseExact(c.dr["birth_time"].ToString(), "", null, DateTimeStyles.None, out dtt);
                //drphour.SelectedValue =
                drphour.SelectedValue = c.dr["b_time_HH"].ToString();
                drpmin.SelectedValue = c.dr["b_time_mi"].ToString();
                txtgotra.Text = c.dr["gotra_paternal"].ToString();
                txtgotramaternal.Text = c.dr["gotra_maternal"].ToString();
                txtancestral.Text = c.dr["ancestral_origin"].ToString();
                string manglik = c.dr["manglik"].ToString();
                rbtnmanglik.SelectedValue = manglik;
                string nakshatra = c.dr["nakshatra"].ToString();
                drpnakshatra.SelectedValue = nakshatra;
                string moon_sign = c.dr["moon_sign"].ToString();
                drpmoon.SelectedValue = moon_sign;
                string sun_sign = c.dr["sun_sign"].ToString();
                drpsun.SelectedValue = sun_sign;
                string horoscope_match = c.dr["horoscope_match"].ToString();
                rbtnmatch.SelectedValue = horoscope_match;


            }
        }
        c.dr.Close();
        c.cn.Close();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        int error=0;
       

        try
        {


            connect c = new connect();
            tx = c.cn.BeginTransaction();
            c.cmd.Transaction = tx;
            string manglik = rbtnmanglik.SelectedValue;
            string horoscope_match = rbtnmatch.SelectedValue;

            c.cmd.CommandText = " update horoscope set birth_time=@birth_time,gotra_paternal=@gotra_paternal,gotra_maternal=@gotra_maternal,ancestral_origin=@ancestral_origin,manglik='" + manglik + "',nakshatra=@nakshatra,moon_sign=@moon_sign,sun_sign=@sun_sign,horoscope_match='" + horoscope_match + "'";




            //DateTime dt = new DateTime();
            //dt.AddHours(13);
            //dt.AddMinutes(45);
            string dtt = "1/1/2001 " + drphour.SelectedValue + ":" + drpmin.SelectedValue + ":00";

            //     string dtt = "1/1/0001 00:00:00";
            DateTime DOB = DateTime.Parse(dtt);

            //  Response.Write(DOB.ToString());

            //  string dv=drphour.SelectedValue + drpmin.SelectedValue;
            c.cmd.Parameters.Add("@birth_time", SqlDbType.DateTime).Value = DOB;
            c.cmd.Parameters.Add("@gotra_paternal", SqlDbType.VarChar).Value = txtgotra.Text;
            c.cmd.Parameters.Add("@gotra_maternal", SqlDbType.VarChar).Value = txtgotramaternal.Text;
            c.cmd.Parameters.Add("@ancestral_origin", SqlDbType.VarChar).Value = txtancestral.Text;
            c.cmd.Parameters.Add("@nakshatra", SqlDbType.Int).Value = drpnakshatra.SelectedValue;
            c.cmd.Parameters.Add("@moon_sign", SqlDbType.Int).Value = drpmoon.SelectedValue;
            c.cmd.Parameters.Add("@sun_sign", SqlDbType.Int).Value = drpsun.SelectedValue;
            c.cmd.ExecuteNonQuery();
            tx.Commit();

          //  c.dr.Close();
            c.cn.Close();
            

        }

        catch (Exception ex)
        {
            Response.Write("ERROR IN CONNECTION:" + ex.Message);
            tx.Rollback();
            error = 1;
        }
        finally
        {
            if(error==0)
            Response.Redirect("partner.aspx");
            
              // Response.Redirect("partner.aspx");
        }
    }

    protected void btnupld_Click(object sender, EventArgs e)
    {
        try
        {
            
            if (fuplddpkundli.PostedFile != null && fuplddpkundli.PostedFile.FileName != "")
            {
                int size = fuplddpkundli.PostedFile.ContentLength;  // This line will tell the actual size of image

                if (size <= 6000000) // Here u can compare that do wanna insert less then 65 KB
                {

                    connect c = new connect();
                    c.cmd.CommandText = "update horoscope set file_name=@file_name,file_ext=@file_ext where id='" + s + "'";
                    tx = c.cn.BeginTransaction();
                    c.cmd.Transaction = tx;
                   string file_name=fuplddpkundli.FileName.ToString();
                    string file_ext=System.IO.Path.GetExtension(this.fuplddpkundli.PostedFile.FileName).ToString();
                   // c.cmd.Parameters.Add("@kundli", SqlDbType.VarBinary).Value = binary;
                   c.cmd.Parameters.Add("@file_name", SqlDbType.VarChar).Value = file_name;
                   c.cmd.Parameters.Add("@file_ext", SqlDbType.VarChar).Value = file_ext;

                    fuplddpkundli.SaveAs(Server.MapPath("datafiles/kundli/" + s + "_" + file_name ));

                    c.cmd.ExecuteNonQuery();
                    tx.Commit();
                    
                    lbcomplt.Text = "Upload Successful";
                    lbcomplt.Visible = true;

                    //c.dr.Close();
                    c.cn.Close();



                }
                else
                {

                    lbcomplt.Text = "Size is too large. Please upload file less than 3 MB ";
                    lbcomplt.Visible = true;

                   
                }
                
               
            }  
        }
        catch(Exception ex)
        {
          
            lbcomplt.Text = "Upload failed";
            lbcomplt.Visible = true;
            tx.Rollback();
            
        }



    }
    protected void link_pdf_Click(object sender, EventArgs e)
    {



    }
    protected void bindNakshtra()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//nakshtra.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpnakshatra.DataSource = ds;
                drpnakshatra.DataTextField = "Text";
                drpnakshatra.DataValueField = "Value";
                drpnakshatra.DataBind();
            }
            
        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void bindMoon()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//moon.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
               drpmoon.DataSource = ds;
               drpmoon.DataTextField = "Text";
               drpmoon.DataValueField = "Value";
               drpmoon.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    protected void bindSun()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml//sun.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);

            if (ds.Tables.Count != 0)
            {
                drpsun.DataSource = ds;
                drpsun.DataTextField = "Text";
                drpsun.DataValueField = "Value";
                drpsun.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }

    }

    
}
