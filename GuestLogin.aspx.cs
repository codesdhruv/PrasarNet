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
    public partial class GuestLogin : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["UserName"]) == "" || Convert.ToString(Session["isLogin"]) == "")
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    string currentDate = DateTime.Today.ToShortDateString();
                    cValFrom.ValueToCompare = currentDate;
                    cValTo.ValueToCompare = currentDate;
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddldoctyp, "PN18_DocTypen", "Doc_Type", "Docid", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
                    cmm.bindDDL(ddlorg, "PN18_orgProc", "Abbreviation", "OrganizationId", "--All--", "PRASARNETConnectionString");

                    bindrepeater();
                    bindgrd();
                    grddoc.Focus();
                }
            }
        }
        private void bindrepeater()
        {
            DataSet dsrep = new DataSet();
            dsrep = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            RepDetails.DataSource = dsrep;
            RepDetails.DataBind();
        }
        private void bindgrd()
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        private void bindgrdcatwise(int doctypeid)
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@flag", 8)
                                                                                           , new SqlParameter("@doctypeid", doctypeid));
            grddoc.DataSource = ds;
            grddoc.DataBind();
            grddoc.PageIndex = 0;
        }
        protected void lnksearch_Click(object sender, EventArgs e)
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            //ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            txttodate.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;
            uploadedbyrow.Visible = false;

            divsrch1.Visible = false;
            divsearch2.Visible = true;
          
            divcat.Visible = false;
            divgrd.Visible = true;
            ViewState["search"] = 1;
            HideNotes();
            divshow.Visible = false;
            Label5.Visible = false;
            grddoc.PageIndex = 0;
        }
        private void clear()
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;

        }
        public void HideNotes()
        {
            foreach (RepeaterItem ri in RepDetails.Items)
                ri.FindControl("lnkelg").Visible = false;
        }
        public void visNotes()
        {
            foreach (RepeaterItem ri in RepDetails.Items)
                ri.FindControl("lnkelg").Visible = true;
        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            ddldoctyp.SelectedIndex = 0;
            ddlorg.SelectedIndex = 0;
            //ddlsection.SelectedIndex = 0;
            //ddlstation.SelectedIndex = 0;
            //ddluploadedby.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtfileno.Text = "";
            txtorder.Text = "";
            txttodate.Text = "";
            SectionRow.Visible = false;
            stationrow.Visible = false;
            uploadedbyrow.Visible = false;

            divsrch1.Visible = true;
            divsearch2.Visible = false;
            divcat.Visible = true;
            divgrd.Visible = true;
            grddoc.PageIndex = 0;
            bindgrd();
            ViewState["search"] = 0;
            visNotes();
            divshow.Visible = false;
            Label5.Visible = false;
            

        }
        //private void clear()
        //{
        //    ddldoctyp.SelectedIndex = 0;
        //    ddlorg.SelectedIndex = 0;
        //    ddlsection.SelectedIndex = 0;
        //    ddlstation.SelectedIndex = 0;
        //    ddluploadedby.SelectedIndex = 0;
        //    txttitle.Text = "";
        //    txtdatedoc.Text = "";
        //    txtfileno.Text = "";
        //    txtorder.Text = "";
        //    SectionRow.Visible = false;
        //    stationrow.Visible = false;

        //}
        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            if (Convert.ToInt16(ViewState["search"]) == 1)
            {
                bndgrid_search();
            }
            else if (Convert.ToInt16(ViewState["search"]) == 21)
            {
                bindgrdcatwise(Convert.ToInt32(ViewState["catid"]));
            }
            else
            {
                bindgrd();
            }
        }

        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
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
                if (ds2.Tables[0].Rows.Count != 0)
                {
                    //
                    string paths = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + ds1.Tables[0].Rows[0][9].ToString();
                    Session["showDocFilePath"] = paths;
                    string str = ds1.Tables[0].Rows[0][9].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        //Response.Redirect(paths);
                        if (ds1.Tables[0].Rows[0][9].ToString() != "")
                        {
                            //string strURL = @"http://192.168.1.xxx/" + sDocumento;
                            WebClient req = new WebClient();// Added on 29May2018 due becos in meeting eith ADG , it has been instructed that the repository should be come from AIRNET Web Server
                            HttpResponse response = HttpContext.Current.Response;
                            response.Clear();
                            response.ClearContent();
                            response.ClearHeaders();
                            response.Buffer = true;
                            Response.ContentType = "application/octet-stream";
                            response.AddHeader("Content-Disposition", "attachment;filename=\"" + str + "\"");
                            byte[] data = req.DownloadData(paths);
                            response.BinaryWrite(data);
                            response.End();

                            //System.Web.HttpContext.Current.Response.Clear();
                            //System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename="+ str);
                            //System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                            //System.Web.HttpContext.Current.Response.TransmitFile(paths);






                            //            Response.Clear();
                            // Remove on 29May2018 due becos in meeting eith ADG , it has been instructed that the repository should be come from AIRNET Web Server
                            //            Response.ContentType = "application/octet-stream";
                            //            Response.AddHeader("Content-Disposition", "attachment; filename=Download.pdf");
                            //            Response.TransmitFile(paths);
                            //            Response.End();

                        }
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                    else
                    {
                        Session["dash/order"] = 2;
                        Response.Redirect("showDocument.aspx");
                        //Response.Redirect("showDocument.aspx");
                        // //Dim queryString As String = "AdminStnDetails.aspx" 



                        //Response.Write("<script>");
                        //string newWin = "window.open('" + paths + "','_blank');";
                        //ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                        //Response.Write("</script>");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
            }
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }
        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlorg.SelectedIndex != 0)
            {
                uploadedbyrow.Visible = true;
                cmm.bindDDLWidParam(ddluploadedby, "PN18_usertypeproc", "Usertype", "Usertypeid", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 3),
                                                                                                                                              new SqlParameter("@orgid", Convert.ToInt32(ddlorg.SelectedValue)));
            }
            else
            {
                uploadedbyrow.Visible = false;
                stationrow.Visible = false;
                SectionRow.Visible = false;
            }
        }

        protected void ddluploadedby_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" || ddluploadedby.SelectedValue == "24") //Station
            {
                stationrow.Visible = true;
                SectionRow.Visible = false;
                cmm.bindDDLWidParam(ddlstation, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", "--All--", new SqlParameter("@orgId", ddlorg.SelectedValue));

            }
            else if (ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Section
            {
                stationrow.Visible = false;
                SectionRow.Visible = true;
                cmm.bindDDLWidParam(ddlsection, "PN18_SectionProc", "secname", "userID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 2),
                                                                                                                                  new SqlParameter("@orgId", ddlorg.SelectedValue));
            }
            else //others
            {
                stationrow.Visible = false;
                SectionRow.Visible = false;
            }
        }
        private void bndgrid_search()
        {
            string title = txttitle.Text.Trim();
            DateTime? dated = null;

            DateTime? datedto = null;
            string order = txtorder.Text.Trim();
            string fileno = txtfileno.Text.Trim();
            int stnid = 0;
            int secid = 0;
            int orgid = 0;
            int utypid = 0;
            int dtypid = 0;
            if (title == "")
            {
                title = "None";
            }
            if (txtdatedoc.Text != "")
                dated = DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);                
                    //Convert.ToDateTime(txtdatedoc.Text);
            if (txttodate.Text != "")
                datedto = DateTime.ParseExact(txttodate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture); 
                    //Convert.ToDateTime(txttodate.Text);
            if (order == "")
            {
                order = "None";
            }
            if (fileno == "")
            {
                fileno = "None";
            }

            if (ddlorg.SelectedItem.Text != "--All--")
            {
                orgid = Convert.ToInt32(ddlorg.SelectedValue);
                if (ddluploadedby.SelectedItem.Text != "--All--")
                {
                    utypid = Convert.ToInt32(ddluploadedby.SelectedValue);
                }
            }

            //if (ddluploadedby.SelectedItem.Text != "--All--")
            //{
            //    utypid = Convert.ToInt32(ddluploadedby.SelectedValue);
            //}

            if (ddldoctyp.SelectedItem.Text != "--All--")
            {
                dtypid = Convert.ToInt32(ddldoctyp.SelectedValue);
            }
            if (ddluploadedby.SelectedValue == "11" || ddluploadedby.SelectedValue == "20" || ddluploadedby.SelectedValue == "22" || ddluploadedby.SelectedValue == "23" || ddluploadedby.SelectedValue == "24") //Station
            {
                if (ddlstation.SelectedItem.Text != "--All--")
                {
                    stnid = Convert.ToInt32(ddlstation.SelectedValue);
                }
            }
            else if (ddluploadedby.SelectedValue == "12" || ddluploadedby.SelectedValue == "25" || ddluploadedby.SelectedValue == "26") //Section
            {
                if (ddlsection.SelectedItem.Text != "--All--")
                {
                    secid = Convert.ToInt32(ddlsection.SelectedValue);
                }
            }
            //cmm.RunSpReturnDSParam(
            ds = cmm.RunSpReturnDSParam("PN18_documentsFilter", "PRASARNETConnectionString", new SqlParameter("@orgid", orgid),
                                                                                   new SqlParameter("@usertypeid", utypid),
                                                                                   new SqlParameter("@doctypeid", dtypid),
                                                                                   new SqlParameter("@doctitle", title),
                                                                                   new SqlParameter("@docdated", dated),
                                                                                   new SqlParameter("@docdatedto", datedto),
                                                                                   new SqlParameter("@orderNo", order),
                                                                                   new SqlParameter("@fileNo", fileno),
                                                                                   new SqlParameter("@stationid", stnid),
                                                                                   new SqlParameter("@sectionid", secid));


            grddoc.DataSource = ds;
            grddoc.DataBind();
            divgrd.Visible = true;
            grddoc.Focus();
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            bndgrid_search();
            ViewState["search"] = 1;
            grddoc.Focus();
            HideNotes();
            grddoc.PageIndex = 0;
        }

        protected void RepDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "catsearch")
            {
                ViewState["search"] = 21;
                LinkButton lnkelg = (LinkButton)e.Item.FindControl("lnkelg");
                divshow.Visible = true;
                lblcat.Text = lnkelg.Text;
                Label5.Visible = true;
                Label lbldoccatid = (Label)e.Item.FindControl("lbldoccatid");
                ViewState["catid"] = lbldoccatid.Text;
                bindgrdcatwise(Convert.ToInt32(lbldoccatid.Text));
            }
        }

        protected void lnkshowall_Click(object sender, EventArgs e)
        {
            divshow.Visible = false;
            bindgrd();


        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/vigilance/Posters of Vigilance Awareness Week 2019.docx");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "Posters for Vigilance Awareness Week - 2019.docx" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }

        protected void lnkcoronawarriors_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_CoronaWarriors.aspx", true);
        }
    }
}