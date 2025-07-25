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

namespace PrasarNet.PBB_Members
{
    public partial class Members_DocumentsView : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("pbb_boardmember_sp", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement1"]))
                                                                                       , new SqlParameter("@flag", "2"));
            if (Convert.ToString(Session["username1"]) == "" || Convert.ToString(Session["islogin1"]) != "boardMember_2")
            {
                Response.Redirect("~/PBB_Members/Members_Login.aspx", false);
            }
            else if (ds.Tables[0].Rows.Count > 0)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["username1"]);
                    string i = Session["otherdocpath1"].ToString() + "?ref={0}#toolbar=0";
                    shareddoc.Attributes.Add("src", i);
                }                
            }
            else
            {
                Response.Redirect("~/PBB_Members/Members_LogOut.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBB_Members/Shared_Documents.aspx");
        }
    }
}