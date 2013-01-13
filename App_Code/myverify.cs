using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Net;

/// <summary>
/// Summary description for verify
/// </summary>
public class myverify
{
    string emailto;
    string recpassword;
    string emailcod;
    string smsto;
    string smscod;
    

    public myverify()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public int verifyemail(string s)
    {
        
        connect c = new connect();
        c.cmd.CommandText = "select logins.emailid,userinfo.* from logins,userinfo where logins.id='" + s + "' and userinfo.id='" + s + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            emailto = c.dr["emailid"].ToString();
            emailcod = c.dr["email_verified"].ToString();
            //mobcode = c.dr["mob_verified"].ToString();
        }
       
        
        try
        {

            MailMessage MyMailMessage = new MailMessage();



            MailAddress m = new MailAddress("info@rasamvivah.com", "RasamVivah");
            MyMailMessage.From = m;
            MyMailMessage.To.Add(new MailAddress(emailto));

            MyMailMessage.Subject = "RasamVivah Email Verification";
            MyMailMessage.Body = "Your verification code is:"+emailcod;

            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("info@rasamvivah.com", "akarshparul"); //id and password here...........

            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

            //Enable SSL
            mailClient.EnableSsl = true;

            mailClient.UseDefaultCredentials = false;

            mailClient.Credentials = mailAuthentication;

            mailClient.Send(MyMailMessage);
            string status = MyMailMessage.DeliveryNotificationOptions.ToString();
            //  return s;
            //  Response.Redirect("#");// redirect to??????
            c.cn.Close();
            c.dr.Close();
            return 1;

            
        }
        catch (Exception exp)
        {
            //  return e.ToString();
            return 0;
        }
        

    }

    public int verifymob(string s)
    {


        connect c = new connect();
        c.cmd.CommandText = "select p_details.mobile,userinfo.* from p_details,userinfo where p_details.id='" + s + "' and userinfo.id='" + s + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            smsto = c.dr["mobile"].ToString();
            smscod = c.dr["mob_verified"].ToString();
            //mobcode = c.dr["mob_verified"].ToString();
        }
        c.dr.Close();
        c.cn.Close();


        try
        {
            string uid = "9017050076";
            string password = "43digiWorld";
            string message = "Your Mobile verification code is: "+smscod;


            HttpWebRequest myReq =
              (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password + "&msg=" + message + "&phone=" + smsto + "&provider=way2sms");




            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
            string status = responseString;
           
            if (status.Equals("1"))
                return 1;
            else
                throw new Exception(status);

            
        }
        catch (Exception Ex)
        {

            return 0;
        }

    }

    public int recoverpassword(string s)
    {
        
        connect c = new connect();
        c.cmd.CommandText = "select * from logins where id='" + s + "' ";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            emailto = c.dr["emailid"].ToString();
            recpassword = c.dr["pass"].ToString();
        }
       
        
        try
        {

            MailMessage MyMailMessage = new MailMessage();



            MailAddress m = new MailAddress("info@rasamvivah.com", "RasamVivah");
            MyMailMessage.From = m;
            MyMailMessage.To.Add(new MailAddress(emailto));

            MyMailMessage.Subject = "RasamVivah Password Recovery";
            MyMailMessage.Body = "Your password is:"+recpassword;

            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("info@rasamvivah.com", "akarshparul"); //id and password here...........

            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

            //Enable SSL
            mailClient.EnableSsl = true;

            mailClient.UseDefaultCredentials = false;

            mailClient.Credentials = mailAuthentication;

            mailClient.Send(MyMailMessage);
            string status = MyMailMessage.DeliveryNotificationOptions.ToString();
            //  return s;
            //  Response.Redirect("#");// redirect to??????
            c.cn.Close();
            c.dr.Close();
            return 1;
            

        }
        catch (Exception exp)
        {
            //  return e.ToString();
            return 0;
        }
        

    }
   
    public int checkemail(string s)
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from userinfo where id='" + s + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            string e_verified = c.dr["email_verified"].ToString();
            if (e_verified.Equals("1"))
                return 1;
            else return 0;
        }

        c.cn.Close();
        c.dr.Close();

        return 0;
    }

    public int checkmobile(string s)
    {
        connect c = new connect();
        c.cmd.CommandText = "select * from userinfo where id='" + s + "'";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            string m_verified = c.dr["mob_verified"].ToString();
            if (m_verified.Equals("1"))
                return 1;
            else
                return 0;
        }

        c.cn.Close();
        c.dr.Close();

        return 0;
    }

    public int recoveradminpassword(string s)
    {

        connect c = new connect();
        c.cmd.CommandText = "select * from admins where id='" + s + "' ";
        c.dr = c.cmd.ExecuteReader();
        if (c.dr.Read())
        {
            emailto = c.dr["emailid"].ToString();
            recpassword = c.dr["pass"].ToString();
        }


        try
        {

            MailMessage MyMailMessage = new MailMessage();



            MailAddress m = new MailAddress("info@rasamvivah.com", "RasamVivah");
            MyMailMessage.From = m;
            MyMailMessage.To.Add(new MailAddress(emailto));

            MyMailMessage.Subject = "RasamVivah Password Recovery";
            MyMailMessage.Body = "Your password is:" + recpassword;

            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("info@rasamvivah.com", "akarshparul"); //id and password here...........

            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

            //Enable SSL
            mailClient.EnableSsl = true;

            mailClient.UseDefaultCredentials = false;

            mailClient.Credentials = mailAuthentication;

            mailClient.Send(MyMailMessage);
            string status = MyMailMessage.DeliveryNotificationOptions.ToString();
            //  return s;
            //  Response.Redirect("#");// redirect to??????
            c.cn.Close();
            c.dr.Close();
            return 1;


        }
        catch (Exception exp)
        {
            //  return e.ToString();
            return 0;
        }


    }
}