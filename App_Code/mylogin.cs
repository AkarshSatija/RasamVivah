using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for login
/// </summary>
public class mylogin
{
    public mylogin()
    {
        //
        // TODO: Add constructor logic here
        //

    }
    public int updatelastlogin(string s)
    {
        try
        {
            connect c = new connect();
            c.cmd.CommandText = "update userinfo set last_login=getdate() where id='" + s + "'";
            c.cmd.ExecuteNonQuery();

            c.cn.Close();
            return 1;
        }
        catch
        {


        }
        return 0;
    }

    public string login(string un, string pass)
    {





        return "0";
    }


}