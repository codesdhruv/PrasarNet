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

namespace PrasarNet.Sta_Sec_Det
{
    public partial class OfficeDetails : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    ViewState["search"] = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 10)
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
                    cmm.bindDDLWidParam(ddloffctype, "PN21_Sec_station", "UserName", "uid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }


        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx", true);
        }

        protected void ddloffctype_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlsecstn.ClearSelection();
            ddlsecstn.Items.Clear();
            if (ddloffctype.SelectedValue == "2")//station/kendra
            {
                cmm.bindDDLWidParam(ddlorg, "PN21_Org_Officedirectory", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 2));
            }
            else//section
            {
                cmm.bindDDLWidParam(ddlorg, "PN21_Org_Officedirectory", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
            }
        }

        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddloffctype.SelectedValue == "2")//station/kendra
            {
                cmm.bindDDLWidParam(ddlsecstn, "PN21_StnSec_Officedirectory", "StationName", "StationID", "PRASARNETConnectionString", "--All Stations--", new SqlParameter("@flag", 2)
                                                                                                                                                         , new SqlParameter("@orgid", Convert.ToInt16(ddlorg.SelectedValue)));
            }
            else//section
            {
                cmm.bindDDLWidParam(ddlsecstn, "PN21_StnSec_Officedirectory", "secname", "userID", "PRASARNETConnectionString", "--All Sections--", new SqlParameter("@flag", 1)
                                                                                                                                                  , new SqlParameter("@orgid", Convert.ToInt16(ddlorg.SelectedValue)));
            }
        }

        protected void btngetdata_Click(object sender, EventArgs e)//Search
        {
            if (ddloffctype.SelectedValue == "2")//station/kendra
            {
                divstngrd.Visible = true;
                divsecgrd.Visible = false;
                stngridbind();

            }
            else//section
            {
                divstngrd.Visible = false;
                divsecgrd.Visible = true;
                secgridbind();
            }
        }

        protected void btnstnprint_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                grdstndirectory.AllowPaging = false;
                stngridbind();
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
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "PrasarBharati_Stn_Sec_Directory", sb.ToString());
                grdstndirectory.AllowPaging = true;
                stngridbind();
                divmsg.Visible = false;
                lblmsg.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public void stngridbind()
        {
            int? orgid = null;
            int? stnid = null;
            if (ddlorg.SelectedIndex != 0)
            {
                orgid = Convert.ToInt32(ddlorg.SelectedValue);
                if (ddlsecstn.SelectedIndex != 0)
                {
                    stnid = Convert.ToInt32(ddlsecstn.SelectedValue);
                }
            }


            ds = cmm.RunSpReturnDSParam("PN21_stationSec_directory", "PRASARNETConnectionString", new SqlParameter("@orgid", orgid),
                                                                              new SqlParameter("@stn_secid", stnid),
                                                                              new SqlParameter("@flag", 1));
            grdstndirectory.DataSource = ds;
            grdstndirectory.DataBind();
        }
        public void secgridbind()
        {
            int? orgid = null;
            int? stnid = null;
            if (ddlorg.SelectedIndex != 0)
            {
                orgid = Convert.ToInt32(ddlorg.SelectedValue);
                if (ddlsecstn.SelectedIndex != 0)
                {
                    stnid = Convert.ToInt32(ddlsecstn.SelectedValue);
                }
            }


            ds = cmm.RunSpReturnDSParam("PN21_stationSec_directory", "PRASARNETConnectionString", new SqlParameter("@orgid", orgid),
                                                                              new SqlParameter("@stn_secid", stnid),
                                                                              new SqlParameter("@flag", 2));
            grdsecdetails.DataSource = ds;
            grdsecdetails.DataBind();
        }

        protected void grdstndirectory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdstndirectory.PageIndex = e.NewPageIndex;
            stngridbind();
        }

        protected void grdsecdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdsecdetails.PageIndex = e.NewPageIndex;
            secgridbind();
        }

        protected void btnsecprint_Click(object sender, EventArgs e)
        {
            grdsecdetails.AllowPaging = false;
            secgridbind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdsecdetails.RenderControl(hw);
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
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            grdsecdetails.AllowPaging = true;
            secgridbind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=PB_Emp_Vaccination_Report.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);

                grdstndirectory.AllowPaging = false;
                stngridbind();

                grdstndirectory.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in grdstndirectory.HeaderRow.Cells)
                {
                    cell.BackColor = grdstndirectory.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grdstndirectory.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        cell.BackColor = grdstndirectory.RowStyle.BackColor;
                    }
                }
                panelprint.RenderControl(ht);
                Response.Write(sw.ToString());
                grdstndirectory.AllowPaging = true;
                stngridbind();
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
    }
}