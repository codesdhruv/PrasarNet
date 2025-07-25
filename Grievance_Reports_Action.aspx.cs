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
    public partial class Grievance_Reports_Action : System.Web.UI.Page
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
                    ViewState["serach_Gr"] = 0;
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
                    if (Convert.ToInt16(Session["Usertype"]) == 14)
                    {
                        grdcomdetails.Columns[7].Visible = false;
                    }
                    else
                    {
                        grdcomdetails.Columns[7].Visible = true;
                    }
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    DataSet dslast = new DataSet();
                    dslast = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 2));
                    if (dslast.Tables[0].Rows.Count > 0)
                    {
                        string gre_ref_last = dslast.Tables[0].Rows[0][3].ToString();
                        string date_last = dslast.Tables[0].Rows[0][2].ToString();
                        string greid_last = dslast.Tables[0].Rows[0][0].ToString();
                        lnklastvisited.Text = gre_ref_last + " on " + date_last;
                        hid_last_vis_id.Value = greid_last;
                    }
                    DataSet dslastaction = new DataSet();
                    dslastaction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                    if (dslastaction.Tables[0].Rows.Count > 0)
                    {
                        string gre_ref_lastAction = dslastaction.Tables[0].Rows[0][3].ToString();
                        string date_lastAction = dslastaction.Tables[0].Rows[0][2].ToString();
                        string greid_lastAction = dslastaction.Tables[0].Rows[0][0].ToString();
                        lnkactiontaken.Text = gre_ref_lastAction + " on " + date_lastAction;
                    }
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
                                                                                     , new SqlParameter("@filetransferflag", 1));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 9),
                                                                                    new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                    , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                    , new SqlParameter("@filetransferflag", 1));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }
        protected void btnprint1_Click1(object sender, EventArgs e)
        {
            try
            {
                grdcomdetails.AllowPaging = false;
                if (ViewState["serach_Gr"].ToString() == "0")
                    gridbind();
                else if (ViewState["serach_Gr"].ToString() == "1")
                    gridbindsearch();
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
                if (ViewState["serach_Gr"].ToString() == "0")
                    gridbind();
                else if (ViewState["serach_Gr"].ToString() == "1")
                    gridbindsearch();
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
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            divsearch.Visible = false;
            divtrackgridprimary.Visible = true;
            btnback.Visible = true;

            ViewState["serach_Gr"] = 0;
            divlast.Visible = true;
            divdashoption.Visible = true;
            Div3.Visible = true;

            gridbind();
            grdcomdetails.Focus();
            lnksearch.Visible = true;
        }

        protected void lnksearch_Click(object sender, EventArgs e)
        {
            divsearch.Visible = true;
            divtrackgridprimary.Visible = false;
            cmm.bindDDLWidParam(ddldept, "PN18_Gre_Deptt", "department", "id", "PRASARNETConnectionString", "--All--",
                                                                                                             new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlregdusertype, "pn18_gre_SPtypeofUser", "Gre_Usertype", "Gre_UtypeId", "PRASARNETConnectionString", "--All--",
                                                                                                             new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlsubject, "PN18_gre_SP_Subject", "Subject", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));
            btnback.Visible = false;
            divlast.Visible = false;
            divdashoption.Visible = false;
            Div3.Visible = false;
            lnksearch.Visible = false;
        }

        protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldept.SelectedIndex != 0)
            {
                if (ddldept.SelectedValue != "8")
                {
                    ds = cmm.RunSpReturnDSParam("PN18_Gre_Deptt", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(ddldept.SelectedValue))
                                                                                           , new SqlParameter("@flag", 2));
                    int flag = 0, orgid, secORstn;
                    orgid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    secORstn = Convert.ToInt32(ds.Tables[0].Rows[0][2]);

                    if (secORstn == 1)
                    {
                        flag = 1;
                    }
                    else if (secORstn == 2)
                    {
                        flag = 2;
                    }
                    else if (secORstn == 3)
                    {
                        flag = 3;
                    }
                    else if (secORstn == 4)
                    {
                        flag = 4;
                    }
                    else if (secORstn == 5)
                    {
                        flag = 5;
                    }
                    cmm.bindDDLWidParam(ddlsection, "PN18_Gre_section", "Expr1", "secstnid", "PRASARNETConnectionString", "--All--", new SqlParameter("@orgid", orgid),
                                                                                                                          new SqlParameter("@flag", flag));
                }
                ddlsection.Focus();
            }
            else
            {
                ddlsection.Items.Clear();
                ddlsection.SelectedIndex = -1;
                ddlsection.SelectedValue = null;
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            ddldept.SelectedIndex = 0;
            ddlsection.Items.Clear();
            ddlsection.SelectedIndex = -1;
            ddlsection.SelectedValue = null;
            TextBox1.Text = "";
            ddlstatus.SelectedIndex = 0;
            ddlregdusertype.SelectedIndex = 0;
            divtrackgridprimary.Visible = false;
            divresorfor.Visible = false;
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            divlast.Visible = false;
            divdashoption.Visible = false;
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            divsearch.Visible = true;
            divtrackgridprimary.Visible = true;
            divresorfor.Visible = false;
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            gridbindsearch();
            grdcomdetails.Focus();
            ViewState["serach_Gr"] = 1;
        }
        private void gridbindsearch()
        {
            int deptid = 0;
            int secid = 0;
            int usertype = 0;
            bool? status = null;
            string comid = null;
            int subid = 0;

            if (ddlsubject.SelectedIndex != 0)
            {
                subid = Convert.ToInt32(ddlsubject.SelectedValue);
            }
            if (ddldept.SelectedIndex != 0)
            {
                deptid = Convert.ToInt32(ddldept.SelectedValue);
                if (ddlsection.SelectedIndex != 0)
                {
                    secid = Convert.ToInt32(ddlsection.SelectedValue);
                }
            }

            if (ddlregdusertype.SelectedIndex != 0)
            {
                usertype = Convert.ToInt32(ddlregdusertype.SelectedValue);
            }
            if (ddlstatus.SelectedIndex != 0)
            {
                if (ddlstatus.SelectedValue == "2")
                    status = false;
                else if (ddlstatus.SelectedValue == "1")
                    status = true;
            }
            if (TextBox1.Text != "")
            {
                comid = TextBox1.Text.Trim();
            }
            int loginusertypeid = Convert.ToInt32(Session["Usertype"]);
            int loginstn_secid = Convert.ToInt32(Session["Uidmanagement"]);
            if (Convert.ToInt16(Session["Usertype"]) == 14)
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 10)
                                                                                          , new SqlParameter("@GrievanceId", comid)
                                                                                          , new SqlParameter("@DeptId", deptid)
                                                                                          , new SqlParameter("@Section_Stationid", secid)
                                                                                          , new SqlParameter("@status", status)
                                                                                          , new SqlParameter("@Gre_usertypeid", usertype),
                                                                                            new SqlParameter("@Dealing_StnSecId", 33)
                                                                                            , new SqlParameter("@DealingUsertypeId", 47)
                                                                                            , new SqlParameter("@subjectid", subid)
                                                                                            , new SqlParameter("@filetransferflag", 1));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 10)
                                                                                          , new SqlParameter("@GrievanceId", comid)
                                                                                          , new SqlParameter("@DeptId", deptid)
                                                                                          , new SqlParameter("@Section_Stationid", secid)
                                                                                          , new SqlParameter("@status", status)
                                                                                          , new SqlParameter("@Gre_usertypeid", usertype),
                                                                                            new SqlParameter("@Dealing_StnSecId", loginstn_secid)
                                                                                            , new SqlParameter("@DealingUsertypeId", loginusertypeid)
                                                                                            , new SqlParameter("@subjectid", subid)
                                                                                            , new SqlParameter("@filetransferflag", 1));
            }
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblresult.Text = "";
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
            if (e.CommandName == "View")
            {
                try
                {
                    divresorfor.Visible = true;
                    // divresorfor.Focus();
                    CheckBoxList1.Focus();
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
                    CheckBoxList1.ClearSelection();
                    divforwardedaction.Visible = false;
                    divresolvedaction.Visible = false;
                    Response.Redirect("GetaPDF_Grievance.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }

            if (e.CommandName == "ResendEmail")
            {
                try
                {
                    txtemailresend.Enabled = true;
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
                    lblresendinfo_stn.Text = "";
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
                            lnklastvisited.Text = gre_ref_last + " on " + date_last;
                            hid_last_vis_id.Value = greid_last;
                        }
                        lblresult.Text = "";
                        divresendmail.Visible = false;
                        divresorfor.Visible = true;
                        // divresorfor.Focus();
                        CheckBoxList1.Focus();

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
                    lblresult.Text = "";
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

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            if (ViewState["serach_Gr"].ToString() == "0")
                gridbind();
            else if (ViewState["serach_Gr"].ToString() == "1")
                gridbindsearch();

            grdcomdetails.Focus();
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

                Label grerefid = (Label)e.Row.FindControl("lblrefid");

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

                DataSet dslastvisited = new DataSet();// grerefid
                DataSet dslastAction = new DataSet();
                dslastvisited = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                string gre_ref_lastvisited = dslastvisited.Tables[0].Rows[0][3].ToString();

                dslastAction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 2));
                string gre_ref_lastaction = dslastAction.Tables[0].Rows[0][3].ToString();

                if (grerefid.Text == gre_ref_lastvisited)//lastvisited
                {
                    string hex = "#FDEBD0";
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml(hex);
                }
                if (grerefid.Text == gre_ref_lastaction)//Last Action
                {
                    string hex2 = "#D5F5E3";
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml(hex2);
                }


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

        protected void Button6_Click(object sender, EventArgs e)
        {
            divresorfor.Visible = false;
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            CheckBoxList1.ClearSelection();

            txtemailforwarded.Text = "";
            //ddldeptfwd.SelectedIndex = 0;
            ddlsecfwd.Items.Clear();
            ddlsecfwd.SelectedIndex = -1;
            ddlsecfwd.SelectedValue = null;
            txtremarksforward.Text = "";
            txtcc.Text = "";
            lblsuggestedemails.Text = "";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblsuggestedemails.Text = "";
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
                    btnfwd.Focus();
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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // string IpAdress = cmm.GetIPAddressHostName();
                //string ipaddress2 = Commonclass1.GetLocalIPAddress();
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
                        //File.Copy(sourcepath, targetpath);

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
                            DataSet dslastaction = new DataSet();
                            dslastaction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                            if (dslastaction.Tables[0].Rows.Count > 0)
                            {
                                string gre_ref_lastAction = dslastaction.Tables[0].Rows[0][3].ToString();
                                string date_lastAction = dslastaction.Tables[0].Rows[0][2].ToString();
                                string greid_lastAction = dslastaction.Tables[0].Rows[0][0].ToString();
                                lnkactiontaken.Text = gre_ref_lastAction + " on " + date_lastAction;
                            }
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

                        DataSet dslastaction = new DataSet();
                        dslastaction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                        if (dslastaction.Tables[0].Rows.Count > 0)
                        {
                            string gre_ref_lastAction = dslastaction.Tables[0].Rows[0][3].ToString();
                            string date_lastAction = dslastaction.Tables[0].Rows[0][2].ToString();
                            string greid_lastAction = dslastaction.Tables[0].Rows[0][0].ToString();
                            lnkactiontaken.Text = gre_ref_lastAction + " on " + date_lastAction;
                        }

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
                lblresult.Text += "The Email has been sent to " + empEmail + " & CC to " + ccmailto;
            }

            catch (Exception ex)
            {
                lblresult.Text += " Unable to send an Email. <br/>" + ex.ToString();
                //+ ex.ToString() 
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

        protected void btnfwd_Click(object sender, EventArgs e)
        {
            try
            {
                lblresult.Text = "";
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
                            CheckBoxList1.Focus();
                            lblresult.Focus();

                            DataSet dslastaction = new DataSet();
                            dslastaction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                            if (dslastaction.Tables[0].Rows.Count > 0)
                            {
                                string gre_ref_lastAction = dslastaction.Tables[0].Rows[0][3].ToString();
                                string date_lastAction = dslastaction.Tables[0].Rows[0][2].ToString();
                                string greid_lastAction = dslastaction.Tables[0].Rows[0][0].ToString();
                                lnkactiontaken.Text = gre_ref_lastAction + " on " + date_lastAction;
                            }

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

                        DataSet dslastaction = new DataSet();
                        dslastaction = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                        if (dslastaction.Tables[0].Rows.Count > 0)
                        {
                            string gre_ref_lastAction = dslastaction.Tables[0].Rows[0][3].ToString();
                            string date_lastAction = dslastaction.Tables[0].Rows[0][2].ToString();
                            string greid_lastAction = dslastaction.Tables[0].Rows[0][0].ToString();
                            lnkactiontaken.Text = gre_ref_lastAction + " on " + date_lastAction;
                        }

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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            txtEmailres.ReadOnly = false;
            txtEmailres.Focus();
            LinkButton1.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                txtemailresend.Enabled = true;
                txtemailresend.Text = "";
                txt_CC_Resend.Text = "";
                txtremkresend.Text = "";

                FileUpload3.Attributes.Clear();
                divresendmail.Visible = false;//Resend Section is OFF
                divresorfor.Visible = false;    //Forward and Closed Section is OFF            

                if (ViewState["serach_Gr"].ToString() == "0")//Search Mode OFF
                {
                    gridbind();
                    divsearch.Visible = false;
                    divtrackgridprimary.Visible = true;
                    btnback.Visible = true;

                    ViewState["serach_Gr"] = 0;
                    divlast.Visible = true;
                    divdashoption.Visible = true;
                    Div3.Visible = true;

                }
                else if (ViewState["serach_Gr"].ToString() == "1")//Search Mode ON
                {
                    gridbindsearch();
                    divsearch.Visible = true;
                    btnback.Visible = false;
                    divlast.Visible = false;
                    divdashoption.Visible = false;
                    Div3.Visible = false;
                }
                grdcomdetails.Focus();
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
                            bodyofemail += "Kindly login into PrasarNet to take a necessary action.";
                            bodyofemail += "If you have any query then you may write to Prasar Bharati Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
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
                            txtemailresend.Enabled = true;
                            txtemailresend.Text = "";
                            txt_CC_Resend.Text = "";
                            txtremkresend.Text = "";
                            FileUpload3.Attributes.Clear();
                            divresendmail.Visible = false;
                            divresorfor.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The mail carrying the information has been forwarded sucessfully')", true);
                            if (ViewState["serach_Gr"].ToString() == "0")//Search Mode OFF
                            {
                                gridbind();
                                divsearch.Visible = false;
                                divtrackgridprimary.Visible = true;
                                btnback.Visible = true;

                                ViewState["serach_Gr"] = 0;
                                divlast.Visible = true;
                                divdashoption.Visible = true;
                                Div3.Visible = true;

                            }
                            else if (ViewState["serach_Gr"].ToString() == "1")//Search Mode ON
                            {
                                gridbindsearch();
                                divsearch.Visible = true;
                                btnback.Visible = false;
                                divlast.Visible = false;
                                divdashoption.Visible = false;
                                Div3.Visible = false;
                            }
                            grdcomdetails.Focus();
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
                        bodyofemail += "If you have any query then you may write to Prasar Bharati Grievance Officer at grievances@prasarbharati.gov.in, mentioning the grievance id: "
                                   + referenceid + " in a subject.";
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
                        txtemailresend.Enabled = true;
                        txtemailresend.Text = "";
                        txt_CC_Resend.Text = "";
                        txtremkresend.Text = "";
                        FileUpload3.Attributes.Clear();
                        divresendmail.Visible = false;
                        divresorfor.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The mail carrying information has been forwarded sucessfully')", true);
                        if (ViewState["serach_Gr"].ToString() == "0")//Search Mode OFF
                        {
                            gridbind();
                            divsearch.Visible = false;
                            divtrackgridprimary.Visible = true;
                            btnback.Visible = true;

                            ViewState["serach_Gr"] = 0;
                            divlast.Visible = true;
                            divdashoption.Visible = true;
                            Div3.Visible = true;

                        }
                        else if (ViewState["serach_Gr"].ToString() == "1")//Search Mode ON
                        {
                            gridbindsearch();
                            divsearch.Visible = true;
                            btnback.Visible = false;
                            divlast.Visible = false;
                            divdashoption.Visible = false;
                            Div3.Visible = false;
                        }
                        grdcomdetails.Focus();
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

        protected void lnkreplyfromoffices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Grievance_Reply_Recieved_fromSec_Stns.aspx");
        }
        protected void closeModalCommand(Object sender, CommandEventArgs e)
        {
            // Identify which ModalPopupExtender should hide
            String extenderId = (String)e.CommandArgument;
            Button btn = (Button)sender;
            GridViewRow gvobj = (GridViewRow)btn.NamingContainer;
            AjaxControlToolkit.ModalPopupExtender extender = (AjaxControlToolkit.ModalPopupExtender)gvobj.FindControl(extenderId);// get the control based on its id
                                                                                                                                  //AjaxControlToolkit.ModalPopupExtender extender = (AjaxControlToolkit.ModalPopupExtender)FindControl(extenderId);
            if (extender != null)
            {
                extender.Hide();
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

        protected void lnkReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EGrievance/G_DashBoard.aspx", true);
        }

        protected void lnklastvisited_Click(object sender, EventArgs e)
        {
            DataSet dslast = new DataSet();
            dslast = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 2));
            string gre_ref_last = dslast.Tables[0].Rows[0][3].ToString();

            DataSet dsRowNo = new DataSet();
            dsRowNo = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                                , new SqlParameter("@gre_refID", gre_ref_last));
            int rowno = Convert.ToInt32(dsRowNo.Tables[0].Rows[0][0]);

            //int totalentryGR = (grdcomdetails.DataSource as DataTable).Rows.Count;

            int totalpages = grdcomdetails.PageCount;

            int pagesiz = grdcomdetails.PageSize;

            int page = 0;

            //if (rowno <= totalentryGR)
            //{
            decimal no = Convert.ToDecimal(rowno) / Convert.ToDecimal(pagesiz);
            page = Convert.ToInt32(Math.Floor(no));
            if (page != 0 && page > totalpages)
            {
                grdcomdetails.PageIndex = 0;
            }
            else
            {
                grdcomdetails.PageIndex = page;
            }
            gridbind();
            //}

        }

        protected void lnkactiontaken_Click(object sender, EventArgs e)
        {
            DataSet dslast = new DataSet();
            dslast = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
            string gre_ref_last = dslast.Tables[0].Rows[0][3].ToString();

            DataSet dsRowNo = new DataSet();
            dsRowNo = cmm.RunSpReturnDSParam("PN21_Gre_LastVisited", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                                , new SqlParameter("@gre_refID", gre_ref_last));
            int rowno = Convert.ToInt32(dsRowNo.Tables[0].Rows[0][0]);

            //int totalentryGR = (grdcomdetails.DataSource as DataTable).Rows.Count;

            int totalpages = grdcomdetails.PageCount;

            int pagesiz = grdcomdetails.PageSize;

            int page = 0;

            //if (rowno <= totalentryGR)
            //{
            decimal no = Convert.ToDecimal(rowno) / Convert.ToDecimal(pagesiz);
            page = Convert.ToInt32(Math.Floor(no));
            if (page != 0 && page > totalpages)
            {
                grdcomdetails.PageIndex = 0;
            }
            else
            {
                grdcomdetails.PageIndex = page;
            }
            gridbind();

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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EGrievance/G_Reminder.aspx", true);
        }
    }

}