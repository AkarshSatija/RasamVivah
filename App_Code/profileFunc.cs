using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Data.SqlClient;

/// <summary>
/// Summary description for profileFunc
/// </summary>
public class profileFunc
{
    
	public profileFunc()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void visit(string prof, string visitor)
    {
        connect c = new connect();

        c.cmd.CommandText = "Insert into visitor(prof_id,visitor_id) values('"+ prof +"','"+visitor+"')";
        c.cmd.ExecuteNonQuery();
        c.cn.Close();
    
    }

    public void request(string sender, string receiver)
    {
        connect c = new connect();
        c.cmd.CommandText = "Insert into request(sender,receiver) values('" + sender+ "','"+ receiver +"')";
        c.cmd.ExecuteNonQuery();
        c.cn.Close();
    }

    public void ReqResponse(string host, string visitor, int todo)
    {

        connect c = new connect();
        if (todo == 1)
        {
            c.cmd.CommandText = "update request set answer='" + todo.ToString() + "' where sender='" + host + "' and receiver='" + visitor + "'";
            c.cmd.ExecuteNonQuery();
            c.cn.Close();
        }
        else if (todo == 2)
        {

            cancelRequest(host, visitor);
        
        
        }
        //todo =1: accept
        //todo=2: reject
       //sender=host
        //accept or decline



       
    }

