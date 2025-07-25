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
    public partial class DocumentUpload : System.Web.UI.Page
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
                    cmm.bindDDLWidParam(ddldoctype, "PN18_DocTypen", "Doc_Type", "Docid", "PRASARNETConnectionString", "-- DocType --", new SqlParameter("@flag", 1));
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

            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
            {
                ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                              new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                              new SqlParameter("@flag", "2"),
                                                              new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26) //Section
            {
                ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                                new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                new SqlParameter("@flag", "2"),
                                                                new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                                new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                new SqlParameter("@flag", "2"));
            }
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        private void clear()
        {
            ddldoctype.SelectedIndex = 0;
            txttitle.Text = "";
            txtdatedoc.Text = "";
            txtordernum.Text = "";
            txtfilenum.Text = "";
            FileUpload1.Attributes.Clear();
        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
            divgrd.Visible = true;
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    lblexception.Text = "";
                    DataSet dsurl = new DataSet();
                    dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                           , new SqlParameter("@flag", 1));
                    string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                    filetype = filetype.ToLower();
                    //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                    string max;
                    if (btnupload.Text == "Upload")
                    {
                        max = cmm.SelectMaxId("select max(Docid)+1 from PN18_Documents", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                    }
                    else
                    {
                        DataSet ds2 = new DataSet();
                        max = Convert.ToString(Session["Docid"]);
                        ds = cmm.RunSQLReturnDS("Select Doc_Name,Doc_Typeid from PN18_Documents where Docid=" + Convert.ToInt64(Session["Docid"]), "PRASARNETConnectionString");
                        string docname1 = Convert.ToString(ds.Tables[0].Rows[0][0]);
                        int doctypid = Convert.ToInt32(ds.Tables[0].Rows[0][1]);
                        ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", doctypid),
                                                                                           new SqlParameter("@flag", 2));
                        //string path1 = Server.MapPath("~/airnet_folder/" + ds2.Tables[0].Rows[0][5].ToString() + "/" + docname1);
                        string path1 = urlfixedpath + "/" + ds2.Tables[0].Rows[0][5].ToString() + "/" + docname1;
                        // change the method server.mappath to path on 01-06-2018 as per the requiremnet of ADG(IT)
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)// on uploading the previous file in a repository should be deleted 
                        {
                            //file.Delete();
                        }
                    }
                    //string img = cmm.ReturnValue(str);
                    if (filetype == ".pdf")// only pdf and html file are allowed to upload
                    {
                        //string files = "";// commenetd on 01-06-2018
                        DataSet ds2 = new DataSet();
                        ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", ddldoctype.SelectedValue),
                                                                                        new SqlParameter("@flag", 2));
                        string subfoldername = ds2.Tables[0].Rows[0][5].ToString();

                        //FileUpload1.SaveAs(MapPath("~/UploadedDocuments/" + subfoldername+"/" + FileUpload1.FileName.ToString()));// commented on 01-06-2018 as per the instruction of ADG(IT)

                        //files = FileUpload1.FileName.ToString(); // commented on 01-06-2018
                        //path = Server.MapPath("~") + "\\UploadedDocuments\\" +subfoldername+"\\"; // commented on 01-06-2018
                        //string Fromfile = path + files;// commented on 01-06-2018
                        string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                        string savefile = "Doc" + max + "_" + dtetm + filetype;
                        //string target = "\\\\192.168.1.2/f$/www/LocalUser/AirNet/UploadedDocuments/" + subfoldername + "/" + savefile.ToString();
                        string target = urlfixedpath + subfoldername + "/" + savefile.ToString();//Added on 08-10-2018 due to shifting PN and Airnrtnew server
                        string sourcefile = Server.MapPath("~/UploadedDocuments/" + subfoldername + "/" + savefile.ToString());



                        int d;
                        if (btnupload.Text == "Upload")
                        {
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station
                            {
                                d = cmm.RunSP("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"])),
                                                         new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                         new SqlParameter("@doctypeid", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                         new SqlParameter("@doctitle", txttitle.Text.Trim()),
                                new SqlParameter("@docdated", DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                         new SqlParameter("@orderNo", txtordernum.Text.Trim()),
                                                         new SqlParameter("@fileNo", txtfilenum.Text.Trim()),
                                                         new SqlParameter("@docname", savefile),
                                                         new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                         new SqlParameter("@flag", "1"),
                                                         new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])));
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                d = cmm.RunSP("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"])),
                                                         new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                         new SqlParameter("@doctypeid", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                         new SqlParameter("@doctitle", txttitle.Text.Trim()),
                                                         new SqlParameter("@docdated", DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                         new SqlParameter("@orderNo", txtordernum.Text.Trim()),
                                                         new SqlParameter("@fileNo", txtfilenum.Text.Trim()),
                                                         new SqlParameter("@docname", savefile),
                                                         new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                         new SqlParameter("@flag", "1"),
                                                         new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
                            }
                            else
                            {
                                d = cmm.RunSP("PN18_documentsupload", "PRASARNETConnectionString", new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"])),
                                                                                         new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                         new SqlParameter("@doctypeid", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                                                         new SqlParameter("@doctitle", txttitle.Text.Trim()),
                                                                                         new SqlParameter("@docdated", DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                                                         new SqlParameter("@orderNo", txtordernum.Text.Trim()),
                                                                                         new SqlParameter("@fileNo", txtfilenum.Text.Trim()),
                                                                                         new SqlParameter("@docname", savefile),
                                                                                         new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                         new SqlParameter("@flag", "1"));
                            }
                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                FileUpload1.SaveAs(Server.MapPath("~/UploadedDocuments/" + subfoldername + "/" + savefile.ToString()));// Added on 01-06-2018 as per the instruction of ADG(IT)
                                File.Move(sourcefile, target);
                                clear();
                                gridbind();
                                grddoc.Focus();
                                grddoc.PageIndex = 0;
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                        }
                        else
                        {
                            d = cmm.RunSP("PN18_documentsupload", "PRASARNETConnectionString",
                                                     new SqlParameter("@doctypeid", Convert.ToInt32(ddldoctype.SelectedValue)),
                                                     new SqlParameter("@doctitle", txttitle.Text.Trim()),
                                                     new SqlParameter("@docdated", DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                     new SqlParameter("@orderNo", txtordernum.Text.Trim()),
                                                     new SqlParameter("@fileNo", txtfilenum.Text.Trim()),
                                                     new SqlParameter("@docname", savefile),
                                                     new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                     new SqlParameter("@flag", "5"),
                                                     new SqlParameter("@docid", Convert.ToInt64(Session["Docid"])));
                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information updated successfully');", true);
                                FileUpload1.SaveAs(Server.MapPath("~/UploadedDocuments/" + subfoldername + "/" + savefile.ToString()));// Added on 01-06-2018 as per the instruction of ADG(IT)
                                File.Move(sourcefile, target);
                                clear();
                                btnupload.Text = "Upload";
                                divgrd.Visible = true;
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
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, PDF documents are allowed to upload!!');", true);
                        gridbind();
                    }


                }
                catch (Exception ex)
                {
                    lblexception.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    lblexception.Text = ex.Message;
                }
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pls. Attach a file!!');", true);

        }
        private int fileaccesslog(Int64 Docid, string Pageadd, string ip, string v_down, Boolean issuccessful, int stn_sec_emp)
        {
            int i = cmm.RunSP("order_circular_fileaccessLog", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                                         , new SqlParameter("@stn_secid", Convert.ToInt32(Convert.ToInt32(Session["Station_SectionID"])))
                                                                                                         , new SqlParameter("@orderid", Docid)
                                                                                                         , new SqlParameter("@page", Pageadd)
                                                                                                         , new SqlParameter("@ip", ip)
                                                                                                         , new SqlParameter("@download_view", v_down)
                                                                                                         , new SqlParameter("@issuccessful", issuccessful)
                                                                                                         , new SqlParameter("@flag", 1));
            return i;
        }
        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DataSet dsurl = new DataSet();
                dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                       , new SqlParameter("@flag", 1));
                string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int Docid = (int)grddoc.DataKeys[row.RowIndex].Value;

                DataSet dscount = new DataSet();
                string constring = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                SqlCommand cmd = new SqlCommand("PN18_linked_document", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@maindocid", SqlDbType.NVarChar);
                cmd.Parameters["@maindocid"].Value = Docid;
                cmd.Parameters.Add("@flag", SqlDbType.Int);
                cmd.Parameters["@flag"].Value = 8;
                Int32 duplicatecount = (Int32)cmd.ExecuteScalar();
                con.Close();
                if (duplicatecount == 0)
                {
                    ds = cmm.RunSQLReturnDS("Select Doc_Name,Doc_Typeid from PN18_Documents where Docid=" + Docid, "PRASARNETConnectionString");
                    string docname = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    int doctypid = Convert.ToInt32(ds.Tables[0].Rows[0][1]);
                    DataSet ds2 = new DataSet();
                    ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", doctypid),
                                                                                              new SqlParameter("@flag", 2));
                    string path = urlfixedpath + "/" + ds2.Tables[0].Rows[0][5].ToString() + "/" + docname;
                    FileInfo file = new FileInfo(path);
                    if (file.Exists)
                    {

                        i = cmm.RunSP("PN18_documentsupload", "PRASARNETConnectionString",
                                                      new SqlParameter("@flag", "3"),
                                                      new SqlParameter("@docid", Docid));
                    }
                    if (i > 0)
                    {
                        file.Delete();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                        gridbind();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Document(s) are Linked With the Selected Document. First, Delete them to process the current request!!');", true);
                }


            }
            if (e.CommandName == "Edit")
            {
                divgrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                Session["Docid"] = Docid;
                ds1 = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "4"),
                                                   new SqlParameter("@docid", Docid));
                ddldoctype.SelectedValue = ds1.Tables[0].Rows[0][4].ToString();
                txttitle.Text = ds1.Tables[0].Rows[0][5].ToString();

                txtdatedoc.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][8].ToString()).Date.ToString("dd-MM-yyyy");

                //Convert.ToDateTime(ds1.Tables[0].Rows[0][8].ToString()).ToShortDateString().ToString();

                txtordernum.Text = ds1.Tables[0].Rows[0][6].ToString();
                txtfilenum.Text = ds1.Tables[0].Rows[0][7].ToString();
                btnupload.Text = "Update";
                ddldoctype.Focus();

            }
            if (e.CommandName == "Download")
            {
                //try
                //{
                int stn_sec_emp = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 10)
                {
                    stn_sec_emp = Convert.ToInt32(Session["empid"]);
                }
                else
                {
                    stn_sec_emp = Convert.ToInt32(Convert.ToInt32(Session["Station_SectionID"]));
                }
                string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                string ip = cmm.GetIp_Priyank();
                DataSet dsurl = new DataSet();
                dsurl = cmm.RunSpReturnDSParam("PN18_URL_get", "PRASARNETConnectionString", new SqlParameter("@typeURL", 1)
                                                                                       , new SqlParameter("@flag", 1));
                string urlfixedpath = dsurl.Tables[0].Rows[0][1].ToString();
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_documentsupload", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "4"),
                                                   new SqlParameter("@docid", Docid));

                string docname = Convert.ToString(ds1.Tables[0].Rows[0][9]);
                int doctypid = Convert.ToInt32(ds1.Tables[0].Rows[0][4]);
                DataSet ds2 = new DataSet();

                ds2 = cmm.RunSpReturnDSParam("PN18_DocTypen", "PRASARNETConnectionString", new SqlParameter("@docid", doctypid),
                                                                                          new SqlParameter("@flag", 2));
                string paths1 = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + docname;
                FileInfo file = new FileInfo(paths1);
                if (file.Exists)
                {
                    //if (ds2.Tables[0].Rows.Count != 0)
                    //{
                    string paths = urlfixedpath + ds2.Tables[0].Rows[0][5].ToString() + "/" + docname;
                    Session["showDocFilePath"] = paths;
                    //Response.Redirect(paths);
                    string str = ds1.Tables[0].Rows[0][9].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        //Response.Redirect(paths);
                        if (ds1.Tables[0].Rows[0][9].ToString() != "")
                        {

                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", true, stn_sec_emp);
                            Response.Clear();
                            Response.ContentType = "application/octet-stream";
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][9].ToString());
                            Response.WriteFile(paths);
                            Response.End();
                            //Response.Write("<script>");
                            //Response.Write("window.open('" + paths + "','_blank')");
                            //Response.Write("</script>");
                        }
                        else
                        {
                            int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }
                    }
                    else
                    {
                        Session["dash/order"] = 2;
                        int ret = fileaccesslog(Docid, Pageadd, ip, "View HTML Doc", true, stn_sec_emp);
                        Response.Write("<script>window.open ('showDocument.aspx','_blank');</script>");

                    }
                }
                else
                {
                    int ret = fileaccesslog(Docid, Pageadd, ip, "Download", false, stn_sec_emp);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
                //}
                //catch (Exception ex)
                //{
                //    string Pageadd = HttpContext.Current.Request.Url.AbsolutePath;
                //    string ip = cmm.GetIp_Priyank();
                //    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                //    Int64 Docid = (int)grddoc.DataKeys[row.RowIndex].Value;
                //    int ret = fileaccesslog(Docid, Pageadd, ip, "Download_Exception", false);
                //    lblexception.Focus();
                //    lblexception.Visible = true;
                //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                //    lblexception.Text = "Try Again!!";
                //}
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

        protected void btnprint_Click(object sender, EventArgs e)
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

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Div11.Visible = false;
            Div12.Visible = true;
        }

        protected void lnkclosesearch_Click(object sender, EventArgs e)
        {
            Div11.Visible = true;
            Div12.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
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
            string path11 = Server.MapPath("~/LinkedDocuments/" + txtfilenamesearch.Text + ".pdf");
            FileInfo file11 = new FileInfo(path11);
            if (file11.Exists)
            {
                Label27.Text = "FileName already exists!!";
            }
            else
            {
                Label27.Text = "you are allowed to use this FileName..";
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

