

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
    public partial class G_SubGrievances : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        int totalGrievance = 0;
        int NoofGrievancesFwd_res = 0;
        int NoOfGr_pendingforfwd = 0, NoofGR_resolved = 0, Noof_ReplyRvd_Pending = 0, Gr_Pending_atstn = 0, NoofGR_resolved_PBGS = 0, NoofGR_resolved_PBGS_stn = 0, totalpending = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../Logout.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                Page.Form.Attributes.Add("enctype", "multipart/form-data");
                if (!IsPostBack)
                {
                    ViewState["serach_Gr"] = 0;
                    totalGrievance = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                    NoofGrievancesFwd_res = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 3));
                    NoOfGr_pendingforfwd = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                    NoofGR_resolved = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 2));

                    NoofGR_resolved_PBGS = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
                    NoofGR_resolved_PBGS_stn = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
                    Noof_ReplyRvd_Pending = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 8));
                    Gr_Pending_atstn = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 6));

                    totalpending = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 9));


                    btntotalGrievance.Text = "Total Grievance(s) Received: " + totalGrievance.ToString();
                    btn_initialAction.Text = "Intial Action Taken By PBGS inc Fwd/Res: " + NoofGrievancesFwd_res.ToString();
                    btn_pending_PBGS.Text = "Grievance(s) Pending for Initial Action at PBGS: " + NoOfGr_pendingforfwd.ToString();
                    btnresolved.Text = "Total Grievance(s) Resolved/Closed: " + NoofGR_resolved.ToString();

                    btn_GR_res_PBGS_IstStep.Text = "Grievance(s) Closed by PBGS during Ist Step: " + NoofGR_resolved_PBGS.ToString();
                    btn_gr_res_afterstn.Text = "Grievance(s) Closed by PBGS after Stn/Sec Reply: " + NoofGR_resolved_PBGS_stn.ToString();
                    // btn_reply_pending_PBGS.Text = "Action Pending for Replies Rcvd. by PBGS: " + Noof_ReplyRvd_Pending.ToString();
                    //btn_Action_Pending_stn.Text = "Action Pending at Station Level: " + Gr_Pending_atstn.ToString();
                    btn_reply_pending_PBGS.Text = "Action Pending for Replies Rcvd. by PBGS: 3";
                    btn_Action_Pending_stn.Text = "Action Pending at Station Level: 476";
                    btnTotalpending.Text = "Total Grievance(s) Pending : " + totalpending.ToString();

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

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            if (ViewState["type"].ToString() == "total")
                gridbind();
            else if (ViewState["type"].ToString() == "inipending")
                gridbind2(1, 2);
            else if (ViewState["type"].ToString() == "resolvedinIst")
                gridbind2(1, 1);
            else if (ViewState["type"].ToString() == "initialaction")
                gridbindfwd();
            else if (ViewState["type"].ToString() == "totalresolved")
                gridbindtotalres(true);
            else if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                gridbindres_stnRply(1);
            else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                gridbindres_stnRply(2);
            else if (ViewState["type"].ToString() == "totalpendingC")
                gridbindtotalres(false);
            else if (ViewState["type"].ToString() == "pendingatStnLevel")
                gridbind_pend_stnend();
            grdcomdetails.Focus();
        }

        protected void btn_initialAction_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = false;
            grdcomdetails.Columns[4].Visible = true;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "initialaction";
            gridbindfwd();
        }

        protected void btn_pending_PBGS_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = true;
            grdcomdetails.Columns[4].Visible = false;
            grdcomdetails.Columns[7].Visible = true;
            ViewState["type"] = "inipending";
            gridbind2(1, 2);
        }
        protected void btn_GR_res_PBGS_IstStep_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = false;
            grdcomdetails.Columns[4].Visible = true;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "resolvedinIst";
            gridbind2(1, 1);
        }
        protected void btntotalGrievance_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = false;
            grdcomdetails.Columns[4].Visible = true;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "total";
            gridbind();
        }



        protected void lnksubjectwise_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_Rpt_SubjectWise.aspx", true);
        }

        protected void btnresolved_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = false;
            grdcomdetails.Columns[4].Visible = true;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "totalresolved";
            gridbindtotalres(true);
        }

        protected void btn_gr_res_afterstn_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = false;
            grdcomdetails.Columns[4].Visible = true;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "resolvedAfOffcReply";
            gridbindres_stnRply(1);
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Grievance_Reports_Action.aspx", true);
        }

        protected void lnkdepttwisegrievance_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_Rpt_Deptt.aspx", true);
        }

        protected void btnTotalpending_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = true;
            grdcomdetails.Columns[4].Visible = false;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "totalpendingC";
            gridbindtotalres(false);
        }

        protected void btn_reply_pending_PBGS_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = true;
            grdcomdetails.Columns[4].Visible = false;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "pendingAfOffcReply";
            gridbindres_stnRply(2);
        }

        protected void btn_Action_Pending_stn_Click(object sender, EventArgs e)
        {
            grdcomdetails.Columns[6].Visible = true;
            grdcomdetails.Columns[4].Visible = false;
            grdcomdetails.Columns[7].Visible = false;
            ViewState["type"] = "pendingatStnLevel";
            gridbind_pend_stnend();
        }



        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                grdcomdetails.AllowPaging = false;
                if (ViewState["type"].ToString() == "total")
                {
                    Label5.Text += "<br /><br />All Grievances, as on today";
                    gridbind();
                }
                else if (ViewState["type"].ToString() == "inipending")
                {

                    Label5.Text += "<br /><br />Grievances Pending for Initial Action at PBGS";
                    gridbind2(1, 2);
                }
                else if (ViewState["type"].ToString() == "resolvedinIst")
                {
                    Label5.Text += "<br /><br />Closed Grievances, By PBGS during Initial Action ";

                    gridbind2(1, 1);
                }
                else if (ViewState["type"].ToString() == "initialaction")
                {
                    Label5.Text += "<br /><br />List of Grievances on which Intial Action Taken By PBGS inc Fwd/Res";
                    gridbindfwd();
                }
                else if (ViewState["type"].ToString() == "totalresolved")
                {
                    Label5.Text += "<br /><br />List of All Resolved Grievances";
                    gridbindtotalres(true);
                }
                else if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                {
                    Label5.Text += "<br /><br />List of Grievances Resolved, After Getting Station/Section Reply";
                    gridbindres_stnRply(1);
                }
                else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                {

                    Label5.Text += "<br /><br />List of Grievances Pending at PBGS, After Getting Station/Section Reply";
                    gridbindres_stnRply(2);
                }
                else if (ViewState["type"].ToString() == "totalpendingC")
                {
                    Label5.Text += "<br /><br />List of All Pending Grievances";
                    gridbindtotalres(false);
                }
                else if (ViewState["type"].ToString() == "pendingatStnLevel")
                {
                    Label5.Text += "<br /><br />List of Grievances Pending at Station/Section Level";
                    gridbind_pend_stnend();
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
                //sb.Append("printWin.document.title = newTitle");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "Grievances_Details", sb.ToString());
                grdcomdetails.AllowPaging = true;
                if (ViewState["type"].ToString() == "total")
                    gridbind();
                else if (ViewState["type"].ToString() == "inipending")
                    gridbind2(1, 2);
                else if (ViewState["type"].ToString() == "resolvedinIst")
                    gridbind2(1, 1);
                else if (ViewState["type"].ToString() == "initialaction")
                    gridbindfwd();
                else if (ViewState["type"].ToString() == "totalresolved")
                    gridbindtotalres(true);
                else if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                    gridbindres_stnRply(1);
                else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                    gridbindres_stnRply(2);
                else if (ViewState["type"].ToString() == "totalpendingC")
                    gridbindtotalres(false);
                else if (ViewState["type"].ToString() == "pendingatStnLevel")
                    gridbind_pend_stnend();
                divmsg.Visible = false;
                lblmsg.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=Grievances_Details.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);

                grdcomdetails.AllowPaging = false;
                if (ViewState["type"].ToString() == "total")
                {
                    Label5.Text += "<br /><br />All Grievances, as on today";
                    gridbind();
                }
                else if (ViewState["type"].ToString() == "inipending")
                {

                    Label5.Text += "<br /><br />Grievances Pending for Initial Action at PBGS";
                    gridbind2(1, 2);
                }
                else if (ViewState["type"].ToString() == "resolvedinIst")
                {
                    Label5.Text += "<br /><br />Closed Grievances, By PBGS during Initial Action ";

                    gridbind2(1, 1);
                }
                else if (ViewState["type"].ToString() == "initialaction")
                {
                    Label5.Text += "<br /><br />List of Grievances on which Intial Action Taken By PBGS inc Fwd/Res";
                    gridbindfwd();
                }
                else if (ViewState["type"].ToString() == "totalresolved")
                {
                    Label5.Text += "<br /><br />List of All Resolved Grievances";
                    gridbindtotalres(true);
                }
                else if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                {
                    Label5.Text += "<br /><br />List of Grievances Resolved, After Getting Station/Section Reply";
                    gridbindres_stnRply(1);
                }
                else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                {

                    Label5.Text += "<br /><br />List of Grievances Pending at PBGS, After Getting Station/Section Reply";
                    gridbindres_stnRply(2);
                }
                else if (ViewState["type"].ToString() == "totalpendingC")
                {
                    Label5.Text += "<br /><br />List of All Pending Grievances";
                    gridbindtotalres(false);
                }
                else if (ViewState["type"].ToString() == "pendingatStnLevel")
                {
                    Label5.Text += "<br /><br />List of Grievances Pending at Station/Section Level";
                    gridbind_pend_stnend();
                }

                grdcomdetails.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in grdcomdetails.HeaderRow.Cells)
                {
                    cell.BackColor = grdcomdetails.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grdcomdetails.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        cell.BackColor = grdcomdetails.RowStyle.BackColor;
                    }
                }
                grdcomdetails.RenderControl(ht);
                Response.Write(sw.ToString());
                grdcomdetails.AllowPaging = true;
                if (ViewState["type"].ToString() == "total")
                    gridbind();
                else if (ViewState["type"].ToString() == "inipending")
                    gridbind2(1, 2);
                else if (ViewState["type"].ToString() == "resolvedinIst")
                    gridbind2(1, 1);
                else if (ViewState["type"].ToString() == "initialaction")
                    gridbindfwd();
                else if (ViewState["type"].ToString() == "totalresolved")
                    gridbindtotalres(true);
                else if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                    gridbindres_stnRply(1);
                else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                    gridbindres_stnRply(2);
                else if (ViewState["type"].ToString() == "totalpendingC")
                    gridbindtotalres(false);
                else if (ViewState["type"].ToString() == "pendingatStnLevel")
                    gridbind_pend_stnend();
                divmsg.Visible = false;
                lblmsg.Text = "";
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
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
            if (e.CommandName == "fwddownload2")
            {
                // lblresult.Text = "";
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
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    ViewState["trnid_Action"] = lbltrnid.Text;
                    Label lblrefid = row.FindControl("lblrefid") as Label;
                    Label9.Text = lblrefid.Text;
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    int updt = cmm.RunSP("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                            , new SqlParameter("@greid", greid));
                    if (updt == 1)
                    {
                        DataSet ds1 = new DataSet();

                        divresorfor.Visible = true;
                        // divresorfor.Focus();

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

                        CheckBoxList1.ClearSelection();
                        divforwardedaction.Visible = false;
                        divresolvedaction.Visible = false;

                        CheckBoxList1.Focus();

                        //Display the ModalPopup.
                        mpeaction.Show();
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
                    lnkview.Visible = true;
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
                    lnkview.Visible = true;
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

        private void gridbind()
        {
            divmsg.Visible = true;
            Label5.Text = "All Grievances, as on today";
            divinfogrd.Visible = true;
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

            if (Convert.ToInt16(Session["Usertype"]) == 14)
            {
                ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                     new SqlParameter("@Dealing_StnSecId", 33)
                                                                                     , new SqlParameter("@DealingUsertypeId", 47)
                                                                                     , new SqlParameter("@filetransferflag", 1));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                    new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                    , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                    , new SqlParameter("@filetransferflag", 1));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        private void gridbind2(int serialno, int currentStatus)
        {
            divmsg.Visible = true;
            if (ViewState["type"].ToString() == "inipending")
                Label5.Text = "Grievances Pending for Initial Action at PBGS";
            else if (ViewState["type"].ToString() == "resolvedinIst")
                Label5.Text = "Closed Grievances, By PBGS during Initial Action ";


            divinfogrd.Visible = true;
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

            ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 3),
                                                                                     new SqlParameter("@serialno", serialno)
                                                                                     , new SqlParameter("@currentStatus", currentStatus));

            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        private void gridbindfwd()
        {
            divmsg.Visible = true;

            Label5.Text = "List of Grievances on which Intial Action Taken By PBGS inc Fwd/Res";

            divinfogrd.Visible = true;
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);

            ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 2));

            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        private void gridbindtotalres(Boolean status)
        {
            divmsg.Visible = true;
            if (ViewState["type"].ToString() == "totalpendingC")
                Label5.Text = "List of All Pending Grievances";
            else if (ViewState["type"].ToString() == "totalresolved")
                Label5.Text = "List of All Resolved Grievances";

            divinfogrd.Visible = true;

            ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                            , new SqlParameter("@status", status));

            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        private void gridbindres_stnRply(int currentstatus)
        {
            divmsg.Visible = true;
            if (ViewState["type"].ToString() == "resolvedAfOffcReply")
                Label5.Text = "List of Grievances Resolved, After Getting Station/Section Reply";
            else if (ViewState["type"].ToString() == "pendingAfOffcReply")
                Label5.Text = "List of Grievances Pending at PBGS, After Getting Station/Section Reply";

            divinfogrd.Visible = true;

            ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 5)
                                                                                            , new SqlParameter("@currentStatus", currentstatus));

            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        private void gridbind_pend_stnend()
        {
            divmsg.Visible = true;

            Label5.Text = "List of Grievances Pending at Station/Section Level";

            divinfogrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN21_GrievanceReport2", "PRASARNETConnectionString", new SqlParameter("@flag", 6));

            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
            grdcomdetails.Focus();
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            CheckBoxList1.ClearSelection();

            //txtemailforwarded.Text = "";
            ////ddldeptfwd.SelectedIndex = 0;
            //ddlsecfwd.Items.Clear();
            //ddlsecfwd.SelectedIndex = -1;
            //ddlsecfwd.SelectedValue = null;
            //txtremarksforward.Text = "";
            //txtcc.Text = "";
            //lblsuggestedemails.Text = "";

            mpeaction.Hide();
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
        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblsuggestedemails.Text = "";
            try
            {
                if (CheckBoxList1.SelectedValue == "1")//closed
                {
                    divresolvedaction.Visible = true;
                    divforwardedaction.Visible = false;

                    txtEmailres.Text = "";
                    txtEmailres.ReadOnly = true;
                    txtEmailres.CssClass = "select font2 widthofboxes1";
                    txtremarksres.Text = "";

                    txtccresto.Focus();
                    btnsubmit.Focus();
                    txtEmailres.Text = ViewState["email_res"].ToString();
                    lblnameres.Text = ViewState["name_res"].ToString() + " & " + ViewState["mob_res"].ToString();
                    lblrefidres.Text = ViewState["referenceId_res"].ToString();

                    lblgrievanceres.Text = ViewState["GrievanceComp"].ToString();
                    lbldateres.Text = ViewState["G_REGDon"].ToString();
                    lbldeptres.Text = ViewState["station"].ToString();


                }
                else if (CheckBoxList1.SelectedValue == "3")// forward
                {
                    divresolvedaction.Visible = false;
                    divforwardedaction.Visible = true;
                    cmm.bindDDLWidParam(ddldeptfwd, "PN18_Gre_Deptt", "department", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));

                    txtemailforwarded.Text = "";
                    // ddldeptfwd.SelectedIndex = 0;
                    ddlsecfwd.Items.Clear();
                    ddlsecfwd.SelectedIndex = -1;
                    ddlsecfwd.SelectedValue = null;
                    txtremarksforward.Text = "";
                    txtcc.Text = "";
                    lblsuggestedemails.Text = "";

                    txtemailforwarded.Focus();
                    lblnamefwd.Text = ViewState["name_res"].ToString() + " & " + ViewState["mob_res"].ToString();
                    lblrefIdFwd.Text = ViewState["referenceId_res"].ToString();

                    lblgrievancefwd.Text = ViewState["GrievanceComp"].ToString();
                    lbldatefwd.Text = ViewState["G_REGDon"].ToString();
                    lbldeptfwd.Text = ViewState["station"].ToString();
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
        protected void ddldeptfwd_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblsuggestedemails.Text = "";
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
                //lblresult.Text += "The Email has been sent to " + empEmail + " & CC to " + ccemail;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Unable to send an E-Mail. Try Again!!')", true);
                //+ ex.ToString() 
            }
        }
        protected void btnfwd_Click(object sender, EventArgs e)
        {
            try
            {
                string IpAdress = cmm.GetIPAddressHostName();
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
                            bindstats();
                            gridbind2(1, 2);
                            grdcomdetails.Focus();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to " + section + " ')", true);
                            gridbind2(1, 2);
                            grdcomdetails.Focus();
                            mpeaction.Hide();
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
                        bindstats();
                        gridbind2(1, 2);
                        grdcomdetails.Focus();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + " has been sucessfully forwarded to " + section + " ')", true);
                        gridbind2(1, 2);
                        grdcomdetails.Focus();
                        mpeaction.Hide();
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
            lblsuggestedemails.Text = "";
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
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            txtEmailres.ReadOnly = false;
            txtEmailres.Focus();
            LinkButton1.Visible = false;
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
                // lblresult.Text += "The Email has been sent to " + empEmail + " & CC to " + ccmailto;
            }

            catch (Exception ex)
            {
                // lblresult.Text += " Unable to send an Email. <br/>" + ex.ToString();
                //+ ex.ToString() 
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
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
                        string filename = Convert.ToString(ViewState["GDfilename"]);
                        DataSet dsurlG = new DataSet();
                        DataSet dsurlPN = new DataSet();
                        dsurlG = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 3)
                                                                                               , new SqlParameter("@flag", 1));
                        //string targetpath = "", sourcepath = "";
                        //string urlfixedpathG = dsurlG.Tables[0].Rows[0][1].ToString();
                        //targetpath = urlfixedpathG + "/" + filename;
                        //dsurlPN = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 2)
                        //                                                                       , new SqlParameter("@flag", 1));
                        //string urlfixedpathPN = dsurlPN.Tables[0].Rows[0][1].ToString();
                        //sourcepath = Server.MapPath("~") + "\\GrievanceDoc\\" + filename;
                        // File.Copy(sourcepath, targetpath);

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

                            CheckBoxList1.ClearSelection();
                            bindstats();
                            gridbind2(1, 2);
                            grdcomdetails.Focus();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance with Reference ID " + referenceid + ". has been closed.')", true);
                            mpeaction.Hide();

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

                        CheckBoxList1.ClearSelection();
                        bindstats();
                        gridbind2(1, 2);
                        grdcomdetails.Focus();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Grievance having Reference ID " + referenceid + ". has been closed.')", true);
                        mpeaction.Hide();

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
        }
        private void bindstats()
        {
            totalGrievance = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            NoofGrievancesFwd_res = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 3));
            NoOfGr_pendingforfwd = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
            NoofGR_resolved = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 2));

            NoofGR_resolved_PBGS = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
            NoofGR_resolved_PBGS_stn = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
            Noof_ReplyRvd_Pending = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 8));
            Gr_Pending_atstn = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 6));

            totalpending = cmm.RunSPReturnCountParam("PN21_Grievance_Report", "PRASARNETConnectionString", new SqlParameter("@flag", 9));


            btntotalGrievance.Text = "Total Grievance(s) Received: " + totalGrievance.ToString();
            btn_initialAction.Text = "Intial Action Taken By PBGS inc Fwd/Res: " + NoofGrievancesFwd_res.ToString();
            btn_pending_PBGS.Text = "Grievance(s) Pending for Initial Action at PBGS: " + NoOfGr_pendingforfwd.ToString();
            btnresolved.Text = "Total Grievance(s) Resolved/Closed: " + NoofGR_resolved.ToString();

            btn_GR_res_PBGS_IstStep.Text = "Grievance(s) Closed by PBGS during Ist Step: " + NoofGR_resolved_PBGS.ToString();
            btn_gr_res_afterstn.Text = "Grievance(s) Closed by PBGS after Stn/Sec Reply: " + NoofGR_resolved_PBGS_stn.ToString();

            // btn_reply_pending_PBGS.Text = "Action Pending for Replies Rcvd. by PBGS: " + Noof_ReplyRvd_Pending.ToString();
            //btn_Action_Pending_stn.Text = "Action Pending at Station Level: " + Gr_Pending_atstn.ToString();

            btn_reply_pending_PBGS.Text = "Action Pending for Replies Rcvd. by PBGS: 3";
            btn_Action_Pending_stn.Text = "Action Pending at Station Level: 476";

            btnTotalpending.Text = "Total Grievance(s) Pending : " + totalpending.ToString();
        }
    }
}