    public int checkRequest(string visitor, string host)
    {
        connect c = new connect();


        c.cmd.CommandText = "select * from request where ((sender='" + host + "' and receiver='" + visitor + "') or (sender='" + visitor +
            "' and receiver='" + host + "')) and answer='1'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();
            c.cn.Close();
            return 3;
        }
        
        
        c.dr.Close();
        c.cmd.CommandText = "select * from request where sender='" + visitor + "' and receiver='" + host + "' and answer='0'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();
            c.cn.Close();
            return 1;
        }

        c.dr.Close();
        c.cmd.CommandText = "select * from request where sender='" + host + "' and receiver='" + visitor + "' and answer='0'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();
            c.cn.Close();
            return 2;
        }
        c.dr.Close();
        c.cn.Close();




        return 0;
    }

    public void cancelRequest(string sender, string receiver)
    {

        connect c = new connect();
        c.cmd.CommandText = "delete from request where sender='"+sender+"' and receiver='"+receiver+"'";
        c.cmd.ExecuteNonQuery();
        c.cn.Close();
    }

    public void shortlist(string prof, string shortlisting)
    {
        connect c = new connect();
        c.cmd.CommandText = "Insert into shortlist(prof_id,shortlisted_id) values('" + prof + "','" + shortlisting + "')";
        c.cmd.ExecuteNonQuery();
        c.cn.Close();
    }
    
    public string getTextXml(string xml,string elementName,string value)
    {
        string xmlFile =xml;
        XmlReaderSettings settings = new XmlReaderSettings();
        settings.IgnoreComments = true;
        settings.IgnoreWhitespace = true;
        try
        {
            using (XmlReader reader = XmlReader.Create(xmlFile, settings))
            {
                string xmlContent;
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        xmlContent = "";

                        if (reader.Name == elementName.ToString())
                        {
                            if (reader.GetAttribute("Value").ToString().Equals(value))
                            {
                                xmlContent = reader.GetAttribute("Text").ToString();
                                return xmlContent;
                            }
                           
                        }
                        
                        
                    }
                }
            }
        }
        catch (Exception ex)
        {
            return " ";
        }




        return "";
    }

    public string getCaste(string religion, string caste_val, string pathToXmlFolder)
    {

        string path;

        if (religion.Equals("1"))
            path="hindu.xml";
        else if (religion.Equals("2"))
            path="muslim.xml";
        else if (religion.Equals("3"))
            path="christian.xml";
        else if (religion.Equals("4"))
            path="sikh.xml";
        else if (religion.Equals("5"))
            path="other.xml";
        else if (religion.Equals("6"))
            path="jain.xml";
        else if (religion.Equals("7"))
            path="other.xml";
        else if (religion.Equals("8"))
            path="other.xml";
        else
            path="other.xml";


        string xmlFile = pathToXmlFolder+path;
        XmlReaderSettings settings = new XmlReaderSettings();
        settings.IgnoreComments = true;
        settings.IgnoreWhitespace = true;
        try
        {
            using (XmlReader reader = XmlReader.Create(xmlFile, settings))
            {
                string xmlContent;
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        xmlContent = "";

                        if (reader.Name == "option")
                        {
                            if (reader.GetAttribute("Value").ToString().Equals(caste_val))
                            {
                                xmlContent = reader.GetAttribute("Text").ToString();
                                return xmlContent;
                            }

                        }


                    }
                }
            }
        }
        catch (Exception ex)
        {
            return ("");
        }

        return "";
    }

    public string getCity(string country, string city_val, string pathToXmlFolder)
    {
        //p.getCity(Eval("country").ToString(),Eval("city").ToString(),Server.MapPath("xml//"))

        string path;

        if (country.Equals("356"))
            path = "cities.xml";
        else if (country.Equals("840"))
            path = "UScities.xml";
        else
            path = "other.xml";


        string xmlFile = pathToXmlFolder + path;
        XmlReaderSettings settings = new XmlReaderSettings();
        settings.IgnoreComments = true;
        settings.IgnoreWhitespace = true;
        try
        {
            using (XmlReader reader = XmlReader.Create(xmlFile, settings))
            {
                string xmlContent;
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        xmlContent = "";

                        if (reader.Name == "option")
                        {
                            if (reader.GetAttribute("Value").ToString().Equals(city_val))
                            {
                                xmlContent = reader.GetAttribute("Text").ToString();
                                return xmlContent;
                            }

                        }


                    }
                }
            }
        }
        catch (Exception ex)
        {
            return ("");
        }

        return "";
    }

    public string getAboutMeString(string id, string pathToXmlFolder,int stringtype=1)
    {

        //stringtype=2 for only name
        string content = "";
        string name="";
        try
        {

            connect c = new connect();
            c.cmd.CommandText = "Select fname,lname,dbo.fn_GetAge(dob, GetDate()) as myage,gender,city,country from p_details WHERE([id]='" + id + "')";

            c.dr = c.cmd.ExecuteReader();

            if (c.dr.Read())
            {
                name = c.dr["fname"].ToString() + " " + c.dr["lname"].ToString();
               
                if (c.dr["gender"].ToString() == "True")
                {
                   
                    content += "Male";
                }
                else
                {
                    content+= "Female";
                }
                
                string city = getTextXml(pathToXmlFolder+"cities.xml", "option", c.dr["city"].ToString());
                string age = c.dr["myage"].ToString();
                content +=", "+ city;
                content += ", " + age + " Years";


            }
            c.dr.Close();

            c.cmd.CommandText = "Select religion,caste from religion WHERE([id]='" + id + "')";
            c.dr = c.cmd.ExecuteReader();

            if (c.dr.Read())
            {
                string religion = getTextXml(pathToXmlFolder+"religion.xml", "option", c.dr["religion"].ToString());
                string caste = getCaste(c.dr["religion"].ToString(), c.dr["caste"].ToString(), pathToXmlFolder);
                content += ", " + religion ;
                content += ", " + caste ;
            }
            c.dr.Close();

            c.cmd.CommandText = "Select work_area,other from education WHERE([id]='" + id + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                string occupation = getTextXml(pathToXmlFolder+"occupation.xml", "occupation", c.dr["work_area"].ToString());
                //lbabouteducation.Text = c.dr["other"].ToString();
                content += ", " + occupation;
            }
            
            c.dr.Close();
            c.cn.Close();
            if (stringtype==2)
            {

                return name;
            }


            return content;
            //==========================
        }
        catch
        {

            return "";
        }


    
    }

    public string lastlogindetails(string id)
    {
        try {

            connect c = new connect();
            c.cmd.CommandText = "select dbo.format_date(last_login, '24HH:MI AMPM on DD/MM/YYYY') as last_login_date from userinfo where id='" + id + "'";
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                string lastlogin = c.dr["last_login_date"].ToString();
                c.dr.Close();
                c.cn.Close();
                return lastlogin;
            }
        
        
        
        
        }
        catch {
            return "error";
        }



        return "";

    }

    public int isPaid(string id)
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from membership where id='"+id+"'";
        c.dr=c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            c.dr.Close();
            c.cn.Close();
            return 1;
        }
        return 0;
    }

    public string descAboutMe(string id)
    {

        connect c = new connect();
        c.cmd.CommandText = "Select other from physical WHERE([id]='" + id + "')";
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            string other = c.dr["other"].ToString();
            c.dr.Close();
            c.cn.Close();
            return other;
           
        }



        return "";
    }

    public string descAboutMyFamily(string id)
    {
        connect c = new connect();
        c.cmd.CommandText = "Select other from family WHERE([id]='" + id + "')";
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            string other = c.dr["other"].ToString();
            c.dr.Close();
            c.cn.Close();

            return other;
            

        }
        return "";

    }

    public string descAboutMycareer(string id)
    {
        connect c = new connect();
        c.cmd.CommandText = "Select work_area,other from education WHERE([id]='" + id + "')";
        c.dr = c.cmd.ExecuteReader();

        while (c.dr.Read())
        {
            string other = c.dr["other"].ToString();
            c.dr.Close();
            c.cn.Close();
            return other;
            
        }
        return "";
    }

}

