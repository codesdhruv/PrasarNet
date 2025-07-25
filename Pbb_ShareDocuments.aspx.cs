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
    public partial class Pbb_ShareDocuments : System.Web.UI.Page
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

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> TitleSearch(string prefixText, int count, string contextKey)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            int? catid = null, doctypeid = null;
            if (contextKey != "")
            {
                string[] x = contextKey.Split(',');
                catid = Convert.ToInt32(x[0]);
                doctypeid = Convert.ToInt32(x[1]);
            }

            ds = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", catid),
                                                                                new SqlParameter("@DoctypeID", doctypeid),
                                                                                new SqlParameter("@Title", prefixText),
                                                             new SqlParameter("@flag", "7"));


            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                Output.Add(ds.Tables[0].Rows[i][0].ToString());
            return Output;
        }
        protected void ddldoctype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldoctype.SelectedIndex != 0)
            {
                trtitle.Visible = true;
                trbtn.Visible = true;
                trsharewith.Visible = true;
                string context = ddldoccat.SelectedValue + ',' + ddldoctype.SelectedValue;
                autoComplete1.ContextKey = context;
            }
            else
            {
                trtitle.Visible = false;
                trbtn.Visible = false;
                trsharewith.Visible = false;
            }
        }

        protected void ddlsharewith_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strsharewithid = ddlsharewith.SelectedValue.Trim();
            string strsharewithname = ddlsharewith.SelectedItem.Text;
            lstsharewith.Items.Add(new ListItem(strsharewithname, strsharewithid));
            ddlsharewith.SelectedIndex = 0;
            ddlsharewith.Focus();
            //foreach (ListItem i in ddlsharewith.Items)
            //{
            //    i.Enabled = true;
            //}
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@pbbdocid", Convert.ToInt64(ViewState["pbbdocid"])),
                                                              new SqlParameter("@flag", "4"));
            int n = Convert.ToInt32(ds1.Tables[0].Rows.Count);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < n; i++)
                {
                    string row = ds1.Tables[0].Rows[i][0].ToString();
                    ddlsharewith.Items.FindByValue(row).Enabled = false;
                }            
            }
            for (int i = lstsharewith.Items.Count - 1; i >= 0; i--)
            {
                string id = lstsharewith.Items[i].Value;
                ddlsharewith.Items.FindByValue(id).Enabled = false;
                //ddlsharewith.Items.FindByValue(id) = false;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //DataSet ds1 = new DataSet();
            //ds1 = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@pbbdocid", Convert.ToInt64(ViewState["pbbdocid"])),
            //                                                  new SqlParameter("@flag", "4"));
            //int n = Convert.ToInt32(ds1.Tables[0].Rows.Count);
            //if (ds1.Tables[0].Rows.Count > 0)
            //{
            //    for (int i = 0; i < n; i++)
            //    {
            //        string row = ds1.Tables[0].Rows[i][0].ToString();
            //        ddlsharewith.Items.FindByValue(row).Enabled = false;
            //    }

            //}
            for (int i = lstsharewith.Items.Count - 1; i >= 0; i--)
            {
                string id = lstsharewith.Items[i].Value;
                if (lstsharewith.Items[i].Selected)
                {
                    lstsharewith.Items.Remove(lstsharewith.Items[i]);
                }                
                ddlsharewith.Items.FindByValue(id).Enabled = true;
            }
        }
        public string getsharewithpersonIDin_string()
        {
            
                string str = "";
                foreach (ListItem liItem in lstsharewith.Items)
                    str += liItem.Value + ",";
                str = str.Substring(0, str.Length);
                return str;
           
        }

        protected void btnshare_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                if (lstsharewith.Items.Count > 0)
                {
                    int i;
                    string sharewithpersonID = getsharewithpersonIDin_string();

                    i = cmm.RunSP("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@pbbuseridstring", sharewithpersonID),
                                                                                        new SqlParameter("pbbdocid", Convert.ToInt64(ViewState["pbbdocid"])),
                                                                                        new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                        new SqlParameter("@ip", ip),
                                                                                        new SqlParameter("@flag", "1"));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Shared Successfully!!');", true);
                        clear();
                        gridbind();
                        trsharewith.Visible = false;
                        trtitle.Visible = false;
                        trbtn.Visible = false;
                        divgrd.Visible = true;
                        divshareform.Visible = false;
                        grddoc.Focus();                        
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please select atleast one 'ShareWith' from the list!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error while Processing the information. Please,Try Again!!');", true);
            }
        }

        protected void txttitle_TextChanged(object sender, EventArgs e)
        {
            try
            {
                cmm.bindDDLWidParam(ddlsharewith, "pbb_boardmember_sp", "HOO", "Uid", "PRASARNETConnectionString", "-- Select --", new SqlParameter("@flag", 1));

                ds = cmm.RunSpReturnDSParam("PN18_pbb_MeetingDocumentDetails_SP", "PRASARNETConnectionString", new SqlParameter("@doc_cat_ID", Convert.ToInt32(ddldoccat.SelectedValue)),
                                                                                       new SqlParameter("@DoctypeID", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                                                       new SqlParameter("@Title", txttitle.Text.Trim()),
                                                                                       new SqlParameter("@flag", "8"));
                ViewState["pbbdocid"] = ds.Tables[0].Rows[0][0].ToString();
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@pbbdocid", Convert.ToInt64(ViewState["pbbdocid"])),
                                                                                                        new SqlParameter("@flag", "4"));
                int n = Convert.ToInt32(ds1.Tables[0].Rows.Count);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < n; i++)
                    {
                        string row = ds1.Tables[0].Rows[i][0].ToString();
                        ddlsharewith.Items.FindByValue(row).Enabled = false;
                    }
                    //foreach (DataRow row in ds1.Tables[0].Rows)
                    //{
                    //    ddlsharewith.Items.FindByValue(row[0].ToString()).Enabled = false;
                    //}
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Try Again!!');", true);
            }
            //string id = lstsharewith.Items[i].Value;
            //ddlsharewith.Items.FindByValue(id).Enabled = false;
        }
        private void clear()
        {
            ddldoccat.SelectedIndex = 0;
            ddldoctype.SelectedIndex = 0;
            ddlsharewith.SelectedIndex = 0;
            txttitle.Text = "";
            lstsharewith.Items.Clear();
            //foreach (ListItem li in ddlsharewith.Items)
            //{
            //    li.Enabled = true;

            //}
            ddlsharewith.Items.Clear();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
            trsharewith.Visible = false;
            trtitle.Visible = false;
            trbtn.Visible = false;
            divgrd.Visible = true;
            divshareform.Visible = false;
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString", new SqlParameter("@flag", "2"));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DocumentUpload_pbb.aspx");
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
            if (e.CommandName == "Delete")
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    int i = 0;
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grddoc.DataKeys[row.RowIndex].Value;
                    i = cmm.RunSP("PN18_Pbb_Sharedocuments_SP", "PRASARNETConnectionString",
                                                                         new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                                         new SqlParameter("@flag", "3"),
                                                                         new SqlParameter("@ip",ip),
                                                                         new SqlParameter("@pbbdocid", id));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Deleted Sucessfully!!');", true);
                        gridbind();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
        }

        protected void grddoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grddoc_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            gridbind();
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
                ClientScript.RegisterStartupScript(this.GetType(), "Documents_Shared_by_PBB-Section", sb.ToString());
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

        protected void ddldoccat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddldoccat.SelectedIndex==0)
            {
                trtitle.Visible = false;
                trbtn.Visible = false;
                trsharewith.Visible = false;
            }
        }

        protected void lnkshare_Click(object sender, EventArgs e)
        {
            divshareform.Visible = true;
            divgrd.Visible = false;
            trsharewith.Visible = false;
            trtitle.Visible = false;
            trbtn.Visible = false;
            ddldoctype.Focus();
        }

        protected void grddoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbluplon2 = (Label)e.Row.FindControl("Label18");
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