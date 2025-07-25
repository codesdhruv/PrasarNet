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
    public partial class UtilityUpload : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("Logout.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 27)
            {
                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlutilitytype, "PN18_utilityType", "utilityname", "uid", "PRASARNETConnectionString", "-- Utility Type --", new SqlParameter("@flag", 1));
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
            ds = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@flag", 4));
            grdutility.DataSource = ds;
            grdutility.DataBind();
        }
        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {

                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                    filetype = filetype.ToLower();
                    //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                    string max = "";
                    if (btnupload.Text == "Upload")
                    {
                        max = cmm.SelectMaxId("select max(fileid)+1 from PN18_Utilityfiledownload", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                    }
                    else
                    {
                        max = Convert.ToString(Session["fileid"]);
                        ds = cmm.RunSQLReturnDS("Select UtilityFileName from PN18_Utilityfiledownload where fileid=" + Convert.ToInt64(Session["fileid"]), "PRASARNETConnectionString");
                        string docname1 = Convert.ToString(ds.Tables[0].Rows[0][0]);
                        string path1 = Server.MapPath("~/UtilityDownloads/" + docname1);
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)
                        {
                            //file.Delete();
                        }
                    }
                    //string img = cmm.ReturnValue(str);
                    if (filetype == ".pdf" || filetype == ".exe" || filetype == ".apk" || filetype == ".ipa" || filetype == ".msi" || filetype == ".ttf")
                    {
                        string files = "";
                        FileUpload1.SaveAs(MapPath("~/UtilityDownloads/" + FileUpload1.FileName.ToString()));
                        files = FileUpload1.FileName.ToString();
                        path = Server.MapPath("~") + "\\UtilityDownloads\\";
                        string Fromfile = path + files;
                        string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                        string savefile = "utility" + max + "_" + dtetm + filetype;
                        string Tofile = path + savefile;
                        File.Move(Fromfile, Tofile);
                        int d;
                        if (btnupload.Text == "Upload")
                        {

                            d = cmm.RunSP("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@Subject", txttitle.Text.Trim()),
                                                                                       new SqlParameter("@utilitytypID", Convert.ToInt32(ddlutilitytype.SelectedValue)),
                                                                                       new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                       new SqlParameter("@UtilityFileName", savefile),
                                                                                       new SqlParameter("@flag", "1"));

                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                clear();
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                        }
                        else
                        {
                            d = cmm.RunSP("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@Subject", txttitle.Text.Trim()),
                                                                                       new SqlParameter("@utilitytypID", Convert.ToInt32(ddlutilitytype.SelectedValue)),
                                                                                       new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                       new SqlParameter("@UtilityFileName", savefile),
                                                                                       new SqlParameter("@fileid", Convert.ToInt64(Session["fileid"])),
                                                                                       new SqlParameter("@flag", "2"));
                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                                clear();
                                btnupload.Text = "Upload";
                                divgrd.Visible = true;
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Upload .pdf or .exe or .ipa or .apk or .msi or .ttf files, only!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Attach a file !!');", true);
            gridbind();
            grdutility.Focus();

            grdutility.PageIndex = 0;
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
        }
        private void clear()
        {
            ddlutilitytype.SelectedIndex = 0;
            txttitle.Text = "";
            FileUpload1.Attributes.Clear();
        }

        protected void grdutility_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdutility.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grdutility_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int fileid = (int)grdutility.DataKeys[row.RowIndex].Value;
                //ds = cmm.RunSQLReturnDS("Select UtilityFileName from PN18_Utilityfiledownload where fileid=" + fileid, "PRASARNETConnectionString");
                //string filenme = Convert.ToString(ds.Tables[0].Rows[0][0]);
                //string path = Server.MapPath("~/UtilityDownloads/" + filenme);
                //FileInfo file = new FileInfo(path);
                //if (file.Exists)
                //{
                    //file.Delete();
                    i = cmm.RunSP("PN18_UtilityUpload", "PRASARNETConnectionString",
                                                  new SqlParameter("@flag", "3"),
                                                  new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                  new SqlParameter("@fileid", fileid));
               // }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                    gridbind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
            if (e.CommandName == "Edit")
            {
                divgrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int fileid = (int)grdutility.DataKeys[row.RowIndex].Value;
                Session["fileid"] = fileid;
                ds1 = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString", new SqlParameter("@fileid", fileid),
                                                                                       new SqlParameter("@flag", "5"));
                ddlutilitytype.SelectedValue = ds1.Tables[0].Rows[0][3].ToString();
                txttitle.Text = ds1.Tables[0].Rows[0][2].ToString();
                btnupload.Text = "Update";
                ddlutilitytype.Focus();

            }
            if (e.CommandName == "Download")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int fileid = (int)grdutility.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_UtilityUpload", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 5),
                                                       new SqlParameter("@fileid", fileid));


                    string paths = Server.MapPath("~/UtilityDownloads/" + ds1.Tables[0].Rows[0][1].ToString());
                    string str = ds1.Tables[0].Rows[0][1].ToString();
                    string substr = str.Substring(str.Length - 3);

                     FileInfo file = new FileInfo(paths);
                    //if (ds1.Tables[0].Rows.Count != 0)
                    if (file.Exists)
                    {

                    //Response.Redirect(paths);
                    //if (ds1.Tables[0].Rows.Count != 0)
                    //{
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
                            System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                            System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                            System.Web.HttpContext.Current.Response.TransmitFile(Server.MapPath("~/UtilityDownloads/" + str));
                            //    Catch ex As Exception

                            //    End Try


                            //    System.Web.HttpContext.Current.Response.End()
                            //End Sub
                        }
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no Utility to download!!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
            }
        }

        protected void grdutility_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdutility_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdutility_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdutility.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx");
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdutility.AllowPaging = false;
                grdutility.Columns[2].Visible = false;
                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdutility.RenderControl(hw);
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
                grdutility.AllowPaging = true;
                grdutility.Columns[2].Visible = true;
                gridbind();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}