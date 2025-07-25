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
    public partial class OrdernCircular : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {

                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    ViewState["search"] = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station section
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                        {
                            DataSet dsccw = new DataSet();
                            dsccw = cmm.RunSpReturnDSParam("PN18_CCW_Offices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "1"));

                            if (Convert.ToInt32(Session["Orgid"]) == 2 || Convert.ToInt32(Session["Orgid"]) == 3)// Only DD and AIR can fill the Monthly Reports
                            {
                                divmonthlystationreportsforadg.Visible = false;
                                if (dsccw.Tables[0].Rows.Count == 0)
                                {
                                    divmonthlystationreports.Visible = true;

                                }
                                else
                                {
                                    divmonthlystationreports.Visible = false;
                                }
                            }
                            else
                            {
                                DataSet dsadg = new DataSet();
                                dsadg = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                                new SqlParameter("@flag", "1"));
                                if (dsccw.Tables[0].Rows.Count == 0)
                                {
                                    divmonthlystationreportsforadg.Visible = true;

                                }
                                else
                                {
                                    divmonthlystationreportsforadg.Visible = false;
                                }
                                divmonthlystationreports.Visible = false;
                            }

                        }

                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                        {
                            divmonthlystationreports.Visible = false;
                            divmonthlystationreportsforadg.Visible = false;
                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
                            {
                                divlandrecords.Visible = true;
                            }
                            else
                            {
                                divlandrecords.Visible = false;
                            }
                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 245))
                            {
                                divboradmeetingrecordsUpload.Visible = true;
                                //divboardmeetingreport.Visible = true;
                            }
                            else
                            {
                                divboradmeetingrecordsUpload.Visible = false;
                                //divboardmeetingreport.Visible = false;
                            }
                        }
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// Management
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
                        if (Convert.ToInt16(Session["Usertype"]) == 28)
                        {
                            divstatementsmanagement.Visible = true;
                            divRRReports_UM.Visible = true;
                        }
                        else
                        {
                            divstatementsmanagement.Visible = false;
                            divRRReports_UM.Visible = false;
                        }
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else//14,15,16,18,19
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
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                    string currentDate = DateTime.Today.ToShortDateString();
                    //cValFrom.ValueToCompare = currentDate;
                    cValTo.ValueToCompare = currentDate;
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddldoctyp, "PN18_DocTypen", "Doc_Type", "Docid", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
                    cmm.bindDDL(ddlorg, "PN18_orgProc", "Abbreviation", "OrganizationId", "--All--", "PRASARNETConnectionString");

                    bindrepeater();
                    bindgrd();
                    grddoc.Focus();
                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void bindrepeater()
        {
            DataSet dsrep = new DataSet();
            dsrep = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            RepDetails.DataSource = dsrep;
            RepDetails.DataBind();
        }
        private void bindgrd()
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        private void bindgrdcatwise(int doctypeid)
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 8)
                                                                                           , new SqlParameter("@doctypeid", doctypeid));
            grddoc.DataSource = ds;
            grddoc.DataBind();
            grddoc.PageIndex = 0;
        }
        protected void lnksearch_Click(object sender, EventArgs e)
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            //ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            txttodate.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;
            uploadedbyrow.Visible = false;

            divsrch1.Visible = false;
            divsearch2.Visible = true;
            divcat.Visible = false;
            divgrd.Visible = true;
            ViewState["search"] = 1;
            HideNotes();
            divshow.Visible = false;
            Label5.Visible = false;
            grddoc.PageIndex = 0;
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            //ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            txttodate.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;
            uploadedbyrow.Visible = false;

            divsrch1.Visible = true;
            divsearch2.Visible = false;
            divcat.Visible = true;
            divgrd.Visible = true;
            grddoc.PageIndex = 0;
            bindgrd();
            ViewState["search"] = 0;
            visNotes();
            divshow.Visible = false;
            Label5.Visible = false;


        }
        private void clear()
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;

        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            if (Convert.ToInt16(ViewState["search"]) == 1)
            {
                bndgrid_search();
            }
            else if (Convert.ToInt16(ViewState["search"]) == 21)
            {
                bindgrdcatwise(Convert.ToInt32(ViewState["catid"]));
            }
            else
            {
                bindgrd();
            }
        }
        private int fileaccesslog(Int64 Docid, string Pageadd, string ip, string v_down, Boolean issuccessful,int stn_sec_emp)
        {
            int i = cmm.RunSP("order_circular_fileaccessLog", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                                         , new SqlParameter("@stn_secid", stn_sec_emp)
                                                                                                         , new SqlParameter("@orderid", Docid)
                                                                                                         , new SqlParameter("@page", Pageadd)
                                                                                                         , new SqlParameter("@ip", ip)
                                                                                                         , new SqlParameter("@download_view", v_down)
                                                                                                         , new SqlParameter("@issuccessful", issuccessful)
                                                                                                         , new SqlParameter("@flag", 1));
            return i;
        }
        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                //try
                //{
                int stn_sec_emp = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 10)
                {
                    stn_sec_emp = Convert.ToInt32(Session["empid"]);
                }
                else
                {
                    stn_sec_emp = Convert.ToInt32(Convert.ToInt32(Session["Station_SectionID"]));
                }
                string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                string ip = cmm.GetIp_Priyank();
                DataSet dsurl = new DataSet();
                dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                       , new SqlParameter("@flag", 1));
                string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                DataSet ds2 = new DataSet();
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 4),
                                                   new SqlParameter("@docid", Docid));

                ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", Convert.ToInt32(ds1.Tables[0].Rows[0][4])),
                                                                                           new SqlParameter("@flag", 2));
                //if (ds2.Tables[0].Rows.Count != 0)
                //{
                string paths1 = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                FileInfo file = new FileInfo(paths1);
                if (file.Exists)
                {
                    string paths = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                    Session["showDocFilePath"] = paths;
                    string str = ds1.Tables[0].Rows[0][9].ToString();
                    string downloadstr = ds1.Tables[0].Rows[0][5].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        //Response.Redirect(paths);
                        if (ds1.Tables[0].Rows[0][9].ToString() != "")
                        {
                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", true, stn_sec_emp);
                            //string strURL = @"http://192.168.1.xxx/" + sDocumento;
                            WebClient req = new WebClient();// Added on 29May2018 due becos in meeting eith ADG , it has been instructed that the repository should be come from AIRNET Web Server
                            HttpResponse response = HttpContext.Current.Response;
                            response.Clear();
                            response.ClearContent();
                            response.ClearHeaders();
                            response.Buffer = true;
                            response.ContentType = "application/octet-stream";
                            response.AddHeader("Content-Disposition", "attachment;filename=\"" + str + "\"");
                            //Response.WriteFile(paths);
                            byte[] data = req.DownloadData(paths);
                            response.BinaryWrite(data);
                            response.End();

                        }
                        else
                        {
                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }
                    }
                    else
                    {
                        Session["dash/order"] = 2;
                        int ret = fileaccesslog(Docid, Pageadd, ip, "View HTML Doc", true, stn_sec_emp);
                        Response.Redirect("showDocument.aspx");
                    }
                }
                else
                {
                    int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
                //}
                //catch (Exception ex)
                //{
                //    string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                //    string ip = cmm.GetIp_Priyank();
                //    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                //    Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                //    int ret = fileaccesslog(Docid, Pageadd, ip, "Download_Exception", false);
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issue(s) occured while downloading a document.Try Again!!');", true);

                //}
            }

        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlorg.SelectedIndex != 0)
            {
                uploadedbyrow.Visible = true;
                cmm.bindDDLWidParam(ddluploadedby, "PN18_usertypeproc", "Usertype", "Usertypeid", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 3),
                                                                                                                                              new SqlParameter("@orgid", Convert.ToInt32(ddlorg.SelectedValue)));
            }
            else
            {
                uploadedbyrow.Visible = false;
                stationrow.Visible = false;
                SectionRow.Visible = false;
            }
        }

        protected void ddluploadedby_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" || ddluploadedby.SelectedValue == "24") //Station
            {
                stationrow.Visible = true;
                SectionRow.Visible = false;
                cmm.bindDDLWidParam(ddlstation, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", "--All--", new SqlParameter("@orgId", ddlorg.SelectedValue));

            }
            else if (ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Section
            {
                stationrow.Visible = false;
                SectionRow.Visible = true;
                cmm.bindDDLWidParam(ddlsection, "PN18_SectionProc", "secname", "userID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 2),
                                                                                                                                  new SqlParameter("@orgId", ddlorg.SelectedValue));
            }
            else //others
            {
                stationrow.Visible = false;
                SectionRow.Visible = false;
            }
        }
        private void bndgrid_search()
        {
            string title = txttitle.Text.Trim();
            DateTime? dated = null;
            string datedfrom = "", datedtonew = "";
            DateTime? datedto = null;


            string order = txtorder.Text.Trim();
            string fileno = txtfileno.Text.Trim();
            int stnid = 0;
            int secid = 0;
            int orgid = 0;
            int utypid = 0;
            int dtypid = 0;
            if (title == "")
            {
                title = "None";
            }


            if (txtdatedoc.Text != "")
                dated = DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //txtdatedoc.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][8].ToString()).ToShortDateString().ToString();
            if (txttodate.Text != "")
                datedto = DateTime.ParseExact(txttodate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            if (order == "")
            {
                order = "None";
            }
            if (fileno == "")
            {
                fileno = "None";
            }

            if (ddlorg.SelectedItem.Text != "--All--")
            {
                orgid = Convert.ToInt32(ddlorg.SelectedValue);
                if (ddluploadedby.SelectedItem.Text != "--All--")
                {
                    utypid = Convert.ToInt32(ddluploadedby.SelectedValue);
                }
            }

            //if (ddluploadedby.SelectedItem.Text != "--All--")
            //{
            //    utypid = Convert.ToInt32(ddluploadedby.SelectedValue);
            //}

            if (ddldoctyp.SelectedItem.Text != "--All--")
            {
                dtypid = Convert.ToInt32(ddldoctyp.SelectedValue);
            }
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" || ddluploadedby.SelectedValue == "24") //Station
            {
                if (ddlstation.SelectedItem.Text != "--All--")
                {
                    stnid = Convert.ToInt32(ddlstation.SelectedValue);
                }
            }
            else if (ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Section
            {
                if (ddlsection.SelectedItem.Text != "--All--")
                {
                    secid = Convert.ToInt32(ddlsection.SelectedValue);
                }
            }
            //cmm.RunSpReturnDSParam(
            ds = cmm.RunSpReturnDSParam("PN18_documentsFilter", "PRASARNETConnectionString", new SqlParameter("@orgid", orgid),
                                                                                   new SqlParameter("@usertypeid", utypid),
                                                                                   new SqlParameter("@doctypeid", dtypid),
                                                                                   new SqlParameter("@doctitle", title),
                                                                                   new SqlParameter("@docdated", dated),
                                                                                   new SqlParameter("@docdatedto", datedto),
                                                                                   new SqlParameter("@orderNo", order),
                                                                                   new SqlParameter("@fileNo", fileno),
                                                                                   new SqlParameter("@stationid", stnid),
                                                                                   new SqlParameter("@sectionid", secid));


            grddoc.DataSource = ds;
            grddoc.DataBind();
            divgrd.Visible = true;
            grddoc.Focus();
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            bndgrid_search();
            ViewState["search"] = 1;
            grddoc.Focus();
            HideNotes();
            grddoc.PageIndex = 0;
        }

        protected void RepDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "catsearch")
            {
                ViewState["search"] = 21;
                LinkButton lnkelg = (LinkButton)e.Item.FindControl("lnkelg");
                divshow.Visible = true;
                lblcat.Text = lnkelg.Text;
                Label5.Visible = true;
                Label lbldoccatid = (Label)e.Item.FindControl("lbldoccatid");
                ViewState["catid"] = lbldoccatid.Text;
                bindgrdcatwise(Convert.ToInt32(lbldoccatid.Text));
            }
        }

        protected void lnkshowall_Click(object sender, EventArgs e)
        {
            divshow.Visible = false;
            bindgrd();


        }
        public void HideNotes()
        {
            foreach (RepeaterItem ri in RepDetails.Items)
                ri.FindControl("lnkelg").Visible = false;
        }
        public void visNotes()
        {
            foreach (RepeaterItem ri in RepDetails.Items)
                ri.FindControl("lnkelg").Visible = true;
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void grddoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbluplon2 = (Label)e.Row.FindControl("lbluplon2");
                DateTime todaydate = DateTime.Now.Date;
                DateTime uploadedon = Convert.ToDateTime(lbluplon2.Text.Trim()).Date;
                if (uploadedon == todaydate)
                {
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FEF5E7");
                }
            }
        }
    }
    //ds = cmm.RunSpReturnDSParam("IT_orgStation", new SqlParameter("@orgId", ddlorg_add_details.SelectedValue));
}