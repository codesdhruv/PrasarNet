using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;
using System.Data.SqlClient;

namespace PrasarNet.R_Roster
{
    public partial class M_Logout : System.Web.UI.Page
    {
       Commonclass1 cmm = new Commonclass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/R_Roster/M_Login.aspx", false);
        }
    }
}
