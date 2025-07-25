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
    public partial class utilityDownload : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("Logout.aspx");
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
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station section
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
                    else// MANAGEMENT
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

                    ds = cmm.RunSpReturnDSParam("PN18_utilityType", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                    //rbluttyp.DataSource = ds;
                    //rbluttyp.DataTextField = "utilityname";
                    //rbluttyp.DataValueField = "uid";
                    //rbluttyp.DataBind();
                    bindrepeater();
                    ds = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                         new SqlParameter("@utilitytypID", "4"));
                    grdutility.DataSource = ds;
                    grdutility.DataBind();
                    grdutility.PageIndex = 0;
                    lblcat.Text = "IT Softwares";
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void bindrepeater()
        {
            DataSet dsrep = new DataSet();
            dsrep = cmm.RunSpReturnDSParam("PN18_utilityType", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            RepCat.DataSource = dsrep;
            RepCat.DataBind();
        }
        //protected void rbluttyp_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    divgrd.Visible = true;
        //    ds = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
        //                                                                                new SqlParameter("@utilitytypID", Convert.ToInt32(rbluttyp.SelectedValue)));
        //    grdutility.DataSource = ds;
        //    grdutility.DataBind();
        //}

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void grdutility_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int fileid = (int)grdutility.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "5"),
                                                   new SqlParameter("@fileid", fileid));
                string str = ds1.Tables[0].Rows[0][1].ToString();
                string substr = str.Substring(str.Length - 3);
                string paths = Server.MapPath("~/UtilityDownloads/" + ds1.Tables[0].Rows[0][1].ToString());
                //Response.Redirect(paths);
                //if (ds1.Tables[0].Rows.Count != 0)
                //{
                FileInfo file = new FileInfo(paths);
                //if (ds1.Tables[0].Rows.Count != 0)
                if (file.Exists)
                {
                    if (substr == "pdf")
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                        Response.WriteFile(Server.MapPath("~/UtilityDownloads/" + ds1.Tables[0].Rows[0][1].ToString()));
                        Response.End();
                    }
                    else
                    {
                        System.Web.HttpContext.Current.Response.Clear();
                        System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename="+ ds1.Tables[0].Rows[0][1].ToString());
                        System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                        System.Web.HttpContext.Current.Response.TransmitFile(Server.MapPath("~/UtilityDownloads/" + str));
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no Utility to download!!');", true);

            }
        }

        protected void grdutility_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdutility.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                         new SqlParameter("@utilitytypID", Convert.ToInt32(ViewState["catid"])));
            grdutility.DataSource = ds;
            grdutility.DataBind();
        }

        protected void RepCat_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "catsearch")
            {
                LinkButton utname = (LinkButton)e.Item.FindControl("lnkelg");
                divgrd.Visible = true;
                Label lblutcatid = (Label)e.Item.FindControl("lbldoccatid");
                ViewState["catid"] = lblutcatid.Text;
                ds = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                           new SqlParameter("@utilitytypID", Convert.ToInt32(lblutcatid.Text)));
                grdutility.DataSource = ds;
                grdutility.DataBind();
                grdutility.PageIndex = 0;
                lblcat.Text = utname.Text;

            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx");
        }
    }
}