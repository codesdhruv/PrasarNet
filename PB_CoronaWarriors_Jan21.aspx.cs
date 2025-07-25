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
    public partial class PB_CoronaWarriors_Jan21 : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        int total = 0;
        int active = 0;
        int deceased = 0, home = 0, hospitalised = 0, cured = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("HomePage.aspx", false);
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3 || Session["UserName"].ToString() == "Guest")
            {
                if (!IsPostBack)
                {
                    ViewState["search_corona"] = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 32)// adgadmin
                    {
                        grdcon_war_details.Columns[6].Visible = true;
                        //grdcon_war_details.Columns[11].Visible = true;
                    }
                    else
                    {
                        grdcon_war_details.Columns[6].Visible = false;
                        // grdcon_war_details.Columns[11].Visible = false;
                    }
                    ViewState["grid"] = 1;
                    total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 15));
                    cmm.bindDDLWidParam(ddlzone, "PN18_Zone", "ShortCode", "IT_ZONEID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));


                    lblrecordsfound.Text = total.ToString() + " (Total Cases Since Jan-2021) ";
                    lblfiltercriterion.Text = "None";
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Session["UserName"].ToString() == "Guest")
                    {
                        guestmenu.Visible = true;
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        guestmenu.Visible = false;
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Sections
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
                        guestmenu.Visible = false;
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// management
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
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            guestmenu.Visible = false;
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
                            guestmenu.Visible = false;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    gridbind();

                }
                //IT_MonthlyRetire_RSS
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 16));
            grdcon_war_details.DataSource = ds;
            grdcon_war_details.DataBind();
        }
        private void gridbindfilter()
        {
            DateTime? from = null;
            DateTime? to = null;
            int zoneid = 0;
            int stateid = 0;
            string status = null;
            int flag = 17;

            if (ddlstatus.SelectedIndex != 0)
            {
                if (ddlstatus.SelectedValue == "1")// Active
                {
                    flag = 17;
                    status = " Not-Yet ";
                }
                else if (ddlstatus.SelectedValue == "2")// cured
                {
                    flag = 18;
                }
                else if (ddlstatus.SelectedValue == "3")// Deceased
                {
                    flag = 17;
                    status = " Deceased ";
                }
            }
            if (txtdatefrom.Text != "")
            {
                from = DateTime.ParseExact(txtdatefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            if (txtdateto.Text != "")
            {
                to = DateTime.ParseExact(txtdateto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            if (ddlzone.SelectedIndex != 0)
            {
                zoneid = Convert.ToInt16(ddlzone.SelectedValue);
                if (ddlstate.SelectedIndex != 0)
                {
                    stateid = Convert.ToInt16(ddlstate.SelectedValue);
                }
            }
            ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", flag)
                                                                                                  , new SqlParameter("@zoneid", zoneid)
                                                                                                  , new SqlParameter("@stateid", stateid)
                                                                                                  , new SqlParameter("@coronapositiveonfrom", from)
                                                                                                  , new SqlParameter("@coronapositiveonTo", to)
                                                                                                  , new SqlParameter("@discharged_deceased_completionhomequran", status));
            grdcon_war_details.DataSource = ds;
            grdcon_war_details.DataBind();

            //filter
            string zonefilter = "None";
            if (zoneid != 0)
                zonefilter = ddlzone.SelectedItem.Text;
            string statusfilter = "None";
            if (status != null)
                statusfilter = ddlstatus.SelectedItem.Text;
            string statefilter = "None";
            if (stateid != 0)
                statefilter = ddlstate.SelectedItem.Text;
            string dateto = "--", datefrom = "--";
            if (from != null)
                datefrom = from.ToString();
            if (to != null)
                dateto = to.ToString();

            lblfiltercriterion.Text = "Status Selected: " + statusfilter + "; Zone Selected: " + zonefilter + "; State Selected: " + statefilter + "; Period: " + datefrom + " to " + dateto;
            //filter

            if (ddlstatus.SelectedIndex == 0 && ddlzone.SelectedIndex == 0 && txtdatefrom.Text == "" && txtdateto.Text == "")
            {
                total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 15));
                lblrecordsfound.Text = total.ToString() + " (Total Cases Since Jan-2021) ";

            }
            else
            {
                if (ddlstatus.SelectedValue == "2")
                {
                    total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 20)
                                                                                                  , new SqlParameter("@zoneid", zoneid)
                                                                                                  , new SqlParameter("@stateid", stateid)
                                                                                                  , new SqlParameter("@coronapositiveonfrom", from)
                                                                                                  , new SqlParameter("@coronapositiveonTo", to)
                                                                                                  , new SqlParameter("@discharged_deceased_completionhomequran", status));
                    lblrecordsfound.Text = total.ToString();
                }
                else
                {
                    total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 19)
                                                                                                  , new SqlParameter("@zoneid", zoneid)
                                                                                                  , new SqlParameter("@stateid", stateid)
                                                                                                  , new SqlParameter("@coronapositiveonfrom", from)
                                                                                                  , new SqlParameter("@coronapositiveonTo", to)
                                                                                                  , new SqlParameter("@discharged_deceased_completionhomequran", status));
                    lblrecordsfound.Text = total.ToString();
                }
            }
            grdcon_war_details.Focus();
        }
        protected void btnprint1_Click(object sender, EventArgs e)
        {
            divmsg.Visible = true;
            lblmsg.Text = "This Data taken from PrasarNet, on "+ DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
            grdcon_war_details.AllowPaging = false;
            if (Convert.ToInt16(ViewState["search_corona"]) == 0)
                gridbind();
            else if (Convert.ToInt16(ViewState["grid"]) == 1)
                gridbindfilter();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            panelprint.RenderControl(hw);
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
            ClientScript.RegisterStartupScript(this.GetType(), "Corona Warriors-Prasar Bharati", sb.ToString());
            grdcon_war_details.AllowPaging = true;
            if (Convert.ToInt16(ViewState["search_corona"]) == 0)
                gridbind();
            else if (Convert.ToInt16(ViewState["grid"]) == 1)
                gridbindfilter();
            divmsg.Visible = false;
            lblmsg.Text = "";
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            divmsg.Visible = true;
            lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Corona_Warriors_Report_PrasarNet.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter ht = new HtmlTextWriter(sw);

            grdcon_war_details.AllowPaging = false;
            if (Convert.ToInt16(ViewState["search_corona"]) == 0)
                gridbind();
            else if (Convert.ToInt16(ViewState["grid"]) == 1)
                gridbindfilter();
            grdcon_war_details.HeaderRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell cell in grdcon_war_details.HeaderRow.Cells)
            {
                cell.BackColor = grdcon_war_details.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in grdcon_war_details.Rows)
            {
                row.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    cell.BackColor = grdcon_war_details.RowStyle.BackColor;
                }
            }
            panelprint.RenderControl(ht);
            Response.Write(sw.ToString());
            grdcon_war_details.AllowPaging = true;
            if (Convert.ToInt16(ViewState["search_corona"]) == 0)
                gridbind();
            else if (Convert.ToInt16(ViewState["grid"]) == 1)
                gridbindfilter();
            divmsg.Visible = false;
            lblmsg.Text = "";
            Response.Flush();
            Response.End();
            
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlzone.SelectedIndex != 0)
                cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1)
                                                                                                                          , new SqlParameter("@zoneid", Convert.ToInt16(ddlzone.SelectedValue)));
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            gridbindfilter();            
            ViewState["search_corona"] = 1;
            grdcon_war_details.Focus();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            lblfiltercriterion.Text = "";
            total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 15));
            lblrecordsfound.Text = total.ToString() + " (Total Cases Since Jan-2021) ";
            gridbind();
            ddlstatus.ClearSelection();
            ddlstatus.Items.FindByText("--All--").Selected = true;
            ddlzone.ClearSelection();
            ddlzone.Items.FindByText("--All--").Selected = true;            
            ddlstate.Items.Clear();
            ddlstate.SelectedIndex = -1;
            ddlstate.SelectedValue = null;
            txtdatefrom.Text = "";
            txtdateto.Text = "";
            ViewState["search_corona"] = 0;
            lblfiltercriterion.Text = "None";
            grdcon_war_details.Focus();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_CoronaWarriors.aspx", true);
        }

        protected void grdcon_war_details_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcon_war_details.PageIndex = e.NewPageIndex;
            if (Convert.ToInt16(ViewState["search_corona"]) == 0)
                gridbind();
            else if (Convert.ToInt16(ViewState["grid"]) == 1)
                gridbindfilter();
            grdcon_war_details.Focus();
        }

        protected void grdcon_war_details_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grdcon_war_details_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}