<%@ WebHandler Language="C#" Class="Handler" %>


using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class Handler : IHttpHandler
{
    string gender = "1";
    string imgPath;
    public void ProcessRequest(HttpContext context)
    {

        try
        {
            connect c = new connect();


            string s = context.Request.QueryString["id"];
            c.cmd.CommandText = "Select * from p_details WHERE id='" + s + "'";

            c.cmd.Prepare();
            c.dr = c.cmd.ExecuteReader();


            if (c.dr.Read())
            {
                gender = c.dr["gender"].ToString();

            }
            c.dr.Close();

            c.cmd.CommandText = "select * from userinfo where id='" + s + "'";
            c.cmd.Prepare();
            c.dr = c.cmd.ExecuteReader();

            if (c.dr.Read())
            {
                imgPath = c.dr["prof_img"].ToString();

            }

            context.Response.ContentType = "image/jpeg";
            context.Response.WriteFile("~/datafiles//profile//" + imgPath);


            c.dr.Close();
            c.dr.Dispose();
            c.cn.Close();
            c.cn.Dispose();

        }
        catch (Exception ex)
        {

            context.Response.ContentType = "image/jpeg";
            if (gender.ToLower().Equals("true"))
                context.Response.WriteFile("~/images//male.jpg");
            else
                context.Response.WriteFile("~/images//female.jpg");
        }


    }






    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}