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
    public partial class ChangePassword : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {

                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// section and stations
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
                    else// managements
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
                    //lbluser.Text = Convert.ToString(Session["UserName"]);

                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();


                if (Convert.ToInt32(Session["Usertype"]) == 10)//employee
                {
                    ds = cmm.RunSpReturnDSParam("Updatepwd", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                     new SqlParameter("@flag", 1));
                }
                else if (Convert.ToInt32(Session["Usertype"]) == 11 || Convert.ToInt32(Session["Usertype"]) == 20 || Convert.ToInt32(Session["Usertype"]) == 22 ||
                         Convert.ToInt32(Session["Usertype"]) == 23 || Convert.ToInt32(Session["Usertype"]) == 24)// For Station
                {
                    ds = cmm.RunSpReturnDSParam("Updatepwd", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                     new SqlParameter("@flag", 3));
                    //    Session["Station_SectionID"] 
                }
                else if (Convert.ToInt32(Session["Usertype"]) == 12 || Convert.ToInt32(Session["Usertype"]) == 25 || Convert.ToInt32(Session["Usertype"]) == 26)// For Section
                {
                    ds = cmm.RunSpReturnDSParam("Updatepwdpn", "PRASARNETConnectionString", new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                     new SqlParameter("@flag", 1));
                }
                else if (Convert.ToInt32(Session["Usertype"]) == 14 || Convert.ToInt32(Session["Usertype"]) == 15 || Convert.ToInt32(Session["Usertype"]) == 16 ||
                         Convert.ToInt32(Session["Usertype"]) == 18 || Convert.ToInt32(Session["Usertype"]) == 19 || Convert.ToInt32(Session["Usertype"]) == 27)//for Management Users like CEO, DG:DD, DG:AIR, Admin, SuperAdmin etc
                {
                    ds = cmm.RunSpReturnDSParam("Updatepwdpn", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement"])),
                                                                                     new SqlParameter("@flag", 3));
                }

                DataSet dshash = cmm.RunSpReturnDSParam("convertHash", "PRASARNETConnectionString", new SqlParameter("@pwd", txtcurrentpwd.Text.Trim()),
                                                                                     new SqlParameter("@flag", 1));
                if (Convert.ToString(ds.Tables[0].Rows[0][0]) == Convert.ToString(dshash.Tables[0].Rows[0][0]))
                {
                    int i = 0;
                    if (Convert.ToInt32(Session["Usertype"]) == 10)//employee
                    {
                        i = cmm.RunSP("Updatepwd", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                         new SqlParameter("@pwd", txtnewpwd.Text),
                                                                                                      new SqlParameter("@flag", 2));
                    }
                    else if (Convert.ToInt32(Session["Usertype"]) == 11 || Convert.ToInt32(Session["Usertype"]) == 20 || Convert.ToInt32(Session["Usertype"]) == 22 ||
                         Convert.ToInt32(Session["Usertype"]) == 23 || Convert.ToInt32(Session["Usertype"]) == 24)// For Station
                    {
                        i = cmm.RunSP("Updatepwd", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                        new SqlParameter("@pwd", txtnewpwd.Text),
                                                                                                     new SqlParameter("@flag", 4));
                    }
                    else if (Convert.ToInt32(Session["Usertype"]) == 12 || Convert.ToInt32(Session["Usertype"]) == 25 || Convert.ToInt32(Session["Usertype"]) == 26)// For Section
                    {
                        i = cmm.RunSP("Updatepwdpn", "PRASARNETConnectionString", new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                  new SqlParameter("@pwd", txtnewpwd.Text),
                                                                                  new SqlParameter("@flag", 2));
                    }
                    else
                    {
                        i = cmm.RunSP("Updatepwdpn", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement"])),
                                                                                 new SqlParameter("@pwd", txtnewpwd.Text),
                                                                                 new SqlParameter("@flag", 4));
                    }
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Password Updated Sucessfully!!');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Current Password is Incorrect.Try Again!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Error Occured, Please Try Again!!');", true);
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txtcurrentpwd.Text = "";
            txtnewpwd.Text = "";
            txtrepwd.Text = "";
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx", true);
        }
    }
}