<%@ WebHandler Language="C#" Class="albumHandler" %>

using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class albumHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        try
        {
            connect c = new connect();

            
            string id = context.Request.QueryString["id"];
            c.cmd.CommandText = "select * from album where id='" + id + "'";

            // cmd.Parameters.Add("@ImageId", SqlDbType.VarChar, 50).Value = context.Request.QueryString["image"];
            c.cmd.Prepare();
            c.dr = c.cmd.ExecuteReader();
            bool ret = c.dr.Read();

            if (ret == true)
            {
                
                context.Response.ContentType = "image/jpeg";
                //context.Response.BinaryWrite((byte[])c.dr["img"]);

                string path = "~/datafiles//album//" + c.dr["user_id"].ToString() + "_" + id;
                context.Response.WriteFile("~/datafiles//album//"+c.dr["user_id"].ToString()+"_" + id+".jpg");



            }
            else
            {


            }

            c.cn.Close();
            c.cn.Dispose();

        }
        catch (Exception ex)
        {
            // context.Response.Write(ex.Message);

           
        }


    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}