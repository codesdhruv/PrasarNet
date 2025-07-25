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

    public partial class GeMReportInMinistryFormat : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215))
            {
                divmonthlystationreports.Visible = false;
                divmonthlystationreportsforadg.Visible = false;
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select--",
                                                                                                            new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select--",
                                                                                                            new SqlParameter("@flag", 1));
                    if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
                    {
                        if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
                        {
                            divlandrecords.Visible = true;
                        }
                        else
                        {
                            divlandrecords.Visible = false;
                        }
                        DataSet dspbb = new DataSet();
                        dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                      , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                        if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
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

        protected void btngetdata_Click(object sender, EventArgs e)
        {
            divgrd.Visible = true;
            DataSet dsprev = new DataSet();
            DataSet dscurrent = new DataSet();
            DataSet dslastmonth = new DataSet();
            int monid = 0;
            int yearid = 0;

            bool? submittedtodirectorate = null;
            bool? submittedtoPB = null;
            bool? submittedtoministry = null;
            if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                {
                    if (ddlstatuscon.SelectedIndex == 0)// all
                    {
                        submittedtodirectorate = true;
                        //submittedtoministry = false;
                        //submittedtoPB = true;
                    }
                    else if (ddlstatuscon.SelectedIndex == 1)// forwared to PB sectt
                    {
                        submittedtoPB = true;
                    }
                    else if (ddlstatuscon.SelectedIndex == 2)// Not-forwared to PB sectt
                    {
                        submittedtodirectorate = true;
                        submittedtoPB = false;
                    }
                }
            }
            if (ddlmonth.SelectedIndex != 0)
            {
                monid = Convert.ToInt32(ddlmonth.SelectedValue);
            }

            if (ddlyear.SelectedIndex != 0)
            {
                yearid = Convert.ToInt32(ddlyear.SelectedValue);
            }
            if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                if (ddlorgconsolidated.SelectedIndex == 0)//All
                {
                    dsprev = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 1));
                    dscurrent = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 2));
                    dslastmonth = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 9));
                }
                else if (ddlorgconsolidated.SelectedIndex == 1)//AIR
                {
                    dsprev = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                                                  new SqlParameter("@Month", monid),
                                                                                                  new SqlParameter("@year", yearid),
                                                                                                  new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                                                  new SqlParameter("@submittedtopb", submittedtoPB),
                                                                                                  new SqlParameter("@flag", 3));
                    dscurrent = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 4));
                    dslastmonth = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 12));
                }
                else if (ddlorgconsolidated.SelectedIndex == 2)//DD
                {
                    dsprev = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 5));
                    dscurrent = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 6));
                    dslastmonth = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 11));
                }
                else if (ddlorgconsolidated.SelectedIndex == 3)//PBSectt
                {
                    dsprev = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                                                new SqlParameter("@Month", monid),
                                                                                                new SqlParameter("@year", yearid),
                                                                                                new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                                                new SqlParameter("@submittedtopb", submittedtoPB),
                                                                                                new SqlParameter("@flag", 7));
                    dscurrent = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 8));
                    dslastmonth = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP_2_ministryformatreport", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 10));
                }
                if (dscurrent.Tables[0].Rows.Count != 0)
                {
                    lblcurmnth1.Text = dscurrent.Tables[0].Rows[0][0].ToString();
                    lblcurmnth2.Text = dscurrent.Tables[0].Rows[0][1].ToString();
                    lblcurmnth3.Text = dscurrent.Tables[0].Rows[0][2].ToString();
                    lblcurmnth4.Text = dscurrent.Tables[0].Rows[0][3].ToString();
                    lblcurmnth5.Text = dscurrent.Tables[0].Rows[0][4].ToString();
                    lblcurmnth6.Text = dscurrent.Tables[0].Rows[0][5].ToString();
                    lblcurmnth7ano.Text = dscurrent.Tables[0].Rows[0][6].ToString();
                    lblcurmnth7aAmt.Text = dscurrent.Tables[0].Rows[0][7].ToString();
                    lblcurmnth7bno.Text = dscurrent.Tables[0].Rows[0][8].ToString();
                    lblcurmnth7bAmt.Text = dscurrent.Tables[0].Rows[0][9].ToString();
                    lblcurmnth7cNo.Text = dscurrent.Tables[0].Rows[0][10].ToString();
                    lblcurmnth7cAmt.Text = dscurrent.Tables[0].Rows[0][11].ToString();
                    lblcurmnth8.Text = dscurrent.Tables[0].Rows[0][12].ToString();
                    lblcurmnth9.Text = dscurrent.Tables[0].Rows[0][13].ToString();
                    lblcurmnth10.Text = dscurrent.Tables[0].Rows[0][14].ToString();
                    lblcurmnth11.Text = dscurrent.Tables[0].Rows[0][15].ToString();
                    lblcurmnth12.Text = dscurrent.Tables[0].Rows[0][16].ToString();
                    lblcurmnth13.Text = dscurrent.Tables[0].Rows[0][17].ToString();
                    lblcurmnth14.Text = dscurrent.Tables[0].Rows[0][18].ToString();
                    lblcurmnth15.Text = "--";
                }
                else
                {
                    lblcurmnth1.Text = "--";
                    lblcurmnth2.Text = "--";
                    lblcurmnth3.Text = "--";
                    lblcurmnth4.Text = "--";
                    lblcurmnth5.Text = "--";
                    lblcurmnth6.Text = "--";
                    lblcurmnth7ano.Text = "--";
                    lblcurmnth7aAmt.Text = "--";
                    lblcurmnth7bno.Text = "--";
                    lblcurmnth7bAmt.Text = "--";
                    lblcurmnth7cNo.Text = "--";
                    lblcurmnth7cAmt.Text = "--";
                    lblcurmnth8.Text = "--";
                    lblcurmnth9.Text = "--";
                    lblcurmnth10.Text = "--";
                    lblcurmnth11.Text = "--";
                    lblcurmnth12.Text = "--";
                    lblcurmnth13.Text = "--";
                    lblcurmnth14.Text = "--";
                    lblcurmnth15.Text = "--";
                }
                if (dslastmonth.Tables[0].Rows.Count != 0)
                {
                    lbllastmonth1.Text = dslastmonth.Tables[0].Rows[0][0].ToString();
                    lbllastmonth2.Text = dslastmonth.Tables[0].Rows[0][1].ToString();
                    lbllastmonth3.Text = dslastmonth.Tables[0].Rows[0][2].ToString();
                    lbllastmonth4.Text = dslastmonth.Tables[0].Rows[0][3].ToString();
                    lbllastmonth5.Text = dslastmonth.Tables[0].Rows[0][4].ToString();
                    lbllastmonth6.Text = dslastmonth.Tables[0].Rows[0][5].ToString();
                    lbllastmonth7ano.Text = dslastmonth.Tables[0].Rows[0][6].ToString();
                    lbllastmonth7aAmt.Text = dslastmonth.Tables[0].Rows[0][7].ToString();
                    lbllastmonth7bno.Text = dslastmonth.Tables[0].Rows[0][8].ToString();
                    lbllastmonth7bAmt.Text = dslastmonth.Tables[0].Rows[0][9].ToString();
                    lbllastmonth7cNo.Text = dslastmonth.Tables[0].Rows[0][10].ToString();
                    lbllastmonth7cAmt.Text = dslastmonth.Tables[0].Rows[0][11].ToString();
                    lbllastmonth8.Text = dslastmonth.Tables[0].Rows[0][12].ToString();
                    lbllastmonth9.Text = dslastmonth.Tables[0].Rows[0][13].ToString();
                    lbllastmonth10.Text = dslastmonth.Tables[0].Rows[0][14].ToString();
                    lbllastmonth11.Text = dslastmonth.Tables[0].Rows[0][15].ToString();
                    lbllastmonth12.Text = dslastmonth.Tables[0].Rows[0][16].ToString();
                    lbllastmonth13.Text = dslastmonth.Tables[0].Rows[0][17].ToString();
                    lbllastmonth14.Text = dslastmonth.Tables[0].Rows[0][18].ToString();
                    lbllastmonth15.Text = "--";

                }
                else
                {
                    lbllastmonth1.Text = "--";
                    lbllastmonth2.Text = "--";
                    lbllastmonth3.Text = "--";
                    lbllastmonth4.Text = "--";
                    lbllastmonth5.Text = "--";
                    lbllastmonth6.Text = "--";
                    lbllastmonth7ano.Text = "--";
                    lbllastmonth7aAmt.Text = "--";
                    lbllastmonth7bno.Text = "--";
                    lbllastmonth7bAmt.Text = "--";
                    lbllastmonth7cNo.Text = "--";
                    lbllastmonth7cAmt.Text = "--";
                    lbllastmonth8.Text = "--";
                    lbllastmonth9.Text = "--";
                    lbllastmonth10.Text = "--";
                    lbllastmonth11.Text = "--";
                    lbllastmonth12.Text = "--";
                    lbllastmonth13.Text = "--";
                    lbllastmonth14.Text = "--";
                    lbllastmonth15.Text = "--";

                }
                if (ddlmonth.SelectedValue == "4")//April
                {
                    lblprevmnth1.Text = "0";
                    lblprevmnth2.Text = "0";
                    lblprevmnth3.Text = "0";
                    lblprevmnth4.Text = "0";
                    lblprevmnth5.Text = "0";
                    lblprevmnth6.Text = "0";
                    lblprevmnth7aNo.Text = "0";
                    lblprevmnth7aAmt.Text = "0";
                    lblprevmnth7bNo.Text = "0";
                    lblprevmnth7bAmt.Text = "0";
                    lblprevmnth7cNo.Text = "0";
                    lblprevmnth7cAmt.Text = "0";
                    lblprevmnth8.Text = "0";
                    lblprevmnth9.Text = "0";
                    lblprevmnth10.Text = "0";
                    lblprevmnth11.Text = "0";
                    lblprevmnth12.Text = "0";
                    lblprevmnth13.Text = "0";
                    lblprevmnth14.Text = "0";
                    lblprevmnth15.Text = "--";

                    //last month
                    lbllastmonth1.Text = "0";
                    lbllastmonth2.Text = "0";
                    lbllastmonth3.Text = "0";
                    lbllastmonth4.Text = "0";
                    lbllastmonth5.Text = "0";
                    lbllastmonth6.Text = "0";
                    lbllastmonth7ano.Text = "0";
                    lbllastmonth7aAmt.Text = "0";
                    lbllastmonth7bno.Text = "0";
                    lbllastmonth7bAmt.Text = "0";
                    lbllastmonth7cNo.Text = "0";
                    lbllastmonth7cAmt.Text = "0";
                    lbllastmonth8.Text = "0";
                    lbllastmonth9.Text = "0";
                    lbllastmonth10.Text = "0";
                    lbllastmonth11.Text = "0";
                    lbllastmonth12.Text = "0";
                    lbllastmonth13.Text = "0";
                    lbllastmonth14.Text = "0";
                    lbllastmonth15.Text = "--";

                    //percentage Change
                    lblperchange1.Text = "--";
                    lblperchange2.Text = "--";
                    lblperchange3.Text = "--";
                    lblperchange4.Text = "--";
                    lblperchange5.Text = "--";
                    lblperchange6.Text = "--";
                    lblperchange7aNo.Text = "--";
                    lblperchange7aAmt.Text = "--";
                    lblperchange7bNo.Text = "--";
                    lblperchange7bAmt.Text = "--";
                    lblperchange7cNo.Text = "--";
                    lblperchange7cAmt.Text = "--";
                    lblperchange8.Text = "--";
                    lblperchange9.Text = "--";
                    lblperchange10.Text = "--";
                    lblperchange11.Text = "--";
                    lblperchange12.Text = "--";
                    lblperchange13.Text = "--";
                    lblperchange14.Text = "--";
                    lblperchange15.Text = "--";

                }
                else
                {
                    if (dsprev.Tables[0].Rows.Count != 0)
                    {
                        lblprevmnth1.Text = dsprev.Tables[0].Rows[0][0].ToString();
                        lblprevmnth2.Text = dsprev.Tables[0].Rows[0][1].ToString();
                        lblprevmnth3.Text = dsprev.Tables[0].Rows[0][2].ToString();
                        lblprevmnth4.Text = dsprev.Tables[0].Rows[0][3].ToString();
                        lblprevmnth5.Text = dsprev.Tables[0].Rows[0][4].ToString();
                        lblprevmnth6.Text = dsprev.Tables[0].Rows[0][5].ToString();
                        lblprevmnth7aNo.Text = dsprev.Tables[0].Rows[0][6].ToString();
                        lblprevmnth7aAmt.Text = dsprev.Tables[0].Rows[0][7].ToString();
                        lblprevmnth7bNo.Text = dsprev.Tables[0].Rows[0][8].ToString();
                        lblprevmnth7bAmt.Text = dsprev.Tables[0].Rows[0][9].ToString();
                        lblprevmnth7cNo.Text = dsprev.Tables[0].Rows[0][10].ToString();
                        lblprevmnth7cAmt.Text = dsprev.Tables[0].Rows[0][11].ToString();
                        lblprevmnth8.Text = dsprev.Tables[0].Rows[0][12].ToString();
                        lblprevmnth9.Text = dsprev.Tables[0].Rows[0][13].ToString();
                        lblprevmnth10.Text = dsprev.Tables[0].Rows[0][14].ToString();
                        lblprevmnth11.Text = dsprev.Tables[0].Rows[0][15].ToString();
                        lblprevmnth12.Text = dsprev.Tables[0].Rows[0][16].ToString();
                        lblprevmnth13.Text = dsprev.Tables[0].Rows[0][17].ToString();
                        lblprevmnth14.Text = dsprev.Tables[0].Rows[0][18].ToString();
                        lblprevmnth15.Text = "--";
                    }
                    else
                    {
                        lblprevmnth1.Text = "--";
                        lblprevmnth2.Text = "--";
                        lblprevmnth3.Text = "--";
                        lblprevmnth4.Text = "--";
                        lblprevmnth5.Text = "--";
                        lblprevmnth6.Text = "--";
                        lblprevmnth7aNo.Text = "--";
                        lblprevmnth7aAmt.Text = "--";
                        lblprevmnth7bNo.Text = "--";
                        lblprevmnth7bAmt.Text = "--";
                        lblprevmnth7cNo.Text = "--";
                        lblprevmnth7cAmt.Text = "--";
                        lblprevmnth8.Text = "--";
                        lblprevmnth9.Text = "--";
                        lblprevmnth10.Text = "--";
                        lblprevmnth11.Text = "--";
                        lblprevmnth12.Text = "--";
                        lblprevmnth13.Text = "--";
                        lblprevmnth14.Text = "--";
                        lblprevmnth15.Text = "--";
                    }
                    //percentage Change
                    if (dscurrent.Tables[0].Rows.Count != 0)
                    {
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][0]) != 0)
                        {
                            lblperchange1.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][0])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][0])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][0])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange1.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][1]) != 0)
                        {
                            lblperchange2.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][1])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][1])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][1])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange2.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][2]) != 0)
                        {
                            lblperchange3.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][2])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][2])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][2])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange3.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][3]) != 0)
                        {
                            lblperchange4.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][3])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][3])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][3])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange4.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][4]) != 0)
                        {
                            lblperchange5.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][4])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][4])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][4])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange5.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][5]) != 0)
                        {
                            lblperchange6.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][5])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][5])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][5])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange6.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][6]) != 0)
                        {
                            lblperchange7aNo.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][6])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][6])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][6])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7aNo.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][7]) != 0)
                        {
                            lblperchange7aAmt.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][7])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][7])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][7])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7aAmt.Text = "--";
                        }

                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][8]) != 0)
                        {
                            lblperchange7bNo.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][8])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][8])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][8])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7bNo.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][9]) != 0)
                        {
                            lblperchange7bAmt.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][9])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][9])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][9])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7bAmt.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][10]) != 0)
                        {
                            lblperchange7cNo.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][10])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][10])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][10])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7cNo.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][11]) != 0)
                        {
                            lblperchange7cAmt.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][11])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][11])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][11])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange7cAmt.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][12]) != 0)
                        {
                            lblperchange8.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][12])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][12])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][12])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange8.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][13]) != 0)
                        {
                            lblperchange9.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][13])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][13])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][13])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange9.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][14]) != 0)
                        {
                            lblperchange10.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][14])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][14])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][14])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange10.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][15]) != 0)
                        {
                            lblperchange11.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][15])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][15])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][15])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange11.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][16]) != 0)
                        {
                            lblperchange12.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][16])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][16])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][16])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange12.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][17]) != 0)
                        {
                            lblperchange13.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][17])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][17])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][17])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange13.Text = "--";
                        }
                        if (Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][18]) != 0)
                        {
                            lblperchange14.Text = Math.Round((((Convert.ToDecimal(dscurrent.Tables[0].Rows[0][18])- Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][18])) / Convert.ToDecimal(dslastmonth.Tables[0].Rows[0][18])) * 100), 2).ToString();
                        }
                        else
                        {
                            lblperchange14.Text = "--";
                        }
                        lblperchange15.Text = "--";
                    }
                    else
                    {
                        lblperchange1.Text = "--";
                        lblperchange2.Text = "--";
                        lblperchange3.Text = "--";
                        lblperchange4.Text = "--";
                        lblperchange5.Text = "--";
                        lblperchange6.Text = "--";
                        lblperchange7aNo.Text = "--";
                        lblperchange7aAmt.Text = "--";
                        lblperchange7bNo.Text = "--";
                        lblperchange7bAmt.Text = "--";
                        lblperchange7cNo.Text = "--";
                        lblperchange7cAmt.Text = "--";
                        lblperchange8.Text = "--";
                        lblperchange9.Text = "--";
                        lblperchange10.Text = "--";
                        lblperchange11.Text = "--";
                        lblperchange12.Text = "--";
                        lblperchange13.Text = "--";
                        lblperchange14.Text = "--";
                        lblperchange15.Text = "--";
                    }


                }
            }
            string calyear = "";
            int Ylen = 0;
            Ylen = ddlyear.SelectedItem.Text.Length;
            if (Convert.ToInt16(ddlmonth.SelectedValue)>=4 && Convert.ToInt16(ddlmonth.SelectedValue)<=12 )
            {
                calyear = ddlyear.SelectedItem.Text.Substring(0, 4);
            }
            else
            {
                calyear = ddlyear.SelectedItem.Text.Substring(5,4);
            }
            Label29.Text = ddlmonth.SelectedItem.Text +"-"+calyear+ " (FY: " + ddlyear.SelectedItem.Text+")";
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMReports.aspx", true);
        }

        
    }
}