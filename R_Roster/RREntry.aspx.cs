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

namespace PrasarNet.R_Roster
{
    public partial class RREntry : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../HomePage.aspx");
            }
            else if ((Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3))
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--",
                                                                                                                   new SqlParameter("@flag", 1));
                    gridbind();
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
                            }
                            else
                            {
                                divboradmeetingrecordsUpload.Visible = false;
                            }
                        }
                        StationSectionMenu.Visible = true;
                        //AdminMenu.Visible = false;
                        //AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["UserId"]) == 4)// Management
                    {
                        //if (Convert.ToInt16(Session["Usertype"]) == 27)
                        //{
                        //    StationSectionMenu.Visible = false;
                        //    AdminMenu.Visible = false;
                        //    AdminMenuIT.Visible = true;
                        //}
                        //else//14,15,16,18,19
                        //{
                        //    DataSet dspbb = new DataSet();
                        //    dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                        //                                                                  , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                        //    if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
                        //    {
                        //        divmeetingrecordadmin.Visible = true;
                        //    }
                        //    else
                        //    {
                        //        divmeetingrecordadmin.Visible = false;
                        //    }
                        //    StationSectionMenu.Visible = false;
                        //    AdminMenu.Visible = true;
                        //    AdminMenuIT.Visible = false;
                        //}
                    }
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Int32 createdbyid = 0;
            int zoneid = Convert.ToInt16(Session["zoneidLogin_A"]);
            string ip = cmm.GetIp_Priyank();
            try
            {
                if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                    || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                {
                    createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                }
                else
                {
                    createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                }
                if (btnsubmit.Text == "Submit")
                {
                    if (FileUpload1.HasFile)
                    {
                        int ret = uploaddoc();
                        if (ret == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                        }
                        else
                        {
                            int i = 0;
                            i = cmm.RunSP("PN18_ReservationRoster1", "PRASARNETConnectionString", new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                            new SqlParameter("@zoneid",zoneid),
                                                                                            new SqlParameter("@designationid", ddldesgn.SelectedValue),
                                                                                            new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                            new SqlParameter("@stationid", createdbyid),
                                                                                            new SqlParameter("@title", txttitle.Text.Trim()),
                                                                                            new SqlParameter("@doctitle", ViewState["LOfilename"].ToString()),
                                                                                            new SqlParameter("@createdbyid", createdbyid),
                                                                                            new SqlParameter("@createdbyusertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                            new SqlParameter("@last_op_IPAddress", ip),
                                                                                            new SqlParameter("@flag", 1));
                            if (i > 0)
                            {
                                gridbind();
                                clear();
                                grddoc.Focus();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully...');", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Attach a File..');", true);
                    }
                }
                else
                {
                    string filename = "";
                    int ret = 0;
                    if (FileUpload1.HasFile)
                    {
                        ret = uploaddoc();
                        filename = ViewState["LOfilename"].ToString();
                    }
                    else
                    {
                        filename = Session["docname"].ToString();
                        ret = 1;
                    }
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        int i = 0;
                        i = cmm.RunSP("PN18_ReservationRoster1", "PRASARNETConnectionString", new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                        new SqlParameter("@designationid", ddldesgn.SelectedValue),
                                                                                        new SqlParameter("@title", txttitle.Text.Trim()),
                                                                                        new SqlParameter("@doctitle", filename),
                                                                                        new SqlParameter("@updatedbyid", createdbyid),
                                                                                        new SqlParameter("@updatedbyusertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                        new SqlParameter("@last_op_IPAddress", ip),
                                                                                        new SqlParameter("@rrid", Convert.ToInt32(Session["rrid_Edit"])),
                                                                                        new SqlParameter("@flag", 6));
                        if (i > 0)
                        {
                            btnsubmit.Text = "Submit";
                            btncncl.Text = "Clear";
                            divView.Visible = true;
                            diventry.Visible = true;
                            gridbind();
                            clear();
                            grddoc.Focus();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully...');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        private void clear()
        {
            ddlwing.SelectedIndex = 0;
            ddldesgn.Items.Clear();
            ddldesgn.SelectedIndex = -1;
            ddldesgn.SelectedValue = null;
            txttitle.Text = "";
            FileUpload1.Attributes.Clear();
        }
        private int uploaddoc()
        {

            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                string max = "";

                max = cmm.SelectMaxId("select max(rrid)+1 from PN18_ReservationRoster", "PRASARNETConnectionString");
                if (max == "")
                {
                    max = "1";
                }

                if (filetype == ".pdf")
                {
                    string files = "";
                    FileUpload1.SaveAs(MapPath("~/R_Roster/RRDocuments/" + FileUpload1.FileName.ToString()));
                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        if ((lastline.IndexOf("%PDF") > -1))
                        {
                            path = Server.MapPath("~") + "\\R_Roster\\RRDocuments\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();
                            string savefile = "RR" + max + "_" + dtetm + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["LOfilename"] = savefile;
                            return 1;

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                            return 0;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                        return 0;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                    return 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Error Occured!!');", true);
                return 0;
            }
        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
            if (btnsubmit.Text == "Submit")
            {
                ddlwing.Focus();
            }
            else
            {
                btnsubmit.Text = "Submit";
                btncncl.Text = "Clear";
                divView.Visible = true;
                diventry.Visible = true;
                grddoc.Focus();
            }
        }
        private void gridbind()
        {
            int createdbyid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
            {
                createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
            }
            else
            {
                createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
            }
            ds = cmm.RunSpReturnDSParam("PN18_ReservationRoster1", "PRASARNETConnectionString",
                                                                  new SqlParameter("@stationid", createdbyid),
                                                                  new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                  new SqlParameter("@flag", "3"));

            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void btncloseDPCEntry_Click(object sender, EventArgs e)
        {

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx", true);
        }

        protected void ddlwing_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
            ddldesgn.Focus();
        }

        protected void btnprint_Click(object sender, EventArgs e)
        {

        }

        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "download")
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/R_Roster/RRDocuments/");
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int rrid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Label docname = row.FindControl("lbldocname") as Label;
                    Label lbltitle = row.FindControl("lbltitle") as Label;
                    string paths1 = urlfixedpath + docname.Text;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname.Text;
                        ViewState["pathLO"] = paths;
                        string str = docname.Text;
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (str != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + str.Substring(0,(str.Length-5)) + ".pdf");
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grddoc.Focus();
            }
            if (e.CommandName == "view")
            {
                try
                {
                    //string urlfixedpath = Server.MapPath("~/R_Roster/RRDocuments/");
                   // DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int rrid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Label docname = row.FindControl("lbldocname") as Label;
                    Session["RRLOPath"] = "RRDocuments/" + docname.Text;
                    Response.Redirect("~/R_Roster/RR_DocumentView.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grddoc.Focus();
            }
            if (e.CommandName == "Delete")
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    int createdbyid = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                        || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                    {
                        createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                    }
                    else
                    {
                        createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                    }
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int rrid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    int i = 0;
                    i = cmm.RunSP("PN18_ReservationRoster1", "PRASARNETConnectionString", new SqlParameter("@rrid", rrid),
                                                                                    new SqlParameter("@deletedbyid", createdbyid),
                                                                                    new SqlParameter("@deletedbyUsertyid", Convert.ToInt16(Session["Usertype"])),
                                                                                    new SqlParameter("@last_op_IPAddress", ip),
                                                                                    new SqlParameter("@flag", 4));
                    if (i > 0)
                    {
                        gridbind();
                        clear();
                        grddoc.Focus();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Deleted Successfully..');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured.Try Again!!');", true);
                }
                grddoc.Focus();
            }
            if (e.CommandName == "Editp")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int rrid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Session["rrid_Edit"] = rrid;
                    divView.Visible = false;
                    diventry.Visible = true;
                    btnsubmit.Text = "Update";
                    btncncl.Text = "Cancel";
                    ds1 = cmm.RunSpReturnDSParam("PN18_ReservationRoster1", "PRASARNETConnectionString",
                                                      new SqlParameter("@flag", "5"),
                                                      new SqlParameter("@rrid", rrid));
                    ddlwing.SelectedValue = ds1.Tables[0].Rows[0][1].ToString();
                    cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
                    ddldesgn.SelectedValue = ds1.Tables[0].Rows[0][2].ToString();
                    txttitle.Text = ds1.Tables[0].Rows[0][3].ToString();
                    Session["docname"] = ds1.Tables[0].Rows[0][4].ToString();

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured.Try Again!!');", true);
                }
                ddlwing.Focus();
            }
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grddoc_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grddoc_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void grddoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grddoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grddoc.AllowPaging = false;

                gridbind();
                grddoc.Columns[4].Visible = false;
                grddoc.Columns[5].Visible = false;
                grddoc.Columns[6].Visible = false;
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
                grddoc.Columns[4].Visible = true;
                grddoc.Columns[5].Visible = true;
                grddoc.Columns[6].Visible = true;

            }
            catch (Exception ex)
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