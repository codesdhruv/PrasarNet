using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;
using System.Data.SqlClient;

namespace PrasarNet.PBB_Members
{
    public partial class Members_LogOut : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/PBB_Members/Members_Login.aspx", false);
        }
    }
}