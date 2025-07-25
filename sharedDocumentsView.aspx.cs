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
    public partial class sharedDocumentsView : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 33 || Convert.ToInt16(Session["Usertype"]) == 34 || Convert.ToInt16(Session["Usertype"]) == 35
                                || Convert.ToInt16(Session["Usertype"]) == 36 || Convert.ToInt16(Session["Usertype"]) == 37 || Convert.ToInt16(Session["Usertype"]) == 38
                                || Convert.ToInt16(Session["Usertype"]) == 39 || Convert.ToInt16(Session["Usertype"]) == 40 || Convert.ToInt16(Session["Usertype"]) == 41
                                || Convert.ToInt16(Session["Usertype"]) == 15 || Convert.ToInt16(Session["Usertype"]) == 16 || Convert.ToInt16(Session["Usertype"]) == 18
                                || Convert.ToInt16(Session["Usertype"]) == 19 || Convert.ToInt16(Session["Usertype"]) == 50 || Convert.ToInt16(Session["Usertype"]) == 14
                                || Convert.ToInt16(Session["Usertype"]) == 32 || Convert.ToInt16(Session["Usertype"]) == 49)               

            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Section Menu
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
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }

                    //cmm.bindDDLWidParam(ddldoccat, "PN18_pbb_MeetingDoc_category_SP", "Category", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));
                    //cmm.bindDDLWidParam(ddldoctype, "PN18_pbb_Meeting_documenttype_SP", "DocumentType", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));
                   
                    string i = Session["otherdocpath"].ToString() + "?ref={0}#toolbar=0";
                    //  shareddoc.Attributes.Add("src", "D:/www/LocalUser/AirNet/UploadedDocuments/Circulars/Doc42539_01-08-2019%2017o19o29.pdf");
                    shareddoc.Attributes.Add("src", i);
                    // mydiv.frames["shareddoc"].document.oncontextmenu = function(){ return false; };
                }
            }

            else
            {
                Response.Redirect("Logout.aspx");
            }






            
        }

        protected void btnback_Click(object sender, EventArgs e)
        {

            Response.Redirect("Pbb_documentsshared.aspx");
        }
    }
}