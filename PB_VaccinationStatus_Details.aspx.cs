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
    public partial class PB_VaccinationStatus_Details : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
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
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlzone, "PN18_Zone", "ShortCode", "IT_ZONEID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        grdvaccinationdet.Columns[3].Visible = false;
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

                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        grdvaccinationdet.Columns[3].Visible = true;
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
            int zoneid = 0;
            int stateid = 0, stationid = 0;
            string agegrp = null;
            string vactaken = null;
            int flag = 0;
            if (ddlstatus.SelectedValue != "4")
            {
                if (ddlTypeofEmp.SelectedValue == "1")//Regular
                {
                    flag = 16;
                }
                else
                {
                    flag = 18;
                }
            }
            else
            {
                flag = 19;
            }
            if (ddlstatus.SelectedValue == "1")//Vaccination Done
            {
                vactaken = "Yes";
            }
            if (ddlstatus.SelectedValue == "2")//Updated Info but Vaccination Not Done
            {
                vactaken = "No";
            }
            else if (ddlstatus.SelectedValue == "3")//Not Updated Information
            {
                vactaken = "Details Not Updated";
            }
            if (ddlagegroup.SelectedValue == "1")//>=45 years
            {
                agegrp = ">=45 years";
            }
            else if (ddlagegroup.SelectedValue == "2")
            {
                agegrp = "18-44 years";
            }
            if (ddlzone.SelectedIndex != 0)
            {
                zoneid = Convert.ToInt32(ddlzone.SelectedValue);
                if (ddlstate.SelectedIndex != 0)
                {
                    stateid = Convert.ToInt32(ddlstate.SelectedValue);

                    if (ddlstations.SelectedIndex != 0)
                    {
                        stationid = Convert.ToInt32(ddlstations.SelectedValue);
                    }
                }
            }
            ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@zoneid", zoneid)
                                                                                           , new SqlParameter("@stateid", stateid)
                                                                                           , new SqlParameter("@stationid", stationid)
                                                                                           , new SqlParameter("@agegrp", agegrp)
                                                                                           , new SqlParameter("@Isvaccinationtaken", vactaken)
                                                                                           , new SqlParameter("@flag", flag));


            grdvaccinationdet.DataSource = ds;
            grdvaccinationdet.DataBind();
            int count = 0;
            if (ddlstatus.SelectedValue != "4")
            {
                count = cmm.RunSPReturnCountParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@zoneid", zoneid)
                                                                                           , new SqlParameter("@stateid", stateid)
                                                                                           , new SqlParameter("@stationid", stationid)
                                                                                           , new SqlParameter("@agegrp", agegrp)
                                                                                           , new SqlParameter("@Isvaccinationtaken", vactaken)
                                                                                           , new SqlParameter("@flag", 17));
            }
            else
            {
                count = cmm.RunSPReturnCountParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@zoneid", zoneid)
                                                                                          , new SqlParameter("@stateid", stateid)
                                                                                          , new SqlParameter("@stationid", stationid)
                                                                                          , new SqlParameter("@agegrp", agegrp)
                                                                                          , new SqlParameter("@Isvaccinationtaken", vactaken)
                                                                                          , new SqlParameter("@flag", 20));
            }
            lblrecords.Text = count.ToString();

            grdvaccinationdet.Focus();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_Corona_Vaccination_Reports.aspx", true);
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            { 
            if (ddlzone.SelectedIndex != 0)
                cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1)
                                                                                                                          , new SqlParameter("@zoneid", Convert.ToInt16(ddlzone.SelectedValue)));
            ddlstate.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            { 
            if (ddlstate.SelectedIndex != 0)
                cmm.bindDDLWidParam(ddlstations, "PN18_stnbyState", "stationname", "StationID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1)
                                                                                                                          , new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)));
            ddlstations.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            { 
            gridbind();
            grdvaccinationdet.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            { 
            divmsg.Visible = true;
            lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
            grdvaccinationdet.AllowPaging = false;
            gridbind();
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
            ClientScript.RegisterStartupScript(this.GetType(), "PB_Emp_Vaccination_Detail_Report", sb.ToString());
            grdvaccinationdet.AllowPaging = true;
            gridbind();
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
            Response.AddHeader("content-disposition", "attachment;filename=PB_Emp_Vaccination_Report.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter ht = new HtmlTextWriter(sw);

            grdvaccinationdet.AllowPaging = false;
            gridbind();

            grdvaccinationdet.HeaderRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell cell in grdvaccinationdet.HeaderRow.Cells)
            {
                cell.BackColor = grdvaccinationdet.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in grdvaccinationdet.Rows)
            {
                row.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    cell.BackColor = grdvaccinationdet.RowStyle.BackColor;
                }
            }
            panelprint.RenderControl(ht);
            Response.Write(sw.ToString());
            grdvaccinationdet.AllowPaging = true;
            gridbind();
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
        protected void grdvaccinationdet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvaccinationdet.PageIndex = e.NewPageIndex;
            gridbind();
            grdvaccinationdet.Focus();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {

        }
    }
}