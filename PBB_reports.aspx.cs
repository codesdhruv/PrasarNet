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
    public partial class PBB_reports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 245) || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                if (!IsPostBack)
                {
                    cmm.bindDDLWidParam(ddlcat, "PN18_pbb_MeetingDoc_category_SP", "Category", "Id", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddldoctype, "PN18_pbb_Meeting_documenttype_SP", "DocumentType", "Id", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
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
                                LinkButton1.Visible = true;
                                //divboardmeetingreport.Visible = true;
                            }
                            else
                            {
                                divboradmeetingrecordsUpload.Visible = false;
                                LinkButton1.Visible = false;
                                //divboardmeetingreport.Visible = false;
                            }
                        }
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["UserId"]) == 4)// Management
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
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }

                        else//14,15,16,18,19
                        {
                            DataSet dspbb = new DataSet();
                            dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                          , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                            if (dspbb.Tables[0].Rows.Count>0)//adgadmin and CEO
                            {
                                divmeetingrecordadmin.Visible = true;
                            }
                            else
                            {
                                divmeetingrecordadmin.Visible = false;
                            }
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btngetdata_Click(object sender, EventArgs e)
        {
            try
            {
                gridbind();
                divgrd.Visible = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Issue while fetching a list of documents, as per the filter.Please Try Again !!');", true);
            }
        }
        private void gridbind()
        {
            int? catid = null;
            int? doctypeid = null;
            string title = "None";
            string keyword = "None";
            DateTime? DateOfMeeting = null;
            string Docextension = "None";
            if (ddlcat.SelectedIndex != 0)
            {
                catid = Convert.ToInt32(ddlcat.SelectedValue);
            }
            if (ddldoctype.SelectedIndex != 0)
            {
                doctypeid = Convert.ToInt32(ddldoctype.SelectedValue);
            }
            if (txtdatemeeting.Text != "")
                DateOfMeeting = DateTime.ParseExact(txtdatemeeting.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

            if (txttitle.Text.Trim() != "")
            {
                title = txttitle.Text.Trim();
            }
            if (txtkeyword.Text.Trim() != "")
            {
                keyword = txtkeyword.Text.Trim();
            }
            if (ddldocext.SelectedIndex != 0)
            {
                Docextension = Convert.ToString(ddldocext.SelectedItem.Text);

            }
            ds = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", catid),
                                                                              new SqlParameter("@DoctypeID", doctypeid),
                                                                              new SqlParameter("@Title", title),
                                                                              new SqlParameter("@keyword", keyword),
                                                                              new SqlParameter("@DateOfMeeting", DateOfMeeting),
                                                                              new SqlParameter("@Docextension", Docextension),
                                                                              new SqlParameter("@flag", 6));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 5),
                                                       new SqlParameter("@id", id));


                    //string paths = "BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][1].ToString();
                    string paths = Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString());
                    string substr = ds1.Tables[0].Rows[0][2].ToString();
                    //Response.Redirect(paths);
                    FileInfo file = new FileInfo(paths);
                    //if (ds1.Tables[0].Rows.Count != 0)
                    if (file.Exists)
                    {
                        if (substr == ".pdf" || substr == ".doc" || substr == ".docx")
                        {
                            Response.Clear();
                            Response.ContentType = "application/octet-stream";
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                            Response.WriteFile(Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
                            Response.End();

                        }
                        else
                        {
                            System.Web.HttpContext.Current.Response.Clear();
                            System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                            System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                            System.Web.HttpContext.Current.Response.TransmitFile(Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
                        }
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no file to download!!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Issue while downloading a document.Please Try Again !!');", true);
                }
            }
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            gridbind();
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
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DocumentUpload_pbb.aspx");
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