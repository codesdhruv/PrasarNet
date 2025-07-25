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

namespace PrasarNet
{
    public partial class Approve : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 27)
            {
                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }
        

      

        protected void lnkquote_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApprovedQuotes.aspx");
        }

        protected void lnkphoto_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhotoApproval.aspx");
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

    }
}