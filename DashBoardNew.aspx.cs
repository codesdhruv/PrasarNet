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

namespace PrasarNet
{
    public partial class DashBoardNew : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        DataSet dsorder1 = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            lnkcoronawarriors.CssClass = "font2 blink_me";
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {

                    //Binding a CEO Photo in Message Corner
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    DataSet dsp = new DataSet();
                    dsp = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", 2), new SqlParameter("@flag", 5));
                    if (dsp.Tables[0].Rows[0][0] != "")
                    {
                        string imgdsp = Convert.ToString(dsp.Tables[0].Rows[0][0]);
                        imgceo.ImageUrl = "~/ManagementPhoto/" + imgdsp;
                    }
                    lblnameCEO.Text = Convert.ToString(dsp.Tables[0].Rows[0][9]);
                    //Binding a DGAIR Photo in Message Corner
                    dsp = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", 1), new SqlParameter("@flag", 5));
                    if (dsp.Tables[0].Rows[0][0] != "")
                    {
                        string imgdsdgair = Convert.ToString(dsp.Tables[0].Rows[0][0]);
                        imgdgair.ImageUrl = "~/ManagementPhoto/" + imgdsdgair;
                    }
                    lblDGAIRname.Text = Convert.ToString(dsp.Tables[0].Rows[0][9]);

                    dsp = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", 5), new SqlParameter("@flag", 5));
                    if (dsp.Tables[0].Rows[0][0] != "")
                    {
                        string imgdsdgdd = Convert.ToString(dsp.Tables[0].Rows[0][0]);
                        imgdgdd.ImageUrl = "~/ManagementPhoto/" + imgdsdgdd;
                    }
                    lbldgddn.Text = Convert.ToString(dsp.Tables[0].Rows[0][9]);

                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        divreports.Visible = false;
                        divemppanel.Visible = true;
                        divcoronavac.Visible = true;
                        divemail.Visible = false;
                        divstnsecdirectory.Visible = true;
                        divcoronaexp.Visible = false;
                        divcoronawarriors.Visible = false;
                        divfeedbacknGrievances.Visible = false;
                        lnkgrievances.Visible = true;
                        divgrievanceemployee.Visible = true;
                        divcommercialrevenueimg.Visible = false;
                        //divhos.Visible = true;
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                        //divempprofile.Visible = true;
                        //divstationinfo.Visible = false;
                        //divmanagemntprofile.Visible = false;
                        trempphoto.Visible = true;
                        trstationphoto.Visible = false;
                        trmanagementphoto.Visible = false;
                        divmanagemodules.Visible = false;
                        divpbhs.Visible = true;
                        DataSet dsphoto = new DataSet();
                        dsphoto = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                              new SqlParameter("@flag", 3));
                        if (dsphoto.Tables[0].Rows[0][0] != "")
                        {
                            string imgname = Convert.ToString(dsphoto.Tables[0].Rows[0][0]);
                            ImageButton3.ImageUrl = "~/empphoto/" + imgname;
                        }
                        DataSet ds1 = new DataSet();
                        ds1 = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                    new SqlParameter("@flag", 1));
                        //lblNamedis.Text = Convert.ToString(ds1.Tables[0].Rows[0][2]);
                        //lbldesignationdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);
                        //lblempcode.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                        ViewState["empcode"] = Convert.ToInt64(ds1.Tables[0].Rows[0][0]);
                        ViewState["empid"] = Convert.ToInt64(ds1.Tables[0].Rows[0][1]);
                        ViewState["empname"] = Convert.ToString(ds1.Tables[0].Rows[0][2]);
                        //if (Convert.ToString(ds1.Tables[0].Rows[0][5]) != "")
                        //{
                        //    lblDOBdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][5]).Substring(0, 10);
                        //}
                        //else
                        //    lblDOBdis.Text = "--";
                        //lblstndis.Text = Convert.ToString(ds1.Tables[0].Rows[0][8]);
                        //if (Convert.ToString(ds1.Tables[0].Rows[0][6]) != "")
                        //{
                        //    lblDOJdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][6]);
                        //}
                        //else
                        //    lblDOJdis.Text = "--";
                        //lblemaildis.Text = Convert.ToString(ds1.Tables[0].Rows[0][9]);
                        //lblcontactdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                        Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26
                        || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)
                    // station and sections
                    {

                        divmanagemodules.Visible = false;
                        divreports.Visible = true;
                        divcoronavac.Visible = true;
                        divemail.Visible = false;
                        divstnsecdirectory.Visible = true;
                        //divcoronaexp.Visible = true;
                        //divcoronawarriors.Visible = true;
                        DataSet corexp = new DataSet();
                        corexp = cmm.RunSpReturnDSParam("Pn18_corona_exp", "PRASARNETConnectionString", new SqlParameter("@userid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                      new SqlParameter("@flag", 7));
                        if (corexp.Tables[0].Rows.Count > 0)//Budget section of DGAIR
                        {
                            lnkcoronaexpreport.Visible = true;
                            lnkcoronaexp.Visible = false;

                        }
                        else
                        {
                            lnkcoronaexp.Visible = true;
                            lnkcoronaexpreport.Visible = false;
                        }
                        divextra.Visible = false;
                        divrow2.Visible = true;
                        divboardmembers.Visible = false;
                        LinkButton6.Visible = false;
                        divgrievanceemployee.Visible = false;
                        //divhos.Visible = false;
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                        //divemp profile off and station or section profile on
                        //divempprofile.Visible = false;
                        //divstationinfo.Visible = true;
                        //divmanagemntprofile.Visible = false;
                        trempphoto.Visible = false;
                        trstationphoto.Visible = true;
                        trmanagementphoto.Visible = false;
                        divgemprocurements.Visible = true;

                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                        {
                            divfeedbacknGrievances.Visible = true;
                            lnkgrievances.Visible = true;
                            //divpbhs.Visible = false;
                            //divpbhs.Visible = false;
                            //divpbhswelfare.Visible = false;
                            DataSet dsstn = new DataSet();
                            dsstn = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "3"));// Only capital Station
                            if (dsstn.Tables[0].Rows.Count == 0)// Only Capital Stns
                            {
                                divDPC.Visible = false;
                                //divpbhs.Visible = false;
                                //divpbhswelfare.Visible = false;
                            }
                            else
                            {
                                divDPC.Visible = true;
                            }

                            DataSet dsccw = new DataSet();
                            dsccw = cmm.RunSpReturnDSParam("PN18_CCW_Offices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "1"));


                            if (Convert.ToInt32(Session["Orgid"]) == 4) // Only Zonal Ofices can use  the Common DPC Reports
                            {
                                DataSet dsstnadg = new DataSet();

                                dsstnadg = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "1"));// Only ADGE office
                                if (dsstnadg.Tables[0].Rows.Count > 0)
                                {
                                    //divpbhs.Visible = false;
                                    //divpbhswelfare.Visible = false;
                                    divCommonDPC.Visible = false;// setted false for now 
                                }

                            }

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
                                if (dsadg.Tables[0].Rows.Count > 0)
                                {
                                    divmonthlystationreportsforadg.Visible = true;

                                }
                                else
                                {
                                    divmonthlystationreportsforadg.Visible = false;

                                }
                                divmonthlystationreports.Visible = false;
                            }

                            divcommercialrevenueimg.Visible = false;
                            DataSet ds1 = new DataSet();
                            ds1 = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                        new SqlParameter("@flag", 1));
                            //lblstn.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                            ViewState["stnname"] = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                            DataSet dsstnphoto = new DataSet();

                            dsstnphoto = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                             new SqlParameter("@flag", 3));
                            if (Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]) != "")
                            {
                                string imgname = Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]);
                                imgstation.ImageUrl = "~/stationphoto/" + imgname;
                            }
                            //lblhos.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);
                            //lblstndesgn.Text = Convert.ToString(ds1.Tables[0].Rows[0][2]);
                            //lblnoemp.Text = "";
                            //lblstnemail.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][4]);
                            //lblstncontact.Text = Convert.ToString(ds1.Tables[0].Rows[0][5]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][6]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][7]);
                            //lblhosmobile.Text = Convert.ToString(ds1.Tables[0].Rows[0][8]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][9]);


                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                        {
                            divmonthlystationreports.Visible = false;
                            divmonthlystationreportsforadg.Visible = false;
                            divfeedbacknGrievances.Visible = true;
                            lnkgrievances.Visible = true;
                            divboradmeetingrecordsUpload.Visible = false;
                            divlandrecords.Visible = false;
                            //divpbhs.Visible = false;
                            //divpbhswelfare.Visible = false;

                            if (Convert.ToInt16(Session["Station_SectionID"]) == 23)
                            {
                                divpbhswelfare.Visible = true;
                                lbpbhswelfare.Visible = true;
                                divpbhs.Visible = true;
                            }

                            else
                            {
                                //divpbhswelfare.Visible = false;
                                //lbpbhswelfare.Visible = false;
                                //divpbhs.Visible = false;
                            }
                            if (Convert.ToInt16(Session["Station_SectionID"]) == 11) //pbrb commondpc
                            {
                                divCommonDPC.Visible = true;
                   
                            }

                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))//landrecords
                            {
                                divfeedbacknGrievances.Visible = false;
                                lnkgrievances.Visible = false;
                                divlandrecords.Visible = true;
                                divcoronawarriors.Visible = false;
                                divcoronaexp.Visible = false;
                            }

                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 245))//Prasar_Bharati_Board
                            {
                                divfeedbacknGrievances.Visible = false;
                                lnkgrievances.Visible = false;
                                divboradmeetingrecordsUpload.Visible = true;
                                // divcoronawarriors.Visible = false;
                                //divboardmeetingreport.Visible = true;

                            }
                            DataSet dssecfordpc = new DataSet();
                            dssecfordpc = cmm.RunSpReturnDSParam("secforDPCinDirectorates", "PRASARNETConnectionString", new SqlParameter("@userid", Convert.ToInt32(Session["Uidmanagement"])),
                                                                                                                         new SqlParameter("@flag", "1"));// Only capital section
                            if (dssecfordpc.Tables[0].Rows.Count == 0)
                            {
                                divDPC.Visible = false;
                            }
                            else
                            {
                                divDPC.Visible = true;
                            }

                            divcommercialrevenueimg.Visible = false;
                            DataSet ds1 = new DataSet();
                            ds1 = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@flag", 3),
                                                                                                          new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])));
                            //lblstn.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                            ViewState["secname"] = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                            DataSet dsstnphoto = new DataSet();

                            dsstnphoto = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                            if (Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]) != "")
                            {
                                string imgname = Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]);
                                imgstation.ImageUrl = "~/SectionPhoto/" + imgname;
                            }

                        }

                    }
                    else// Management
                    {
                        divreports.Visible = true;
                        divcoronavac.Visible = false;
                        divemail.Visible = false;
                        divstnsecdirectory.Visible = true;
                        divmanagemodules.Visible = false;
                        if (Convert.ToInt16(Session["Usertype"]) == 28)
                        {
                            divstatementsmanagement.Visible = true;
                            divRRReports_UM.Visible = true;
                            divCommonDPC.Visible = true;
                        }
                        else
                        {
                            divstatementsmanagement.Visible = true;
                            divRRReports_UM.Visible = false;
                        }
                        divcoronawarriors.Visible = false;
                        divcoronaexp.Visible = false;
                        if (Convert.ToInt16(Session["Usertype"]) == 47)
                        {
                            //divcoronawarriors.Visible = true;
                        }
                        divgrievanceemployee.Visible = false;
                        divcommercialrevenueimg.Visible = false;// false for everyone until we decide a Admin for them in prasarbharati
                                                                //divhos.Visible = false;

                        if (Convert.ToInt16(Session["Usertype"]) == 27)//PBIT
                        {
                            divrow2.Visible = true;
                            divboardmembers.Visible = false;
                            LinkButton6.Visible = false;
                            divfeedbacknGrievances.Visible = true;
                            lnkgrievances.Visible = true;
                            lnkfeedbackreports.Visible = true;
                            divapprove.Visible = true;
                            divmotquote.Visible = true;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                            divmanagemodules.Visible = true;

                            //divgemprocurementsreports.Visible = false;
                        }
                        else//14,15,16,18,19,28
                        {
                            lnkfeedbackreports.Visible = false;
                            DataSet dsgrievances = new DataSet();
                            dsgrievances = cmm.RunSpReturnDSParam("Gre_otherUser", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement"]))
                                                                                                                    , new SqlParameter("@flag", 1));
                            if (dsgrievances.Tables[0].Rows.Count > 0 || Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
                            {
                                divrow2.Visible = true;
                                divfeedbacknGrievances.Visible = true;
                                lnkgrievances.Visible = true;


                            }
                            else
                            {
                                divrow2.Visible = false;
                                divfeedbacknGrievances.Visible = false;
                                lnkgrievances.Visible = false;


                            }
                            if (Convert.ToInt16(Session["Usertype"]) == 33 || Convert.ToInt16(Session["Usertype"]) == 34 || Convert.ToInt16(Session["Usertype"]) == 35 || Convert.ToInt16(Session["Usertype"]) == 50
                                || Convert.ToInt16(Session["Usertype"]) == 36 || Convert.ToInt16(Session["Usertype"]) == 37 || Convert.ToInt16(Session["Usertype"]) == 38
                                || Convert.ToInt16(Session["Usertype"]) == 39 || Convert.ToInt16(Session["Usertype"]) == 40 || Convert.ToInt16(Session["Usertype"]) == 41
                                || Convert.ToInt16(Session["Usertype"]) == 15 || Convert.ToInt16(Session["Usertype"]) == 16 || Convert.ToInt16(Session["Usertype"]) == 18
                                || Convert.ToInt16(Session["Usertype"]) == 19 || Convert.ToInt16(Session["Usertype"]) == 32 || Convert.ToInt16(Session["Usertype"]) == 14 || Convert.ToInt16(Session["Usertype"]) == 49)
                            {
                                //if (Convert.ToInt16(Session["Usertype"]) == 33 || Convert.ToInt16(Session["Usertype"]) == 34 || Convert.ToInt16(Session["Usertype"]) == 35
                                //|| Convert.ToInt16(Session["Usertype"]) == 36 || Convert.ToInt16(Session["Usertype"]) == 37 || Convert.ToInt16(Session["Usertype"]) == 38
                                //|| Convert.ToInt16(Session["Usertype"]) == 39 || Convert.ToInt16(Session["Usertype"]) == 40 || Convert.ToInt16(Session["Usertype"]) == 41
                                //|| Convert.ToInt16(Session["Usertype"]) == 32 || Convert.ToInt16(Session["Usertype"]) == 49)

                                //{

                                //}
                                //else
                                //{

                                //}
                                divrow2.Visible = true;
                                divboardmembers.Visible = true;
                                LinkButton6.Visible = true;


                            }

                            else
                            {
                                //divrow2.Visible = false;
                                divboardmembers.Visible = false;
                                LinkButton6.Visible = false;

                            }
                            DataSet dspbb = new DataSet();
                            dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                          , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                            if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
                            {
                                divmeetingrecordadmin.Visible = true;// Inside a Menu
                            }
                            else
                            {
                                divmeetingrecordadmin.Visible = false;
                            }
                            if (Convert.ToInt16(Session["Usertype"]) == 14 || Convert.ToInt16(Session["Usertype"]) == 15 || Convert.ToInt16(Session["Usertype"]) == 16 || Convert.ToInt16(Session["Usertype"]) == 18 || Convert.ToInt16(Session["Usertype"]) == 19 ||
                               Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 32 || Convert.ToInt16(Session["Usertype"]) == 33
                               || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 ||
                               Convert.ToInt16(Session["Usertype"]) == 46 || Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 48)
                            {
                                divrow2.Visible = true;
                                divextra.Visible = false;
                            }
                            else
                            {
                                divextra.Visible = true;
                            }
                            if (Convert.ToInt16(Session["Usertype"]) == 14)// Add CEO-Message Button Visible
                            {
                                divDPC.Visible = false;
                                divceo.Visible = true;
                                divdgair.Visible = false;
                                divdgdd.Visible = false;
                                //divgemprocurementsreports.Visible = false;
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 15)//dgdd
                            {
                                divDPC.Visible = false;
                                divceo.Visible = false;
                                divdgair.Visible = false;
                                divdgdd.Visible = true;
                                //divgemprocurementsreports.Visible = true;
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 16)//dgair
                            {
                                divDPC.Visible = false;
                                divceo.Visible = false;
                                divdgair.Visible = true;
                                divdgdd.Visible = false;
                                //divgemprocurementsreports.Visible = true;
                            }

                            else if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                                || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 ||
                                Convert.ToInt16(Session["Usertype"]) == 46)//PBRB,DGAIR-DPC,DGDD-DPC
                            {
                                divDPC.Visible = true;
                                divceo.Visible = false;
                                divdgair.Visible = false;
                                divdgdd.Visible = false;
                                divCommonDPC.Visible = true;
                                //divgemprocurementsreports.Visible = false;
                            }
                            else
                            {
                                divDPC.Visible = false;
                                divceo.Visible = false;
                                divdgair.Visible = false;
                                divdgdd.Visible = false;
                                //divgemprocurementsreports.Visible = false;
                            }
                            divmotquote.Visible = false;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }

                        //divempprofile.Visible = false;
                        //divstationinfo.Visible = false;
                        //divmanagemntprofile.Visible = true;
                        trempphoto.Visible = false;
                        trstationphoto.Visible = false;
                        trmanagementphoto.Visible = true;
                        DataSet ds1 = new DataSet();
                        DataSet dsuserid = new DataSet();

                        ds1 = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])), new SqlParameter("@flag", 1));
                        //lblhoo1.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                        //ViewState["hoo"] = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                        DataSet dsmanphoto = new DataSet();
                        dsuserid = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])), new SqlParameter("@flag", 3));

                        //dsmanphoto = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", Convert.ToInt32(dsuserid.Tables[0].Rows[0][0])), new SqlParameter("@flag", 5));
                        //if (dsmanphoto.Tables[0].Rows[0][0] != "")
                        //{
                        //    string imgname = Convert.ToString(dsmanphoto.Tables[0].Rows[0][0]);
                        //    Image2.ImageUrl = "~/ManagementPhoto/" + imgname;
                        //}
                        //lblhoodes1.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);
                        //lblhooEmail1.Text = Convert.ToString(ds1.Tables[0].Rows[0][2]);
                        //lblLLNO1.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]);
                        //lblhoomobile1.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);
                        //lbloff1.Text = Convert.ToString(ds1.Tables[0].Rows[0][9]);
                    }
                    //binding a Order/Circulars list
                    DataSet dsorder = new DataSet();
                    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
                    grdwhatsnew.DataSource = dsorder;
                    grdwhatsnew.DataBind();
                    //lnk22.Text = Convert.ToString(dsorder.Tables[0].Rows[0][8]);
                    //lbluplby.Text = Convert.ToString(dsorder.Tables[0].Rows[0][16]);
                    //LinkButton5.Text = Convert.ToString(dsorder.Tables[0].Rows[1][8]);
                    //Label14.Text = Convert.ToString(dsorder.Tables[0].Rows[1][16]);
                    //LinkButton6.Text = Convert.ToString(dsorder.Tables[0].Rows[2][8]);
                    //Label17.Text = Convert.ToString(dsorder.Tables[0].Rows[2][16]);
                    //LinkButton7.Text = Convert.ToString(dsorder.Tables[0].Rows[3][8]);
                    //Label20.Text = Convert.ToString(dsorder.Tables[0].Rows[3][16]);
                    //LinkButton8.Text = Convert.ToString(dsorder.Tables[0].Rows[4][8]);
                    //Label23.Text = Convert.ToString(dsorder.Tables[0].Rows[4][16]);
                    //LinkButton2.Text = Convert.ToString(dsorder.Tables[0].Rows[5][8]);
                    //Label26.Text = Convert.ToString(dsorder.Tables[0].Rows[5][16]);
                    //LinkButton3.Text = Convert.ToString(dsorder.Tables[0].Rows[6][8]);
                    //Label29.Text = Convert.ToString(dsorder.Tables[0].Rows[6][16]);
                    //LinkButton9.Text = Convert.ToString(dsorder.Tables[0].Rows[7][8]);
                    //Label32.Text = Convert.ToString(dsorder.Tables[0].Rows[7][16]);
                    //LinkButton10.Text = Convert.ToString(dsorder.Tables[0].Rows[8][8]);
                    //Label35.Text = Convert.ToString(dsorder.Tables[0].Rows[8][16]);
                    //LinkButton11.Text = Convert.ToString(dsorder.Tables[0].Rows[9][8]);
                    //Label38.Text = Convert.ToString(dsorder.Tables[0].Rows[9][16]);
                    //binding a retirement list from IT_MonthlyRetire_Top4
                    DataSet dsret = new DataSet();
                    dsret = cmm.RunSpReturnDS("IT_MonthlyRetire_Top4", "HRITConnectionString");
                    grdretirement.DataSource = dsret;
                    grdretirement.DataBind();

                    //binding a Birthday list from IT_BirthDay_RSS_top4 
                    DataSet dsbday = new DataSet();
                    dsbday = cmm.RunSpReturnDS("IT_BirthDay_RSS_top4", "HRITConnectionString");
                    grdbday.DataSource = dsbday;
                    grdbday.DataBind();

                    //bind crousal repeater
                    bindslide();//to bind a crousal
                    DataSet ds5 = new DataSet();// motivational Quote
                    ds5 = cmm.RunSpReturnDSParam("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
                    if (ds5.Tables[0].Rows.Count > 0)
                    {
                        lblquote.Text = Convert.ToString(ds5.Tables[0].Rows[0][1]);
                        lblauthor.Text = Convert.ToString(ds5.Tables[0].Rows[0][9]);
                    }
                    DataSet ds2 = new DataSet();
                    ds2 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 14),
                                                                                        new SqlParameter("@flag", 8));
                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds2.Tables[0].Rows[0][3]).Trim().Length > 0)
                        {
                            divviewdoc.Visible = true;
                        }
                        else
                        {
                            divviewdoc.Visible = false;
                        }
                        int msgid = Convert.ToInt32(ds2.Tables[0].Rows[0][1]);
                        ViewState["msgidv"] = msgid;
                        lblceomessage.Text = Convert.ToString(ds2.Tables[0].Rows[0][0]);
                    }
                    else
                    {

                        lblceomessage.Text = "";
                    }
                    DataSet ds3 = new DataSet();

                    ds3 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 15),
                                                                                        new SqlParameter("@flag", 8));
                    if (ds3.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds3.Tables[0].Rows[0][3]).Trim().Length > 0)
                        {
                            divviewdgdd.Visible = true;
                        }
                        else
                        {
                            divviewdgdd.Visible = false;
                        }
                        lbldgdd.Text = Convert.ToString(ds3.Tables[0].Rows[0][0]);
                        int msgid2 = Convert.ToInt32(ds3.Tables[0].Rows[0][1]);
                        ViewState["msgidvdgdd"] = msgid2;
                    }
                    else
                    {

                        lbldgdd.Text = "";
                    }
                    DataSet ds4 = new DataSet();
                    ds4 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 16),
                                                                           new SqlParameter("@flag", 8));
                    if (ds4.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds4.Tables[0].Rows[0][3]).Trim().Length > 0)
                        {
                            divviewdgair.Visible = true;
                        }
                        else
                        {
                            divviewdgair.Visible = false;
                        }
                        lbldgair.Text = Convert.ToString(ds4.Tables[0].Rows[0][0]);
                        int msgid3 = Convert.ToInt32(ds4.Tables[0].Rows[0][1]);
                        ViewState["msgidvdgair"] = msgid3;
                    }
                    else
                    {

                        lbldgair.Text = "";
                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        public void bindslide() // for binding of crousel
        {
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                      new SqlParameter("@flag", "3"));
            if (ds1.Tables[0].Rows.Count != 0)
            {
                Rgallary.DataSource = ds1;
                Rgallary.DataBind();
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string max = cmm.SelectMaxId("select max(cid) from PN18_tblcalender", "PRASARNETConnectionString");
                int RowID = Convert.ToInt32(max);
                if (max != "")
                {
                    ds = cmm.RunSQLReturnDS("Select calendername from PN18_tblcalender where cid=" + RowID, "PRASARNETConnectionString");
                    string calendername = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=PBCalender.pdf");
                    Response.WriteFile(Server.MapPath("~/Calender/" + ds.Tables[0].Rows[0][0].ToString()));
                    Response.End();
                    //string paths = "Calender/" + calendername;
                    //Response.Redirect("showDocument.aspx", false);
                    //Session["showDocFilePath"] = paths;// Holds the path of the file..

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('No Calender to Download!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }

        protected void lnkmorebirthday_Click(object sender, EventArgs e)
        {
            Response.Redirect("birthday.aspx");
        }

        protected void lnkretmore_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthlyRetirements.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Approve.aspx");
        }

        protected void lnkviewdoc_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidv"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=CEOMessage.pdf");
                    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }

        protected void lnkviewdgair_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidvdgair"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=DGAIRMessage.pdf");
                    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                    Response.End();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                //lbldgair.Text = ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again or you may contact IT Team');", true);
            }
        }

        protected void lnkviewdgdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidvdgdd"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=DGDD.pdf");
                    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                    Response.End();


                    //Response.Clear();
                    //Response.ContentType = "CEO_Docs/";
                    //Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][3].ToString());
                    //Response.Write("thanks god, finally file got downloaded.");
                    //Response.End();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }
        //protected void logout_Click(object sender, EventArgs e)
        //{
        //    Session.RemoveAll();
        //    Session.Abandon();
        //    Response.Redirect("HomePage.aspx", false);
        //}


        protected void logoutstn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }


        protected void logoutadmin_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }


        protected void logoutIT_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }


        protected void lnkhere_Click(object sender, EventArgs e)
        {
            Response.Redirect("MotivationalQuote.aspx");
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            //PhotoUpload Station
            if (FileUpload2.HasFile)
            {
                DataSet ds1 = new DataSet();
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload2.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload2.PostedFile.ContentLength / (decimal)1024), 2);
                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                {
                    DataSet dsphotoold = new DataSet();
                    dsphotoold = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                 new SqlParameter("@flag", 3));
                    ViewState["photoold"] = dsphotoold.Tables[0].Rows[0][0];
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                {
                    DataSet dssecphotoold = new DataSet();

                    dssecphotoold = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                    ViewState["secphotoold"] = dssecphotoold.Tables[0].Rows[0][0];
                }

                if (height <= 230 && width <= 200 && size <= 50 && size >= 20)
                {

                    try
                    {
                        string imagepath = "";
                        string Fromfile = "";
                        string savefile = "";
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload2.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = Convert.ToString(Convert.ToInt64(Session["Station_SectionID"]) + 1);
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                            {
                                string target = MapPath("~/stationphoto/" + FileUpload2.FileName.ToString());
                                FileUpload2.PostedFile.SaveAs(MapPath("~/stationphoto/" + FileUpload2.FileName.ToString()));
                                files = FileUpload2.FileName.ToString();
                                path = Server.MapPath("~") + "\\stationphoto\\";
                                savefile = Convert.ToString(ViewState["stnname"]).Substring(4, 4) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                                imagepath = "~/stationphoto/" + savefile;
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                string target = MapPath("~/SectionPhoto/" + FileUpload2.FileName.ToString());
                                FileUpload2.PostedFile.SaveAs(MapPath("~/SectionPhoto/" + FileUpload2.FileName.ToString()));
                                files = FileUpload2.FileName.ToString();
                                path = Server.MapPath("~") + "\\SectionPhoto\\";
                                savefile = Convert.ToString(ViewState["secname"]).Substring(0, 1) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                                imagepath = "~/SectionPhoto/" + savefile;

                            }
                            Fromfile = path + files;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);

                            int d = 0;
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                            {
                                d = cmm.RunSP("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                            new SqlParameter("@photoname", savefile),
                                                                                            new SqlParameter("@flag", 2));
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                d = cmm.RunSP("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                               new SqlParameter("@photoname", savefile),
                                                                                               new SqlParameter("@flag", 4));
                            }
                            if (d > 0)
                            {
                                string path1 = "";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                DataSet dsphoto = new DataSet();
                                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                                {
                                    DataSet dsstnphoto = new DataSet();

                                    dsstnphoto = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                     new SqlParameter("@flag", 3));
                                    //if (dsstnphoto.Tables[0].Rows[0][0] != "")
                                    //{
                                    //    string imgname = Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]);
                                    //    imgstation.ImageUrl = "~/stationphoto/" + imgname;
                                    //}
                                    //ViewState["photoold"]
                                    path1 = Server.MapPath("~/stationphoto/" + Convert.ToString(ViewState["photoold"]));
                                    imgstation.ImageUrl = "~/stationphoto/" + savefile;

                                }
                                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                                {
                                    DataSet dssecphoto = new DataSet();
                                    dssecphoto = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                                    //if (dssecphoto.Tables[0].Rows[0][0] != "")
                                    //{
                                    //    string imgname = Convert.ToString(dssecphoto.Tables[0].Rows[0][0]);
                                    //    imgstation.ImageUrl = "~/SectionPhoto/" + imgname;
                                    //}
                                    path1 = Server.MapPath("~/SectionPhoto/" + Convert.ToString(ViewState["secphotoold"]));
                                    imgstation.ImageUrl = "~/SectionPhoto/" + savefile;
                                }
                                FileInfo file = new FileInfo(path1);
                                if (file.Exists)// on uploading the previous file in a repository should be deleted 
                                {
                                    file.Delete();
                                }

                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Size should be between 20kB to 50 kB and Dimensions should be between 0-230px X 0-200px!!!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);
            }
        }

        protected void lnkstnupload_Click(object sender, EventArgs e)
        {

        }
        protected void Button23_Click(object sender, EventArgs e)
        {
            try
            {
                ds = cmm.RunSpReturnDSParam("prasarnet_SearchEmpAll1", "HRITConnectionString", new SqlParameter("@fullname", txtemployee.Text));
                grddoc.DataSource = ds;
                grddoc.DataBind();
                divgrd.Visible = true;
            }
            catch (Exception ex)
            {
                //Label25.Text = ex.Message;
            }

        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            divgrd.Visible = false;
            txtemployee.Text = "";

        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            // PhotoUpload Station
            if (FileUpload3.HasFile)
            {
                DataSet ds1 = new DataSet();
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload3.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload3.PostedFile.ContentLength / (decimal)1024), 2);

                DataSet dsmanphotoold = new DataSet();
                DataSet dsuserid = new DataSet();
                dsuserid = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])), new SqlParameter("@flag", 3));
                ViewState["uid"] = dsuserid.Tables[0].Rows[0][0];
                dsmanphotoold = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", Convert.ToInt32(dsuserid.Tables[0].Rows[0][0])), new SqlParameter("@flag", 5));
                ViewState["manphotoold"] = dsmanphotoold.Tables[0].Rows[0][0];

                if (height <= 230 && width <= 200 && size <= 50 && size >= 20)
                {

                    try
                    {
                        string imagepath = "";
                        string Fromfile = "";
                        string savefile = "";
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload3.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = Convert.ToString(Convert.ToInt64(ViewState["uid"]) + 1);
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";

                            string target = MapPath("~/ManagementPhoto/" + FileUpload3.FileName.ToString());
                            FileUpload3.PostedFile.SaveAs(MapPath("~/ManagementPhoto/" + FileUpload3.FileName.ToString()));
                            files = FileUpload3.FileName.ToString();
                            path = Server.MapPath("~") + "\\ManagementPhoto\\";
                            savefile = Convert.ToString(ViewState["hoo"]).Substring(0, 2) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                            imagepath = "~/ManagementPhoto/" + savefile;

                            Fromfile = path + files;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);

                            int d = 0;

                            d = cmm.RunSP("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", Convert.ToInt32(ViewState["uid"]))
                                                                                                    , new SqlParameter("@photoname", savefile)
                                                                                                    , new SqlParameter("@flag", 4));

                            if (d > 0)
                            {
                                string path1 = "";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);

                                DataSet dsmanphoto = new DataSet();
                                dsmanphoto = cmm.RunSpReturnDSParam("othermanagement_usr_profile", "PRASARNETConnectionString", new SqlParameter("@otheruid", Convert.ToInt32(ViewState["uid"])), new SqlParameter("@flag", 5));
                                //if (dsmanphoto.Tables[0].Rows[0][0] != "")
                                //{
                                //    string imgname = Convert.ToString(dsmanphoto.Tables[0].Rows[0][0]);
                                //    Image2.ImageUrl = "~/ManagementPhoto/" + imgname;
                                //}
                                path1 = Server.MapPath("~/ManagementPhoto/" + Convert.ToString(ViewState["manphotoold"]));

                                FileInfo file = new FileInfo(path1);
                                if (file.Exists)// on uploading the previous file in a repository should be deleted 
                                {
                                    file.Delete();
                                }
                                Image2.ImageUrl = "~/ManagementPhoto/" + savefile;
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Size should be between 20kB to 50 kB and Dimensions should be between 0-230px X 0-200px!!!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);
            }
        }

        protected void lnkempupload_Click(object sender, EventArgs e)
        {
            //lblcaptchaemp.Text = "priyank";
        }

        protected void lnkeditprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditEmpProfile.aspx", true);
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            //PhotoUpload Employee
            if (FileUpload1.HasFile)
            {
                DataSet ds1 = new DataSet();
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
                DataSet dsphotoold = new DataSet();
                dsphotoold = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                         new SqlParameter("@flag", 3));
                ViewState["photoold"] = dsphotoold.Tables[0].Rows[0][0];
                if (height <= 230 && width <= 200 && size <= 50 && size >= 20)
                {

                    try
                    {
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = Convert.ToString(Convert.ToInt64(ViewState["empid"]) + 1);
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";
                            string target = MapPath("~/empphoto/" + FileUpload1.FileName.ToString());
                            FileUpload1.PostedFile.SaveAs(MapPath("~/empphoto/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            path = Server.MapPath("~") + "\\empphoto\\";
                            string Fromfile = path + files;
                            string savefile = Convert.ToString(ViewState["empname"]).Substring(0, 3) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            string imagepath = "~/empphoto/" + savefile;
                            int d;

                            d = cmm.RunSP("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                                        new SqlParameter("@photoname", savefile),
                                                                                        new SqlParameter("@flag", 2));

                            if (d > 0)
                            {

                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                DataSet dsphoto = new DataSet();
                                dsphoto = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                      new SqlParameter("@flag", 3));
                                //if (dsphoto.Tables[0].Rows[0][0] != "")
                                //{
                                //    string imgname = Convert.ToString(dsphoto.Tables[0].Rows[0][0]);
                                //    ImageButton3.ImageUrl = "~/empphoto/" + imgname;
                                //}
                                //ViewState["photoold"]
                                string path1 = Server.MapPath("~/empphoto/" + Convert.ToString(ViewState["photoold"]));
                                FileInfo file = new FileInfo(path1);
                                if (file.Exists)// on uploading the previous file in a repository should be deleted 
                                {
                                    file.Delete();
                                }

                                ImageButton3.ImageUrl = "~/empphoto/" + savefile;

                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Size should be between 20kB to 50 kB and Dimensions should be between 0-230px X 0-200px!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrdernCircular.aspx");
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEOMessage.aspx");
        }


        private void download_whatsnew(string subfolder, string docname, string filename)
        {
            string paths = "E:/www/LocalUser/AirNet/UploadedDocuments/" + subfolder + "/" + filename;
            //Response.Redirect(paths);
            Session["showDocFilePath"] = paths;// Holds the path of the file..
            string str = filename;
            string substr = str.Substring(str.Length - 3).ToLower();
            if (substr == "pdf")
            {
                //Response.Redirect(paths);
                if (str != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=Download.pdf");
                    Response.WriteFile(paths);
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            else
            {
                Session["dash/order"] = 1;
                Response.Redirect("showDocument.aspx");

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrdernCircular.aspx");
        }

        private int fileaccesslog(Int64 Docid, string Pageadd, string ip, string v_down, Boolean issuccessful, int stn_sec_emp)
        {
            int i = cmm.RunSP("order_circular_fileaccessLog", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                                         , new SqlParameter("@stn_secid", stn_sec_emp)
                                                                                                         , new SqlParameter("@orderid", Docid)
                                                                                                         , new SqlParameter("@page", Pageadd)
                                                                                                         , new SqlParameter("@ip", ip)
                                                                                                         , new SqlParameter("@download_view", v_down)
                                                                                                         , new SqlParameter("@issuccessful", issuccessful)
                                                                                                         , new SqlParameter("@flag", 1));
            return i;
        }
        protected void grdwhatsnew_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                //try
                //{
                int stn_sec_emp = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 10)
                {
                    stn_sec_emp = Convert.ToInt32(Session["empid"]);
                }
                else
                {
                    stn_sec_emp = Convert.ToInt32(Convert.ToInt32(Session["Station_SectionID"]));
                }
                string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                string ip = cmm.GetIp_Priyank();
                DataSet dsurl = new DataSet();
                dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                          , new SqlParameter("@flag", 1));
                string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                DataSet ds2 = new DataSet();
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Int64 Docid = (int)grdwhatsnew.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                                , new SqlParameter("@docid", Docid));

                ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", Convert.ToInt32(ds1.Tables[0].Rows[0][4])),
                                                                                           new SqlParameter("@flag", 2));
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    //string paths = "http://192.168.1.15/UploadedDocuments/" + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                    string paths = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                    Session["showDocFilePath"] = paths;
                    string str = ds1.Tables[0].Rows[0][9].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        if (ds1.Tables[0].Rows[0][9].ToString() != "")
                        {
                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", true, stn_sec_emp);
                            WebClient req = new WebClient();// Added on 29May2018 due becos in meeting eith ADG , it has been instructed that the repository should be come from AIRNET Web Server
                            HttpResponse response = HttpContext.Current.Response;
                            response.Clear();
                            response.ClearContent();
                            response.ClearHeaders();
                            response.Buffer = true;
                            Response.ContentType = "application/octet-stream";
                            response.AddHeader("Content-Disposition", "attachment;filename=\"" + str + "\"");
                            byte[] data = req.DownloadData(paths);
                            response.BinaryWrite(data);
                            response.End();

                        }
                        else
                        {
                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);

                        }
                    }
                    else
                    {
                        Session["dash/order"] = 2;
                        int ret = fileaccesslog(Docid, Pageadd, ip, "View HTML Doc", true, stn_sec_emp);
                        Response.Write("<script>window.open ('showDocument.aspx','_blank');</script>");
                        //Response.Redirect("showDocument.aspx");
                        // //Dim queryString As String = "AdminStnDetails.aspx" 



                        //Response.Write("<script>");
                        //string newWin = "window.open('" + paths + "','_blank');";
                        //ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                        //Response.Write("</script>");
                    }
                }
                else
                {
                    int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
                //}
                //catch (Exception ex)
                //{
                //    string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                //    string ip = cmm.GetIp_Priyank();
                //    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                //    Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                //    int ret = fileaccesslog(Docid, Pageadd, ip, "Download_Exception", false);
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issue(s) occured while downloading a document.Try Again!!');", true);

                //}
            }
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("prasarnet_SearchEmpAll1", "HRITConnectionString", new SqlParameter("@fullname", txtemployee.Text));
            grddoc.DataSource = ds;
            grddoc.DataBind();
            divgrd.Visible = true;
        }

        protected void imgdpc_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/DPCStatusEntry.aspx", true);
        }

        protected void imggemprocurement_Click(object sender, ImageClickEventArgs e)
        {
            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
            {
                ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                           new SqlParameter("@flag", 1));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
            {
                ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                          new SqlParameter("@flag", 4));

            }
            if (Convert.ToString(ds.Tables[0].Rows[0][0]) != "")
            {
                Response.Redirect("~/GEMProcurement.aspx", true);

            }
            else
            {
                Response.Redirect("~/AttachDDO.aspx", true);
            }

        }

        protected void imgcomrevenue_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/CommercialRevenueStatementEntry.aspx", true);

        }

        protected void lnkdgair_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEOMessage.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/vigilance/Posters of Vigilance Awareness Week 2019.docx");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "Posters for Vigilance Awareness Week - 2019.docx" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RNFrequencySchedule.aspx", true);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OSD(PB)_Orders_Circulars.aspx", true);
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pbb_documentsshared.aspx", true);
        }

        protected void lnkfeedbackreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("Feedback_Rpt.aspx", true);
        }

        protected void imggrievance_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Grievances.aspx", false);
            Session["GreUsertype"] = 2;
        }

        protected void lnkgrievances_Click(object sender, EventArgs e)
        {
            DataSet dsgrievances = new DataSet();
            dsgrievances = cmm.RunSpReturnDSParam("Gre_otherUser", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement"]))
                                                                                                               , new SqlParameter("@flag", 1));
            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26
                || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// sections and stations
            {
                Response.Redirect("Grievance_Reports_OffciesAction.aspx", false);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 47
                || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                Response.Redirect("Grievance_Reports_Action.aspx", false);
            }
            else if (dsgrievances.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Grievance_Reports_OffciesAction.aspx", false);
            }
        }

        protected void grdwhatsnew_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbluplon2 = (Label)e.Row.FindControl("lbluplon2");
                DateTime todaydate = DateTime.Now.Date;
                DateTime uploadedon = Convert.ToDateTime(lbluplon2.Text.Trim()).Date;
                if (uploadedon == todaydate)
                {
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FEF5E7");
                }
            }
        }

        protected void lnkcoronawarriorsAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Salute_CoronaWarriors.aspx", false);
        }

        protected void lnkcoronawarriors_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_CoronaWarriors.aspx", true);
        }

        protected void lnkcoronaexpreport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Corona_Exp/CoronaExpReports.aspx", true);
        }

        protected void lnkcoronaexp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Corona_Exp/CoronaExpStatements.aspx", true);
        }

        protected void lnkstn_sec_directory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Sta_Sec_Det/OfficeDetails.aspx", true);
        }

        protected void LinkButton3_Click1(object sender, EventArgs e)
        {
            Response.Redirect("PB_Corona_Vaccination_Status.aspx", true);
        }

        protected void lnktransferApplication_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/Transfer.aspx", true);
        }

        protected void lnkreport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/All_Reports/Reports.aspx", true);
        }

        protected void lnkpbhs_Click(object sender, EventArgs e)
        {
            if (Session["Station_SectionID"] != null)
            {

                if (Session["Station_SectionID"].ToString() == "23")
                {
                    Response.Redirect("~/PBHS/PBHS_Admin_Action.aspx", true);
                }
            }
            else
            {
                Response.Redirect("~/PBHS/PBHS_Action.aspx", true);
            }


        }
        protected void lnkcommondpc_Click(object sender, EventArgs e)
        {
            if ((Convert.ToInt32(Session["Orgid"]) == 4) || (Convert.ToInt32(Session["Usertype"]) == 28))// Only Zonal Ofices can use  the Common DPC Reports
            {
                DataSet dsstnadg = new DataSet();

                dsstnadg = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                            new SqlParameter("@flag", "1"));// Only ADGE office
                if (dsstnadg.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("~/Commondpc/listupload.aspx", true);
                }
                else if (Convert.ToInt32(Session["Usertype"]) == 28)
                {
                    Response.Redirect("~/Commondpc/listupload.aspx", true);
                }

            }




            if (Session["Station_SectionID"] != null)
            {

                if (Session["Station_SectionID"].ToString() == "23")
                {
                    Response.Redirect("~/Commondpc/listupload.aspx", true);
                }
            }
            else
            {
                Response.Redirect("~/PBHS/PBHS_Action.aspx", true);
            }
        }
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageSoft_Module/Manage_Dashboard.aspx", true);
        }

        protected void lnkemailmig_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/emailmigrationcheck.aspx", true);
        }
    }





    //protected void lnk22_Click1(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[0][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[0][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[0][12]);




    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton5_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[1][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[1][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[1][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}


    //protected void LinkButton7_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[3][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[3][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[3][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton8_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[4][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[4][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[4][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton2_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[5][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[5][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[5][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton3_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[6][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[6][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[6][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton9_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[7][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[7][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[7][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton10_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[8][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[8][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[8][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton11_Click(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[9][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[9][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[9][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}

    //protected void LinkButton6_Click1(object sender, EventArgs e)
    //{
    //    DataSet dsorder = new DataSet();
    //    dsorder = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 7));
    //    string subfolder = Convert.ToString(dsorder.Tables[0].Rows[2][7]);
    //    string doc_title = Convert.ToString(dsorder.Tables[0].Rows[2][8]);// title
    //    string filename = Convert.ToString(dsorder.Tables[0].Rows[2][12]);
    //    download_whatsnew(subfolder, doc_title, filename);
    //}    

}
