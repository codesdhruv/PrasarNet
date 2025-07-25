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
using System.Text.RegularExpressions;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Collections;
using System.Web.Services;
using System.Web.Configuration;
using PrasarNet.BLL;
using System.Collections.Generic;
using System.Text;

namespace PrasarNet.webservice
{
    /// <summary>
    /// Summary description for PbbTitle
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class PbbTitle : System.Web.Services.WebService
    {

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        
        public static List<string> TitleSearch(string prefixText, int count, string contextKey)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            int? catid=null, doctypeid=null;
            if (contextKey != "")
            {
                string[] x = contextKey.Split(',');
                catid = Convert.ToInt32(x[0]);
                doctypeid = Convert.ToInt32(x[1]);
            }

            ds = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", catid),
                                                                                new SqlParameter("@DoctypeID", doctypeid),
                                                                                new SqlParameter("@Title", prefixText),
                                                             new SqlParameter("@flag", "7"));


            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                Output.Add(ds.Tables[0].Rows[i][0].ToString());
            return Output;
        }
    }
}
