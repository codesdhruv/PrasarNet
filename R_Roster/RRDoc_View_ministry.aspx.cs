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

namespace PrasarNet.R_Roster
{
    public partial class RRDoc_View_ministry : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["UsertypeRR"]) == "" || Convert.ToString(Session["isloginRR"]) != "1")
            {
                Response.Redirect("~/R_Roster/M_Logout.aspx");
            }
            else if (Convert.ToString(Session["UsertypeRR"]) == "ministry")
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    string i = Session["RRLOPath"].ToString() + "?ref={0}#toolbar=0";
                    viewDPCDoc.Attributes.Add("src", i);
                }

            }
            else
            {
                Response.Redirect("~/R_Roster/M_Logout.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("RR_Reports_Ministry.aspx");
        }
    }
}