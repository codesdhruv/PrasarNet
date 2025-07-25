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
    public partial class Grievance_Reply_Recieved_fromSec_Stns : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                if (!IsPostBack)
                {

                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                        Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                        Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                        Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and sections
                    {
                        AdminMenu.Visible = false;
                        StationSectionMenu.Visible = true;
                    }
                    else
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 28)
                        {
                            divstatementsmanagement.Visible = true;
                            divRRReports_UM.Visible = true;
                        }
                        else
                        {
                            divstatementsmanagement.Visible = true;
                            divRRReports_UM.Visible = false;
                        }
                        if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
                        {
                            AdminMenu.Visible = true;
                            StationSectionMenu.Visible = false;
                        }
                    }
                    if (Convert.ToInt16(Session["Usertype"]) == 14)
                    {
                        grdcomdetails.Columns[7].Visible = false;
                    }
                    else
                    {
                        grdcomdetails.Columns[7].Visible = true;
                    }
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    gridbind();
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);
            if (Convert.ToInt16(Session["Usertype"]) == 14)
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 9),
                                                                                                        new SqlParameter("@Dealing_StnSecId", 33)
                                                                                                        , new SqlParameter("@DealingUsertypeId", 47)
                                                                                                        , new SqlParameter("@filetransferflag", 3));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 9),
                                                                                            new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                            , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                            , new SqlParameter("@filetransferflag", 3));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }

        protected void lnkallgrievances_Click(object sender, EventArgs e)
        {
            Response.Redirect("Grievance_Reports_Action.aspx");
        }

        protected void grdcomdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdcomdetails, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onclick", string.Format("ChangeRowColor('{0}','{1}');", e.Row.ClientID, e.Row.RowIndex));
                Label lblfileuploadoutput = (Label)e.Row.FindControl("lblfileuploadoutput");
                LinkButton lblgrievancegrid = (LinkButton)e.Row.FindControl("lblgrievancegrid");
                Label lnkstatus = (Label)e.Row.FindControl("lnkstatus");
                Label lblresolvedflag = (Label)e.Row.FindControl("lblresolvedflag");

                Label lblfilefwdupldoutput = (Label)e.Row.FindControl("lblfilefwdupldoutput");
                LinkButton lblfilefwd2 = (LinkButton)e.Row.FindControl("lblfilefwd2");

                Boolean res = Convert.ToBoolean(lblresolvedflag.Text);
                string fileupload = lblfileuploadoutput.Text;
                Label lblcurrentstatus = (Label)e.Row.FindControl("lblcurrentstatus");
                int currentstatus = Convert.ToInt32(lblcurrentstatus.Text);
                LinkButton lnkaction = (LinkButton)e.Row.FindControl("lnkaction");
                LinkButton lnkview = (LinkButton)e.Row.FindControl("lnkview");
                LinkButton lnkresend_details = (LinkButton)e.Row.FindControl("lnkresend_details");
                LinkButton lnkresendemail = (LinkButton)e.Row.FindControl("lnkresendemail");
                LinkButton lnkresendemailtoComplainant = (LinkButton)e.Row.FindControl("lnkresendemailtoComplainant");
                Label trnid = (Label)e.Row.FindControl("lbltrnid");

                Label lblaction = (Label)e.Row.FindControl("lblaction");
                int countresend = cmm.RunSPReturnCountParam("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@trnid", Convert.ToInt64(trnid.Text)),
                                                                                                                 new SqlParameter("@flag", 2));
                if (countresend > 0)
                {
                    lnkresend_details.Text = "History of Reminder(s), sent by PBGS";
                    lnkresend_details.ForeColor = System.Drawing.Color.Blue;
                    lnkresend_details.Visible = true;
                    lnkresend_details.Enabled = true;
                    lnkresend_details.CssClass = "fontingrid underline";
                }
                else
                {
                    lnkresend_details.Text = "";
                    lnkresend_details.Visible = false;
                }
                if (lblfilefwdupldoutput.Text == "0")
                {
                    lblfilefwd2.ForeColor = System.Drawing.Color.Black;
                    lblfilefwd2.Text = "None";
                    lblfilefwd2.Enabled = false;
                    lblfilefwd2.CssClass = "fontingrid nounderline";

                }
                else
                {
                    lblfilefwd2.ForeColor = System.Drawing.Color.Blue;
                    lblfilefwd2.Text = "Yes/Download";
                    lblfilefwd2.Enabled = true;
                    lblfilefwd2.CssClass = "fontingrid underline";
                }
                if (fileupload == "0")
                {
                    lblgrievancegrid.ForeColor = System.Drawing.Color.Black;
                    lblgrievancegrid.Enabled = false;
                    lblgrievancegrid.CssClass = "fontingrid nounderline";


                }
                else
                {
                    lblgrievancegrid.ForeColor = System.Drawing.Color.Blue;
                    lblgrievancegrid.Enabled = true;
                    lblgrievancegrid.CssClass = "fontingrid underline";
                }
                if (!res)//Pending
                {
                    lnkstatus.CssClass = "btn-info btn font2";


                }

                else if (res)//resolved
                {
                    lnkstatus.CssClass = "btncomplete  btn font2";


                }
                if (currentstatus == 1)//Closed
                {
                    lblaction.ForeColor = System.Drawing.Color.Black;
                    lblaction.CssClass = "fontingrid";
                    lnkview.Visible = false;
                    lnkresendemail.Visible = false;
                    lnkresendemailtoComplainant.Visible = true;
                    lnkaction.Text = "Closed";
                    lnkaction.Enabled = false;
                    lnkaction.CssClass = "btn btncomplete font2";
                }
                else if (currentstatus == 3)//forwarded
                {
                    lblaction.ForeColor = System.Drawing.Color.Black;
                    lblaction.CssClass = "fontingrid";
                    lnkview.Visible = false;
                    lnkresendemail.Visible = true;
                    lnkresendemailtoComplainant.Visible = false;
                    lnkaction.Text = "Forwarded";
                    lnkaction.Enabled = false;
                    lnkaction.CssClass = "btn btncomplete font2";
                }
                else//pending 
                {
                    lblaction.ForeColor = System.Drawing.Color.Red;
                    lblaction.CssClass = "blink_me font2";
                    lnkview.Visible = false;
                    lnkresendemail.Visible = false;
                    lnkresendemailtoComplainant.Visible = false;
                    lnkaction.Text = "Action";
                    lnkaction.Enabled = true;
                    lnkaction.CssClass = "btn font2";
                }
            }
        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ResendEmail")
            {
                try
                {
                    ViewState["Comp_offc"] = "office";
                    divresendmail.Visible = true;
                    divresorfor.Visible = false;
                    txtemailresend.Focus();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    Label primaryemail = row.FindControl("Label22") as Label;
                    Label CCemail = row.FindControl("Label30") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action_resend"] = greid;
                    ViewState["trnid_resend"] = lbltrnid.Text;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 6),
                                                       new SqlParameter("@Gre_ID", greid));
                    ViewState["name_resend"] = ds1.Tables[0].Rows[0][2];
                    ViewState["email_resend"] = ds1.Tables[0].Rows[0][3];
                    ViewState["mob_resend"] = ds1.Tables[0].Rows[0][4];
                    ViewState["referenceId_resend"] = ds1.Tables[0].Rows[0][5];

                    ViewState["GrievanceComp_resend"] = ds1.Tables[0].Rows[0][6];
                    ViewState["G_REGDon_resend"] = ds1.Tables[0].Rows[0][7];
                    ViewState["gREuSERTYPE_resend"] = ds1.Tables[0].Rows[0][9];
                    ViewState["station_resend"] = ds1.Tables[0].Rows[0][10];

                    Label28.Text = ViewState["referenceId_resend"].ToString();
                    Label42.Text = ViewState["name_resend"].ToString() + " & " + ViewState["mob_resend"].ToString();
                    Label45.Text = ViewState["station_resend"].ToString();
                    Label47.Text = ViewState["G_REGDon_resend"].ToString();
                    Label49.Text = ViewState["GrievanceComp_resend"].ToString();

                    DataSet ds2 = new DataSet();
                    ds2 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 12),
                                                       new SqlParameter("@id", Convert.ToInt64(lbltrnid.Text)));
                    ViewState["GreForwardedto"] = ds2.Tables[0].Rows[0][1];

                    txtemailresend.Enabled = true;
                    txtemailresend.Text = primaryemail.Text.Trim();
                    txt_CC_Resend.Text = CCemail.Text.Trim();
                    txtremkresend.Text = "";
                    divforwardedaction.Visible = false;
                    divresolvedaction.Visible = false;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "ResendEmailtoComplainant")
            {
                try
                {
                    ViewState["Comp_offc"] = "comp";
                    divresendmail.Visible = true;
                    divresorfor.Visible = false;
                    txtremkresend.Focus();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action_resend"] = greid;
                    ViewState["trnid_resend"] = lbltrnid.Text;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 6),
                                                       new SqlParameter("@Gre_ID", greid));
                    ViewState["name_resend"] = ds1.Tables[0].Rows[0][2];
                    ViewState["email_resend"] = ds1.Tables[0].Rows[0][3];
                    txtemailresend.Text = ViewState["email_resend"].ToString();
                    ViewState["mob_resend"] = ds1.Tables[0].Rows[0][4];
                    ViewState["referenceId_resend"] = ds1.Tables[0].Rows[0][5];

                    ViewState["GrievanceComp_resend"] = ds1.Tables[0].Rows[0][6];
                    ViewState["G_REGDon_resend"] = ds1.Tables[0].Rows[0][7];
                    ViewState["gREuSERTYPE_resend"] = ds1.Tables[0].Rows[0][9];
                    ViewState["station_resend"] = ds1.Tables[0].Rows[0][10];

                    Label28.Text = ViewState["referenceId_resend"].ToString();
                    Label42.Text = ViewState["name_resend"].ToString() + " & " + ViewState["mob_resend"].ToString();
                    Label45.Text = ViewState["station_resend"].ToString();
                    Label47.Text = ViewState["G_REGDon_resend"].ToString();
                    Label49.Text = ViewState["GrievanceComp_resend"].ToString();

                    DataSet ds2 = new DataSet();
                    ds2 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 12),
                                                       new SqlParameter("@id", Convert.ToInt64(lbltrnid.Text)));
                    ViewState["GreForwardedto"] = ds2.Tables[0].Rows[0][1];

                    txtemailresend.Enabled = false;
                    txt_CC_Resend.Text = "";
                    txtremkresend.Text = "";
                    divforwardedaction.Visible = false;
                    divresolvedaction.Visible = false;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }

            if (e.CommandName == "Trackinfo")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                Label lbltrnid = row.FindControl("lbltrnid") as Label;
                ViewState["greid_popup_track"] = greid;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                //GridView grdresendmails = row.FindControl("grdresendmails") as GridView;
                Label55.Text = lblrefid.Text;
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 13)
                                                                                     , new SqlParameter("@Gre_ID", greid));
                grdtrack.DataSource = ds;
                grdtrack.DataBind();
                //Display the ModalPopup.
                mpetrack.Show();
            }
            if (e.CommandName == "ShowPopup")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lbltrnid = row.FindControl("lbltrnid") as Label;
                ViewState["trnidpopuuresend"] = lbltrnid.Text;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                //GridView grdresendmails = row.FindControl("grdresendmails") as GridView;
                Label52.Text = lblrefid.Text;
                ds = cmm.RunSpReturnDSParam("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                     , new SqlParameter("@trnid", Convert.ToInt64(lbltrnid.Text)));
                grdresendmails.DataSource = ds;
                grdresendmails.DataBind();
                //Display the ModalPopup.
                mpe.Show();

            }
            if (e.CommandName == "takeaction")
            {
                try
                {
                    lblresult.Text = "";
                    divresendmail.Visible = false;
                    divresorfor.Visible = true;
                    divforwardedaction.Visible = false;
                    divresolvedaction.Visible = false;
                    CheckBoxList1.Focus();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    Label lblreplygivenBy = row.FindControl("Label50") as Label;
                    Label lblreplyon = row.FindControl("lblpbgson2") as Label;
                    Label lblprevfilename = row.FindControl("lblprevfilename") as Label;
                    Label lblrmkpbgs2 = row.FindControl("lblrmkpbgs2") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action"] = greid;
                    ViewState["trnid"] = lbltrnid.Text;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 6),
                                                       new SqlParameter("@Gre_ID", greid));
                    ViewState["name_res"] = ds1.Tables[0].Rows[0][2];
                    ViewState["email_res"] = ds1.Tables[0].Rows[0][3];
                    ViewState["mob_res"] = ds1.Tables[0].Rows[0][4];
                    ViewState["referenceId_res"] = ds1.Tables[0].Rows[0][5];

                    ViewState["GrievanceComp"] = ds1.Tables[0].Rows[0][6];
                    ViewState["G_REGDon"] = ds1.Tables[0].Rows[0][7];
                    ViewState["gREuSERTYPE"] = ds1.Tables[0].Rows[0][9];
                    ViewState["station"] = ds1.Tables[0].Rows[0][10];
                    ViewState["replygivenby"] = lblreplygivenBy.Text;
                    ViewState["replygivenon"] = lblreplyon.Text;
                    ViewState["Repliedattachedfile"] = lblprevfilename.Text;
                    ViewState["reply"] = lblrmkpbgs2.Text;
                    CheckBoxList1.ClearSelection();

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "fwddownload2")
            {
                try
                {
                    lblresult.Text = "";
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                           new SqlParameter("@flag", 12),
                                                           new SqlParameter("@id", Convert.ToInt32(lbltrnid.Text)));
                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][3]);
                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string str = ds1.Tables[0].Rows[0][3].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][3].ToString());
                                Response.WriteFile(paths1);
                                //Response.End();
                                HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                                HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                                HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                }

                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdcomdetails.Focus();
            }

            if (e.CommandName == "download")
            {
                try
                {
                    lblresult.Text = "";
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                                   new SqlParameter("@flag", 6),
                                                                   new SqlParameter("@Gre_ID", greid));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string substr = docname.Substring(docname.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths1);
                                //  Response.End();
                                HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                                HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                                HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdcomdetails.Focus();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                txtemailresend.Text = "";
                txt_CC_Resend.Text = "";
                txtremkresend.Text = "";
                grdcomdetails.Focus();
                FileUpload3.Attributes.Clear();
                divresendmail.Visible = false;
                divresorfor.Visible = false;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            try
            {
                lblresult.Text = "";
                string ipaddress2 = cmm.GetIp_Priyank();
                if (FileUpload3.HasFile)
                {
                    int ret = uploaddoc(FileUpload3);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        string filename = Convert.ToString(ViewState["GDfilename"]);
                        string remarks = txtremkresend.Text;
                        string emailofcomplainant = ViewState["email_resend"].ToString();
                        string nameofcomplainant = ViewState["name_resend"].ToString();
                        string mobnoofComplainant = ViewState["mob_resend"].ToString();
                        string referenceid = ViewState["referenceId_resend"].ToString();
                        string Grievance = ViewState["GrievanceComp_resend"].ToString();
                        string G_RegdOn = ViewState["G_REGDon_resend"].ToString();

                        string Subofemail = "";
                        string bodyofemail = "";
                        if (ViewState["Comp_offc"].ToString() == "comp")
                        {
                            Subofemail = "Regarding Grievance having Grievance Reference Id: " + referenceid;
                            bodyofemail = "Your grievance has been closed and answered. Kindly login to PrasarNet to see the answer";
                        }
                        else if (ViewState["Comp_offc"].ToString() == "office")
                        {
                            Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;
                            bodyofemail += "The details of grievance and the user who registered it on PrasarNet are given below: <br /> <br />";
                            bodyofemail += "<b>1. Grievance: <b>";
                            bodyofemail += Grievance + "<br /><br />";
                            bodyofemail += "2. Grievance Registered On: ";
                            bodyofemail += G_RegdOn + "<br /><br />";

                            bodyofemail += "3. Name of the Complainant: ";
                            bodyofemail += nameofcomplainant + "<br /><br />";
                            bodyofemail += "4. Email of the Complainant: ";
                            bodyofemail += emailofcomplainant + "<br /><br />";
                            bodyofemail += "5. Mobile No. of the Complainant: ";
                            bodyofemail += mobnoofComplainant + "<br /><br />";

                            bodyofemail += "6. Grievance Forwarded By: ";
                            bodyofemail += Convert.ToString(Session["UserName"]) + "<br /><br />";
                            bodyofemail += "7. Grievance Forwarded to: ";
                            bodyofemail += ViewState["GreForwardedto"].ToString() + "<br /><br />";
                            bodyofemail += "8. Remarks given by PBGS while re-mailing this information: ";
                            bodyofemail += txtremkresend.Text.Trim() + "<br /><br />";
                            bodyofemail += "The reply of this grievance should be submitted to Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
                                            + referenceid + " in a subject.";
                        }
                        string sectionname = Session["UserName"].ToString();
                        int usertypeid = Convert.ToInt32(Session["Usertype"]);
                        int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);
                        int i = cmm.RunSP("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailto", txtemailresend.Text.Trim())
                                                                                      , new SqlParameter("@ccto", txt_CC_Resend.Text.Trim())
                                                                                      , new SqlParameter("@attachedfilename", filename)
                                                                                      , new SqlParameter("@Ipadress", ipaddress2)
                                                                                      , new SqlParameter("@trnid", Convert.ToInt32(ViewState["trnid_resend"]))
                                                                                      , new SqlParameter("@createdbyusertpeid", usertypeid)
                                                                                      , new SqlParameter("@createdbyid", stn_secid));

                        if (i > 0)
                        {
                            if (ViewState["Comp_offc"].ToString() == "comp")
                            {
                                sendEmail(Subofemail, txtemailresend.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, Session["UserName"].ToString(), ViewState["name_resend"].ToString());
                            }
                            else if (ViewState["Comp_offc"].ToString() == "office")
                            {
                                sendEmailforward(Subofemail, txtemailresend.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam", Convert.ToInt32(ViewState["GREid_action_resend"]));
                            }
                            txtemailresend.Text = "";
                            txt_CC_Resend.Text = "";
                            txtremkresend.Text = "";
                            FileUpload3.Attributes.Clear();
                            divresendmail.Visible = false;
                            divresorfor.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The mail carrying the information has been forwarded sucessfully')", true);
                            gridbind();
                            lblresult.Focus();
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {

                    string filename = Convert.ToString(ViewState["GDfilename"]);
                    string remarks = txtremkresend.Text;
                    string emailofcomplainant = ViewState["email_resend"].ToString();
                    string nameofcomplainant = ViewState["name_resend"].ToString();
                    string mobnoofComplainant = ViewState["mob_resend"].ToString();
                    string referenceid = ViewState["referenceId_resend"].ToString();
                    string Grievance = ViewState["GrievanceComp_resend"].ToString();
                    string G_RegdOn = ViewState["G_REGDon_resend"].ToString();

                    string Subofemail = "";
                    string bodyofemail = "";

                    //bodyofemail += "The reply of this grievance should be submitted to Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
                    //                + referenceid + " in a subject.";
                    if (ViewState["Comp_offc"].ToString() == "comp")
                    {
                        Subofemail = "Regarding Grievance having Grievance Reference Id: " + referenceid;
                        bodyofemail = "Your grievance has been closed and answered. Kindly login to PrasarNet to see the answer";
                    }
                    else if (ViewState["Comp_offc"].ToString() == "office")
                    {
                        Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;
                        bodyofemail += "The details of grievance and the user who registered it on PrasarNet are given below: <br /> <br />";
                        bodyofemail += "<b>1. Grievance: <b>";
                        bodyofemail += Grievance + "<br /><br />";
                        bodyofemail += "2. Grievance Registered On: ";
                        bodyofemail += G_RegdOn + "<br /><br />";

                        bodyofemail += "3. Name of the Complainant: ";
                        bodyofemail += nameofcomplainant + "<br /><br />";
                        bodyofemail += "4. Email of the Complainant: ";
                        bodyofemail += emailofcomplainant + "<br /><br />";
                        bodyofemail += "5. Mobile No. of the Complainant: ";
                        bodyofemail += mobnoofComplainant + "<br /><br />";

                        bodyofemail += "6. Grievance Forwarded By: ";
                        bodyofemail += Convert.ToString(Session["UserName"]) + "<br /><br />";
                        bodyofemail += "7. Grievance Forwarded to: ";
                        bodyofemail += ViewState["GreForwardedto"].ToString() + "<br /><br />";
                        bodyofemail += "8. Remarks given by PBGS while re-mailing this information: ";
                        bodyofemail += txtremkresend.Text.Trim() + "<br /><br />";
                        bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                    }
                    string sectionname = Session["UserName"].ToString();
                    int usertypeid = Convert.ToInt32(Session["Usertype"]);
                    int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);
                    int i = cmm.RunSP("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                  , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailto", txtemailresend.Text.Trim())
                                                                                  , new SqlParameter("@ccto", txt_CC_Resend.Text.Trim())
                                                                                  , new SqlParameter("@Ipadress", ipaddress2)
                                                                                  , new SqlParameter("@trnid", Convert.ToInt32(ViewState["trnid_resend"]))
                                                                                  , new SqlParameter("@createdbyusertpeid", usertypeid)
                                                                                  , new SqlParameter("@createdbyid", stn_secid));

                    if (i > 0)
                    {
                        if (ViewState["Comp_offc"].ToString() == "comp")
                        {
                            sendEmail(Subofemail, txtemailresend.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, Session["UserName"].ToString(), ViewState["name_resend"].ToString());
                        }
                        else if (ViewState["Comp_offc"].ToString() == "office")
                        {
                            sendEmailforward(Subofemail, txtemailresend.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam", Convert.ToInt32(ViewState["GREid_action_resend"]));

                        }
                        txtemailresend.Text = "";
                        txt_CC_Resend.Text = "";
                        txtremkresend.Text = "";
                        FileUpload3.Attributes.Clear();
                        divresendmail.Visible = false;
                        divresorfor.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The mail carrying information has been forwarded sucessfully')", true);
                        gridbind();
                        lblresult.Focus();
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtEmailres.Text = "";
            txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
            txtremarksres.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            chkcopyafile.Checked = false;
            chkcopyreply.Checked = false;
            lblfileupload1_lnk.Text = "";
            divLOupload.Visible = true;
            div11.Visible = false;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = "";
                string ipaddress2 = cmm.GetIp_Priyank();
                int ret = 0;
                if (FileUpload1.HasFile || chkcopyafile.Checked)
                {
                    if (chkcopyafile.Checked)// no file upload in fileupload1 but having replied file
                    {
                        ret = 1;
                        filename = Convert.ToString(ViewState["Repliedattachedfile"]);
                    }
                    else //no reply file but may have file upload
                    {
                        if (FileUpload1.HasFile)//if file is attached
                        {
                            ret = uploaddoc(FileUpload1);
                            filename = Convert.ToString(ViewState["GDfilename"]);
                        }
                        else// if no file attached
                        {
                            ret = 2;
                        }
                    }

                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        DataSet dsurlG = new DataSet();
                        DataSet dsurlPN = new DataSet();
                        dsurlG = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 3)
                                                                                               , new SqlParameter("@flag", 1));
                        string targetpath = "", sourcepath = "";
                        string urlfixedpathG = dsurlG.Tables[0].Rows[0][1].ToString();
                        targetpath = urlfixedpathG + "/" + filename;
                        dsurlPN = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 2)
                                                                                               , new SqlParameter("@flag", 1));
                        string urlfixedpathPN = dsurlPN.Tables[0].Rows[0][1].ToString();
                        sourcepath = Server.MapPath("~") + "\\GrievanceDoc\\" + filename;
                        File.Copy(sourcepath, targetpath);

                        int trnid = Convert.ToInt32(ViewState["trnid"]);
                        int greid = Convert.ToInt32(ViewState["GREid_action"]);

                        string remarks = txtremarksres.Text;
                        string emailofcomplainant = ViewState["email_res"].ToString();
                        string nameofcomplainant = ViewState["name_res"].ToString();
                        string mobnoofComplainant = ViewState["mob_res"].ToString();
                        string referenceid = ViewState["referenceId_res"].ToString();
                        string Subofemail = "Regarding Grievance with Grievance Reference Id" + referenceid;
                        string bodyofemail = "Your grievance has been closed and answered. Kindly login to PrasarNet to see the answer";
                        string sectionname = Session["UserName"].ToString();
                        int usertypeid = Convert.ToInt32(Session["Usertype"]);
                        int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);
                        int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 8)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailidsend", emailofcomplainant)
                                                                                      , new SqlParameter("@ccmailto", txtccresto.Text.Trim())
                                                                                      , new SqlParameter("@filename", filename)
                                                                                      , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                      , new SqlParameter("@id", trnid)
                                                                                      , new SqlParameter("@resolvedbyUserTypeId", usertypeid)
                                                                                      , new SqlParameter("@ResolvedByStn_Sec_Id", stn_secid)
                                                                                      , new SqlParameter("@Gre_ID", greid));
                        if (i > 0)
                        {
                            sendEmail(Subofemail, emailofcomplainant, txtccresto.Text.Trim(), bodyofemail, sectionname, nameofcomplainant);
                            divresolvedaction.Visible = false;
                            divresorfor.Visible = false;
                            txtremarksres.Text = "";
                            txtEmailres.Text = "";
                            chkcopyafile.Checked = false;
                            chkcopyreply.Checked = false;
                            lblfileupload1_lnk.Text = "";
                            divLOupload.Visible = true;
                            div11.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + ". has been closed.')", true);
                            gridbind();

                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {
                    int trnid = Convert.ToInt32(ViewState["trnid"]);
                    int greid = Convert.ToInt32(ViewState["GREid_action"]);
                    string remarks = txtremarksres.Text;
                    string emailofcomplainant = ViewState["email_res"].ToString();
                    string nameofcomplainant = ViewState["name_res"].ToString();
                    string mobnoofComplainant = ViewState["mob_res"].ToString();
                    string referenceid = ViewState["referenceId_res"].ToString();
                    string Subofemail = "Regarding Grievance having Grievance Reference Id: " + referenceid;
                    string bodyofemail = "Your grievance has been closed and answered. Kindly login to PrasarNet to see the answer";
                    string sectionname = Session["UserName"].ToString();
                    int usertypeid = Convert.ToInt32(Session["Usertype"]);
                    int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);
                    int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 8)
                                                                                  , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailidsend", emailofcomplainant)
                                                                                  , new SqlParameter("@ccmailto", txtccresto.Text.Trim())
                                                                                  , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                  , new SqlParameter("@id", trnid)
                                                                                  , new SqlParameter("@resolvedbyUserTypeId", usertypeid)
                                                                                  , new SqlParameter("@ResolvedByStn_Sec_Id", stn_secid)
                                                                                  , new SqlParameter("@Gre_ID", greid));
                    if (i > 0)
                    {
                        sendEmail(Subofemail, emailofcomplainant, txtccresto.Text.Trim(), bodyofemail, sectionname, nameofcomplainant);

                        divresolvedaction.Visible = false;
                        divresorfor.Visible = false;
                        txtremarksres.Text = "";
                        txtEmailres.Text = "";
                        txtEmailres.ReadOnly = true;
                        txtEmailres.CssClass = "select font2 widthofboxes1";
                        chkcopyafile.Checked = false;
                        chkcopyreply.Checked = false;
                        lblfileupload1_lnk.Text = "";
                        divLOupload.Visible = true;
                        div11.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance having Reference ID " + referenceid + ". has been closed.')", true);
                        gridbind();
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }
        private void sendEmail(string appsub, string empEmail, string ccmailto, string body, string sectionname, string nameofcomplainant)// For closing of Grievance
        {
            try
            {
                MailMessage message = new MailMessage();
                string appSubject, appBody;
                string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                string docname = Convert.ToString(ViewState["GDfilename"]);
                ViewState["GDfilename"] = null;
                string paths1 = "";

                string wfrom = "no-reply.hris@akashvani.in";
                //string wfrom = "priyankglb2012@gmail.com";
                appSubject = appsub;
                appBody = "Dear " + nameofcomplainant + "<br/><br/> ";
                appBody += body;
                if (docname != "")
                {
                    paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        var attachment = new System.Net.Mail.Attachment(paths1);
                        message.Attachments.Add(attachment);
                        appBody += "<br /> Please, find an attachment.";
                    }
                }
                appBody += "<br /><br />* This is system generated Email. Please do not reply on this.";
                appBody += "<br /><br />With Regards<br />";
                appBody += sectionname;
                //message.IsBodyHtml = false;
                SmtpClient client = new SmtpClient();

                client.Host = "203.122.51.200";
                client.Port = 25;
                // client.EnableSsl = true;
                //'client.Host = "mail.akashvani.in"
                //client.Host = "smtp.gmail.com";
                //client.Port = 587;
                System.Net.NetworkCredential wCred = new NetworkCredential("no-reply.hris", "HRIS@2018");
                //client.UseDefaultCredentials = false;
                client.Credentials = wCred;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                message.From = new MailAddress(wfrom);
                message.To.Add(empEmail);




                if (ccmailto != "")
                {
                    string[] CCId = ccmailto.Split(',');
                    foreach (string CCEmail in CCId)
                    {
                        message.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }
                message.Subject = appSubject;
                message.Body = appBody;
                message.IsBodyHtml = true;
                client.Send(message);
                lblresult.Text += "The Email has been sent to " + empEmail + " & CC to " + ccmailto;
            }

            catch (Exception ex)
            {
                lblresult.Text += " Unable to send an Email. <br/>" + ex.ToString();
                //+ ex.ToString() 
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            txtemailforwarded.Text = "";
            ddldeptfwd.SelectedIndex = 0;
            ddlsecfwd.Items.Clear();
            ddlsecfwd.SelectedIndex = -1;
            ddlsecfwd.SelectedValue = null;
            txtremarksforward.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            txtcc.Text = "";
        }
        private int uploaddoc(FileUpload fileupload)
        {

            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(fileupload.FileName);
                filetype = filetype.ToLower();
                string max = "";
                max = cmm.SelectMaxId("select max(Gre_Id)+1 from PN18_Gre_Grievances", "PRASARNETConnectionString");
                if (max == "")
                {
                    max = "1";
                }

                if (filetype == ".pdf")
                {
                    string files = "";
                    fileupload.SaveAs(MapPath("~/GrievanceDoc/" + fileupload.FileName.ToString()));
                    files = fileupload.FileName.ToString();
                    if (fileupload.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = fileupload.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        if ((lastline.IndexOf("%PDF") > -1))
                        {
                            int filesize = fileupload.PostedFile.ContentLength;
                            if (filesize > 3145728)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Maximum file size(3MB) exceeded..');", true);
                                return 0;
                            }
                            else
                            {
                                path = Server.MapPath("~") + "\\GrievanceDoc\\";
                                string Fromfile = path + files;
                                string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();
                                string savefile = "GD_PBFwd" + max + "_" + dtetm + filetype;
                                string Tofile = path + savefile;
                                File.Move(Fromfile, Tofile);
                                ViewState["GDfilename"] = savefile;
                                return 1;
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                            return 0;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                        return 0;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                    return 0;
                }
            }
            catch (Exception ex)
            {

                lblexception.Visible = true;
                lblexception.Text = ex.Message.ToString();
                lblexception.Focus();
                return 0;
            }
        }
        protected void btnfwd_Click(object sender, EventArgs e)
        {
            try
            {
                lblresult.Text = "";
                string ipaddress2 = cmm.GetIp_Priyank();
                if (FileUpload2.HasFile)
                {
                    int ret = uploaddoc(FileUpload2);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        int trnid = Convert.ToInt32(ViewState["trnid"]);
                        int greid = Convert.ToInt32(ViewState["GREid_action"]);
                        string filename = Convert.ToString(ViewState["GDfilename"]);
                        string remarks = txtremarksforward.Text;
                        string emailofcomplainant = ViewState["email_res"].ToString();
                        string nameofcomplainant = ViewState["name_res"].ToString();
                        string mobnoofComplainant = ViewState["mob_res"].ToString();
                        string referenceid = ViewState["referenceId_res"].ToString();

                        string Grievance = ViewState["GrievanceComp"].ToString();
                        string G_RegdOn = ViewState["G_REGDon"].ToString();
                        string GreUsertype = ViewState["gREuSERTYPE"].ToString();
                        string StationofEmployee = ViewState["station"].ToString();
                        string section = ddlsecfwd.SelectedItem.Text;
                        string Subofemail = "";
                        string bodyofemail = "";
                        if (txtemailforwarded.Text != "")
                        {
                            Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;

                            bodyofemail += "The details of grievance and the user who registered it on PrasarNet are given below: <br /> <br />";
                            bodyofemail += "<b>1. Grievance: <b>";
                            bodyofemail += Grievance + "<br /><br />";
                            bodyofemail += "2. Grievance Registered On: ";
                            bodyofemail += G_RegdOn + "<br /><br />";
                            bodyofemail += "3. Grievance Forwarded By: ";
                            bodyofemail += Convert.ToString(Session["UserName"]) + "<br /><br />";
                            bodyofemail += "4. Remarks/Comments By PBGS while forwarding this Information: ";
                            bodyofemail += remarks + "<br /><br />";
                            bodyofemail += "5. Name of the Complainant: ";
                            bodyofemail += nameofcomplainant + "<br /><br />";
                            bodyofemail += "6. Email of the Complainant: ";
                            bodyofemail += emailofcomplainant + "<br /><br />";
                            bodyofemail += "7. Mobile No. of the Complainant: ";
                            bodyofemail += mobnoofComplainant + "<br /><br />";
                            bodyofemail += "Kindly login into PrasarNet to take a necessary action." + "<br />";
                            bodyofemail += "If you have any query then you may write to Prasar Bharati Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
                                        + referenceid + " in a subject.";

                        }
                        string sectionname = Session["UserName"].ToString();

                        int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
                        int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

                        int usertypeid_forwarded = 0;
                        if (ddldeptfwd.SelectedValue == "1")
                            usertypeid_forwarded = 26;
                        else if (ddldeptfwd.SelectedValue == "2")
                            usertypeid_forwarded = 25;

                        else if (ddldeptfwd.SelectedValue == "3")
                            usertypeid_forwarded = 20;

                        else if (ddldeptfwd.SelectedValue == "4")
                            usertypeid_forwarded = 12;

                        else if (ddldeptfwd.SelectedValue == "5" || ddldeptfwd.SelectedValue == "6")
                            usertypeid_forwarded = 11;


                        else if (ddldeptfwd.SelectedValue == "9")
                            usertypeid_forwarded = 22;

                        else if (ddldeptfwd.SelectedValue == "10")
                        {
                            ds = cmm.RunSpReturnDSParam("pn18_gre_fetchUsertype", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                           , new SqlParameter("@uid", Convert.ToInt32(ddlsecfwd.SelectedValue)));
                            usertypeid_forwarded = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                        }

                        int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                      , new SqlParameter("@ccmailto", txtcc.Text.Trim())
                                                                                      , new SqlParameter("@filename", filename)
                                                                                      , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                      , new SqlParameter("@id", trnid)
                                                                                      , new SqlParameter("@ForwardUsertypeId", usertypeid_forwarded)
                                                                                      , new SqlParameter("@Forward_stnsecID", Convert.ToInt32(ddlsecfwd.SelectedValue))
                                                                                      , new SqlParameter("@Gre_ID", greid)
                                                                                      , new SqlParameter("@filetransferflag", 2));
                        if (i > 0)
                        {
                            if (txtemailforwarded.Text != "")
                            {
                                sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, sectionname, "Sir/Madam", Convert.ToInt32(ViewState["GREid_action"]));
                            }
                            divforwardedaction.Visible = false;
                            divresolvedaction.Visible = false;
                            divresorfor.Visible = false;

                            txtemailforwarded.Text = "";
                            txtcc.Text = "";
                            ddldeptfwd.SelectedIndex = 0;
                            ddlsecfwd.Items.Clear();
                            ddlsecfwd.SelectedIndex = -1;
                            ddlsecfwd.SelectedValue = null;
                            txtremarksforward.Text = "";
                            CheckBoxList1.ClearSelection();
                            CheckBoxList1.Focus();
                            lblresult.Focus();

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to " + section + " ')", true);
                            gridbind(); lblresult.Focus();
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {
                    int trnid = Convert.ToInt32(ViewState["trnid"]);
                    int greid = Convert.ToInt32(ViewState["GREid_action"]);
                    string remarks = txtremarksforward.Text;
                    string emailofcomplainant = ViewState["email_res"].ToString();
                    string nameofcomplainant = ViewState["name_res"].ToString();
                    string mobnoofComplainant = ViewState["mob_res"].ToString();
                    string referenceid = ViewState["referenceId_res"].ToString();

                    string Grievance = ViewState["GrievanceComp"].ToString();
                    string G_RegdOn = ViewState["G_REGDon"].ToString();
                    string GreUsertype = ViewState["gREuSERTYPE"].ToString();
                    string StationofEmployee = ViewState["station"].ToString();
                    string section = ddlsecfwd.SelectedItem.Text;
                    string Subofemail = "";
                    string bodyofemail = "";
                    if (txtemailforwarded.Text != "")
                    {
                        Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;

                        bodyofemail += "The details of grievance and the user who registered it on PrasarNet are given below: <br /> <br />";
                        bodyofemail += "<b>1. Grievance: <b>";
                        bodyofemail += Grievance + "<br /><br />";
                        bodyofemail += "2. Grievance Registered On: ";
                        bodyofemail += G_RegdOn + "<br /><br />";
                        bodyofemail += "3. Grievance Forwarded By: ";
                        bodyofemail += Convert.ToString(Session["UserName"]) + "<br /><br />";
                        bodyofemail += "4. Remarks/Comments By PBGS while forwarding this Information: ";
                        bodyofemail += remarks + "<br /><br />";
                        bodyofemail += "5. Name of the Complainant: ";
                        bodyofemail += nameofcomplainant + "<br /><br />";
                        bodyofemail += "6. Email of the Complainant: ";
                        bodyofemail += emailofcomplainant + "<br /><br />";
                        bodyofemail += "7. Mobile No. of the Complainant: ";
                        bodyofemail += mobnoofComplainant + "<br /><br />";
                        bodyofemail += "Kindly login into PrasarNet to take a necessary action." + "<br />";
                        bodyofemail += "If you have any query then you may write to Prasar Bharati Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
                                    + referenceid + " in a subject.";
                    }
                    string sectionname = Session["UserName"].ToString();

                    int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
                    int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

                    int usertypeid_forwarded = 0;
                    if (ddldeptfwd.SelectedValue == "1")
                        usertypeid_forwarded = 26;
                    else if (ddldeptfwd.SelectedValue == "2")
                        usertypeid_forwarded = 25;

                    else if (ddldeptfwd.SelectedValue == "3")
                        usertypeid_forwarded = 20;

                    else if (ddldeptfwd.SelectedValue == "4")
                        usertypeid_forwarded = 12;

                    else if (ddldeptfwd.SelectedValue == "5" || ddldeptfwd.SelectedValue == "6")
                        usertypeid_forwarded = 11;


                    else if (ddldeptfwd.SelectedValue == "9")
                        usertypeid_forwarded = 22;

                    else if (ddldeptfwd.SelectedValue == "10")
                    {
                        ds = cmm.RunSpReturnDSParam("pn18_gre_fetchUsertype", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                       , new SqlParameter("@uid", Convert.ToInt32(ddlsecfwd.SelectedValue)));
                        usertypeid_forwarded = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    }

                    int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                                  , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                  , new SqlParameter("@ccmailto", txtcc.Text.Trim())
                                                                                  , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                  , new SqlParameter("@id", trnid)
                                                                                  , new SqlParameter("@ForwardUsertypeId", usertypeid_forwarded)
                                                                                  , new SqlParameter("@Forward_stnsecID", Convert.ToInt32(ddlsecfwd.SelectedValue))
                                                                                  , new SqlParameter("@Gre_ID", greid)
                                                                                  , new SqlParameter("@filetransferflag", 2));
                    if (i > 0)
                    {
                        if (txtemailforwarded.Text != "")
                        {
                            sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, sectionname, "Sir/Madam", Convert.ToInt32(ViewState["GREid_action"]));
                        }
                        divforwardedaction.Visible = false;
                        divresolvedaction.Visible = false;
                        divresorfor.Visible = false;

                        txtemailforwarded.Text = "";
                        txtcc.Text = "";
                        ddldeptfwd.SelectedIndex = 0;
                        ddlsecfwd.Items.Clear();
                        ddlsecfwd.SelectedIndex = -1;
                        ddlsecfwd.SelectedValue = null;
                        txtremarksforward.Text = "";
                        CheckBoxList1.ClearSelection();
                        CheckBoxList1.Focus();
                        lblresult.Focus();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to " + section + " ')", true);
                        gridbind();
                        lblresult.Focus();
                    }


                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }
        private void sendEmailforward(string appsub, string empEmail, string ccemail, string body, string sectionname, string nameofcomplainant, int greid)
        {
            try
            {
                MailMessage message = new MailMessage();
                string appSubject, appBody;
                string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                string docname = Convert.ToString(ViewState["GDfilename"]);
                ViewState["GDfilename"] = null;
                string paths1 = "";
                DataSet ds1 = new DataSet();
                //int greid = Convert.ToInt32(ViewState["GREid_action"]);
                ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 6),
                                                   new SqlParameter("@Gre_ID", greid));

                string docname1 = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                string paths2 = urlfixedpath + docname1;
                FileInfo file2 = new FileInfo(paths2);
                string wfrom = "no-reply.hris@akashvani.in";

                appSubject = appsub;
                appBody = "Dear " + nameofcomplainant + "<br/><br/> ";
                appBody += body;
                string bd = "";
                if (docname != "")
                {
                    paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        var attachment = new System.Net.Mail.Attachment(paths1);
                        message.Attachments.Add(attachment);
                        bd = "<br /> Please, find an attachment.";
                    }
                }
                if (file2.Exists)
                {
                    var attachment1 = new System.Net.Mail.Attachment(paths2);
                    message.Attachments.Add(attachment1);
                    bd = "<br /> Please, find an attachment.";
                }
                appBody += bd;
                appBody += "<br /><br />* This is system generated Email. Please do not reply on this.";
                appBody += "<br /><br />With Regards<br />";
                appBody += sectionname;
                SmtpClient client = new SmtpClient();
                client.Host = "203.122.51.200";
                client.Port = 25;

                //client.EnableSsl = true;
                //**'client.Host = "mail.akashvani.in"
                //client.Host = "smtp.gmail.com";
                //client.Port = 587;

                System.Net.NetworkCredential wCred = new NetworkCredential("no-reply.hris", "HRIS@2018");

                //client.UseDefaultCredentials = false;

                client.Credentials = wCred;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                message.From = new MailAddress(wfrom);
                message.To.Add(empEmail);
                if (ccemail != "")
                {
                    string[] CCId = ccemail.Split(',');
                    foreach (string CCEmail in CCId)
                    {
                        message.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }
                message.Subject = appSubject;
                message.Body = appBody;
                message.IsBodyHtml = true;
                client.Send(message);
                lblresult.Text += "The Email has been sent to " + empEmail + " & CC to " + ccemail;
            }
            catch (Exception ex)
            {
                lblresult.Text += " Unable to send an Email. <br/>" + ex.ToString();
                //+ ex.ToString() 
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            divresorfor.Visible = false;
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            CheckBoxList1.ClearSelection();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (CheckBoxList1.SelectedValue == "1")//closed
                {
                    divresolvedaction.Visible = true;
                    divforwardedaction.Visible = false;
                    txtremarksres.Focus();
                    btnsubmit.Focus();
                    txtEmailres.Text = ViewState["email_res"].ToString();
                    lblnameres.Text = ViewState["name_res"].ToString() + " & " + ViewState["mob_res"].ToString();
                    lblrefidres.Text = ViewState["referenceId_res"].ToString();

                    lblgrievanceres.Text = ViewState["GrievanceComp"].ToString();
                    lbldateres.Text = ViewState["G_REGDon"].ToString();
                    lbldeptres.Text = ViewState["station"].ToString();
                    lblreplybyres.Text = ViewState["replygivenby"].ToString() + " & " + ViewState["replygivenon"].ToString();
                    lblreplyres.Text = ViewState["reply"].ToString();
                    chkcopyafile.Checked = false;
                    chkcopyreply.Checked = false;
                    if (ViewState["Repliedattachedfile"].ToString() != "")
                    {
                        divchkcopyfile.Visible = true;
                    }
                    else
                    {
                        divchkcopyfile.Visible = false;
                    }
                    divLOupload.Visible = true;
                    div11.Visible = false;
                }
                else if (CheckBoxList1.SelectedValue == "3")// forward
                {
                    divresolvedaction.Visible = false;
                    divforwardedaction.Visible = true;
                    cmm.bindDDLWidParam(ddldeptfwd, "PN18_Gre_Deptt", "department", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));
                    txtremarksforward.Focus();
                    btnfwd.Focus();
                    lblnamefwd.Text = ViewState["name_res"].ToString() + " & " + ViewState["mob_res"].ToString();
                    lblrefIdFwd.Text = ViewState["referenceId_res"].ToString();

                    lblgrievancefwd.Text = ViewState["GrievanceComp"].ToString();
                    lbldatefwd.Text = ViewState["G_REGDon"].ToString();
                    lbldeptfwd.Text = ViewState["station"].ToString();
                    lblreplybyfwd.Text = ViewState["replygivenby"].ToString() + " & " + ViewState["replygivenon"].ToString();
                    lblreplyfwd.Text = ViewState["reply"].ToString();


                }
                else
                {
                    divresolvedaction.Visible = false;
                    divforwardedaction.Visible = false;
                    CheckBoxList1.Focus();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some error occured. Try Again or you may contact IT Team,  if you are getting same error continously');", true);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            txtEmailres.ReadOnly = false;
            txtEmailres.Focus();
            LinkButton1.Visible = false;
        }

        protected void ddldeptfwd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldeptfwd.SelectedValue != "8")
            {
                ds = cmm.RunSpReturnDSParam("PN18_Gre_Deptt", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(ddldeptfwd.SelectedValue))
                                                                                       , new SqlParameter("@flag", 2));
                int flag = 0, orgid, secORstn;
                orgid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                secORstn = Convert.ToInt32(ds.Tables[0].Rows[0][2]);

                if (secORstn == 1)//Sec
                {
                    DataSet dssecttDGlist = new DataSet();
                    flag = 1;
                    lblsecttdg.Text = "";
                    //if (orgid == 1)//PB
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                    //    lblsecttdg.Text = "E-Mail List of PB-Sectt Offices: ";
                    //}
                    //else if (orgid == 2)//DD
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
                    //    lblsecttdg.Text = "E-Mail List of DG:DD Offices: ";
                    //}
                    //else//AIR
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
                    //    lblsecttdg.Text = "E-Mail List of DG:AIR Offices: ";
                    //}
                    //lblsecttdg.Text += dssecttDGlist.Tables[0].Rows[0][1].ToString();
                }
                else if (secORstn == 2)//Stn
                {
                    flag = 2;
                    lblsecttdg.Text = "";
                }
                else if (secORstn == 3)//Other
                {
                    DataSet dssecttDGlist = new DataSet();
                    flag = 3;
                    lblsecttdg.Text = "";
                    //if (orgid == 1)//PB
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                    //    lblsecttdg.Text = "E-Mail List of PB-Sectt Offices: ";
                    //    lblsecttdg.Text += dssecttDGlist.Tables[0].Rows[0][1].ToString();
                    //}
                    //else if (orgid == 2)//DD
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
                    //    lblsecttdg.Text = "E-Mail List of DG:DD Offices: ";
                    //}
                    //else//AIR
                    //{
                    //    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
                    //    lblsecttdg.Text = "E-Mail List of DG:AIR Offices: ";
                    //}
                    //lblsecttdg.Text += dssecttDGlist.Tables[0].Rows[0][1].ToString();
                }
                else if (secORstn == 4)//DDNews
                {
                    flag = 4;
                    DataSet dssecttDGlist = new DataSet();
                    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                                                        , new SqlParameter("@stationid", 2427));
                    lblsecttdg.Text = "E-Mail List of DD NEWS Offices: ";
                    lblsecttdg.Text += dssecttDGlist.Tables[0].Rows[0][1].ToString();
                }
                else if (secORstn == 5)//AIR NEWs
                {
                    flag = 5;
                    DataSet dssecttDGlist = new DataSet();
                    dssecttDGlist = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                                                        , new SqlParameter("@stationid", 513));
                    lblsecttdg.Text = "E-Mail List of AIR NEWS Offices: ";
                    lblsecttdg.Text += dssecttDGlist.Tables[0].Rows[0][1].ToString();
                }
                cmm.bindDDLWidParam(ddlsecfwd, "PN18_Gre_section", "Expr1", "secstnid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@orgid", orgid),
                                                                                                                      new SqlParameter("@flag", flag));
            }
            ddlsecfwd.Focus();
        }

        protected void chkcopyreply_CheckedChanged(object sender, EventArgs e)
        {
            if (chkcopyreply.Checked)
            {
                txtremarksres.Text = lblreplyres.Text;
            }
            else
            {
                txtremarksres.Text = "";
            }
        }

        protected void chkcopyafile_CheckedChanged(object sender, EventArgs e)
        {
            if (chkcopyafile.Checked)
            {
                FileUpload1.Attributes.Clear();
                div11.Visible = true;
                divLOupload.Visible = false;
                lblfileupload1_lnk.Text = ViewState["Repliedattachedfile"].ToString();
                txtremarksres.Focus();
                FileUpload1.Focus();
            }
            else
            {
                div11.Visible = false;
                divLOupload.Visible = true;
                lblfileupload1_lnk.Text = "";
                FileUpload1.Attributes.Clear();
                txtremarksres.Focus();
            }
        }
        protected void grdresend_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                    , new SqlParameter("@trnid", Convert.ToInt64(ViewState["trnidpopuuresend"])));
            grdresendmails.DataSource = ds;
            grdresendmails.DataBind();
        }
        protected void grdtrack_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdtrack.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 13)
                                                                                    , new SqlParameter("@Gre_ID", Convert.ToInt64(ViewState["greid_popup_track"])));
            grdtrack.DataSource = ds;
            grdtrack.DataBind();
        }

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdcomdetails.AllowPaging = false;
                if (Convert.ToInt16(ViewState["search"]) == 1)//PBADG(E&A)
                {

                    gridbindprimary_Search();

                }
                else
                {
                    gridbind();
                }
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdcomdetails.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'")
                    .Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "Grievance Print", sb.ToString());
                grdcomdetails.AllowPaging = true;
                if (Convert.ToInt16(ViewState["search"]) == 1)//PBADG(E&A)
                {

                    gridbindprimary_Search();

                }
                else
                {
                    gridbind();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Grievance_Reports_Action.aspx", true);
        }

        protected void grdtrack_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.FindControl("lnkfiledownloadresend") as LinkButton;
                if (lb != null)
                    ScriptManager.GetCurrent(this).RegisterPostBackControl(lb);
            }
        }

        protected void grdtrack_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "gridtackdownload")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkfiledownloadresend = row.FindControl("lnkfiledownloadresend") as LinkButton;
                try
                {
                    lblresult.Text = "";
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");

                    string docname = lnkfiledownloadresend.Text;

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string str = docname;
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (docname != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + docname);
                                Response.WriteFile(paths1);
                                //Response.End();
                                HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                                HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                                HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }

            }
        }

        protected void ddlsecfwd_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataSet dscontact = new DataSet();
            divsuggestedemail.Visible = true;
            ds = cmm.RunSpReturnDSParam("suggestedemail_offc", "PRASARNETConnectionString", new SqlParameter("@depttid", Convert.ToInt16(ddldeptfwd.SelectedValue))
                                                                                    , new SqlParameter("@secid", Convert.ToInt64(ddlsecfwd.SelectedValue)));
            dscontact = cmm.RunSpReturnDSParam("suggestedcontact_offc", "PRASARNETConnectionString", new SqlParameter("@depttid", Convert.ToInt16(ddldeptfwd.SelectedValue))
                                                                                    , new SqlParameter("@secid", Convert.ToInt64(ddlsecfwd.SelectedValue)));
            string Email = ds.Tables[0].Rows[0][0].ToString();
            string phone = dscontact.Tables[0].Rows[0][0].ToString();
            if (Email == "" || Email == "; ")
            {
                lblsuggestedemails.Text = "No (Office Specific) Suggestion for Emails";
            }
            else
                lblsuggestedemails.Text = "Suggested (Office Specific) Emails are: " + Email;

            if (phone == "")
            {
                lblsuggestedContact.Text = "No (Office Specific) Contact No. Available..";
            }
            else
                lblsuggestedContact.Text = "Station/Section/Office Contact No (Office Specific) : " + phone;
            txtemailforwarded.Focus();
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> EmailList(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            ds = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@email", prefixText),
                                                              new SqlParameter("@flag", "1"));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                Output.Add(ds.Tables[0].Rows[i][0].ToString());
            return Output;
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> EmailResend(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            ds = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@email", prefixText),
                                                              new SqlParameter("@flag", "2"));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                Output.Add(ds.Tables[0].Rows[i][2].ToString());
            return Output;
        }
        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            gridbindprimary_Search();
            ViewState["search"] = 1;
        }
        private void gridbindprimary_Search()
        {
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);
            if (Convert.ToInt16(Session["Usertype"]) == 14)
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 15),
                                                                                                           new SqlParameter("@GrievanceId", txtsearch.Text.Trim()),
                                                                                                           new SqlParameter("@Dealing_StnSecId", 33)
                                                                                                           , new SqlParameter("@DealingUsertypeId", 47)
                                                                                                           , new SqlParameter("@filetransferflag", 3));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 15),
                                                                                            new SqlParameter("@GrievanceId", txtsearch.Text.Trim()),
                                                                                            new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                            , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                            , new SqlParameter("@filetransferflag", 3));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }
    }
}
