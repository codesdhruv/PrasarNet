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

namespace PrasarNet.PBB_Members
{
    public partial class Shared_Documents : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("pbb_boardmember_sp", "PRASARNETConnectionString", new SqlParameter("@uid", Convert.ToInt32(Session["Uidmanagement1"]))
                                                                                       , new SqlParameter("@flag", "2"));
            if (Convert.ToString(Session["username1"]) == "" || Convert.ToString(Session["islogin1"]) != "boardMember_2")
            {
                Response.Redirect("~/PBB_Members/Members_Login.aspx", false);
            }
            else if (ds.Tables[0].Rows.Count>0)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["username1"]);
                    gridbind();
                }
            }
            else
            {
                Response.Redirect("~/PBB_Members/Members_LogOut.aspx");
            }
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@flag", "5")
                                                                                                 , new SqlParameter("@OtherUserId", Convert.ToInt32(Session["Uidmanagement1"])));
            // , new SqlParameter("@OtherUserId", Convert.ToInt32(Session["Uidmanagement"])));
            grddoc.DataSource = ds;
            grddoc.DataBind();
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


                    string paths = "../BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString();
                    //FileInfo file = new FileInfo(paths);
                    //if (file.Exists)
                    if (ds1.Tables[0].Rows.Count != 0)
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                        Response.WriteFile(Server.MapPath("../BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
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
                    
                    string paths = "../BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString();
                    string str = ds1.Tables[0].Rows[0][12].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        Session["otherdocpath1"] = paths;
                        Response.Redirect("../PBB_Members/Members_DocumentsView.aspx", false);
                    }
                    else
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ((Convert.ToString(ds1.Tables[0].Rows[0][12]).Replace(' ', 'o')).Replace(' ', 'o')).Trim());
                        Response.WriteFile(Server.MapPath("../BoardMeetingRecords_Doc/" + ds1.Tables[0].Rows[0][12].ToString()));
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