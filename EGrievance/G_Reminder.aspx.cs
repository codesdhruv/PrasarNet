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

namespace PrasarNet.EGrievance
{
    public partial class G_Reminder : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../Logout.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                if (!IsPostBack)
                {
                    DataSet dspbb = new DataSet();
                    dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                  , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                    if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
                    {
                        divmeetingrecordadmin.Visible = true;
                    }
                    else
                    {
                        divmeetingrecordadmin.Visible = false;
                    }
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
                Label1.Text = Convert.ToString(Session["UserName"]);
                //   gridbind();

            }

            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        private void gridbind()
        {
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

            if (Convert.ToInt16(Session["Usertype"]) == 14)
            {
                ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 5),
                                                                                     new SqlParameter("@Dealing_StnSecId", 33)
                                                                                     , new SqlParameter("@DealingUsertypeId", 47)
                                                                                     , new SqlParameter("@filetransferflag", 1));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 5),
                                                                                    new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                    , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                    , new SqlParameter("@filetransferflag", 1));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }

        protected void lnkComplainantRem_Click(object sender, EventArgs e)
        {
            divinfogrd_complainant.Visible = true;
            gridbind();
        }

        protected void lnkSend_RemforStation_Click(object sender, EventArgs e)
        {
            divinfogrd_complainant.Visible = false;
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {

        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {

        }
        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            gridbind();
            grdcomdetails.Focus();
        }
        protected void grdHOR_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHOR.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                     , new SqlParameter("@greid", Convert.ToInt32(ViewState["greid_popup_HOR"])));
            grdHOR.DataSource = ds;
            grdHOR.DataBind();
        }
        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "History")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                ViewState["greid_popup_HOR"] = greid;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                Label lblname2 = row.FindControl("lblname2") as Label;
                lblhorGRErefid.Text = lblrefid.Text;
                lblnamerem2.Text = lblname2.Text;
                ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                     , new SqlParameter("@greid", greid));
                grdHOR.DataSource = ds;
                grdHOR.DataBind();
                //Display the ModalPopup.
                mpehor.Show();
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
                ////Reference the GridView Row using RowIndex from CommandArgument.
                //GridViewRow selectedRow = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];

                ////Fetch values from BoundField columns.
                //lblId.Text = selectedRow.Cells[0].Text;
                //lblName.Text = selectedRow.Cells[1].Text;

                ////Fetch values from TemplateField columns.
                //lblCountry.Text = (selectedRow.FindControl("lblCountry") as Label).Text;
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
                //StringBuilder sb = new StringBuilder();
                //sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#currentdetail').modal('show');");
                //sb.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModalScript", sb.ToString(), false);
            }


            if (e.CommandName == "ResendEmail")
            {
                try
                {
                    mperemindersend.Show();
                    txtemailresend.Enabled = true;
                    ViewState["Comp_offc"] = "office";
                    txtemailresend.Focus();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;

                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action_resend"] = greid;
                    ViewState["trnid_resend"] = lbltrnid.Text;

                    DataSet dslastactioninfo = new DataSet();
                    string primaryemail = "";
                    string CCemail = "";
                    int stnid = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                        Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                        Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                        Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//Stn or sec
                    {
                        stnid = Convert.ToInt32(Session["Station_SectionID"]);
                    }
                    else
                    {
                        stnid = Convert.ToInt32(Session["Uidmanagement"]);
                    }

                    dslastactioninfo = cmm.RunSpReturnDSParam("PN21_grevience_pnding_withwhom", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 2),
                                                       new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                       new SqlParameter("@stnid", stnid),
                                                       new SqlParameter("@status", 3),
                                                       new SqlParameter("@greid", greid));
                    primaryemail = dslastactioninfo.Tables[0].Rows[0][0].ToString();
                    CCemail = dslastactioninfo.Tables[0].Rows[0][1].ToString();

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
                    txtemailresend.Text = primaryemail;
                    txt_CC_Resend.Text = CCemail;
                    txtremkresend.Text = "";
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }

            if (e.CommandName == "takeaction")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    int updt = cmm.RunSP("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                            , new SqlParameter("@greid", greid));
                    if (updt == 1)
                    {
                        DataSet dslast = new DataSet();
                        dslast = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 2));
                        if (dslast.Tables[0].Rows.Count > 0)
                        {
                            string gre_ref_last = dslast.Tables[0].Rows[0][3].ToString();
                            string date_last = dslast.Tables[0].Rows[0][2].ToString();
                            string greid_last = dslast.Tables[0].Rows[0][0].ToString();
                            //lnklastvisited.Text = gre_ref_last + " on " + date_last;
                            //hid_last_vis_id.Value = greid_last;
                        }
                        //lblresult.Text = "";
                        //divresendmail.Visible = false;
                        //divresorfor.Visible = true;
                        //// divresorfor.Focus();
                        //CheckBoxList1.Focus();

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
                        //CheckBoxList1.ClearSelection();
                        //divforwardedaction.Visible = false;
                        //divresolvedaction.Visible = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Please Try Again!!');", true);
                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "fwddownload2")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkview = row.FindControl("lnkview") as LinkButton;
                try
                {
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                    DataSet ds1 = new DataSet();
                    // GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
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
                //lnkview.Focus();
            }

            if (e.CommandName == "download")
            {

                try
                {
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
                        //if (ds2.Tables[0].Rows.Count != 0)
                        //{
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        //Response.Redirect(paths);
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            //Response.Redirect(paths);
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                //Session["DPCLOpath"] = paths;
                                //Response.Redirect("DPC_LO_DocView.aspx", false);
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                // Response.End();
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
        protected void txtemailresend_TextChanged(object sender, EventArgs e)
        {
            if (txtemailresend.Text != "")
            {
                ds = cmm.RunSpReturnDSParam("Email_List", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                                , new SqlParameter("@email", txtemailresend.Text.Trim()));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblresendinfo_stn.Text = ds.Tables[0].Rows[0][1].ToString() + " " + ds.Tables[0].Rows[0][3].ToString();
                }
                else
                {
                    lblresendinfo_stn.Text = "";
                }

            }
            else
            {
                lblresendinfo_stn.Text = "";
            }
            txt_CC_Resend.Focus();
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
        protected void grdcomdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int greid = Convert.ToInt32(grdcomdetails.DataKeys[e.Row.RowIndex].Values[0]);
                e.Row.Attributes.Add("onclick", string.Format("ChangeRowColor('{0}','{1}');", e.Row.ClientID, e.Row.RowIndex));
                Label lblfileuploadoutput = (Label)e.Row.FindControl("lblfileuploadoutput");
                LinkButton lblgrievancegrid = (LinkButton)e.Row.FindControl("lblgrievancegrid");
                Label lnkstatus = (Label)e.Row.FindControl("lnkstatus");
                Label lblresolvedflag = (Label)e.Row.FindControl("lblresolvedflag");
                Label grerefid = (Label)e.Row.FindControl("lblrefid");
                Label lblfilefwdupldoutput = (Label)e.Row.FindControl("lblfilefwdupldoutput");
                LinkButton lblfilefwd2 = (LinkButton)e.Row.FindControl("lblfilefwd2");
                Label lblmsgforpbgs = (Label)e.Row.FindControl("lblmsgforpbgs");
                Boolean res = Convert.ToBoolean(lblresolvedflag.Text);
                string fileupload = lblfileuploadoutput.Text;
                Label lblcurrentstatus = (Label)e.Row.FindControl("lblcurrentstatus");
                int currentstatus = Convert.ToInt32(lblcurrentstatus.Text);
                LinkButton lnkaction = (LinkButton)e.Row.FindControl("lnkaction");
                LinkButton lnkresend_details = (LinkButton)e.Row.FindControl("lnkresend_details");
                LinkButton lnkresendemail = (LinkButton)e.Row.FindControl("lnkresendemail");
                Label trnid = (Label)e.Row.FindControl("lbltrnid");

                Label lblaction = (Label)e.Row.FindControl("lblaction");
                int stnid = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                        Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                        Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                        Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//Stn or sec
                {
                    stnid = Convert.ToInt32(Session["Station_SectionID"]);
                }
                else
                {
                    stnid = Convert.ToInt32(Session["Uidmanagement"]);
                }
                ds = cmm.RunSpReturnDSParam("PN21_grevience_pnding_withwhom", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 1),
                                                   new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                   new SqlParameter("@stnid", stnid),
                                                   new SqlParameter("@status", 2),
                                                   new SqlParameter("@greid", greid));
                if (ds.Tables[0].Rows.Count == 0)//Grievance is not currrently with PBGS/LoginUser
                {
                    lnkresendemail.Visible = true;
                    lnkaction.Visible = false;
                    lblmsgforpbgs.Text = "Grievance is pending at Station/Section Level";
                }
                else
                {
                    lnkresendemail.Visible = false;
                    lnkaction.Visible = false;
                    lblmsgforpbgs.Text = "Grievance is pending at PBGS Level.";
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

            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Grievance_Reports_Action.aspx");
        }
    }
}