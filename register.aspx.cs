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

public partial class register : System.Web.UI.Page
{
    string s;
    int go = 0;
    SqlTransaction tx;
   // public string chkbox1clientid;

    protected void Page_Load(object sender, EventArgs e)
    {


       if (IsPostBack)
      {
            if (!(String.IsNullOrEmpty(txtpwd.Text.Trim())))
            {
                txtpwd.Attributes["value"] = txtpwd.Text;
                txtcnfrmpwd.Attributes["value"] = txtcnfrmpwd.Text;
            }
            if (!(String.IsNullOrEmpty(txtcnfrmpwd.Text)))
            {
                
                txtcnfrmpwd.Attributes["value"] = txtcnfrmpwd.Text;
            }
      }

        if (!IsPostBack)
        {
            BindDataToGridviewDropdownlist();

            bindMarital();

            bindCountry();

            bindCreateprofile();
        }

       
    }

    protected void btnregister_Click(object sender, EventArgs e)
    {

        
        try
        {
            connect c = new connect();
            tx = c.cn.BeginTransaction();
            c.cmd.Transaction = tx;


            c.cmd.CommandText = "INSERT INTO logins(emailid,pass) VALUES (@emailid, @pass)";
            c.cmd.Parameters.Add("@emailid", SqlDbType.VarChar).Value = txtemail.Text;
            c.cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = txtpwd.Text;
            c.cmd.ExecuteNonQuery();



            //
            // connect cx = new connect();


            c.cmd.CommandText = "select * from logins where emailid='" + txtemail.Text + "' and pass= '" + txtpwd.Text + "'";
            //cx.cmd.Parameters.Add("@emailid", SqlDbType.VarChar).Value = txtemail.Text;
            //cx.cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = txtpwd.Text;
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {

                s = c.dr["id"].ToString();

               

            }
            c.dr.Close();




            c.cmd.CommandText = "INSERT INTO userinfo(id) values('" + s + "')";
            c.cmd.ExecuteNonQuery();

         //   DateTime dt = Convert.ToDateTime(txtdob.Text.Trim(),);
          DateTime dt =   DateTime.ParseExact(txtdob.Text, "dd/MM/yyyy", null);
            {
                string gnder = rbtngender.SelectedValue;
                c.cmd.CommandText = "INSERT INTO p_details(id,fname,mname,lname,dob,gender,mobile,m_status,mother_tongue,address,city,country,create_profile,have_children)"
                    +"VALUES('"+ s + "',@fname,@mname,@lname,@dob,'" + gnder + "',@mobile,@m_status,@mother_tongue,@address,@city,@country,@create_profile,@have_children)";
                c.cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtfstname.Text;
                c.cmd.Parameters.Add("@mname", SqlDbType.VarChar).Value = txtmidname.Text;
                c.cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = txtlastname.Text;
                c.cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = dt;
                //c.cmd.Parameters.Add("@gender", SqlDbType.Bit).Value = rbtngender.SelectedValue;

                c.cmd.Parameters.Add("@mobile", SqlDbType.BigInt).Value = txtphone.Text;
                c.cmd.Parameters.Add("@m_status", SqlDbType.Int).Value = drpmarital.SelectedValue;
                c.cmd.Parameters.Add("@mother_tongue", SqlDbType.Int).Value = drpmthrtongue.SelectedValue;
                c.cmd.Parameters.Add("@address", SqlDbType.Text).Value = txtaddress.Text.ToString().Trim();
                c.cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = drpcity.SelectedValue;
                //c.cmd.Parameters.Add("@state", SqlDbType.Int).Value = drpstate.SelectedValue;
                c.cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = drpcountry.SelectedValue;
                c.cmd.Parameters.Add("@create_profile", SqlDbType.Int).Value = drpcreate.SelectedValue;
                c.cmd.Parameters.Add("@have_children", SqlDbType.Int).Value = drpchildren.SelectedValue;
                c.cmd.ExecuteNonQuery();


                // c.dr.Close();

                tx.Commit();
               

               
            }
            c.cn.Close();
        }


        catch (Exception ex)
        {
            tx.Rollback();
            go = 1;
            Response.Write("ERROR IN CONNECTION:" + ex.Message);

        }
        finally
        {
            if (go != 1)
            {
                Session["id"] = s;
               

                mylogin ml = new mylogin(); // update last login tym
                ml.updatelastlogin(s);


                Response.Redirect("Registring.aspx");
            }
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
    //protected void bindCity()
    //{

    //    try
    //    {
    //        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml/cities.xml"));
    //        DataSet ds = new DataSet();
    //        ds.ReadXml(xmlreader);
    //        xmlreader.Close();
    //        if (ds.Tables.Count != 0)
    //        {
    //          drpcity.DataSource = ds;
    //          drpcity.DataTextField = "Text";
    //          drpcity.DataValueField = "Value";
    //          drpcity.DataBind();
    //            //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));



    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;

    //    }


    //}

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
                trcity.Visible= true;
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



        string xmlFile = Server.MapPath("xml//country.xml");
        XmlReaderSettings settings = new XmlReaderSettings();
        settings.IgnoreComments = true;
        settings.IgnoreWhitespace = true;
        try
        {
            using (XmlReader reader = XmlReader.Create(xmlFile, settings))
            {

                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {

                        //<option Text="Anguilla" Value="660" iso="AI" isd="264" ></option>
                        if (reader.Name == "option")
                        {
                            if (reader.GetAttribute("Value").ToString().Equals(drpcountry.SelectedValue.ToString()))
                            {
                                lbcode.Text = "+" + reader.GetAttribute("isd").ToString();

                            }

                        }


                    }
                }
            }
        }
        catch (Exception ex)
        {

        }

    }

    protected void bindCreateprofile()
    {

        try
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml/createprofile.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                drpcreate.DataSource = ds;
                drpcreate.DataTextField = "Text";
                drpcreate.DataValueField = "Value";
                drpcreate.DataBind();
                //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));



            }
        }
        catch (Exception ex)
        {
            throw ex;

        }


    }

    //protected void bindstate()
    //{

    //    try
    //    {
    //        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("xml/state.xml"));
    //        DataSet ds = new DataSet();
    //        ds.ReadXml(xmlreader);
    //        xmlreader.Close();
    //        if (ds.Tables.Count != 0)
    //        {
    //            drpstate.DataSource = ds;
    //            drpstate.DataTextField = "Text";
    //            drpstate.DataValueField = "Value";
    //            drpstate.DataBind();
    //            //drpmthrtongue.Items.Insert(0, new ListItem("-- Please Select --", "0"));



    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;

    //    }


    //}
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
    
