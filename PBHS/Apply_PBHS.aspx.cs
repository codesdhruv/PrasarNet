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
using System.Collections.Generic;
using System.Text;
using PrasarNet.BLL;
using System.Drawing;

namespace PrasarNet.PBHS
{
    public partial class Apply_PBHS : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                if (!IsPostBack)
                {
                    ds = cmm.RunSpReturnDSParam("PN22_PBHS_Allow_EmpPBHS", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                                        new SqlParameter("@flag", 1));
                    if (ds.Tables[0].Rows.Count != 0)
                    {

                        if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) == 1)
                        {
                            DataSet dsblock = new DataSet();
                            dsblock = cmm.RunSpReturnDSParam("PN22_PBHS_Blockuser_new", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                                        new SqlParameter("@flag", 1));
                            int count = Convert.ToInt16(dsblock.Tables[0].Rows[0][0]);
                            if (count == 1 || count==3 || count==2)// No row found- add family
                            {
                                Label1.Text = Convert.ToString(Session["UserName"]);
                                if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                                {
                                    empmenu.Visible = true;
                                    StationSectionMenu.Visible = false;
                                    AdminMenu.Visible = false;
                                }
                                else
                                {
                                    empmenu.Visible = false;
                                    StationSectionMenu.Visible = false;
                                    AdminMenu.Visible = false;
                                }

                                if (count == 2) // renew card
                                {
                                    ddlrenew.Items.FindByValue("2").Selected = true;
                                    ddlrenew.SelectedIndex = 1;
                                    divrenew2.Visible = true;
                                    ddlrenew.Enabled = false;

                                }
                                else if (count == 3) // add family members only
                                {
                                    ddlrenew.SelectedIndex = 2;
                                    ddlrenew.Enabled = false;
                                    lblmsg_family.Text = "Include only new Members of the family";
                                }
                                else if (count == 1) // no data found
                                {
                                    ddlrenew.SelectedIndex = 0;
                                    ddlrenew.Enabled = false;

                                }
                                else
                                {
                                    ddlrenew.Enabled = true;
                                }
                                cmm.bindDDLWidParam(ddlpaymatrix, "PN22_PBHS_SelectPayBand", "Pay", "PayGradeID", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                divlblMsg.Visible = true;
                                bindbasicinfo();
                                bindgrid_Training();
                                bindgrid_Upload();
                            }
                            //else if (count == 2)// Record found for activ
                            //{
                            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your PBHS Card has already been issued and Not Expired Yet.'); window.open('DashBoard_PBHS.aspx','_self');", true);
                            //}
                            else// Record found for activ
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your request for the creation of PBHS Card is already in Process.'); window.open('DashBoard_PBHS.aspx','_self');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Only Employee, who joined On and After 2007 are allowed to avail the PBHS facility..'); window.open('../DashBoardNew.aspx','_self');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Only Employee, who joined On and After 2007 are allowed to avail the PBHS facility..'); window.open('../DashBoardNew.aspx','_self');", true);
                    }
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }

        private void bindgrid_Upload()
        {
            DataSet dsupload = cmm.RunSpReturnDSParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 1));
            if (dsupload.Tables[0].Rows.Count > 0)
            {
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
            }
            else
            {
                dsupload.Tables[0].Rows.Add(dsupload.Tables[0].NewRow());
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
                int columncount = grdupload.Rows[0].Cells.Count;
                grdupload.Rows[0].Cells.Clear();
                grdupload.Rows[0].Cells.Add(new TableCell());
                grdupload.Rows[0].Cells[0].ColumnSpan = columncount;
                grdupload.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<string> SearchbyName_empcode(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            ds = cmm.RunSpReturnDSParam("PN21_Trans_SearchByName_EmpCode", "PRASARNETConnectionString", new SqlParameter("@prefixtext", prefixText),
                                                                                                        new SqlParameter("@EmployeeId", Convert.ToInt32(HttpContext.Current.Session["empid"])),
                                                                                                        new SqlParameter("@flag", 4));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string str = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString());
                Output.Add(str);
            }
            return Output;

        }

        private void bindgrid_Training()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 1));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
                int columncount = grdhealth.Rows[0].Cells.Count;
                grdhealth.Rows[0].Cells.Clear();
                grdhealth.Rows[0].Cells.Add(new TableCell());
                grdhealth.Rows[0].Cells[0].ColumnSpan = columncount;
                grdhealth.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindbasicinfo()
        {
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                            new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
            lblname_bas.Text = ds.Tables[0].Rows[0][2].ToString();
            lbldeptt_bas.Text = ds.Tables[0].Rows[0][7].ToString();
            lbldesgn_bas.Text = ds.Tables[0].Rows[0][4].ToString();
            lblcontact_bas.Text = ds.Tables[0].Rows[0][5].ToString();
            lblemail_bas.Text = ds.Tables[0].Rows[0][6].ToString();
            lblposting_bas.Text = ds.Tables[0].Rows[0][7].ToString();
            lbldate_superannu_bas.Text = ds.Tables[0].Rows[0][9].ToString();
            lblappforwarded.Text = ds.Tables[0].Rows[0][12].ToString();
            ViewState["HoonameID"]= ds.Tables[0].Rows[0][13].ToString();
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/DashBoard_PBHS.aspx");
        }
        private int uploaddocpdf(FileUpload FileUpload1, string foldername, Label Label130)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".pdf")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        //if ((lastline.IndexOf("%PDF") > -1))
                        //{
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 363520)//355kB
                        {
                            Label130.Text = "Maximum file size(350kbB) exceeded..";
                            bindgrid_Training();
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/Transfer_M/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "Transfer_M\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "Doc_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["filename"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        Label130.Text = "Only,pdf file are allowed to upload!!";
                        bindgrid_Training();
                        return 0;
                    }

                }
                else
                {
                    Label130.Text = "Only,pdf file are allowed to upload!!";
                    bindgrid_Training();
                    return 0;
                }
            }
            catch (Exception ex)
            {
                Label130.Text = "Error Occured while Uploading a Document!!";
                bindgrid_Training();
                return 0;

            }
        }
        protected void grdhealth_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //
            if (e.CommandName.Equals("downloadresiding"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                 new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][1].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][1].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgrid_Training();
                                Label59.Text = "There is no document to download!!";
                            }
                            grdhealth.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgrid_Training();
                        Label59.Text = "There is no document to download!!";
                        grdhealth.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgrid_Training();
                    Label59.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdhealth.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    TextBox txthcNamefooter = (TextBox)grdhealth.FooterRow.FindControl("txthcNamefooter");
                    DropDownList ddlrelation = (DropDownList)grdhealth.FooterRow.FindControl("ddlrelation");
                    TextBox txtdob_footer = (TextBox)grdhealth.FooterRow.FindControl("txtdob_footer");
                    TextBox txthcBloodFooter = (TextBox)grdhealth.FooterRow.FindControl("txthcBloodFooter");
                    TextBox txtoccupationFooter = (TextBox)grdhealth.FooterRow.FindControl("txtoccupationFooter");

                    // DropDownList ddlresiding = (DropDownList)grdhealth.FooterRow.FindControl("ddlresiding");
                    FileUpload fileupload_Residing = (FileUpload)grdhealth.FooterRow.FindControl("fileupload_Residing");
                    FileUpload fileUpload2 = (FileUpload)grdhealth.FooterRow.FindControl("fileUpload2");
                    int count;
                    count = cmm.RunSPReturnCountParam("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                                           , new SqlParameter("@flag", 6)
                                                                                           , new SqlParameter("@NameofMember", txthcNamefooter.Text.Trim())
                                                                                           
                                                                                           , new SqlParameter("@relationshipid", Convert.ToInt16(ddlrelation.SelectedValue))
                                                                                           , new SqlParameter("@DOB", DateTime.ParseExact(txtdob_footer.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)));
                    if (count == 0)
                    {
                        if (fileUpload2.HasFile)
                        {

                            //if ((fileupload_Residing.HasFile && ddlresiding.SelectedValue == "1") || (ddlresiding.SelectedValue == "0"))
                            if (fileupload_Residing.HasFile)
                            {
                                int retphoto = uploadPhoto(fileUpload2, "Photo");
                                if (retphoto == 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a Photo.Only, JPEG/JPG upto 50kb are allowed!!');", true);
                                }
                                else
                                {
                                    int ret = 0;
                                    //if (fileupload_Residing.HasFile)
                                    //{
                                    ViewState["upload"] = "T";
                                    ret = uploaddoc(fileupload_Residing, "Documents", Label59);
                                    //}
                                    //else
                                    //{
                                    //    ret = 1;
                                    //    ViewState["File_Residing"] = "none";
                                    //}
                                    if (ret == 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Only, pdf upto 350kb are allowed!!');", true);
                                    }
                                    else
                                    {
                                        //Boolean residing = false;
                                        //if (ddlresiding.SelectedValue == "1")
                                        //    residing = true;
                                        int i = cmm.RunSP("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@DOB", DateTime.ParseExact(txtdob_footer.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                                               // , new SqlParameter("@residingwithApplicant", residing)
                                                                                                               , new SqlParameter("@File_Residing", ViewState["File_Residing"].ToString())
                                                                                                               , new SqlParameter("@photo_Filename", ViewState["Photo"].ToString())
                                                                                                               , new SqlParameter("@NameofMember", txthcNamefooter.Text.Trim())
                                                                                                               , new SqlParameter("@RelationShip", ddlrelation.SelectedItem.Text)
                                                                                                               , new SqlParameter("@occupation", txtoccupationFooter.Text.Trim())
                                                                                                               , new SqlParameter("@RelationshipID", Convert.ToInt16(ddlrelation.SelectedValue))
                                                                                                               , new SqlParameter("@BloodGrp", txthcBloodFooter.Text.Trim())
                                                                                                               , new SqlParameter("@LastOpIP", ip)
                                                                                                               , new SqlParameter("@createdby", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@flag", 2));

                                        if (i > 0)
                                        {
                                            bindgrid_Training();
                                            Label59.ForeColor = System.Drawing.Color.Green;
                                            Label59.Text = "Added Successfully..";
                                            grdhealth.Focus();
                                        }
                                        else
                                        {
                                            bindgrid_Training();
                                            Label59.ForeColor = System.Drawing.Color.Red;
                                            Label59.Text = "Error Occured.Try Again!!";
                                            bindgrid_Training();
                                            grdhealth.Focus();

                                        }

                                    }
                                }

                            }
                            else
                            {
                                bindgrid_Training();
                                Label59.Text = "Upload File can't be left blank!!";
                                // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Upload File can't be left blank!!');", true);
                            }

                        }
                        else
                        {
                            Label59.ForeColor = System.Drawing.Color.Red;
                            Label59.Text = "Upload a Photo is Mandatory!!";
                            bindgrid_Training();
                        }
                    }
                    else
                    {
                        Label59.Text = "Duplicate Entry Not Allowed..";
                        bindgrid_Training();
                        grdhealth.Focus();
                    }
                }
                catch (Exception ex)
                {
                    Label59.Text = "Error Occured.Try Again!!";
                    bindgrid_Training();
                    grdhealth.Focus();
                }
            }
        }
        private int uploadPhoto(FileUpload FileUpload1, string foldername)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".jpeg" || filetype == ".jpg")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if ((FileUpload1.PostedFile.ContentType.ToString() == "image/jpg") || (FileUpload1.PostedFile.ContentType.ToString() == "image/jpeg"))
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();

                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 51200)//355kB
                        {
                            Label59.Text = "Maximum allowed Photo size(50kB) exceeded..";
                            bindgrid_Training();
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/PBHS/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "PBHS\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "PBHS_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["Photo"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        Label59.Text = "Only,JPEG/JPG file are allowed to upload!!";
                        bindgrid_Training();
                        return 0;
                    }

                }
                else
                {
                    Label59.Text = "Only,JPEG/JPG file are allowed to upload!!";
                    bindgrid_Training();
                    return 0;
                }
            }
            catch (Exception ex)
            {
                Label59.Text = "Error Occured while Uploading a Photo!!";
                bindgrid_Training();
                return 0;
            }
        }
        private int uploaddoc(FileUpload FileUpload1, string foldername, Label lblmsg)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".pdf")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        //if ((lastline.IndexOf("%PDF") > -1))
                        //{
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 363520)//355kB
                        {
                            lblmsg.Text = "Maximum file size(350kbB) exceeded..";
                            if (ViewState["upload"].ToString() == "T")
                                bindgrid_Training();
                            else
                                bindgrid_Upload();
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/PBHS/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "PBHS\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "PBHS_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["File_Residing"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        lblmsg.Text = "Only,pdf file are allowed to upload!!";
                        if (ViewState["upload"].ToString() == "T")
                            bindgrid_Training();
                        else
                            bindgrid_Upload();
                        return 0;
                    }

                }
                else
                {
                    lblmsg.Text = "Only,pdf file are allowed to upload!!";
                    if (ViewState["upload"].ToString() == "T")
                        bindgrid_Training();
                    else
                        bindgrid_Upload();
                    return 0;
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "Error Occured while Uploading a Document!!";
                if (ViewState["upload"].ToString() == "T")
                    bindgrid_Training();
                else
                    bindgrid_Upload();
                return 0;

            }
        }
        protected void grdhealth_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlrelation = (DropDownList)e.Row.FindControl("ddlrelation");
                cmm.bindDDLWidParam(ddlrelation, "PN22_PBHS_RelationSP", "relationship", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            }
        }

        protected void grdhealth_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(grdhealth.DataKeys[e.RowIndex].Value.ToString());
                string ip = cmm.GetIp_Priyank();

                int i = cmm.RunSP("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@id", Id),
                                                                                        new SqlParameter("@createdby", Convert.ToInt32(Session["empid"])),
                                                                                        new SqlParameter("@LastOpIP", ip),
                                                                                        new SqlParameter("@flag", 4));


                if (i > 0)
                {
                    Label59.ForeColor = System.Drawing.Color.Green;
                    Label59.Text = "Information Deleted Successfully..";
                    bindgrid_Training();
                }
                else
                {

                    Label59.ForeColor = System.Drawing.Color.Red;
                    Label59.Text = "Unable to Delete..";
                    bindgrid_Training();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void Button7_Click(object sender, EventArgs e)
        {

        }

        protected void lnkback__Click(object sender, EventArgs e)
        {
            divgazetted.Visible = true;
            divgazettedlbl.Visible = false;

            divbasic.Visible = true;
            divbasiclbl.Visible = false;

            divlevel.Visible = true;
            divlevellbl.Visible = false;

            divofficialAddress.Visible = true;
            divofficialAdd_lbl.Visible = false;

            divresAdd.Visible = true;
            divResAddLBL.Visible = false;

            divdep.Visible = true;
            divdeplbl.Visible = false;

            divCompdep.Visible = true;
            divCompDep_lbl.Visible = false;

            divtransfer.Visible = true;
            divtransferLBL.Visible = false;

            btnpreview.Visible = true;
            btnsubmit.Visible = false;

            btnhome.Visible = true;
            lnkback_.Visible = false;
            grdhealth.Focus();
        }

        protected void ddlrenew_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlrenew.SelectedValue == "0")
            {
                divrenew2.Visible = false;
            }
            else
            {
                divrenew2.Visible = true;
            }
        }

        protected void grdupload_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloaddoc"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdupload.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@flag", "4"),
                                                                                                 new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][1].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][1].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgrid_Upload();
                                Label22.Text = "There is no document to download!!";
                            }
                            grdupload.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgrid_Upload();
                        Label22.Text = "There is no document to download!!";
                        grdupload.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgrid_Upload();
                    Label22.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdupload.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    DropDownList ddldoctype = (DropDownList)grdupload.FooterRow.FindControl("ddldoctype");
                    FileUpload fileupload_Doc = (FileUpload)grdupload.FooterRow.FindControl("fileupload_Doc");
                    int count;


                    count = cmm.RunSPReturnCountParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                                           , new SqlParameter("@flag", 5)
                                                                                           , new SqlParameter("@DocType", ddldoctype.SelectedItem.Text));
                    if (count == 0)
                    {
                        if (fileupload_Doc.HasFile)
                        {
                            int ret = 0;
                            ViewState["upload"] = "S";
                            ret = uploaddoc(fileupload_Doc, "Documents", Label22);
                            if (ret == 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Only, pdf upto 350kb are allowed!!');", true);
                            }
                            else
                            {
                                //// @empid,@,@Remarks,@Filename,@createdby,GETDATE(),1,@LastOpIP)
                                int i = cmm.RunSP("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                                                       , new SqlParameter("@DocType", ddldoctype.SelectedItem.Text)
                                                                                                       , new SqlParameter("@Filename", ViewState["File_Residing"].ToString())
                                                                                                       , new SqlParameter("@LastOpIP", ip)
                                                                                                       , new SqlParameter("@createdby", Convert.ToInt32(Session["empid"]))
                                                                                                       , new SqlParameter("@flag", 2));

                                if (i > 0)
                                {
                                    bindgrid_Upload();
                                    Label22.ForeColor = System.Drawing.Color.Green;
                                    Label22.Text = "Added Successfully..";
                                }
                                else
                                {
                                    bindgrid_Upload();
                                    Label22.ForeColor = System.Drawing.Color.Red;
                                    Label22.Text = "Error Occured.Try Again!!";

                                }

                            }



                        }
                        else
                        {
                            Label22.ForeColor = System.Drawing.Color.Red;
                            Label22.Text = "Upload a Photo is Mandatory!!";
                            bindgrid_Upload();
                        }
                    }
                    else
                    {
                        Label22.Text = "Duplicate Entry Not Allowed..";
                        bindgrid_Upload();
                        grdupload.Focus();
                    }
                    grdupload.Focus();
                }
                catch (Exception ex)
                {
                    Label22.Text = "Error Occured.Try Again!!";
                    bindgrid_Upload();
                    grdupload.Focus();
                }
            }
        }
        protected void grdupload_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(grdupload.DataKeys[e.RowIndex].Value.ToString());
                string ip = cmm.GetIp_Priyank();

                int i = cmm.RunSP("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@id", Id),
                                                                                        new SqlParameter("@createdby", Convert.ToInt32(Session["empid"])),
                                                                                        new SqlParameter("@LastOpIP", ip),
                                                                                        new SqlParameter("@flag", 3));


                if (i > 0)
                {
                    Label22.ForeColor = System.Drawing.Color.Green;
                    Label22.Text = "Information Deleted Successfully..";
                    bindgrid_Upload();
                }
                else
                {

                    Label22.ForeColor = System.Drawing.Color.Red;
                    Label22.Text = "Unable to Delete..";
                    bindgrid_Upload();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }

        protected void ddldeputation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldeputation.SelectedValue == "1")
            {
                trdepDate.Visible = true;
                RequiredFieldValidator7.Enabled = true;
            }
            else
            {
                trdepDate.Visible = false;
                RequiredFieldValidator7.Enabled = false;
            }
            txtdateCompletion.Focus();
        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            divgazetted.Visible = false;
            divgazettedlbl.Visible = true;
            lblgazetted.Text = ddlgazetted.SelectedItem.Text;

            divbasic.Visible = false;
            divbasiclbl.Visible = true;
            lblbasiclbl.Text = txtbasicpay.Text.Trim();

            divlevel.Visible = false;
            divlevellbl.Visible = true;
            lbllevelLBL.Text = ddlpaymatrix.SelectedItem.Text;

            divofficialAddress.Visible = false;
            divofficialAdd_lbl.Visible = true;
            lblOfficialAdd.Text = txtoffcAddress.Text.Trim();

            divresAdd.Visible = false;
            divResAddLBL.Visible = true;
            lblresAdd_Lbl.Text = txtresaddress.Text.Trim();

            divdep.Visible = false;
            divdeplbl.Visible = true;
            Label7.Text = ddldeputation.SelectedItem.Text;

            divCompdep.Visible = false;
            divCompDep_lbl.Visible = true;
            lbldep_LBL.Text = ddldeputation.SelectedItem.Text;

            divtransfer.Visible = false;
            divtransferLBL.Visible = true;
            lbltransfer_lbl.Text = ddltransfer.SelectedItem.Text;

            divrenew.Visible = false;
            divrenew2.Visible = false;
            div4.Visible = true;
            if (ddlrenew.SelectedValue == "0")
                Label8.Text = ddlrenew.SelectedItem.Text;
            else
                Label8.Text = ddlrenew.SelectedItem.Text + "-" + txtrenew.Text.Trim();

            divappFwd.Visible = false;
            divlblAppFwd.Visible = true;
            lblapplforwared_bas.Text = lblappforwarded.Text;

            div3.Visible = false;
            div5.Visible = true;
            lblresidingwithme.Text = ddlresiding.SelectedItem.Text;

            btnpreview.Visible = false;
            btnsubmit.Visible = true;
            btnedit.Visible = true;
            btnhome.Visible = false;
            lnkback_.Visible = true;
            grdupload.Columns[3].Visible = false;
            grdhealth.Columns[7].Visible = false;
            grdhealth.Focus();
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            divgazetted.Visible = true;
            divgazettedlbl.Visible = false;
            //lblgazetted.Text = ddlgazetted.SelectedItem.Text;

            divbasic.Visible = true;
            divbasiclbl.Visible = false;
            // lblbasiclbl.Text = txtbasicpay.Text.Trim();

            divlevel.Visible = true;
            divlevellbl.Visible = false;
            // lbllevelLBL.Text = txtpaymatrix.Text.Trim();

            divofficialAddress.Visible = true;
            divofficialAdd_lbl.Visible = false;
            //lblOfficialAdd.Text = txtoffcAddress.Text.Trim();

            divresAdd.Visible = true;
            divResAddLBL.Visible = false;
            //lblresAdd_Lbl.Text = txtresaddress.Text.Trim();

            divdep.Visible = true;
            divdeplbl.Visible = false;
            //Label7.Text = ddldeputation.SelectedItem.Text;

            divCompdep.Visible = true;
            divCompDep_lbl.Visible = false;
            //lbldep_LBL.Text = ddldeputation.SelectedItem.Text;

            divtransfer.Visible = true;
            divtransferLBL.Visible = false;
            //lbltransfer_lbl.Text = ddltransfer.SelectedItem.Text;

            divrenew.Visible = true;
            divrenew2.Visible = true;
            div4.Visible = false;
            //if (ddlrenew.SelectedValue == "0")
            //    Label8.Text = ddlrenew.SelectedItem.Text;
            //else
            //    Label8.Text = ddlrenew.SelectedItem.Text + "-" + txtrenew.Text.Trim();

            divappFwd.Visible = true;
            divlblAppFwd.Visible = false;
            //lblapplforwared_bas.Text = txtappforwarded.Text;

            div3.Visible = true;
            div5.Visible = false;
            //lblresidingwithme.Text = ddlresiding.SelectedItem.Text;

            btnpreview.Visible = true;
            btnsubmit.Visible = false;
            btnedit.Visible = false;
            btnhome.Visible = true;
            lnkback_.Visible = false;
            grdupload.Columns[3].Visible = true;
            grdhealth.Columns[7].Visible = true;
            ddlgazetted.Focus();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckBox1.Checked)
                {
                    ds = cmm.RunSpReturnDSParam("PN22_PBHS_finalsubmitdatachk", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"]))
                                                                                               , new SqlParameter("@flag", 1)); //Convert.ToInt32(lblappempid.Text)
                    ViewState["msg_mandatorychk"] = ds.Tables[0].Rows[0][0].ToString();
                    if (ViewState["msg_mandatorychk"].ToString() == "1")//All mandatory Details Submitted
                    {
                        string ip = cmm.GetIp_Priyank();

                        int empid = Convert.ToInt32(Session["empid"]);
                        string new_renw = ddlrenew.SelectedItem.Text;
                        string oldcardnum = txtrenew.Text.Trim();

                        string email = lblemail_bas.Text;
                        string mobile = lblcontact_bas.Text;
                        string name = lblname_bas.Text;
                        string designation = lbldesgn_bas.Text;
                        string present_place = lblposting_bas.Text;
                        string date_retire = lbldate_superannu_bas.Text;

                        string gaz_nonGZ = ddlgazetted.SelectedItem.Text;
                        string basicpay = txtbasicpay.Text.Trim();
                        string levelpay_matrix = ddlpaymatrix.SelectedItem.Text;
                        string offc_ADD = txtoffcAddress.Text.Trim();
                        string Res_ADD = txtresaddress.Text.Trim();

                        Boolean isdeputation = false; Boolean istransferrable = false;
                        DateTime? depCompletedOn = null;
                        if (ddldeputation.SelectedValue == "1")
                        {
                            isdeputation = true;
                            depCompletedOn = DateTime.ParseExact(txtdateCompletion.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        }
                        if (ddltransfer.SelectedValue == "1")
                        {
                            istransferrable = true;
                        }
                        Boolean isdepen = false;
                        if (ddlresiding.SelectedValue == "1")
                        {
                            isdepen = true;
                        }
                        int DealingUsertypeId, Dealing_StnSec_empId;
                        DealingUsertypeId = 10;

                        //Dealing_StnSec_empId = Convert.ToInt32(hdnValue.Value);
                        Dealing_StnSec_empId = Convert.ToInt32(ViewState["HoonameID"]);
                        string createdby = Session["UserName"].ToString();

                        ds = cmm.RunSpReturnDSParam("PN21_Trans_EmployeeDetails", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Dealing_StnSec_empId))
                                                                                                   , new SqlParameter("@flag", 2)); //Convert.ToInt32(lblappempid.Text)

                        string email_officer = ds.Tables[0].Rows[0][3].ToString();
                        string mobile_officer = ds.Tables[0].Rows[0][2].ToString();
                        string name_officer = ds.Tables[0].Rows[0][5].ToString();

                        string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                        SqlConnection conn = new SqlConnection(conf);
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("PN22_PBHS_FinalSubmit", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@empid", empid);
                        cmd.Parameters.AddWithValue("@Name_emp", name);
                        cmd.Parameters.AddWithValue("@New_ReNew", new_renw);
                        cmd.Parameters.AddWithValue("@OldCardNo", oldcardnum);
                        cmd.Parameters.AddWithValue("@Dealing_StnSec_empId", Dealing_StnSec_empId);
                        cmd.Parameters.AddWithValue("@DealingUsertypeId", DealingUsertypeId);
                        cmd.Parameters.AddWithValue("@FMembers_Dependent", isdepen);
                        cmd.Parameters.AddWithValue("@Transferable", istransferrable);
                        cmd.Parameters.AddWithValue("@OnDep_Completion", depCompletedOn);
                        cmd.Parameters.AddWithValue("@OnDeputation", isdeputation);
                        cmd.Parameters.AddWithValue("@Residential_Add", Res_ADD);
                        cmd.Parameters.AddWithValue("@Official_add", offc_ADD);
                        cmd.Parameters.AddWithValue("@Level_payMatrix", levelpay_matrix);
                        cmd.Parameters.AddWithValue("@BasicPay", basicpay);
                        cmd.Parameters.AddWithValue("@Gaz_NonGaz", gaz_nonGZ);
                        cmd.Parameters.AddWithValue("@emp_date_retire", date_retire);
                        cmd.Parameters.AddWithValue("@emp_present_place", present_place);
                        cmd.Parameters.AddWithValue("@emp_Email", email);
                        cmd.Parameters.AddWithValue("@emp_contactno", mobile);
                        cmd.Parameters.AddWithValue("@Emp_Designation", designation);
                        cmd.Parameters.AddWithValue("@ip", ip);
                        cmd.Parameters.AddWithValue("@createdby", createdby);
                        cmd.Parameters.AddWithValue("@flag", 1);
                        cmd.Parameters.Add("@appidout", SqlDbType.Int);// to get a out value from sql query
                        cmd.Parameters["@appidout"].Direction = ParameterDirection.Output;// to get a out value from sql query
                        int i = cmd.ExecuteNonQuery();
                        string appNumber = cmd.Parameters["@appidout"].Value.ToString();
                        conn.Close();

                        if (i > 0)
                        {
                            if (email_officer != "")
                            {
                                sendEmailNotification(name_officer, email_officer, name, mobile, appNumber, present_place);
                            }
                            //A new {#var#} {#var#} has been received, with Application RefID {#var#}.Kindly login into {#var#} for necessary actions.Prasar Bharati
                            string msgsend = "A new PBHealthCard request has been received, with Application RefID " + appNumber + ".Kindly login into PrasarNet for necessary actions.Prasar Bharati";
                            Boolean ret = cmm.sendMobileOTP1(mobile_officer, "", msgsend);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Application Submitted Successfully!!');", true);
                            Response.Redirect("~/PBHS/DashBoard_PBHS.aspx", false);
                            // Session["status_dash"] = "";
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ViewState["msg_mandatorychk"].ToString() + "');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Read and Tick the Declaration!!');", true);
                    CheckBox1.Focus();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
            }
        }
        private void sendEmailNotification(string empName, string empEmail, string applicantname, string applicantmob, string appNumber, string applicantSTN)
        {
            string appSubject, appBody;
            appSubject = "New PB-Health Scheme Card Application Received";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> A new PB-Health Scheme Card application has been received. The details are as follows: <br />";
            appBody += "<br /> Application Number: " + appNumber;
            appBody += "<br /> Applicant Name: " + applicantname;
            appBody += "<br /> Applicant Mobile Number: " + applicantmob;
            appBody += "<br /> Applicant Station/Office: " + applicantSTN;

            appBody += "<br /><br /> Kindly Login on PrasarNet, as an employee, for necessary actions.";
            appBody += "<br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            int i = cmm.sendemail(appBody, empEmail, appSubject, "smtp_hrispb");
        }

    }
}