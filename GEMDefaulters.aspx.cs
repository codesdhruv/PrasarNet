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
    public partial class GEMDefaulters : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228) || (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) || (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215))
            {
                if (!IsPostBack)
                {
                    divmonthlystationreports.Visible = false;
                    divmonthlystationreportsforadg.Visible = false;
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select--",
                                                                                                            new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select--",
                                                                                                            new SqlParameter("@flag", 1));
                    if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
                    {
                        if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                        {
                            Label3.Visible = true;
                            Label5.Visible = true;
                            Label1637.Visible = false;
                            Label1638.Visible = false;
                            ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (2)", "PRASARNETConnectionString");
                        }
                        else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR// CCW Reports here can be seen in AIR
                        {
                            Label3.Visible = true;
                            Label5.Visible = true;
                            Label1637.Visible = false;
                            Label1638.Visible = false;
                            ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (3,4)", "PRASARNETConnectionString");
                        }

                        AdminMenu.Visible = false;
                        StationSectionMenu.Visible = true;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
                    {
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
                        if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                        {
                            Label3.Visible = false;
                            Label5.Visible = false;
                            Label1637.Visible = true;
                            Label1638.Visible = true;
                            AdminMenu.Visible = false;
                            StationSectionMenu.Visible = true;

                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMReports.aspx", true);
        }

        protected void btngetdata_Click(object sender, EventArgs e)
        {
            int defaulters = 0;
            int total = 0;
            int sub = 0;
            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                              new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                              new SqlParameter("@flag", 23));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 22));
                sub = total - defaulters;

            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                             new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                             new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                             new SqlParameter("@flag", 21));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 20));
                sub = total - defaulters;
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                             new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                             new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                             new SqlParameter("@flag", 32));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 31));
                sub = total - defaulters;
            }
            lblnoofdefaulters.Text = Convert.ToString(defaulters);
            lbleportsub.Text = Convert.ToString(sub);
            bindgrid();
            divgrd.Visible = true;
        }
        private void bindgrid()
        {
            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                              new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                              new SqlParameter("@flag", 18));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                               new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                              new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                              new SqlParameter("@flag", 19));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                                             new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                            new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                                            new SqlParameter("@flag", 30));
            }
            grddefaultesDetails.DataSource = ds;
            grddefaultesDetails.DataBind();
        }

        protected void grddefaultesDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddefaultesDetails.PageIndex = e.NewPageIndex;
            bindgrid();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                grddefaultesDetails.AllowPaging = false;
                //grdgemprocDetails.Columns[9].Visible = false;

                bindgrid();

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grddefaultesDetails.RenderControl(hw);
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
                grddefaultesDetails.AllowPaging = true;
                //grdgemprocDetails.Columns[9].Visible = true;

                bindgrid();

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}