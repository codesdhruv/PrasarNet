using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;
using System.Data.SqlClient;
namespace PrasarNet
{
    public partial class Logout : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["guest"]) !="")// login by authentication
            {
                activitylog(Convert.ToInt64(Session["pid"]), 1);
            }
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx", false);

        }
        private int activitylog(Int64 id,int selection)
        {
            int a = 0;
            if (selection == 1)// For Sucessful Login
            {
                a = cmm.RunSP("Pn18_User_login_activitylog_Sp", "PRASARNETConnectionString", new SqlParameter("@id", id)
                                                                                           ,new SqlParameter("@lastlogouton",DateTime.Now)
                                                                                           ,new SqlParameter("@flag", 2));
            }

            return a;
        }
    }
}