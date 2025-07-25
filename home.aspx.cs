
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using PBDll;


namespace PrasarNet
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("+++++++++++++++++home func called");
            //Response.Write(string.Format("<script>alert('{0}');</script>", ""));

            if (!IsPostBack)
            {
                // Response.Write("+++++++++++++++++home");
                // Response.Write(string.Format("<script>alert('{0}');</script>", ""));
                string encstring = Request.QueryString["string"];
                //Response.Write(string.Format("<script>alert('{0}');</script>", encstring));
                JObject jsonobject = null;
                jsonobject = PBDll.Class1.userInfo(encstring);
                //Response.Write(string.Format("<script>alert('{0}');</script>", jsonobject));
                Console.WriteLine(jsonobject);


            }

            //Console.WriteLine("+++++++++++++++++home22");
        }

        protected void sessionTimeOutAPI_Click(object sender, EventArgs e)
        {
            string st = PBDll.Class1.sessionTimeOutAPI();
            Response.Write(string.Format("<script>alert('{0}');</script>", st));
        }

        protected void sessionTimeOut_Click(object sender, EventArgs e)
        {
            string sessionTimeout = PBDll.Class1.sessionTimeOutWeb();
            Response.Redirect(sessionTimeout);
        }

        protected void tokenValidate_Click(object sender, EventArgs e)
        {
            string tokenValidatio = PBDll.Class1.tokenValidation();
            Response.Write(string.Format("<script>alert('{0}');</script>", tokenValidatio));

        }

        protected void logoutAPI_Click(object sender, EventArgs e)
        {
            string logoutApi = PBDll.Class1.logoutAPI();
            Response.Write(string.Format("<script>alert('{0}');</script>", logoutApi));
        }

        protected void logoutWEB_Click(object sender, EventArgs e)
        {
            string logoutWeb_url = PBDll.Class1.logoutWEB();
            Response.Write(logoutWeb_url);
            Response.Write(string.Format("<script>alert('{0}');</script>", logoutWeb_url));

            Response.Redirect(logoutWeb_url);
        }

        protected void btnPrasarNet_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/dashboardNew.aspx");

        }
    }
}


