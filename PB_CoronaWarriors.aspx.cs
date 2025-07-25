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
    public partial class PB_CoronaWarriors : System.Web.UI.Page
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
                    if (Convert.ToInt16(Session["Usertype"]) == 32)// adgadmin
                    {
                        grdcon_war_details.Columns[6].Visible = true;
                        grdcon_war_details.Columns[11].Visible = true;
                    }
                    else
                    {
                        grdcon_war_details.Columns[6].Visible = false;
                        grdcon_war_details.Columns[11].Visible = false;
                    }
                    ViewState["grid"] = 1;
                    total = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
                    active = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 5));

                    hospitalised = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
                    home = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 7));

                    deceased = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 8));
                    cured = cmm.RunSPReturnCountParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 9));
                    // lbltotal.Text = total.ToString();
                    btntotal.Text = "Total No of Cases: " + total.ToString();
                    // lblactivecases.Text = active.ToString();
                    btnactive1.Text = "Active Cases: " + active.ToString();
                    btncured.Text = "Cured Cases: " + cured.ToString();
                    //  lblcured.Text = cured.ToString();
                    //lblhospitalised.Text = hospitalised.ToString();
                    //lblhomeqauarntined.Text = home.ToString();
                    btndeceased.Text = "Deceased: " + deceased.ToString();
                    //lbldeceased.Text = deceased.ToString();

                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Session["UserName"].ToString() == "Guest")
                    {
                        div4.Visible = false;
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
        {//@createdbyusertypeid and createdbystnsecID=@createdbystnsecID
            ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2));
            grdcon_war_details.DataSource = ds;
            grdcon_war_details.DataBind();
        }
        private void gridbind_cases(int flag)
        {
            ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", flag));
            grdcon_war_details.DataSource = ds;
            grdcon_war_details.DataBind();
        }
        protected void grdcon_war_details_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "status")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int CoronaWarriorId = (int)grdcon_war_details.DataKeys[row.RowIndex].Value;
                ViewState["CoronaWarriorId"] = CoronaWarriorId;
                Label lbln2 = row.FindControl("lbln2") as Label;

                lblnameUpdate.Text = lbln2.Text;
                ds = cmm.RunSpReturnDSParam("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                     , new SqlParameter("@C_warriorsId", CoronaWarriorId));

                gvDetails.DataSource = ds;
                gvDetails.DataBind();

                mpeupdate.Show();
            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grdcon_war_details.AllowPaging = false;
            if (Convert.ToInt32(ViewState["grid"]) == 2)
                gridbind_cases(12);
            else if (Convert.ToInt32(ViewState["grid"]) == 3)
                gridbind_cases(13);
            else if (Convert.ToInt32(ViewState["grid"]) == 4)
                gridbind_cases(14);
            else
                gridbind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdcon_war_details.RenderControl(hw);
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
            if (Convert.ToInt32(ViewState["grid"]) == 2)
                gridbind_cases(12);
            else if (Convert.ToInt32(ViewState["grid"]) == 3)
                gridbind_cases(13);
            else if (Convert.ToInt32(ViewState["grid"]) == 4)
                gridbind_cases(14);
            else
                gridbind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void lnkanalysis_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoronaModulesReports.aspx", true);
        }

        protected void btntotal_Click(object sender, EventArgs e)
        {
            ViewState["grid"] = 1;
            gridbind();
            grdcon_war_details.PageIndex = 1;
        }

        protected void btnactive1_Click(object sender, EventArgs e)
        {
            ViewState["grid"] = 2;
            gridbind_cases(12);
            grdcon_war_details.PageIndex = 1;
        }

        protected void btncured_Click(object sender, EventArgs e)
        {
            ViewState["grid"] = 3;
            gridbind_cases(13);
            grdcon_war_details.PageIndex = 1;
        }

        protected void btndeceased_Click(object sender, EventArgs e)
        {
            ViewState["grid"] = 4;
            gridbind_cases(14);
            grdcon_war_details.PageIndex = 1;
        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Corona_Warriors_Report_PrasarNet.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter ht = new HtmlTextWriter(sw);

            grdcon_war_details.AllowPaging = false;
            if (Convert.ToInt32(ViewState["grid"]) == 2)
                gridbind_cases(12);
            else if (Convert.ToInt32(ViewState["grid"]) == 3)
                gridbind_cases(13);
            else if (Convert.ToInt32(ViewState["grid"]) == 4)
                gridbind_cases(14);
            else
                gridbind();
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
            grdcon_war_details.RenderControl(ht);
            Response.Write(sw.ToString());
            grdcon_war_details.AllowPaging = true;
            if (Convert.ToInt32(ViewState["grid"]) == 2)
                gridbind_cases(12);
            else if (Convert.ToInt32(ViewState["grid"]) == 3)
                gridbind_cases(13);
            else if (Convert.ToInt32(ViewState["grid"]) == 4)
                gridbind_cases(14);
            else
                gridbind();
            Response.Flush();
            Response.End();
        }

        protected void lnkfilterrecords_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_CoronaWarriors_Jan21.aspx",true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_Corona_Vaccination_Reports.aspx", true);
        }

        protected void grdcon_war_details_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblcoronawarid = (Label)e.Row.FindControl("lblcoronawarid");
            LinkButton lnkstatus = (LinkButton)e.Row.FindControl("lnkstatus");
            Label lbluplon2 = (Label)e.Row.FindControl("lbluplon2");
            DateTime todaydate = DateTime.Now.Date;
            DateTime uploadedon = Convert.ToDateTime(lbluplon2.Text.Trim()).Date;
            if (uploadedon == todaydate)
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FEF5E7");
            }
            ds = cmm.RunSpReturnDSParam("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                , new SqlParameter("@C_warriorsId", Convert.ToInt32(lblcoronawarid.Text)));

            if (ds.Tables[0].Rows.Count > 0)
            {
                lnkstatus.CssClass = "btn statusupdate font2";
            }
            else
            {
                lnkstatus.CssClass = "btn btn-info font2";
            }
        }
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        if (Session["UserName"].ToString() == "Guest")
        {
            Response.Redirect("GuestLogin.aspx", true);
        }
        else
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }
    }

    protected void grdcon_war_details_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdcon_war_details.PageIndex = e.NewPageIndex;
        if (Convert.ToInt16(ViewState["grid"]) == 1)
            gridbind();
        else if (Convert.ToInt16(ViewState["grid"]) == 2)
            gridbind_cases(12);
        else if (Convert.ToInt16(ViewState["grid"]) == 3)
            gridbind_cases(13);
        else if (Convert.ToInt16(ViewState["grid"]) == 4)
            gridbind_cases(14);

    }
}
}