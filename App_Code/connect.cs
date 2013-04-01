using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
/// <summary>
/// Summary description for connect
/// </summary>
public class connect
{



    public SqlConnection cn;
    public SqlCommand cmd;
    public SqlDataAdapter adp;
    public DataSet ds;
    public SqlDataReader dr;
    public string er;

    public connect()
    {


        try
        {
            cn = new SqlConnection();
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["matrimonialConnectionString"].ToString();
            cn.Open();
            cmd = new SqlCommand("");
            cmd.Connection = cn;
            adp = new SqlDataAdapter();
            adp.SelectCommand = cmd;
            ds = new DataSet();
            //  adp.Fill(ds);
            //dr = new SqlDataReader();
            

        }

        catch (SqlException ex)
        {
            er = ex.ToString();
        }
        finally
        {

        //    cn.Close();
        
        }

    }



    ~connect()
    {
        try
        {
            this.cn.Close();
           
            //this.dr.Close();
            //this.adp.Dispose();
            //this.ds.Dispose();
        }
        catch (Exception exp)
        {
        }

        try
        {
            this.dr.Close();
            //this.cn.Close();
           
            //
            //this.adp.Dispose();
            //this.ds.Dispose();
        }
        catch (Exception exp)
        {
        }

        try
        {
           
            this.ds.Dispose();
            //int s=7;
        }
        catch (Exception exp)
        {
        }


        try
        {

            this.adp.Dispose();
        }
        catch (Exception exp)
        {
        }

    }



    
}
