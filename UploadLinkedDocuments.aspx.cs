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
    public partial class UploadLinkedDocuments : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
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
                    else if (Convert.ToInt16(Session["UserId"]) == 4)// Management// Management
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
                            if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
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
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
                    {
                        cmm.bindDDLWidParam(ddlmaindoc, "PN18_documentsupload", "Doc_Title", "Docid", "PRASARNETConnectionString", "-- Select --",
                                                                                             new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                             new SqlParameter("@flag", "2"),
                                                                                             new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])));
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26) //Section
                    {
                        cmm.bindDDLWidParam(ddlmaindoc, "PN18_documentsupload", "Doc_Title", "Docid", "PRASARNETConnectionString", "-- Select --",
                                                                                            new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                            new SqlParameter("@flag", "2"),
                                                                                            new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
                    }
                    else
                    {
                        cmm.bindDDLWidParam(ddlmaindoc, "PN18_documentsupload", "Doc_Title", "Docid", "PRASARNETConnectionString", "-- Select --",
                                                                                             new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                             new SqlParameter("@flag", "2"));
                    }

                    gridbind();
                    //grddoc.Focus();
                    //grddoc.PageIndex = 0;
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
            {
                ds = cmm.RunSpReturnDSParam("PN18_linked_document", "PRASARNETConnectionString",
                                                                  new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                  new SqlParameter("@flag", "1"),
                                                                  new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26) //Section
            {
                ds = cmm.RunSpReturnDSParam("PN18_linked_document", "PRASARNETConnectionString",
                                                                new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                new SqlParameter("@flag", "1"),
                                                                new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_linked_document", "PRASARNETConnectionString",
                                                                new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                new SqlParameter("@flag", "1"));
            }
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {// added on 31-Oct-2018
            if (FileUpload1.HasFile)
            {
                try
                {
                    //DataSet dscount = new DataSet();
                    //SqlDataAdapter da = new SqlDataAdapter();
                    //string constring = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                    //SqlConnection con = new SqlConnection(constring);
                    //con.Open();
                    //SqlCommand cmd = new SqlCommand("PN18_linked_document", con);
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.Add("@filename", SqlDbType.NVarChar);
                    //cmd.Parameters["@filename"].Value = Convert.ToString(FileUpload1.FileName);
                    //if (btnupload.Text == "Upload")// uploading a fresh document
                    //{
                    //    cmd.Parameters.Add("@flag", SqlDbType.Int);
                    //    cmd.Parameters["@flag"].Value = 3;
                    //}
                    //else//Update
                    //{
                    //    cmd.Parameters.Add("@flag", SqlDbType.Int);
                    //    cmd.Parameters["@flag"].Value = 7;
                    //    cmd.Parameters.Add("@ldocid", SqlDbType.Int);   //linkeddocid 
                    //    cmd.Parameters["@ldocid"].Value = Convert.ToInt64(ViewState["LDocid"]);
                    //}
                    //Int32 duplicatecount = (Int32)cmd.ExecuteScalar();
                    //con.Close();



                    //    if (duplicatecount == 0)
                    //{
                    string path = "";
                    string filetype = "";

                    filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                    filetype = filetype.ToLower();

                    if (filetype == ".pdf")// only pdf and html file are allowed to upload
                    {
                        int d;
                        if (btnupload.Text == "Upload")
                        {
                            string path11 = Server.MapPath("~/LinkedDocuments/" + (FileUpload1.FileName).ToString());
                            FileInfo file11 = new FileInfo(path11);
                            if (file11.Exists)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('FileName already exists!!');", true);
                            }
                            else
                            {
                                d = cmm.RunSP("PN18_linked_document", "PRASARNETConnectionString", new SqlParameter("@maindocid", Convert.ToInt64(ddlmaindoc.SelectedValue)),
                                                         new SqlParameter("@title", txttitle.Text.Trim()),
                                                         new SqlParameter("@filename", Convert.ToString(FileUpload1.FileName)),
                                                         new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                         new SqlParameter("@flag", "2"));

                                if (d > 0)
                                {
                                    string savefile = Convert.ToString(FileUpload1.FileName);
                                    FileUpload1.SaveAs(Server.MapPath("~/LinkedDocuments/" + savefile.ToString()));
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                    txttitle.Text = "";
                                    ddlmaindoc.SelectedIndex = 0;
                                    if (FileUpload1.HasFile)
                                        FileUpload1.Attributes.Clear();
                                    gridbind();
                                    grddoc.Focus();
                                    grddoc.PageIndex = 0;
                                }
                                else
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                            }
                        }
                        else
                        {

                            //Deleting the previously uploaded File in Repository.
                            DataSet ds3 = new DataSet();
                            ds3 = cmm.RunSpReturnDSParam("PN18_linked_document", "PRASARNETConnectionString",
                                                     new SqlParameter("@ldocid", Convert.ToInt64(ViewState["LDocid"])),
                                                     new SqlParameter("@flag", "5"));
                            string savefile1 = ds3.Tables[0].Rows[0][2].ToString();
                            string path1 = Server.MapPath("~/LinkedDocuments/" + savefile1.ToString());
                            FileInfo file = new FileInfo(path1);
                            if (file.Exists)
                            {
                                file.Delete();
                            }
                            string path12 = Server.MapPath("~/LinkedDocuments/" + (FileUpload1.FileName).ToString());
                            FileInfo file12 = new FileInfo(path12);
                            if (file12.Exists)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('FileName already exists!!');", true);
                            }
                            else
                            {

                                d = cmm.RunSP("PN18_linked_document", "PRASARNETConnectionString",
                                                     new SqlParameter("@maindocid", Convert.ToInt64(ddlmaindoc.SelectedValue)),
                                                     new SqlParameter("@title", txttitle.Text.Trim()),
                                                     new SqlParameter("@filename", Convert.ToString(FileUpload1.FileName)),
                                                     new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                     new SqlParameter("@flag", "6"),
                                                     new SqlParameter("@ldocid", Convert.ToInt64(ViewState["LDocid"])));
                                if (d > 0)
                                {
                                    // Upload a New File in Repository.
                                    string savefile = Convert.ToString(FileUpload1.FileName);
                                    FileUpload1.SaveAs(Server.MapPath("~/LinkedDocuments/" + savefile.ToString()));
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                                    btnupload.Text = "Upload";
                                    divgrd.Visible = true;
                                    txttitle.Text = "";
                                    ddlmaindoc.SelectedIndex = 0;
                                    if (FileUpload1.HasFile)
                                        FileUpload1.Attributes.Clear();
                                    gridbind();
                                    grddoc.Focus();
                                    grddoc.PageIndex = 0;
                                }
                                else
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Document in .pdf format !!!! Try Again!!');", true);
                    }
                   
                }




                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(" + ex.Message + ");", true);
                    //Label13.Text = ex.Message;
                }
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Attach a file !!');", true);
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txttitle.Text = "";
            ddlmaindoc.SelectedIndex = 0;
            if (FileUpload1.HasFile)
                FileUpload1.Attributes.Clear();
            divgrd.Visible = true;
            gridbind();
            if(btnupload.Text == "Update")
            {
                btnupload.Text = "Upload";
                btncncl.Text = "Clear";
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DocumentUpload.aspx", true);
            txttitle.Text = "";
            ddlmaindoc.SelectedIndex = 0;
            if (FileUpload1.HasFile)
                FileUpload1.Attributes.Clear();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grddoc.AllowPaging = false;
                grddoc.Columns[4].Visible = false;
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
                grddoc.Columns[4].Visible = true;
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

        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                //DataSet dsurl = new DataSet();
                //dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                //                                                                       , new SqlParameter("@flag", 1));
                //string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int Ldocid = (int)grddoc.DataKeys[row.RowIndex].Value;
                ds = cmm.RunSQLReturnDS("Select [FileName] from PN18_LinkedDoc where Ldocid=" + Ldocid, "PRASARNETConnectionString");
                string docname = Convert.ToString(ds.Tables[0].Rows[0][0]);
                string path = Server.MapPath("~/LinkedDocuments/" + docname);
                //string path = urlfixedpath + "/" + docname;
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    file.Delete();
                    i = cmm.RunSP("PN18_linked_document", "PRASARNETConnectionString",
                                                  new SqlParameter("@flag", "4"),
                                                  new SqlParameter("@ldocid", Ldocid));

                    if (i > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                        gridbind();
                        txttitle.Text = "";
                        ddlmaindoc.SelectedIndex = 0;
                        if (FileUpload1.HasFile)
                            FileUpload1.Attributes.Clear();
                        gridbind();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                else
                {
                    i = cmm.RunSP("PN18_linked_document", "PRASARNETConnectionString",
                                                 new SqlParameter("@flag", "4"),
                                                 new SqlParameter("@ldocid", Ldocid));

                    if (i > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                        gridbind();
                        txttitle.Text = "";
                        ddlmaindoc.SelectedIndex = 0;
                        if (FileUpload1.HasFile)
                            FileUpload1.Attributes.Clear();
                        gridbind();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }

            }
            if (e.CommandName == "Edit")
            {
                divgrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int LDocid = (int)grddoc.DataKeys[row.RowIndex].Value;
                ViewState["LDocid"] = LDocid;
                ds1 = cmm.RunSpReturnDSParam("PN18_linked_document", "PRASARNETConnectionString",
                                                  new SqlParameter("@flag", "5"),
                                                  new SqlParameter("@ldocid", LDocid));
                ddlmaindoc.SelectedValue = ds1.Tables[0].Rows[0][3].ToString();
                txttitle.Text = ds1.Tables[0].Rows[0][1].ToString();
                btnupload.Text = "Update";
                btncncl.Text = "Cancel";
                ddlmaindoc.Focus();
            }
            if (e.CommandName == "Download")
            {
                //DataSet dsurl = new DataSet();
                //dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                //                                                                       , new SqlParameter("@flag", 1));
                //string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Int64 LDocid = (int)grddoc.DataKeys[row.RowIndex].Value;
                ds = cmm.RunSQLReturnDS("Select [FileName] from PN18_LinkedDoc where Ldocid=" + LDocid, "PRASARNETConnectionString");
                string docname = Convert.ToString(ds.Tables[0].Rows[0][0]);
                //string path = urlfixedpath + "/" + docname;
                string path = Server.MapPath("~/LinkedDocuments/" + docname);
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    string str = docname;
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        //Response.Redirect(paths);
                        if (docname != "")
                        {
                            Response.Clear();
                            Response.ContentType = "application/octet-stream";
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + (docname.Replace(' ', 'o')).Replace(' ', 'o'));
                            Response.WriteFile(path);
                            Response.End();
                            //Response.Write("<script>");
                            //Response.Write("window.open('" + paths + "','_blank')");
                            //Response.Write("</script>");
                        }
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                    else
                    {
                        Session["dash/order"] = 2;
                        Response.Write("<script>window.open ('showDocument.aspx','_blank');</script>");

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
            }
        }



        protected void grddoc_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grddoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
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