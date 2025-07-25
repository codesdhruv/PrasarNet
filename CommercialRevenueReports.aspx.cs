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
    public partial class CommercialRevenueReports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) == "")
            {
                Response.Redirect("homepage.aspx");
            }
            else
            {
                if (!IsPostBack)
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
                    Label1.Text = Convert.ToString(Session["UserName"]);


                    cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select Month--",
                                                                                                            new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select Year--",
                                                                                                            new SqlParameter("@flag", 1));
                    ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (2,3,4)", "PRASARNETConnectionString");
                    ddlorg.DataSource = ds;
                    ddlorg.Items.Clear();
                    ddlorg.Items.Add(new ListItem("--All--", ""));
                    ddlorg.AppendDataBoundItems = true;
                    ddlorg.DataValueField = "OrganizationId";
                    ddlorg.DataTextField = "Abbreviation";
                    ddlorg.DataBind();
                }
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            divfilter.Visible = true;
        }

        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlorg.SelectedIndex != 0)
            {

                cmm.bindDDLWidParam(ddlstation, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", "--All--", new SqlParameter("@orgId", ddlorg.SelectedValue));
            }            
            ddlstation.ClearSelection();
        }
    }
}