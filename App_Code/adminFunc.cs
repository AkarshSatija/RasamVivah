using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminFunc
/// </summary>
public class adminFunc
{
    profileFunc p = new profileFunc();
	public adminFunc()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string getAboutMeString(string id, string pathToXmlFolder)
    {
        string content = "";
        try
        {

            connect c = new connect();
            c.cmd.CommandText = "Select fname,lname,dbo.fn_GetAge(dob, GetDate()) as myage,gender,city,country from p_details WHERE([id]='" + id + "')";

            c.dr = c.cmd.ExecuteReader();

            if (c.dr.Read())
            {
                string name = c.dr["fname"].ToString() + " " + c.dr["lname"].ToString();

                if (c.dr["gender"].ToString() == "True")
                {

                    content += "Male";
                }
                else
                {
                    content += "Female";
                }

                string city = p.getTextXml(pathToXmlFolder + "cities.xml", "option", c.dr["city"].ToString());
                string age = c.dr["myage"].ToString();
                content += ", " + city;
                content += ", " + age + " Years";


            }
            c.dr.Close();

            c.cmd.CommandText = "Select religion,caste from religion WHERE([id]='" + id + "')";
            c.dr = c.cmd.ExecuteReader();

            if (c.dr.Read())
            {
                string religion = p.getTextXml(pathToXmlFolder + "religion.xml", "option", c.dr["religion"].ToString());
                string caste = p.getCaste(c.dr["religion"].ToString(), c.dr["caste"].ToString(), pathToXmlFolder);
                content += ", " + religion;
                content += ", " + caste;
            }
            c.dr.Close();

            c.cmd.CommandText = "Select work_area,other from education WHERE([id]='" + id + "')";
            c.dr = c.cmd.ExecuteReader();

            while (c.dr.Read())
            {
                string occupation = p.getTextXml(pathToXmlFolder + "occupation.xml", "occupation", c.dr["work_area"].ToString());
                //lbabouteducation.Text = c.dr["other"].ToString();
                content += ", " + occupation;
            }

            c.dr.Close();
            c.cn.Close();
            return content;
            //==========================
        }
        catch
        {

            return "";
        }



    }
}