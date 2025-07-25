using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;
using System.Data;
using System.Data.SqlClient;

namespace PrasarNet.ManageSoft_Module
{
    public partial class Manage_Dashboard : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 27)
            {
                if (!IsPostBack)
                {
                    if (Convert.ToInt16(Session["Usertype"]) == 27)
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = true;
                    }
                }
            }
            else
            {
                Response.Redirect("../homepage.aspx");
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx",true);
        }

        protected void lnkPBHS_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageSoft_Module/PBHSManageApp.aspx", true);
        }
    }
}