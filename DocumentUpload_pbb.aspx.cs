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
    public partial class DocumentUpload_pbb : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 245))
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

                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddldoccat, "PN18_pbb_MeetingDoc_category_SP", "Category", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddldoctype, "PN18_pbb_Meeting_documenttype_SP", "DocumentType", "Id", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));

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

            ds = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString",
                                                              new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                              new SqlParameter("@flag", "1"),
                                                              new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                string path = "";
                string filetype = "";

                if (btnupload.Text == "Save & Upload")//Insert
                {
                    if (FileUpload1.HasFile)
                    {
                        filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = "";
                        if (btnupload.Text == "Save & Upload")
                        {
                            max = cmm.SelectMaxId("select max(Id)+1 from PN18_pbb_MeetingDocumentDetails", "PRASARNETConnectionString");
                            if (max == "")
                            {
                                max = "1";
                            }
                        }
                        else
                        {
                            //if(ViewState["Filename_Pbb"].ToString()!=null || ViewState["Filename_Pbb"].ToString() != "")
                            //{
                            //    filetype = ViewState["Filename_Pbb"].ToString().Substring(ViewState["Filename_Pbb"].ToString().Length - 4);
                            //}
                            max = Convert.ToString(Session["fileid"]);

                        }
                        if (filetype == ".pdf" || filetype == ".doc" || filetype == ".docx")
                        {
                            string files = "";
                            FileUpload1.SaveAs(MapPath("~/BoardMeetingRecords_Doc/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            if (FileUpload1.PostedFile.ContentType == "application/msword" || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document" || FileUpload1.PostedFile.ContentType == "application/pdf")
                            {
                                System.IO.Stream fs;
                                fs = FileUpload1.PostedFile.InputStream;
                                System.IO.StreamReader rs;
                                rs = new System.IO.StreamReader(fs, true);
                                string lastline = rs.ReadLine().ToString();
                                if ((lastline.IndexOf("%PDF") > -1) || (lastline.IndexOf("MSWordDoc") > -1) || (lastline.IndexOf("docProps") > -1) || FileUpload1.PostedFile.ContentType == "application/msword" || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
                                {
                                    path = Server.MapPath("~") + "\\BoardMeetingRecords_Doc\\";
                                    string Fromfile = path + files;
                                    string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o').Replace(' ', '_')).Trim();
                                    string savefile = "Meeting" + ddldoccat.SelectedItem.Text + max + "_" + dtetm + filetype;
                                    string Tofile = path + savefile;
                                    File.Move(Fromfile, Tofile);
                                    int d;
                                    d = cmm.RunSP("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", Convert.ToInt32(ddldoccat.SelectedValue)),
                                                  new SqlParameter("@DoctypeID", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                  new SqlParameter("@Title", txttitle.Text.Trim()),
                                                  new SqlParameter("@DateOfMeeting", DateTime.ParseExact(txtdatemeeting.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                  new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                  new SqlParameter("@Docextension", filetype),
                                                  new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                  new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                  new SqlParameter("@filename", savefile),
                                                  new SqlParameter("@ip", ip),
                                                  new SqlParameter("@keyword", txtkeyword.Text.Trim()),
                                                  new SqlParameter("@flag", "2"));

                                    if (d > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Records Saved Successfully');", true);
                                        clear();
                                        divgrd.Visible = true;
                                        divupload.Visible = false;
                                        divgrd.Visible = true;
                                        gridbind();
                                        grddoc.Focus();
                                    }
                                    else
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                                }

                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                        }
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(No File Attached!!');", true);
                    }
                }
                else //Update the Records
                {
                    string savefile = "";
                    int d = 0;
                    if (FileUpload1.HasFile)
                    {
                        filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = "";


                        max = Convert.ToString(Session["fileid"]);

                        if (filetype == ".pdf" || filetype == ".doc" || filetype == ".docx")
                        {
                            string files = "";
                            FileUpload1.SaveAs(MapPath("~/BoardMeetingRecords_Doc/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            if (FileUpload1.PostedFile.ContentType == "application/msword" || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document" || FileUpload1.PostedFile.ContentType == "application/pdf")
                            {
                                System.IO.Stream fs;
                                fs = FileUpload1.PostedFile.InputStream;
                                System.IO.StreamReader rs;
                                rs = new System.IO.StreamReader(fs, true);
                                string lastline = rs.ReadLine().ToString();
                                if ((lastline.IndexOf("%PDF") > -1) || (lastline.IndexOf("MSWordDoc") > -1) || (lastline.IndexOf("docProps") > -1) || FileUpload1.PostedFile.ContentType == "application/msword" || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
                                {
                                    path = Server.MapPath("~") + "\\BoardMeetingRecords_Doc\\";
                                    string Fromfile = path + files;
                                    string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o').Replace(' ', '_')).Trim();
                                    savefile = "Meeting" + ddldoccat.SelectedItem.Text + max + "_" + dtetm + filetype;
                                    string Tofile = path + savefile;
                                    File.Move(Fromfile, Tofile);
                                    d = cmm.RunSP("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", Convert.ToInt32(ddldoccat.SelectedValue)),
                                                  new SqlParameter("@DoctypeID", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                  new SqlParameter("@Title", txttitle.Text.Trim()),
                                                  new SqlParameter("@DateOfMeeting", DateTime.ParseExact(txtdatemeeting.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                  new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                  new SqlParameter("@Docextension", filetype),
                                                  new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                  new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                  new SqlParameter("@filename", savefile),
                                                  new SqlParameter("@id", Convert.ToInt64(Session["fileid"])),
                                                  new SqlParameter("@ip", ip),
                                                  new SqlParameter("@keyword", txtkeyword.Text.Trim()),
                                                  new SqlParameter("@flag", "4"));
                                }

                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf and word file are allowed to upload!!');", true);
                        }
                    }
                    else
                    {
                        savefile = ViewState["Filename_Pbb"].ToString();
                        d = cmm.RunSP("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", Convert.ToInt32(ddldoccat.SelectedValue)),
                                                 new SqlParameter("@DoctypeID", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                 new SqlParameter("@Title", txttitle.Text.Trim()),
                                                 new SqlParameter("@DateOfMeeting", DateTime.ParseExact(txtdatemeeting.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                 new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                 new SqlParameter("@Docextension", ViewState["docextn_Pbb"].ToString()),
                                                 new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                 new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                 new SqlParameter("@filename", savefile),
                                                 new SqlParameter("@id", Convert.ToInt64(Session["fileid"])),
                                                 new SqlParameter("@ip", ip),
                                                 new SqlParameter("@keyword", txtkeyword.Text.Trim()),
                                                 new SqlParameter("@flag", "4"));
                    }


                    if (d > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                        clear();
                        btnupload.Text = "Save & Upload";
                        divgrd.Visible = true;
                        divupload.Visible = true;
                        divgrd.Visible = true;
                        gridbind();
                        grddoc.Focus();
                        ViewState["Filename_Pbb"] = null;
                        Label18.Visible = false;
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);

                }

            }
            catch (Exception ex)
            {
                lblexception.Visible = true;
                lblexception.Text = ex.Message.ToString();
            }

        }

        private void clear()
        {
            ddldoctype.SelectedIndex = 0;
            ddldoccat.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatemeeting.Text = "";
            FileUpload1.Attributes.Clear();
            divgrd.Visible = true;
            txtkeyword.Text = "";
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
            divupload.Visible = false;
            divgrd.Visible = true;
            grddoc.Focus();
            if (btnupload.Text != "Save & Upload")
            {
                btnupload.Text = "Save & Upload";
                Label18.Visible = false;
                ViewState["Filename_Pbb"] = null;
            }
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
                grddoc.Columns[3].Visible = false;
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
                grddoc.Columns[3].Visible = true;
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
        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                divupload.Visible = true;
                divgrd.Visible = false;
                divgrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                Session["fileid"] = id;
                ds1 = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@id", id),
                                                                                                                new SqlParameter("@flag", "5"));
                Label18.Visible = true;
                ddldoccat.SelectedValue = ds1.Tables[0].Rows[0][3].ToString();
                ddldoctype.SelectedValue = ds1.Tables[0].Rows[0][4].ToString();
                txttitle.Text = ds1.Tables[0].Rows[0][5].ToString();
                txtdatemeeting.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][6].ToString()).Date.ToString("dd-MM-yyyy");
                txtkeyword.Text = ds1.Tables[0].Rows[0][14].ToString();
                ViewState["Filename_Pbb"] = ds1.Tables[0].Rows[0][12].ToString();
                ViewState["docextn_Pbb"] = ds1.Tables[0].Rows[0][15].ToString();
                btnupload.Text = "Update";
                ddldoccat.Focus();

            }
            if (e.CommandName == "Delete")
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    int i = 0;
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                    i = cmm.RunSP("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString",
                                                                         new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                                         new SqlParameter("@flag", "3"),
                                                                         new SqlParameter("@ip", ip),
                                                                         new SqlParameter("@id", id));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Deleted Sucessfully!!');", true);
                        divupload.Visible = false;
                        divgrd.Visible = true;
                        gridbind();
                        grddoc.Focus();

                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
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
                    string paths = Server.MapPath("~/BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString());
                    string substr = ds1.Tables[0].Rows[0][2].ToString();//extension              
                    FileInfo file = new FileInfo(paths);
                    if (file.Exists)
                    {
                        if (substr == ".pdf" || substr == ".doc" || substr == ".docx")
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

        protected void grddoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grddoc_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grddoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grddoc.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void lnkupload_Click(object sender, EventArgs e)
        {
            divupload.Visible = true;
            divgrd.Visible = false;
            ddldoctype.Focus();
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
