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

namespace PrasarNet.Transfer_M
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
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24 ||
                     Convert.ToInt16(Session["Usertype"]) == 14 || Convert.ToInt16(Session["Usertype"]) == 27 ||
                     Convert.ToInt16(Session["Usertype"]) == 29)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        lnkTransferreports.Visible = false;//Transfer reports

                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        lnkTransferreports.Visible = false;//Transfer reports
                        DataSet dsstn = new DataSet();

                        //ADG Offices and capital Stations
                        dsstn = cmm.RunSpReturnDSParam("reports_visible", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                        new SqlParameter("@flag", "2"));
                        if (dsstn.Tables[0].Rows.Count != 0)//ADG Offices
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
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = true;
                        DataSet dsut = new DataSet();

                        //CEO,PBIT,ADG-HR
                        dsut = cmm.RunSpReturnDSParam("reports_visible", "PRASARNETConnectionString", new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                        new SqlParameter("@flag", "1"));
                        if (dsut.Tables[0].Rows.Count != 0)//ADG Offices
                        { 
                            lnkTransferreports.Visible = true;//Transfer reports
                        }
                        else
                        {
                            lnkTransferreports.Visible = false;//Transfer reports
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
    }
}