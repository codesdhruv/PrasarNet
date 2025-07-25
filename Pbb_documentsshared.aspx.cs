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
    public partial class Pbb_documentsshared : System.Web.UI.Page
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
                                || Convert.ToInt16(Session["Usertype"]) == 15 || Convert.ToInt16(Session["Usertype"]) == 16 || Convert.ToInt16(Session["Usertype"]) == 18 || Convert.ToInt16(Session["Usertype"]) == 49
                                || Convert.ToInt16(Session["Usertype"]) == 19 || Convert.ToInt16(Session["Usertype"]) == 50 || Convert.ToInt16(Session["Usertype"]) == 32 || Convert.ToInt16(Session["Usertype"]) == 14)
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
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = true;
                        AdminMenuIT.Visible = false;
                     
                    }

                    //cmm.bindDDLWidParam(ddldoccat, "PN18_pbb_MeetingDoc_category_SP", "Category", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));
                    //cmm.bindDDLWidParam(ddldoctype, "PN18_pbb_Meeting_documenttype_SP", "DocumentType", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));

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
                    gridbind();
                }
            }

            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            DataSet dsMap = new DataSet();
            dsMap = cmm.RunSpReturnDSParam("Pbb_otheruser_to_BM_Mapping", "PRASARNETConnectionString", new SqlParameter("@flag", "1")
                                                                                                 , new SqlParameter("@otheruserid", Convert.ToInt32(Session["Uidmanagement"])));
            int BMID = Convert.ToInt32(dsMap.Tables[0].Rows[0][0]);

            ds = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@flag", "5")
                                                                                                 , new SqlParameter("@OtherUserId", BMID));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grddoc.AllowPaging = false;
                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grddoc.RenderControl(hw);
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
                ClientScript.RegisterStartupScript(this.GetType(), "Documents_Shared_by_PBB-Section", sb.ToString());
                grddoc.AllowPaging = true;
                gridbind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download2")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Label lblext = row.FindControl("lblext") as Label;
                    string ext = lblext.Text;

                    ds1 = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 5),
                                                       new SqlParameter("@id", id));


                    string paths = "BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString();
                    //FileInfo file = new FileInfo(paths);
                    //if (file.Exists)
                    if(ds1.Tables[0].Rows.Count != 0)
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                        Response.WriteFile(Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
                        HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                        HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                        HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }

                }
                catch (Exception ex)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Try Again !!');", true);
                }


            }
            if (e.CommandName == "Download")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Label lblext = row.FindControl("lblext") as Label;
                    string ext = lblext.Text;
                    ds1 = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 5),
                                                       new SqlParameter("@id", id));


                    string paths = "BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString();
                    string str = ds1.Tables[0].Rows[0][12].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                    //    if (ext==".pdf")
                    //{
                        Session["otherdocpath"] = paths;
                        Response.Redirect("sharedDocumentsView.aspx", false);
                    }
                    else
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                        Response.WriteFile(Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
                        HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                        HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                        HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Try Again !!');", true);
                }


            }
        }

        protected void grddoc_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }

}
