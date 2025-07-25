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
    public partial class OSD_PB__Orders_Circulars : System.Web.UI.Page
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
                    ViewState["search"] = 0;


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
                    else// management
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
                    string currentDate = DateTime.Today.ToShortDateString();
                    bindgrd();
                    grddoc.Focus();
                }


            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void bindgrd()
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 9));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                try
                {
                    DataSet dsurl = new DataSet();
                    dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                           , new SqlParameter("@flag", 1));
                    string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();

                    DataSet ds2 = new DataSet();
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 4),
                                                       new SqlParameter("@docid", Docid));

                    ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", Convert.ToInt32(ds1.Tables[0].Rows[0][4])),
                                                                                               new SqlParameter("@flag", 2));
                    //if (ds2.Tables[0].Rows.Count != 0)
                    //{
                    string paths1 = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                        Session["showDocFilePath"] = paths;
                        string str = ds1.Tables[0].Rows[0][9].ToString();
                        string downloadstr = ds1.Tables[0].Rows[0][5].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][9].ToString() != "")
                            {
                                WebClient req = new WebClient();// Added on 29May2018 due becos in meeting eith ADG , it has been instructed that the repository should be come from AIRNET Web Server
                                HttpResponse response = HttpContext.Current.Response;
                                response.Clear();
                                response.ClearContent();
                                response.ClearHeaders();
                                response.Buffer = true;
                                response.ContentType = "application/octet-stream";
                                response.AddHeader("Content-Disposition", "attachment;filename=\"" + str + "\"");
                                //Response.WriteFile(paths);
                                byte[] data = req.DownloadData(paths);
                                response.BinaryWrite(data);
                                response.End();

                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }
                        else
                        {
                            Session["dash/order"] = 2;
                            Response.Redirect("showDocument.aspx");
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issue(s) occured while downloading a document.Try Again!!');", true);
                }
            }
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            bindgrd();

        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx", true);
        }
    }
}