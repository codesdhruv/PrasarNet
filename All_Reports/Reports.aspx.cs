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

namespace PrasarNet.All_Reports
{
    public partial class Reports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            //else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
            //         Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
            //         Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
            //         Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24 ||
            //         Convert.ToInt16(Session["Usertype"]) == 14 || Convert.ToInt16(Session["Usertype"]) == 27 ||
            //         Convert.ToInt16(Session["Usertype"]) == 29)
            else if (Convert.ToInt16(Session["Usertype"]) != 10)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    int stn_sec_emp_oth = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22
                       || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//Station
                    {
                        stn_sec_emp_oth = 1;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//Section
                    {
                        stn_sec_emp_oth = 2;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 10)//Employee
                    {
                        stn_sec_emp_oth = 4;
                    }
                    else//Management
                    {
                        stn_sec_emp_oth = 3;
                    }
                    DataSet dsstnpbhs = new DataSet();
                    dsstnpbhs = cmm.RunSpReturnDSParam("reports_visible", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                   new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                   new SqlParameter("@stn_sec_other", stn_sec_emp_oth),
                                                                                                   new SqlParameter("@flag", "4"));
                    //Visible Certify right usertable and PBIT,ADGHR, CEO
                    if (dsstnpbhs.Tables[0].Rows.Count != 0)
                    {
                        if (Convert.ToInt16(dsstnpbhs.Tables[0].Rows[0][0]) != 0)//Visible Certify right usertable and PBIT,ADGHR, CEO
                        {
                            lnkpbhsreports.Visible = true;//PBHS reports
                        }
                        else
                        {
                            lnkpbhsreports.Visible = false;//PBHS reports
                        }
                    }
                    else
                    {
                        lnkpbhsreports.Visible = false;//PBHS reports
                    }



                    //Transfer reports Visibilty 
                    DataSet dsstn = new DataSet();

                    dsstn = cmm.RunSpReturnDSParam("reports_visible", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                   new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                   new SqlParameter("@flag", "5"));
                    if (dsstn.Tables[0].Rows.Count != 0)//ADG Offices
                    {
                        if (Convert.ToInt16(dsstn.Tables[0].Rows[0][0]) != 0)//Visible Certify right usertable and PBIT,ADGHR, CEO
                        {
                            lnkTransferreports.Visible = true;//Transfer reports
                        }
                        else
                        {
                            lnkTransferreports.Visible = false;//Transfer reports
                        }
                    }
                    else
                    {
                        lnkTransferreports.Visible = false;//Transfer reports
                    }
                    //end

                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//Station & Section
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;//Transfer reports   
                    }
                    else
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else
                        {
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }

                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }

        protected void lnkTransferreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/Transferreports.aspx");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx");
        }

        protected void lnkpbhsreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/PBHS_Reports.aspx");
        }
    }
}