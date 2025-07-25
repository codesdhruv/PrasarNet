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
    public partial class GEMReports : System.Web.UI.Page
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
                divmonthlystationreports.Visible = false;
                divmonthlystationreportsforadg.Visible = false;
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--All--",
                                                                                                            new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--All--",
                                                                                                            new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlddo, "PN18_DDO", "DDOOffice", "DDOID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 2));

                    if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
                    {
                        if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                        {
                            lbldefaulter2.Visible = true;
                            lblsubmitted2.Visible = true;
                            Label1637.Visible = false;
                            Label1638.Visible = false;
                            Label1633.Visible = true;
                            Label1636.Visible = false;
                            Label1634.Visible = true;
                            Label1635.Visible = false;
                            LinkButton4.Visible = true;
                            LinkButton5.Visible = false;
                            ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (2)", "PRASARNETConnectionString");
                        }
                        else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR// CCW Reports here can be seen in AIR
                        {
                            lbldefaulter2.Visible = true;
                            lblsubmitted2.Visible = true;
                            Label1637.Visible = false;
                            Label1638.Visible = false;
                            Label1633.Visible = true;
                            Label1636.Visible = false;
                            Label1634.Visible = true;
                            Label1635.Visible = false;
                            LinkButton4.Visible = true;
                            LinkButton5.Visible = false;
                            ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (3,4)", "PRASARNETConnectionString");
                        }
                        div23.Visible = false;
                        div28.Visible = false;
                        divforwarded.Visible = false;
                        ddlorg.DataSource = ds;
                        ddlorg.Items.Clear();
                        ddlorg.Items.Add(new ListItem("--All--", ""));
                        ddlorg.AppendDataBoundItems = true;
                        ddlorg.DataValueField = "OrganizationId";
                        ddlorg.DataTextField = "Abbreviation";
                        ddlorg.DataBind();
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
                            lbldefaulter2.Visible = false;
                            lblsubmitted2.Visible = false;
                            Label1637.Visible = true;
                            Label1638.Visible = true;
                            Label1636.Visible = true;
                            Label1633.Visible = false;
                            Label1634.Visible = false;
                            Label1635.Visible = true;
                            div23.Visible = true;
                            div28.Visible = true;
                            divforwarded.Visible = true;
                            LinkButton4.Visible = false;
                            LinkButton5.Visible = true;
                            AdminMenu.Visible = false;
                            StationSectionMenu.Visible = true;
                            ds = cmm.RunSQLReturnDS("Select OrganizationId,Abbreviation from PN18_Organisation where OrganizationId in (1,2,3,4)", "PRASARNETConnectionString");
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

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }


        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlorg.SelectedIndex != 0)
            {

                cmm.bindDDLWidParam(ddluploadedby, "PN18_usertypeproc", "Usertype", "Usertypeid", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 5),
                                                                                                                                              new SqlParameter("@orgid", Convert.ToInt32(ddlorg.SelectedValue)));
            }
            divgrd.Visible = false;
            ddlstation.ClearSelection();
        }

        protected void ddluploadedby_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" || ddluploadedby.SelectedValue == "24") //Station
            {
                lblstn.Text = "Station";
                cmm.bindDDLWidParam(ddlstation, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", "--All--", new SqlParameter("@orgId", ddlorg.SelectedValue));

            }
            else if (ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Section
            {
                lblstn.Text = "Section";
                cmm.bindDDLWidParam(ddlstation, "PN18_SectionProc", "secname", "userID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 2),
                                                                                                                                  new SqlParameter("@orgId", ddlorg.SelectedValue));
            }
            divgrd.Visible = false;
        }
        private void bindgrid()
        {
            int stnsecid = 0;
            int monid = 0;
            int yearid = 0;
            int orgid = 0;
            int utypid = 0;
            int ddoid = 0;
            bool? submittedtodirectorate= null;
            bool? submittedtoPB = null;
            bool? submittedtoministry = null;

            if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                {
                    submittedtodirectorate = true;
                    //submittedtoministry = false;
                    //submittedtoPB = false;
                }
                else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR
                {
                    submittedtodirectorate = true;
                    //submittedtoministry = false;
                    //submittedtoPB = false;
                }
            }

            else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                {
                    if (ddlforwarded.SelectedIndex == 0)// all
                    {
                        submittedtodirectorate = true;
                        //submittedtoministry = false;
                        //submittedtoPB = true;
                    }
                    else if (ddlforwarded.SelectedIndex == 1)// forwared to PB sectt
                    {
                        submittedtoPB = true;
                    }
                    else if (ddlforwarded.SelectedIndex == 2)// Not-forwared to PB sectt
                    {
                        submittedtodirectorate = true;
                        submittedtoPB = false;
                    }
                    
                }
            }

            if (ddlorg.SelectedItem.Text != "--All--")
            {
                orgid = Convert.ToInt32(ddlorg.SelectedValue);
                if (ddluploadedby.SelectedItem.Text != "--All--")
                {
                    utypid = Convert.ToInt32(ddluploadedby.SelectedValue);
                }
            }
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" ||
                ddluploadedby.SelectedValue == "24" || ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Station
            {
                if (ddlstation.SelectedItem.Text != "--All--")
                {
                    stnsecid = Convert.ToInt32(ddlstation.SelectedValue);
                }
            }
            if (ddlmonth.SelectedItem.Text != "--All--")
            {
                monid = Convert.ToInt32(ddlmonth.SelectedValue);
            }

            if (ddlyear.SelectedItem.Text != "--All--")
            {
                yearid = Convert.ToInt32(ddlyear.SelectedValue);
            }
            if (ddlddo.SelectedItem.Text != "--All--")
            {
                ddoid = Convert.ToInt32(ddlddo.SelectedValue);
            }


            if (ddlorg.SelectedIndex == 0)
            {
                if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", stnsecid),
                                                                              new SqlParameter("@usertypeid", utypid),
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@DDOid", ddoid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                              new SqlParameter("@flag", 27));
                    grdgemprocDetails.Columns[11].Visible = true;
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", stnsecid),
                                                                              new SqlParameter("@usertypeid", utypid),
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@DDOid", ddoid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                              new SqlParameter("@flag", 28));
                    grdgemprocDetails.Columns[11].Visible = true;

                }
                else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", stnsecid),
                                                                             new SqlParameter("@orgid", orgid),
                                                                              new SqlParameter("@usertypeid", utypid),
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@DDOid", ddoid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                              new SqlParameter("@flag", 12));
                    grdgemprocDetails.Columns[11].Visible = false;

                }
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", stnsecid),
                                                                             new SqlParameter("@orgid", orgid),
                                                                              new SqlParameter("@usertypeid", utypid),
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@DDOid", ddoid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                              new SqlParameter("@flag", 12));
            }
            grdgemprocDetails.DataSource = ds;
            grdgemprocDetails.DataBind();
            grdgemprocDetails.PageIndex = 1;
            divgrd.Visible = true;

        }

        private void bindgridesclate()
        {
            int monid;
            int yearid;
            bool submittedtodirectorate = false;
            bool submittedtoPB = false;
            bool submittedtoministry = false;

            if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD// Setting and Resseting the Submmited bit to respective directo.. and PB
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                {
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = false;
                }
                else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR
                {
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = false;
                }
            }

            else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                {
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = true;
                }
            }
            monid = Convert.ToInt32(ddlmonth.SelectedValue);
            yearid = Convert.ToInt32(ddlyear.SelectedValue);


            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                          new SqlParameter("@flag", 13));
                grdgemprocDetails.Columns[11].Visible = true;
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@submittedtoministry", submittedtoministry),
                                                                          new SqlParameter("@flag", 14));
                grdgemprocDetails.Columns[11].Visible = true;

            }

            int count = Convert.ToInt32(ds.Tables[0].Rows.Count);
            ViewState["countbeforeesclate"] = count;
            grdgemprocDetails.DataSource = ds;
            grdgemprocDetails.DataBind();
            grdgemprocDetails.PageIndex = 1;
            divgrd.Visible = true;

        }
        protected void btngetdata_Click(object sender, EventArgs e)
        {
            if (ViewState["operation"].ToString() == "esclate")
            {
                bindgridesclate();
            }
            else
            {
                bindgrid();
            }

            //if (ddlorg.SelectedIndex == 0 && ddlddo.SelectedIndex == 0 && ddlmonth.SelectedIndex!=0 && ddlyear.SelectedIndex!=0)
            if (ViewState["operation"].ToString() == "esclate")
            {
                divshow.Visible = true;
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
                lbldef.Text = Convert.ToString(defaulters);
                lblsub.Text = Convert.ToString(sub);

                grdconsolidated0.Visible = true;
                int monid = 0;
                int yearid = 0;

                bool submittedtodirectorate = false;
                bool submittedtoPB = false;
                bool submittedtoministry = false;
                if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
                {
                    if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                    {
                        LinkButton3.Visible = true;
                        submittedtodirectorate = true;
                        submittedtoministry = false;
                        submittedtoPB = false;
                    }
                    else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR
                    {
                        LinkButton3.Visible = true;
                        submittedtodirectorate = true;
                        submittedtoministry = false;
                        submittedtoPB = false;
                    }
                }

                else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
                {
                    if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                    {
                        LinkButton3.Visible = false;
                        submittedtodirectorate = true;
                        submittedtoministry = false;
                        submittedtoPB = true;
                    }
                }


                if (ddlmonthconsolidated.SelectedIndex != 0)
                {
                    monid = Convert.ToInt32(ddlmonth.SelectedValue);
                }

                if (ddlyearconsolidated.SelectedIndex != 0)
                {
                    yearid = Convert.ToInt32(ddlyear.SelectedValue);
                }



                if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 25));

                }
                else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 26));


                }
                else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
                {
                    ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", monid),
                                                                              new SqlParameter("@year", yearid),
                                                                              new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                              new SqlParameter("@submittedtopb", submittedtoPB),
                                                                              new SqlParameter("@flag", 24));


                }


                grdconsolidated0.DataSource = ds;
                grdconsolidated0.DataBind();
                grdconsolidated0.PageIndex = 1;
                divgrd.Visible = true;
            }
            else if (ViewState["operation"].ToString() == "customised")
            {
                divshow.Visible = false;
                grdconsolidated0.Visible = false;
            }
            divnormal.Visible = true;
            divconsolidated.Visible = false;
            grdgemprocDetails.Focus();
        }
        private void bindgrdconsolidated0()
        {
            grdconsolidated0.Visible = true;
            int monid = 0;
            int yearid = 0;

            bool submittedtodirectorate = false;
            bool submittedtoPB = false;
            bool submittedtoministry = false;
            if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                {
                    LinkButton3.Visible = true;
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = false;
                }
                else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR
                {
                    LinkButton3.Visible = true;
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = false;
                }
            }

            else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 215)// GA Section
                {
                    LinkButton3.Visible = false;
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = true;
                }
            }


            if (ddlmonthconsolidated.SelectedIndex != 0)
            {
                monid = Convert.ToInt32(ddlmonth.SelectedValue);
            }

            if (ddlyearconsolidated.SelectedIndex != 0)
            {
                yearid = Convert.ToInt32(ddlyear.SelectedValue);
            }



            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 25));

            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 26));


            }
            else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 24));


            }


            grdconsolidated0.DataSource = ds;
            grdconsolidated0.DataBind();
            grdconsolidated0.PageIndex = 1;
            divgrd.Visible = true;
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMProcurement.aspx", true);
        }

        protected void grdgemprocDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdgemprocDetails.PageIndex = e.NewPageIndex;
            bindgrid();

        }



        protected void ddlmonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            divgrd.Visible = false;
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            divgrd.Visible = false;
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdgemprocDetails.AllowPaging = false;
                //grdgemprocDetails.Columns[9].Visible = false;

                bindgrid();

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdgemprocDetails.RenderControl(hw);
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
                grdgemprocDetails.AllowPaging = true;
                //grdgemprocDetails.Columns[9].Visible = true;
                bindgrdconsolidated0();
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

        protected void grdgemprocDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Finding label
                Label lblfortopb = (Label)e.Row.FindControl("lblfortopb");
                //Finding linkbutton
                LinkButton btnfor = (LinkButton)e.Row.FindControl("lnkbtn1");
                // Retrieve the underlying data item. In this example
                // the underlying data item is a DataRowView object.
                DataRowView rowView = (DataRowView)e.Row.DataItem;


                // Retrieve the key value for the current row. Here it is an int.
                int gem_tranid = (int)rowView["gem_transid"];
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@gem_transid", gem_tranid),
                                                                              new SqlParameter("@flag", 16));

                if (Convert.ToBoolean(ds.Tables[0].Rows[0][0]))
                {
                    lblfortopb.Visible = true;
                    btnfor.Visible = false;
                    lblfortopb.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblfortopb.Visible = true;
                    btnfor.Visible = false;
                    lblfortopb.Text = "Not Forwarded to PB";
                    lblfortopb.ForeColor = System.Drawing.Color.Red;
                }
            }

        }



        protected void btngemreports_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/GEMDefaulters.aspx", true);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            divfilter.Visible = true;
            divconsolidatedmonthnyear.Visible = false;
            divgrd.Visible = false;
            divnormal.Visible = false;
            divconsolidated.Visible = false;
            ViewState["operation"] = "customised";
            rfvmonthesc.Enabled = false;
            rfvyearesc.Enabled = false;
            div6.Visible = true;
            div17.Visible = true;
            div7.Visible = true;
            div11.Visible = true;
            div13.Visible = true;
            div16.Visible = true;
            ddlmonth.SelectedIndex = 0;
            ddlyear.SelectedIndex = 0;
            LinkButton3.Visible = false;
            grdgemprocDetails.Caption = "Submitted Records as per the Selected Parameters";
            Label4.Text = "Filter Records";
        }

        protected void btneditddo_Click(object sender, EventArgs e)
        {
            divfilter.Visible = false;
            divconsolidatedmonthnyear.Visible = true;
            divgrd.Visible = false;
            divnormal.Visible = false;
            divconsolidated.Visible = false;
            cmm.bindDDLWidParam(ddlmonthconsolidated, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select--",
                                                                                                           new SqlParameter("@flag", 2));
            cmm.bindDDLWidParam(ddlyearconsolidated, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select--",
                                                                                                    new SqlParameter("@flag", 1));
        }

        protected void btnconsolidatedfetch_Click(object sender, EventArgs e)
        {

            int defaulters = 0;
            int total = 0;
            int sub = 0;
            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                Label7.Visible = true;
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonthconsolidated.SelectedValue)),
                                                                              new SqlParameter("@year", Convert.ToInt16(ddlyearconsolidated.SelectedValue)),
                                                                              new SqlParameter("@flag", 23));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 22));
                sub = total - defaulters;

            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                Label7.Visible = true;
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                             new SqlParameter("@Month", Convert.ToInt16(ddlmonthconsolidated.SelectedValue)),
                                                                             new SqlParameter("@year", Convert.ToInt16(ddlyearconsolidated.SelectedValue)),
                                                                             new SqlParameter("@flag", 21));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 20));
                sub = total - defaulters;
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                Label7.Visible = false;
                defaulters = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                             new SqlParameter("@Month", Convert.ToInt16(ddlmonthconsolidated.SelectedValue)),
                                                                             new SqlParameter("@year", Convert.ToInt16(ddlyearconsolidated.SelectedValue)),
                                                                             new SqlParameter("@flag", 32));
                total = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@flag", 31));
                sub = total - defaulters;
            }
            lblnoofdefaulters.Text = Convert.ToString(defaulters);
            lbleportsub.Text = Convert.ToString(sub);

            bindgridconsolidated();
            divnormal.Visible = false;
            divconsolidated.Visible = true;
            grdconsolidated.Focus();
        }
        private void bindgridconsolidated()
        {

            int monid = 0;
            int yearid = 0;
          
            bool? submittedtodirectorate = null;
            bool? submittedtoPB = null;
            bool? submittedtoministry = null;
            if ((Convert.ToInt16(Session["Usertype"]) == 12) || (Convert.ToInt16(Session["Usertype"]) == 25)) // GA Section of DGAIR and DGDD
            {
                if (Convert.ToInt32(Session["Station_SectionID"]) == 237)//GA DGDD
                {
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = true;
                }
                else if (Convert.ToInt32(Session["Station_SectionID"]) == 228)// GA DGAIR
                {
                    submittedtodirectorate = true;
                    submittedtoministry = false;
                    submittedtoPB = true;
                }
            }

            else if (Convert.ToInt16(Session["Usertype"]) == 26)// PB Sections
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


            if (ddlmonthconsolidated.SelectedIndex != 0)
            {
                monid = Convert.ToInt32(ddlmonthconsolidated.SelectedValue);
            }

            if (ddlyearconsolidated.SelectedIndex != 0)
            {
                yearid = Convert.ToInt32(ddlyearconsolidated.SelectedValue);
            }



            if ((Convert.ToInt16(Session["Usertype"]) == 12 && Convert.ToInt32(Session["Station_SectionID"]) == 228))//GA Section of DGAIR
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 25));

            }
            else if (Convert.ToInt16(Session["Usertype"]) == 25 && Convert.ToInt32(Session["Station_SectionID"]) == 237) // GA Section of DGDD
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 26));


            }
            else if (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 215) // GA Section of PB
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                          new SqlParameter("@Month", monid),
                                                                          new SqlParameter("@year", yearid),
                                                                          new SqlParameter("@submittedtodirectorate", submittedtodirectorate),
                                                                          new SqlParameter("@submittedtopb", submittedtoPB),
                                                                          new SqlParameter("@flag", 24));


            }
            
            grdconsolidated.DataSource = ds;
            grdconsolidated.DataBind();
            grdconsolidated.PageIndex = 1;
            divgrd.Visible = true;
            //divgrd.Focus();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                grdconsolidated.AllowPaging = false;
                //grdgemprocDetails.Columns[9].Visible = false;

                bindgridconsolidated();
                divnormal.Visible = false;
                divconsolidated.Visible = true;
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdconsolidated.RenderControl(hw);
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
                grdconsolidated.AllowPaging = true;
                //grdgemprocDetails.Columns[9].Visible = true;

                bindgridconsolidated();
                divnormal.Visible = false;
                divconsolidated.Visible = true;
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }

        protected void grdgemprocDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "forwardtopb")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int gem_transid = (int)grdgemprocDetails.DataKeys[row.RowIndex].Value;
                int i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@flag", 15));
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Records Forwarded to Directorate Successfully!!');", true);



                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);

                }
                bindgrid();
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["countbeforeesclate"]) <= 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('No Records to Forward. Kindly Check!!');", true);
            }
            else
            {
                int i = 0;
                grdgemprocDetails.AllowPaging = false;
                bindgridesclate();
                int countrowsbeforeupdating = grdgemprocDetails.Rows.Count;
                for (int count = 0; count < grdgemprocDetails.Rows.Count; count++)
                {

                    Label lblgemtrnid = (Label)grdgemprocDetails.Rows[count].FindControl("lblgemtrnid");
                    i += cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString",
                                                                              new SqlParameter("@gem_transid", Convert.ToInt32(lblgemtrnid.Text)),
                                                                              new SqlParameter("@flag", 29));

                }
                grdgemprocDetails.AllowPaging = true;
                bindgridesclate();
                if (i == countrowsbeforeupdating)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('All Records Sucessfully has been Forwared to PB Sectt!!');", true);
                }
                else if (i < countrowsbeforeupdating && i != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some of the Records has been Sucessfully Forwared to PB Sectt!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }

            }



        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            divfilter.Visible = true;
            divconsolidatedmonthnyear.Visible = false;
            divgrd.Visible = false;
            divnormal.Visible = false;
            divconsolidated.Visible = false;
            div6.Visible = false;
            div17.Visible = false;
            div7.Visible = false;
            div11.Visible = true;
            div13.Visible = true;
            div16.Visible = false;
            ViewState["operation"] = "esclate";
            rfvmonthesc.Enabled = true;
            rfvyearesc.Enabled = true;
            LinkButton3.Visible = true;
            grdgemprocDetails.Caption = "Bifurcation of Consolidated Figure";
            Label4.Text = "Select Month & Year";


        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GeMReportInMinistryFormat.aspx", true);
        }
    }
}