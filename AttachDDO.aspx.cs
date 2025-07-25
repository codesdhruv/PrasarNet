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
    public partial class AttachDDO : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlddo, "PN18_DDO", "DDOOffice", "DDOID", "PRASARNETConnectionString", "--Select DDO--", new SqlParameter("@flag", 2));
                    if (Convert.ToInt16(Session["EditDDOflag"]) == 1)
                    {
                        btnback.Visible = true;
                        btnbakdashboard.Visible = false;
                        btncancel.Visible = true;
                        Label43.Text = ":: Edit Linked DDO ::";
                        btnattach.Text = "Update DDO";
                        DataSet ds1 = new DataSet();
                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)
                        {
                            //station and CCW                       
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
                            ds1 = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                       new SqlParameter("@flag", 1));
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
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
                            ds1 = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                      new SqlParameter("@flag", 4));

                        }
                        string ddoid = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                        ddlddo.Items.FindByValue(ddoid).Selected = true;

                    }
                    else
                    {
                        btnback.Visible = false;
                        btnbakdashboard.Visible = true;
                        btncancel.Visible = false;
                        Label43.Text = ":: Attach DDO ::";
                        btnattach.Text = "Attach a DDO to your Station";
                    }

                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnattach_Click(object sender, EventArgs e)
        {
            int i = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
            {
                i = cmm.RunSP("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@ddoid", Convert.ToInt32(ddlddo.SelectedValue)),
                                                                    new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                    new SqlParameter("@flag", 3));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
            {
                i = cmm.RunSP("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@ddoid", Convert.ToInt32(ddlddo.SelectedValue)),
                                                                   new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                   new SqlParameter("@flag", 5));
            }
            if (i > 0)
            {

                if (Convert.ToInt16(Session["EditDDOflag"]) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Attached Successfully!!');", true);

                }
                Response.Redirect("~/GEMProcurement.aspx", false);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMProcurement.aspx", true);
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMProcurement.aspx", true);
        }

        protected void btnbakdashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx", true);
        }
    }
}