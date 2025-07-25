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
    public partial class Grievance_Reports_OffciesAction : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet dsgrievances = new DataSet();
            dsgrievances = cmm.RunSpReturnDSParam("Gre_otherUser", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement"]))
                                                                                                                       , new SqlParameter("@flag", 1));
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24 || dsgrievances.Tables[0].Rows.Count > 0)
            {

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
                        if (dsgrievances.Tables[0].Rows.Count > 0)
                        {
                            AdminMenu.Visible = true;
                            StationSectionMenu.Visible = false;
                        }
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
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 9),
                                                                                        new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                        , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                        , new SqlParameter("@filetransferflag", 2));
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
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
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
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
            if (e.CommandName == "ResendEmail")
            {
                try
                {
                    divresendmail.Visible = true;
                    divofficereply.Visible = false;
                    txtemailresend.Focus();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;

                    Label primaryemail = row.FindControl("Label4") as Label;
                    Label CCemail = row.FindControl("Label22") as Label;

                    Label lblaction = row.FindControl("lblaction") as Label;
                    Label lblpbgson2 = row.FindControl("lblpbgson2") as Label;
                    Label lblrmkpbgs2 = row.FindControl("lblrmkpbgs2") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action_resend"] = greid;
                    ViewState["trnid_resend"] = lbltrnid.Text;
                    ViewState["resend"] = "yes";
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

                    Label35.Text = lblaction.Text;
                    Label13.Text = ViewState["referenceId_resend"].ToString();
                    Label17.Text = ViewState["name_resend"].ToString() + " & " + ViewState["mob_resend"].ToString();

                    Label19.Text = ViewState["G_REGDon_resend"].ToString();
                    Label23.Text = ViewState["GrievanceComp_resend"].ToString();
                    Label25.Text = lblrmkpbgs2.Text;
                    Label33.Text = lblpbgson2.Text;
                    txtemailresend.Text = "grievances@prasarbharati.gov.in";
                    txtemailresend.ReadOnly = true;
                    txtemailresend.CssClass = "select font2 widthofboxes1";
                    txtccresend.Text = CCemail.Text.Trim();
                    txtremkresend.Text = "";

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "View")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    Label lnkstatus = row.FindControl("lnkstatus") as Label;
                    Label lbldept2 = row.FindControl("lbldept2") as Label;
                    Label lblsection2 = row.FindControl("lblsection2") as Label;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action"] = greid;
                    ViewState["trnid"] = lbltrnid.Text;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 6),
                                                       new SqlParameter("@Gre_ID", greid));
                    Session["section"] = lblsection2.Text;
                    Session["Dept"] = lbldept2.Text;
                    Session["name_res"] = ds1.Tables[0].Rows[0][2];
                    Session["email_res"] = ds1.Tables[0].Rows[0][3];
                    Session["mob_res"] = ds1.Tables[0].Rows[0][4];
                    Session["referenceId_res"] = ds1.Tables[0].Rows[0][5];
                    Session["currentStatus"] = lnkstatus.Text;
                    Session["GrievanceComp"] = ds1.Tables[0].Rows[0][6];
                    Session["G_REGDon"] = ds1.Tables[0].Rows[0][7];
                    Session["gREuSERTYPE"] = ds1.Tables[0].Rows[0][9];
                    Session["station"] = ds1.Tables[0].Rows[0][10];

                    divofficereply.Visible = false;
                    Response.Redirect("GetaPDF_Grievance.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "fwddownload2")
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
            if (e.CommandName == "downloadpbgsForwarded")
            {
                lblresult.Text = "";
                string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblprevfilename = row.FindControl("lblprevfilename") as Label;
                string docname = lblprevfilename.Text;
                string paths = urlfixedpath + docname;
                FileInfo file = new FileInfo(paths);
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
                            Response.WriteFile(paths);
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
            if (e.CommandName == "takeaction")
            {
                lblresult.Text = "";
                divresendmail.Visible = false;
                divofficereply.Visible = true;
                txtreply.Focus();
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                Label lbltrnid = row.FindControl("lbltrnid") as Label;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                Label lblmob2 = row.FindControl("lblmob2") as Label;
                Label lblname2 = row.FindControl("lblname2") as Label;
                Label lblserialno = row.FindControl("lblserialno") as Label;
                Label PBGSRemarks_fwd = row.FindControl("lblrmkpbgs2") as Label;
                Label PBGSforwaredON = row.FindControl("lblpbgson2") as Label;//ForwardedOn
                LinkButton lblgrievancegrid = row.FindControl("lblgrievancegrid") as LinkButton;
                Label lblgrievanceregon = row.FindControl("lblgrievanceregon") as Label;

                int serialno_dealing_offcr = Convert.ToInt32(lblserialno.Text);
                int serialno_offcr_frmrecived = serialno_dealing_offcr - 1;

                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;

                ViewState["GREid_action"] = greid;
                ViewState["trnid"] = lbltrnid.Text;

                ds1 = cmm.RunSpReturnDSParam("pn18_gre_fetchUsertype", "PRASARNETConnectionString",
                                             new SqlParameter("@flag", 2));// Can also be fetch from Gridview data prevusertypeid and prevstnsecID

                txtEmail.Text = ds1.Tables[0].Rows[0][0].ToString();
                //txtEmail.Text = "hris@prasarbharati.gov.in";

                ViewState["PBGSusertypeid"] = ds1.Tables[0].Rows[0][2];
                ViewState["PBGSDealingOfficer"] = ds1.Tables[0].Rows[0][1];

                ViewState["Referenceid"] = lblrefid.Text.Trim();
                ViewState["nameofcomplainant"] = lblname2.Text;
                ViewState["mobofcomplainant"] = lblmob2.Text;
                ViewState["PBGSForwardedOn"] = PBGSforwaredON.Text;
                ViewState["PBGSForwardedRemark"] = PBGSRemarks_fwd.Text;
                ViewState["Grievance"] = lblgrievancegrid.Text;
                ViewState["Grev_RgdOn"] = lblgrievanceregon.Text;
                Label7.Text = ViewState["PBGSForwardedOn"].ToString();
                Label28.Text = ViewState["Referenceid"].ToString();
                Label42.Text = ViewState["nameofcomplainant"].ToString() + " & " + ViewState["mobofcomplainant"].ToString();
                Label47.Text = ViewState["Grev_RgdOn"].ToString();
                Label49.Text = ViewState["Grievance"].ToString();
                Label45.Text = ViewState["PBGSForwardedRemark"].ToString();
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
        }

        private void sendEmailforward(string appsub, string empEmail, string ccemail, string body, string sectionname, string nameofcomplainant)
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

                //ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                //                                   new SqlParameter("@flag", 6),
                //                                   new SqlParameter("@Gre_ID", greid));

                //string docname1 = Convert.ToString(ds1.Tables[0].Rows[0][0]);//Employee Uploaded
                //string paths2 = urlfixedpath + docname1;
                //FileInfo file2 = new FileInfo(paths2);
                //if (file2.Exists)
                //{
                //    var attachment1 = new System.Net.Mail.Attachment(paths2);
                //    message.Attachments.Add(attachment1);
                //    bd = "<br /> Please, find an attachment.";
                //}

                appBody += bd;
                appBody += "<br /><br />* This is system generated Email. Please do not reply on this.";
                appBody += "<br /><br />With Regards<br />";
                appBody += sectionname;
                SmtpClient client = new SmtpClient();
                client.Host = "203.122.51.200";
                client.Port = 25;

                //client.EnableSsl = true;
                //'client.Host = "mail.akashvani.in"
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
                ViewState["resend"] = null;
                lblresult.Text += "The E-Mail has been sent to " + empEmail + " & CC to " + ccemail;
            }
            catch (Exception ex)
            {
                lblresult.Text += " Unable to send an Email. <br/>" + ex.ToString();
                //+ ex.ToString() 
            }
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
                                string savefile = "GD_Reply" + max + "_" + dtetm + filetype;
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
        protected void grdcomdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdcomdetails, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onclick", string.Format("ChangeRowColor('{0}','{1}');", e.Row.ClientID, e.Row.RowIndex));

                Label lblpbgsfileuploadoutput = (Label)e.Row.FindControl("lblpbgsfileuploadoutput");
                Label lblfileuploadoutput = (Label)e.Row.FindControl("lblfileuploadoutput");
                LinkButton lblgrievancegrid = (LinkButton)e.Row.FindControl("lblgrievancegrid");
                LinkButton lnkviewdownloadpbgs = (LinkButton)e.Row.FindControl("lnkviewdownloadpbgs");
                LinkButton lnkview = (LinkButton)e.Row.FindControl("lnkview");

                Label lblcurrentstatus = (Label)e.Row.FindControl("lblcurrentstatus");
                LinkButton lnkaction = (LinkButton)e.Row.FindControl("lnkaction");
                Label lblaction = (Label)e.Row.FindControl("lblaction");
                LinkButton lnkresend_details = (LinkButton)e.Row.FindControl("lnkresend_details");
                LinkButton lnkresendemail = (LinkButton)e.Row.FindControl("lnkemailagain");
                LinkButton lblfilefwd2 = (LinkButton)e.Row.FindControl("lblfilefwd2");
                Label lblfilefwdupldoutput = (Label)e.Row.FindControl("lblfilefwdupldoutput");
                int currentstatus = Convert.ToInt32(lblcurrentstatus.Text);
                string fileupload = lblfileuploadoutput.Text;
                Label trnid = (Label)e.Row.FindControl("lbltrnid");

                int countresend = cmm.RunSPReturnCountParam("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@trnid", Convert.ToInt64(trnid.Text)),
                                                                                                                new SqlParameter("@flag", 2));
                if (countresend > 0)
                {
                    lnkresend_details.Text = "History of Re-Send Info./Notification to PBGS";
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

                if (Convert.ToInt16(lblpbgsfileuploadoutput.Text) == 0)
                {
                    lnkviewdownloadpbgs.ForeColor = System.Drawing.Color.Black;
                    lnkviewdownloadpbgs.Text = "None";
                    lnkviewdownloadpbgs.Enabled = false;
                    lnkviewdownloadpbgs.CssClass = "fontingrid nounderline";
                }
                else
                {
                    lnkviewdownloadpbgs.ForeColor = System.Drawing.Color.Blue;
                    lnkviewdownloadpbgs.Text = "Yes/Download";
                    lnkviewdownloadpbgs.Enabled = true;
                    lnkviewdownloadpbgs.CssClass = "fontingrid underline";
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

                if (currentstatus == 1)//Closed
                {
                    lblaction.ForeColor = System.Drawing.Color.Black;
                    lblaction.CssClass = "fontingrid";
                    lnkview.Visible = false;
                    lnkresendemail.Visible = false;
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
                    lnkaction.Text = "Action";
                    lnkaction.Enabled = true;
                    lnkaction.CssClass = "btn font2";
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //string IpAdress = cmm.GetIPAddressHostName();
                string ipaddress2 = cmm.GetIp_Priyank();
                if (FileUpload1.HasFile)
                {
                    int ret = uploaddoc(FileUpload1);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        int trnid = Convert.ToInt32(ViewState["trnid"]);
                        int greid = Convert.ToInt32(ViewState["GREid_action"]);

                        string grievance = ViewState["Grievance"].ToString();
                        string gre_regdon = ViewState["Grev_RgdOn"].ToString();
                        string filename = Convert.ToString(ViewState["GDfilename"]);
                        string reply = txtreply.Text.Trim();
                        string email = txtEmail.Text.Trim();
                        string nameofcomplainant = ViewState["nameofcomplainant"].ToString();
                        string mobnoofComplainant = ViewState["mobofcomplainant"].ToString();
                        string referenceid = ViewState["Referenceid"].ToString();
                        string Reply = txtreply.Text.Trim();
                        string PBGSforwardedon = ViewState["PBGSForwardedOn"].ToString();
                        string PBGSRemarks_fwd = ViewState["PBGSForwardedRemark"].ToString();

                        int PBGSusertypeid = Convert.ToInt32(ViewState["PBGSusertypeid"]);
                        int PBGSdealingOfficerId = Convert.ToInt32(ViewState["PBGSDealingOfficer"]);

                        string Subofemail = "Reply of Grievance raised by " + nameofcomplainant + " having Grievance Reference Id" + referenceid;
                        string bodyofemail = "";
                        bodyofemail += "The details and reply of the grievance, having Grievance Reference Id " + referenceid + " are given below: <br /> <br />";
                        bodyofemail += "<b>1. Grievance: <b>";
                        bodyofemail += grievance + "<br /><br />";
                        bodyofemail += "2. Grievance Registered On: ";
                        bodyofemail += gre_regdon + "<br /><br />";
                        bodyofemail += "3. Grievance Forwarded By PBGS on: ";
                        bodyofemail += PBGSforwardedon + "<br /><br />";
                        bodyofemail += "4. Remarks given by PBGS, while Forwarding: ";
                        bodyofemail += PBGSRemarks_fwd + "<br /><br />";
                        bodyofemail += "5. Reply by Office(to whom the Grievance has been forwarded by PBGS): ";
                        bodyofemail += reply + "<br /><br />";
                        //bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                        bodyofemail += "For further details and action on this grievance, kindly login to PrasarNet- http://prasarnet.prasarbharati.org";
                        string sectionname = Session["UserName"].ToString();

                        //int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
                        //int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

                        int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                                        , new SqlParameter("@remarks", reply)
                                                                                        , new SqlParameter("@emailidsend", txtEmail.Text.Trim())
                                                                                        , new SqlParameter("@ccmailto", txt_CC_Resend.Text.Trim())
                                                                                        , new SqlParameter("@filename", filename)
                                                                                        , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                        , new SqlParameter("@id", trnid)
                                                                                        , new SqlParameter("@ForwardUsertypeId", PBGSusertypeid)
                                                                                        , new SqlParameter("@Forward_stnsecID", PBGSdealingOfficerId)
                                                                                        , new SqlParameter("@Gre_ID", greid)
                                                                                        , new SqlParameter("@filetransferflag", 3));
                        if (i > 0)
                        {
                            if (txtEmail.Text != "")
                            {
                                sendEmailforward(Subofemail, txtEmail.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam");
                            }
                            txtEmail.Text = "";
                            txtreply.Text = "";
                            txt_CC_Resend.Text = "";
                            lblresult.Focus();
                            divofficereply.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Reply of the Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to PB-Grievance Officer/Section')", true);
                            gridbind(); lblresult.Focus();
                            DataSet dsmob = new DataSet();
                            string mob = "";
                            string datereply = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                            dsmob = cmm.RunSpReturnDSParam("PN18_Gre_Mobile", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                            foreach (DataRow row in dsmob.Tables[0].Rows)
                            {
                                mob = row["Mobile_No"].ToString();
                               // int retFU = sendMobileOTP(mob, referenceid, Session["UserName"].ToString());
                                string msgsend = "Received a new reply from " + Session["UserName"].ToString() + ", for a Grievance having Reference ID " + referenceid + ". Prasar Bharati";
                                Boolean retFU = cmm.sendMobileOTP1(mob, "1234", msgsend);
                            }
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {
                    int trnid = Convert.ToInt32(ViewState["trnid"]);
                    int greid = Convert.ToInt32(ViewState["GREid_action"]);

                    string grievance = ViewState["Grievance"].ToString();
                    string gre_regdon = ViewState["Grev_RgdOn"].ToString();
                    string reply = txtreply.Text.Trim();
                    string email = txtEmail.Text.Trim();
                    string nameofcomplainant = ViewState["nameofcomplainant"].ToString();
                    string mobnoofComplainant = ViewState["mobofcomplainant"].ToString();
                    string referenceid = ViewState["Referenceid"].ToString();
                    string Reply = txtreply.Text.Trim();
                    string PBGSforwardedon = ViewState["PBGSForwardedOn"].ToString();
                    string PBGSRemarks_fwd = ViewState["PBGSForwardedRemark"].ToString();

                    int PBGSusertypeid = Convert.ToInt32(ViewState["PBGSusertypeid"]);
                    int PBGSdealingOfficerId = Convert.ToInt32(ViewState["PBGSDealingOfficer"]);

                    string Subofemail = "Reply of Grievance raised by " + nameofcomplainant + " having Grievance Reference Id" + referenceid;
                    string bodyofemail = "";
                    bodyofemail += "The details and reply of the grievance, having Grievance Reference Id " + referenceid + " are given below: <br /> <br />";
                    bodyofemail += "<b>1. Grievance: <b>";
                    bodyofemail += grievance + "<br /><br />";
                    bodyofemail += "2. Grievance Registered On: ";
                    bodyofemail += gre_regdon + "<br /><br />";
                    bodyofemail += "3. Grievance Forwarded By PBGS on: ";
                    bodyofemail += PBGSforwardedon + "<br /><br />";
                    bodyofemail += "4. Remarks given by PBGS, while Forwarding: ";
                    bodyofemail += PBGSRemarks_fwd + "<br /><br />";
                    bodyofemail += "5. Reply by Office(to whom the Grievance has been forwarded by PBGS): ";
                    bodyofemail += reply + "<br /><br />";
                    //bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                    bodyofemail += "For further details and action on this grievance, kindly login into PrasarNet- http://prasarnet.prasarbharati.org";
                    string sectionname = Session["UserName"].ToString();

                    //int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
                    //int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

                    int i = cmm.RunSP("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 7)
                                                                , new SqlParameter("@remarks", reply)
                                                                , new SqlParameter("@emailidsend", txtEmail.Text.Trim())
                                                                , new SqlParameter("@ccmailto", txt_CC_Resend.Text.Trim())
                                                                , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                , new SqlParameter("@id", trnid)
                                                                , new SqlParameter("@ForwardUsertypeId", PBGSusertypeid)
                                                                , new SqlParameter("@Forward_stnsecID", PBGSdealingOfficerId)
                                                                , new SqlParameter("@Gre_ID", greid)
                                                                , new SqlParameter("@filetransferflag", 3));
                    if (i > 0)
                    {
                        if (txtEmail.Text != "")
                        {
                            sendEmailforward(Subofemail, txtEmail.Text.Trim(), txt_CC_Resend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam");
                        }
                        txtEmail.Text = "";
                        txtreply.Text = "";
                        txt_CC_Resend.Text = "";
                        divofficereply.Visible = false;
                        lblresult.Focus();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Reply of the Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to PB-Grievance Officer/Section')", true);
                        gridbind(); lblresult.Focus();
                        DataSet dsmob = new DataSet();
                        string mob = "";
                        string datereply = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                        dsmob = cmm.RunSpReturnDSParam("PN18_Gre_Mobile", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                        foreach (DataRow row in dsmob.Tables[0].Rows)
                        {
                            mob = row["Mobile_No"].ToString();
                           //int retwoFU = sendMobileOTP(mob, referenceid, Session["UserName"].ToString());
                            string msgsend = "Received a new reply from " + Session["UserName"].ToString() + ", for a Grievance having Reference ID " + referenceid + ". Prasar Bharati";
                            Boolean retwoFU = cmm.sendMobileOTP1(mob, "1234", msgsend);
                           // Recieved a new reply from {#var#}, for a Grievance having Reference ID {#var#}. Prasar Bharati

                        }
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
        //public int sendMobileOTP(string Mobstring, string GID, string office)
        //{
        //    try
        //    {
        //        //ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(AcceptAllCertifications);

        //        string bodyofmsg = "A new reply has been received, for a Grievance having Reference ID " + GID + " from the " + office + ". For more details and action, Please login into PrasarNet (https://prasarnet.prasarbharati.org).";
        //        //string bodyofmsg = "A new grievance has been received, raised by an Employee, having Grievance Reference ID: " + GID + "& registered on " + timestring + ". For more details and action, please login into PrasarNet.";
        //        byte[] buffer = Encoding.ASCII.GetBytes("username=prasarbharati&pin=prasarmsg@123&message=" + bodyofmsg + "&mnumber=" + Mobstring + "&signature=PRASAR");
        //        string sURL;
        //        sURL = ("http://bhashsms.com/api/sendmsg.php?user=prasarbharati&pass=prasarmsg@123&sender=PRASAR&phone=" + Mobstring + "&text=" + bodyofmsg + "&priority=ndnd&stype=normal");


        //        HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(sURL);

        //        WebReq.Method = "POST";

        //        WebReq.ContentType = "application/x-www-form-urlencoded";

        //        WebReq.ContentLength = buffer.Length;
        //        using (Stream postStream = WebReq.GetRequestStream())
        //        {
        //            postStream.Write(buffer, 0, buffer.Length);
        //            System.Threading.Thread.Sleep(50);
        //        }
        //        //lblmobotpmsg.Text = "<br /><br />OTP(Mobile) has been sent to you via sms on " + Mobstring + "<br /><br />";
        //        return 1;
        //    }

        //    catch (Exception ex)
        //    {

        //        //lblmobotpmsg.Text = "<br /><br /> Oopps.. Unable to send OTP to your Mobile." + ex.ToString() + "<br /><br />";
        //        return 0;
        //    }

        //}
        protected void Button2_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtreply.Text = "";
            txt_CC_Resend.Text = "";
            divofficereply.Visible = false;
            grdcomdetails.Focus();
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

                        string bodyofemail = "";
                        string Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;
                        bodyofemail += "The details and reply of the grievance, having Grievance Reference Id " + referenceid + " are given below: <br /> <br />";
                        bodyofemail += "<b>1. Grievance: <b>";
                        bodyofemail += Grievance + "<br /><br />";
                        bodyofemail += "2. Grievance Registered On: ";
                        bodyofemail += G_RegdOn + "<br /><br />";
                        bodyofemail += "3. Grievance Forwarded By PBGS on: ";
                        bodyofemail += Label33.Text + "<br /><br />";
                        bodyofemail += "4. Remarks given by PBGS, while Forwarding: ";
                        bodyofemail += Label25.Text + "<br /><br />";
                        bodyofemail += "5. Action taken by Office(to whom the Grievance has been forwarded by PBGS): ";
                        bodyofemail += Label35.Text + "<br /><br />";
                        bodyofemail += "6. Remarks given by office while re-mailing this information: ";
                        bodyofemail += txtremkresend.Text.Trim() + "<br /><br />";
                        //bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                        bodyofemail += "For further details and action on this grievance, kindly login to PrasarNet- http://prasarnet.prasarbharati.org";
                        string sectionname = Session["UserName"].ToString();
                        int usertypeid = Convert.ToInt32(Session["Usertype"]);
                        int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);
                        int i = cmm.RunSP("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailto", txtemailresend.Text.Trim())
                                                                                      , new SqlParameter("@ccto", txtccresend.Text.Trim())
                                                                                      , new SqlParameter("@attachedfilename", filename)
                                                                                      , new SqlParameter("@Ipadress", ipaddress2)
                                                                                      , new SqlParameter("@trnid", Convert.ToInt32(ViewState["trnid_resend"]))
                                                                                      , new SqlParameter("@createdbyusertpeid", usertypeid)
                                                                                      , new SqlParameter("@createdbyid", stn_secid));

                        if (i > 0)
                        {
                            sendEmailforward(Subofemail, txtemailresend.Text.Trim(), txtccresend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam");
                            txtemailresend.Text = "";
                            txtccresend.Text = "";
                            txtremkresend.Text = "";
                            FileUpload3.Attributes.Clear();
                            divresendmail.Visible = false;
                            divofficereply.Visible = false;
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
                    string remarks = txtremkresend.Text;
                    string emailofcomplainant = ViewState["email_resend"].ToString();
                    string nameofcomplainant = ViewState["name_resend"].ToString();
                    string mobnoofComplainant = ViewState["mob_resend"].ToString();
                    string referenceid = ViewState["referenceId_resend"].ToString();
                    string Grievance = ViewState["GrievanceComp_resend"].ToString();
                    string G_RegdOn = ViewState["G_REGDon_resend"].ToString();

                    string bodyofemail = "";
                    string Subofemail = "Regarding Grievance raised by " + nameofcomplainant + " with Grievance Reference Id " + referenceid;
                    bodyofemail += "The details and reply of the grievance, having Grievance Reference Id " + referenceid + " are given below: <br /> <br />";
                    bodyofemail += "<b>1. Grievance: <b>";
                    bodyofemail += Grievance + "<br /><br />";
                    bodyofemail += "2. Grievance Registered On: ";
                    bodyofemail += G_RegdOn + "<br /><br />";
                    bodyofemail += "3. Grievance Forwarded By PBGS on: ";
                    bodyofemail += Label33.Text + "<br /><br />";
                    bodyofemail += "4. Remarks given by PBGS, while Forwarding: ";
                    bodyofemail += Label25.Text + "<br /><br />";
                    bodyofemail += "5. Action taken by Office(to whom the Grievance has been forwarded by PBGS): ";
                    bodyofemail += Label35.Text + "<br /><br />";
                    bodyofemail += "6. Remarks given by office while re-mailing this information: ";
                    bodyofemail += txtremkresend.Text.Trim() + "<br /><br />";
                    //bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                    bodyofemail += "For further details and action on this grievance, kindly login to PrasarNet- http://prasarnet.prasarbharati.org";
                    string sectionname = Session["UserName"].ToString();
                    int usertypeid = Convert.ToInt32(Session["Usertype"]);
                    int stn_secid = Convert.ToInt32(Session["Uidmanagement"]);

                    int i = cmm.RunSP("PN18_GRE_resend_Email", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                  , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailto", txtemailresend.Text.Trim())
                                                                                  , new SqlParameter("@ccto", txtccresend.Text.Trim())
                                                                                  , new SqlParameter("@Ipadress", ipaddress2)
                                                                                  , new SqlParameter("@trnid", Convert.ToInt32(ViewState["trnid_resend"]))
                                                                                  , new SqlParameter("@createdbyusertpeid", usertypeid)
                                                                                  , new SqlParameter("@createdbyid", stn_secid));

                    if (i > 0)
                    {
                        sendEmailforward(Subofemail, txtemailresend.Text.Trim(), txtccresend.Text.Trim(), bodyofemail, sectionname, "Sir/Madam");
                        txtemailresend.Text = "";
                        txtccresend.Text = "";
                        txtremkresend.Text = "";
                        FileUpload3.Attributes.Clear();
                        divresendmail.Visible = false;
                        divofficereply.Visible = false;
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

        protected void grdtrack_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.FindControl("lnkfiledownloadresend") as LinkButton;
                if (lb != null)
                    ScriptManager.GetCurrent(this).RegisterPostBackControl(lb);
            }
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
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 15),
                                                                                        new SqlParameter("@GrievanceId", txtsearch.Text.Trim()),
                                                                                        new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                        , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                        , new SqlParameter("@filetransferflag", 2));
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }

        protected void lnksearch_Click(object sender, EventArgs e)
        {

        }

        protected void grdresendmails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "gridresenddownload")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lblattachedfile = row.FindControl("lblattachedfile") as LinkButton;
                try
                {
                    lblresult.Text = "";
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");

                    string docname = lblattachedfile.Text;

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

        protected void grdresendmails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = e.Row.FindControl("lblattachedfile") as LinkButton;
                if (lb != null)
                    ScriptManager.GetCurrent(this).RegisterPostBackControl(lb);
            }
        }
    }
}