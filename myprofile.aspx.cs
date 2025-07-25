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
    public partial class myprofile : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {

                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                        divempprofile.Visible = true;
                        divstationinfo.Visible = false;
                        divsection.Visible = false;
                        divmanagemntprofile.Visible = false;
                        DataSet dsphoto = new DataSet();
                        dsphoto = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                              new SqlParameter("@flag", 3));
                        if (dsphoto.Tables[0].Rows[0][0].ToString() != "")
                        {
                            string imgname = Convert.ToString(dsphoto.Tables[0].Rows[0][0]);
                            Image2.ImageUrl = "~/empphoto/" + imgname;
                        }
                        DataSet ds1 = new DataSet();
                        ds1 = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                    new SqlParameter("@flag", 1));
                        lblNamedis.Text = Convert.ToString(ds1.Tables[0].Rows[0][2]);
                        lbldesignationdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);
                        if (Convert.ToString(ds1.Tables[0].Rows[0][5]) != "")
                        {
                            //DateTime t = DateTime.ParseExact(ds1.Tables[0].Rows[0][5].ToShortDateString(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                            lblDOBdis.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][5]).ToShortDateString();
                            //Convert.ToString(ds1.Tables[0].Rows[0][5]).Substring(0, 10);
                        }
                        else
                            lblDOBdis.Text = "--";
                        lblstndis.Text = Convert.ToString(ds1.Tables[0].Rows[0][8]);
                        if (Convert.ToString(ds1.Tables[0].Rows[0][6]) != "")
                        {
                            lblDOJdis.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][6]).ToShortDateString();
                                //Convert.ToString(DateTime.ParseExact(ds1.Tables[0].Rows[0][6].ToShortDateString() , "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture));
                            //Convert.ToString(ds1.Tables[0].Rows[0][6]).Substring(0, 10);



                        }
                        else
                            lblDOJdis.Text = "--";
                        lblemaildis.Text = Convert.ToString(ds1.Tables[0].Rows[0][9]);
                        lblcontactdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station section
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                        divempprofile.Visible = false;
                        if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//Sections
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
                            divsection.Visible = true;
                            divstationinfo.Visible = false;
                            DataSet dsphoto = new DataSet();
                            dsphoto = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                            if (dsphoto.Tables[0].Rows[0][0].ToString() != "")
                            {
                                string imgname = Convert.ToString(dsphoto.Tables[0].Rows[0][0]);
                                Image2.ImageUrl = "~/SectionPhoto/" + imgname;
                            }
                            DataSet ds1 = new DataSet();
                            ds1 = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 3));

                            lblempcodesec.Text = Convert.ToString(ds1.Tables[0].Rows[0][14]);

                            Label9.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);//HOS Name

                            Label20.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);//Designation

                            string per = "--", off = "--";
                            if (ds1.Tables[0].Rows[0][5].ToString() != "")
                                per = ds1.Tables[0].Rows[0][5].ToString();
                            if (ds1.Tables[0].Rows[0][12].ToString() != "")
                                off = ds1.Tables[0].Rows[0][12].ToString();

                            Label22.Text = "Personal: " + per + " Official: " + off;//Mobile

                            Label25.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][11]);//section Email

                            Label29.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);//LLNO

                            Label7.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                            if (Convert.ToString(ds1.Tables[0].Rows[0][15]) != "" || Convert.ToString(ds1.Tables[0].Rows[0][15]) != "0")

                                lblddoempsec.Text = Convert.ToString(ds1.Tables[0].Rows[0][15]) + " (" + Convert.ToString(ds1.Tables[0].Rows[0][16]) + ")";

                            else

                                lblddoempsec.Text = "";

                            lbldutiessec.Text = Convert.ToString(ds1.Tables[0].Rows[0][13]);
                        }
                        else//Station
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
                            divsection.Visible = false;
                            divstationinfo.Visible = true;
                            divstnname.Visible = false;
                            DataSet dsstn = new DataSet();
                            dsstn = cmm.RunSpReturnDSParam("PN18_stationinfo", "PRASARNETConnectionString", new SqlParameter("@stnid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 1));
                            lblhos.Text = Convert.ToString(dsstn.Tables[0].Rows[0][6]);
                            lblstndesgn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][10]);
                            string per = "--", off = "--";
                            if (dsstn.Tables[0].Rows[0][8].ToString() != "")
                                per = dsstn.Tables[0].Rows[0][8].ToString();
                            if (dsstn.Tables[0].Rows[0][7].ToString() != "")
                                off = dsstn.Tables[0].Rows[0][7].ToString();

                            lblhosmobile.Text = "Personal: " + per + " Official: " + off;
                            lblstnemail.Text = Convert.ToString(dsstn.Tables[0].Rows[0][9]);
                            lblstncontact.Text = Convert.ToString(dsstn.Tables[0].Rows[0][11]);
                            if (Convert.ToString(dsstn.Tables[0].Rows[0][13]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][13]) != "0")
                                lblempcodeddo.Text = Convert.ToString(dsstn.Tables[0].Rows[0][13]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][14]) + ")";
                            else
                            {
                                lblempcodeddo.Text = "";
                            }
                            lblhooempcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][12]);

                            lblrefordernumber_stn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][21]);

                            if (Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "0")//EnggHead
                                lbleng_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][15]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][16]) + ")";
                            else
                            {
                                lbleng_head_empcode.Text = "";
                            }

                            if (Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "0")//ProgHead
                                lblproghead_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][17]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][18]) + ")";
                            else
                            {
                                lblproghead_empcode.Text = "";
                            }

                            if (Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "0")//ProgHead
                                lblsec_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][19]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][20]) + ")";
                            else
                            {
                                lblsec_head_empcode.Text = "";
                            }
                        }
                        divmanagemntprofile.Visible = false;

                    }
                    else// management
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
                        divsection.Visible = false;
                        divempprofile.Visible = false;
                        divstationinfo.Visible = false;
                        divmanagemntprofile.Visible = true;
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            empmenu.Visible = false;
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
                            empmenu.Visible = false;
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

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", false);
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            //PhotoUpload Employee
            if (FileUpload1.HasFile)
            {
                DataSet ds1 = new DataSet();
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
                DataSet dsphotoold = new DataSet();
                dsphotoold = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                         new SqlParameter("@flag", 3));
                ViewState["photoold"] = dsphotoold.Tables[0].Rows[0][0];
                if (height <= 230 && width <= 200 && size <= 50 && size >= 20)
                {

                    try
                    {
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                        filetype = filetype.ToLower();
                        string max = Convert.ToString(Convert.ToInt64(ViewState["empid"]) + 1);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";
                            string target = MapPath("~/empphoto/" + FileUpload1.FileName.ToString());
                            FileUpload1.PostedFile.SaveAs(MapPath("~/empphoto/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            path = Server.MapPath("~") + "\\empphoto\\";
                            string Fromfile = path + files;
                            string savefile = Convert.ToString(ViewState["empname"]).Substring(0, 3) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            string imagepath = "~/empphoto/" + savefile;
                            int d;

                            d = cmm.RunSP("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                                        new SqlParameter("@photoname", savefile),
                                                                                        new SqlParameter("@flag", 2));

                            if (d > 0)
                            {

                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                DataSet dsphoto = new DataSet();
                                string path1 = Server.MapPath("~/empphoto/" + Convert.ToString(ViewState["photoold"]));
                                FileInfo file = new FileInfo(path1);
                                if (file.Exists)// After uploading a New Photo,  the previous/old Photo in a repository should be deleted 
                                {
                                    file.Delete();
                                }

                                Image2.ImageUrl = "~/empphoto/" + savefile;

                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Size should be between 20kB to 50 kB and Dimensions should be between 0-230px X 0-200px!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            txtemailemp.Visible = true;
            //txtnameemp.Visible = true;
            txtcontactemp.Visible = true;
            //lblNamedis.Visible = false;
            lblemaildis.Visible = false;
            lblcontactdis.Visible = false;
            txtemailemp.Text = lblemaildis.Text;
            //txtnameemp.Text = lblNamedis.Text;
            txtcontactemp.Text = lblcontactdis.Text;
            rowbtn.Visible = true;
        }

        protected void lnkupdate_Click(object sender, EventArgs e)
        {
            int i = cmm.RunSP("prasarnet_updateEmployeeDetail", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                                                 new SqlParameter("@email", txtemailemp.Text),
                                                                                                 new SqlParameter("@mobile", txtcontactemp.Text),
                                                                                                 new SqlParameter("@updatedby", Convert.ToString(Session["UserName"])),
                                                                                                 new SqlParameter("@flag", 1));
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
                txtemailemp.Visible = false;
                //txtnameemp.Visible = true;
                txtcontactemp.Visible = false;
                //lblNamedis.Visible = false;
                lblemaildis.Visible = true;
                lblcontactdis.Visible = true;
                txtemailemp.Text = lblemaildis.Text;
                //txtnameemp.Text = lblNamedis.Text;
                txtcontactemp.Text = lblcontactdis.Text;
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PrasarNet_Employee", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                   new SqlParameter("@flag", 1));
                lblemaildis.Text = Convert.ToString(ds1.Tables[0].Rows[0][9]);
                lblcontactdis.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);
                rowbtn.Visible = false;
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            txtemailemp.Visible = false;
            txtcontactemp.Visible = false;
            lblemaildis.Visible = true;
            lblcontactdis.Visible = true;
            txtemailemp.Text = "";
            txtcontactemp.Text = "";
            rowbtn.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //PhotoUpload Station
            if (FileUpload2.HasFile)
            {
                DataSet ds1 = new DataSet();
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload2.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)FileUpload2.PostedFile.ContentLength / (decimal)1024), 2);
                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                {
                    DataSet dsphotoold = new DataSet();
                    dsphotoold = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                 new SqlParameter("@flag", 3));
                    ViewState["photoold"] = dsphotoold.Tables[0].Rows[0][0];
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                {
                    DataSet dssecphotoold = new DataSet();

                    dssecphotoold = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                    ViewState["secphotoold"] = dssecphotoold.Tables[0].Rows[0][0];
                }

                if (height <= 230 && width <= 200 && size <= 50 && size >= 20)
                {

                    try
                    {
                        string imagepath = "";
                        string Fromfile = "";
                        string savefile = "";
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload2.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = Convert.ToString(Convert.ToInt64(Session["Station_SectionID"]) + 1);
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                            {
                                string target = MapPath("~/stationphoto/" + FileUpload2.FileName.ToString());
                                FileUpload2.PostedFile.SaveAs(MapPath("~/stationphoto/" + FileUpload2.FileName.ToString()));
                                files = FileUpload2.FileName.ToString();
                                path = Server.MapPath("~") + "\\stationphoto\\";
                                savefile = Convert.ToString(ViewState["stnname"]).Substring(4, 4) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                                imagepath = "~/stationphoto/" + savefile;
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                string target = MapPath("~/SectionPhoto/" + FileUpload2.FileName.ToString());
                                FileUpload2.PostedFile.SaveAs(MapPath("~/SectionPhoto/" + FileUpload2.FileName.ToString()));
                                files = FileUpload2.FileName.ToString();
                                path = Server.MapPath("~") + "\\SectionPhoto\\";
                                savefile = Convert.ToString(ViewState["secname"]).Substring(0, 1) + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                                imagepath = "~/SectionPhoto/" + savefile;

                            }
                            Fromfile = path + files;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);

                            int d = 0;
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                            {
                                d = cmm.RunSP("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                            new SqlParameter("@photoname", savefile),
                                                                                            new SqlParameter("@flag", 2));
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                d = cmm.RunSP("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                               new SqlParameter("@photoname", savefile),
                                                                                               new SqlParameter("@flag", 4));
                            }
                            if (d > 0)
                            {
                                string path1 = "";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                DataSet dsphoto = new DataSet();
                                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20)//station
                                {
                                    DataSet dsstnphoto = new DataSet();

                                    dsstnphoto = cmm.RunSpReturnDSParam("PrasarNet_station", "HRITConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                     new SqlParameter("@flag", 3));
                                    //if (dsstnphoto.Tables[0].Rows[0][0] != "")
                                    //{
                                    //    string imgname = Convert.ToString(dsstnphoto.Tables[0].Rows[0][0]);
                                    //    imgstation.ImageUrl = "~/stationphoto/" + imgname;
                                    //}
                                    //ViewState["photoold"]
                                    path1 = Server.MapPath("~/stationphoto/" + Convert.ToString(ViewState["photoold"]));
                                    imgstation.ImageUrl = "~/stationphoto/" + savefile;

                                }
                                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                                {
                                    DataSet dssecphoto = new DataSet();
                                    dssecphoto = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 5));
                                    //if (dssecphoto.Tables[0].Rows[0][0] != "")
                                    //{
                                    //    string imgname = Convert.ToString(dssecphoto.Tables[0].Rows[0][0]);
                                    //    imgstation.ImageUrl = "~/SectionPhoto/" + imgname;
                                    //}
                                    path1 = Server.MapPath("~/SectionPhoto/" + Convert.ToString(ViewState["secphotoold"]));
                                    imgstation.ImageUrl = "~/SectionPhoto/" + savefile;
                                }
                                FileInfo file = new FileInfo(path1);
                                if (file.Exists)// on uploading the previous file in a repository should be deleted 
                                {
                                    file.Delete();
                                }

                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Size should be between 20kB to 50 kB and Dimensions should be between 0-230px X 0-200px!!!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)// Edit Section Profile
        {
            cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--", new SqlParameter("@flag", 1));

            Label56.Visible = true;

            divempcodesec.Visible = true;
            lblempcodesec.Visible = false;

            Label9.Visible = false;
            TextBox3.Visible = true;

            Label20.Visible = false;
            divwingsec.Visible = true;
            ddlwing.Visible = true;

            Label22.Visible = false;
            TextBox4.Visible = true;

            txtmobileoff.Visible = true;
            divmobilesec.Visible = true;

            Label25.Visible = false;
            TextBox5.Visible = true;

            divemailsec.Visible = true;
            Label29.Visible = false;
            txtemail2sec.Visible = true;
            TextBox7.Visible = true;

            divsecduties.Visible = true;
            lbldutiessec.Visible = false;

            div11.Visible = true;
            lblddoempsec.Visible = false;


            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 3));

            string hooempcode = ds1.Tables[0].Rows[0][14].ToString();
            if (hooempcode == "0")
                hooempcode = "";
            txthoo_EmpCode_sec.Text = hooempcode;

            TextBox3.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);//HOS Name

            string wingid = ds1.Tables[0].Rows[0][8].ToString();
            string degnid = ds1.Tables[0].Rows[0][2].ToString();
            if (wingid != "" || wingid != "0")
            {
                ddlwing.ClearSelection(); //making sure the previous selection has been cleared
                ddlwing.Items.FindByValue(wingid).Selected = true;
                divwingsec.Visible = true;
                ddldesgn.Visible = true;
                cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", wingid));
                if (degnid != "" || degnid != "0")
                {
                    ddldesgn.ClearSelection(); //making sure the previous selection has been cleared
                    ddldesgn.Items.FindByValue(degnid).Selected = true;
                }
            }

            TextBox4.Text = ds1.Tables[0].Rows[0][5].ToString();
            txtmobileoff.Text = ds1.Tables[0].Rows[0][12].ToString();

            TextBox5.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]);
            txtEmail2.Text = Convert.ToString(ds1.Tables[0].Rows[0][11]);//section Email2

            TextBox7.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);//LLNO

            txtdutiessec.Text = Convert.ToString(ds1.Tables[0].Rows[0][13]);

            txtddoempcode_sec.Text = Convert.ToString(ds1.Tables[0].Rows[0][15]);

            if (ds1.Tables[0].Rows[0][15].ToString() != "0" && ds1.Tables[0].Rows[0][15].ToString() != "")
            {
                DataSet ds3 = new DataSet();
                ds3 = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode_sec.Text.Trim())),
                                                                   new SqlParameter("@flag", 2));
                lblddoname_sec.Text = ds3.Tables[0].Rows[0][5].ToString();
            }

            tr1.Visible = true;//update nd cancel button row
            diveditprofilesection.Visible = false;
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HOS.aspx", true);
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                int i = cmm.RunSP("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@HOO_EmpCode", txthoo_EmpCode_sec.Text.Trim()),
                                                                                                 new SqlParameter("@hoo", TextBox3.Text.Trim()),
                                                                                                 new SqlParameter("@email", TextBox5.Text.Trim()),
                                                                                                 new SqlParameter("@EMail2", txtEmail2.Text.Trim()),
                                                                                                 new SqlParameter("@mob", TextBox4.Text.Trim()),
                                                                                                 new SqlParameter("@Sec_Head_MobNo_off", txtmobileoff.Text.Trim()),
                                                                                                 new SqlParameter("@llno", TextBox7.Text.Trim()),
                                                                                                 new SqlParameter("@duties", txtdutiessec.Text.Trim()),
                                                                                                 new SqlParameter("@Updatedby", Convert.ToString(Session["UserName"])),
                                                                                                 new SqlParameter("@secuserid", Convert.ToInt64(Session["Station_SectionID"])),
                                                                                                 new SqlParameter("@wingidfordesignation", Convert.ToInt32(ddlwing.SelectedValue)),
                                                                                                 new SqlParameter("@degnid", Convert.ToInt32(ddldesgn.SelectedValue)),
                                                                                                 new SqlParameter("@ddoempcode", Convert.ToInt32(txtddoempcode_sec.Text.Trim())),
                                                                                                 new SqlParameter("@ip", ip),
                                                                                                 new SqlParameter("@flag", 6));
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
                    divempcodesec.Visible = false;
                    lblempcodesec.Visible = true;

                    Label9.Visible = true;
                    TextBox3.Visible = false;

                    Label20.Visible = true;
                    divwingsec.Visible = false;
                    ddlwing.Visible = false;

                    Label22.Visible = true;
                    TextBox4.Visible = false;
                    divmobilesec.Visible = false;
                    txtmobileoff.Visible = false;

                    txtemail2sec.Visible = false;
                    TextBox7.Visible = false;

                    Label25.Visible = true;
                    TextBox5.Visible = false;

                    divemailsec.Visible = false;
                    Label29.Visible = true;
                    txtemail2sec.Visible = false;
                    TextBox7.Visible = false;

                    divsecduties.Visible = false;
                    lbldutiessec.Visible = true;
                    Label56.Visible = false;
                    DataSet ds1 = new DataSet();
                    ds1 = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 3));

                    lblempcodesec.Text = Convert.ToString(ds1.Tables[0].Rows[0][14]);

                    Label9.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);//HOS Name

                    Label20.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);//Designation

                    div11.Visible = false;
                    lblddoempsec.Visible = true;


                    string per = "--", off = "--";
                    if (ds1.Tables[0].Rows[0][5].ToString() != "")
                        per = ds1.Tables[0].Rows[0][5].ToString();
                    if (ds1.Tables[0].Rows[0][12].ToString() != "")
                        off = ds1.Tables[0].Rows[0][12].ToString();

                    Label22.Text = "Personal: " + per + " Official: " + off;//Mobile

                    Label25.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][11]);//section Email

                    Label29.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);//LLNO

                    Label7.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                    if (Convert.ToString(ds1.Tables[0].Rows[0][15]) != "" || Convert.ToString(ds1.Tables[0].Rows[0][15]) != "0")

                        lblddoempsec.Text = Convert.ToString(ds1.Tables[0].Rows[0][15]) + " (" + Convert.ToString(ds1.Tables[0].Rows[0][16]) + ")";

                    else

                        lblddoempsec.Text = "";
                    lbldutiessec.Text = Convert.ToString(ds1.Tables[0].Rows[0][13]);

                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox7.Text = "";
                    txthoo_EmpCode_sec.Text = "";
                    txtmobileoff.Text = "";
                    txtemail2sec.Text = "";
                    txtdutiessec.Text = "";

                    tr1.Visible = false;
                    diveditprofilesection.Visible = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            try
            {
                divempcodesec.Visible = false;
                lblempcodesec.Visible = true;

                Label9.Visible = true;
                TextBox3.Visible = false;

                Label20.Visible = true;
                divwingsec.Visible = false;
                ddlwing.Visible = false;

                Label22.Visible = true;
                TextBox4.Visible = false;

                divmobilesec.Visible = false;
                txtmobileoff.Visible = false;

                Label25.Visible = true;
                TextBox5.Visible = false;

                divemailsec.Visible = false;
                Label29.Visible = true;
                txtemail2sec.Visible = false;
                TextBox7.Visible = false;

                divsecduties.Visible = false;
                lbldutiessec.Visible = true;
                Label56.Visible = false;

                div11.Visible = false;
                lblddoempsec.Visible = true;

                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_SectionProc", "PRASARNETConnectionString", new SqlParameter("@secuserid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 3));

                lblempcodesec.Text = Convert.ToString(ds1.Tables[0].Rows[0][14]);

                Label9.Text = Convert.ToString(ds1.Tables[0].Rows[0][1]);//HOS Name

                Label20.Text = Convert.ToString(ds1.Tables[0].Rows[0][10]);//Designation

                string per = "--", off = "--";
                if (ds1.Tables[0].Rows[0][5].ToString() != "")
                    per = ds1.Tables[0].Rows[0][5].ToString();
                if (ds1.Tables[0].Rows[0][12].ToString() != "")
                    off = ds1.Tables[0].Rows[0][12].ToString();

                Label22.Text = "Personal: " + per + " Official: " + off;//Mobile

                Label25.Text = Convert.ToString(ds1.Tables[0].Rows[0][3]) + " ," + Convert.ToString(ds1.Tables[0].Rows[0][11]);//section Email

                Label29.Text = Convert.ToString(ds1.Tables[0].Rows[0][4]);//LLNO

                Label7.Text = Convert.ToString(ds1.Tables[0].Rows[0][0]);
                if (Convert.ToString(ds1.Tables[0].Rows[0][15]) != "" || Convert.ToString(ds1.Tables[0].Rows[0][15]) != "0")

                    lblddoempsec.Text = Convert.ToString(ds1.Tables[0].Rows[0][15]) + " (" + Convert.ToString(ds1.Tables[0].Rows[0][16]) + ")";

                else

                    lblddoempsec.Text = "";

                lbldutiessec.Text = Convert.ToString(ds1.Tables[0].Rows[0][13]);

                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox7.Text = "";
                txthoo_EmpCode_sec.Text = "";
                txtmobileoff.Text = "";
                txtemail2sec.Text = "";
                txtdutiessec.Text = "";
                tr1.Visible = false;
                diveditprofilesection.Visible = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void ddlwing_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddldesgn.Visible = true;
                cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
                ddldesgn.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void LinkButton61_Click(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddlwingstn, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--", new SqlParameter("@flag", 1));
            lblhos.Visible = false;
            lblstndesgn.Visible = false;
            lblhosmobile.Visible = false;
            lblstnemail.Visible = false;
            lblstncontact.Visible = false;

            divstnname.Visible = true;
            txtfirst.Visible = true;
            txtmiddle.Visible = true;
            txtlast.Visible = true;

            divdesgnstn.Visible = true;
            ddldesgnstn.Visible = false;
            ddlwingstn.Visible = true;

            divmobstn.Visible = true;
            txthoomob.Visible = true;
            txtoffmob.Visible = true;

            divstnemail.Visible = true;
            txtEmail1.Visible = true;
            txtEmail2.Visible = true;

            divLLno.Visible = true;
            txtph1.Visible = true;
            txtph2.Visible = true;
            txtph3.Visible = true;

            divorder_stn.Visible = true;
            lblrefordernumber_stn.Visible = false;
            txtreforderno_stn.Visible = true;

            divengg_head.Visible = true;
            lbleng_head_empcode.Visible = false;
            txtenggheadempcode.Visible = true;

            divprog_head.Visible = true;
            lblproghead_empcode.Visible = false;
            txtprogH_empcode.Visible = true;

            divsec_head.Visible = true;
            lblsec_head_empcode.Visible = false;
            txtsec_head_empcode.Visible = true;

            DataSet dsstn = new DataSet();
            dsstn = cmm.RunSpReturnDSParam("PN18_stationinfo", "PRASARNETConnectionString", new SqlParameter("@stnid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 3));

            ViewState["stnidupdate"] = dsstn.Tables[0].Rows[0][0].ToString();

            txtfirst.Text = dsstn.Tables[0].Rows[0][6].ToString();
            txtmiddle.Text = dsstn.Tables[0].Rows[0][7].ToString();
            txtlast.Text = dsstn.Tables[0].Rows[0][8].ToString();

            string wingid = dsstn.Tables[0].Rows[0][14].ToString();
            string degnid = dsstn.Tables[0].Rows[0][13].ToString();
            if (wingid != "" || wingid != "0")
            {
                ddlwingstn.ClearSelection(); //making sure the previous selection has been cleared
                ddlwingstn.Items.FindByValue(wingid).Selected = true;
                divdesgnhoowing.Visible = true;
                ddldesgnstn.Visible = true;
                cmm.bindDDLWidParam(ddldesgnstn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", wingid));
                if (degnid != "" || degnid != "0")
                {
                    ddldesgnstn.ClearSelection(); //making sure the previous selection has been cleared
                    ddldesgnstn.Items.FindByValue(degnid).Selected = true;
                }
            }

            txthoomob.Text = dsstn.Tables[0].Rows[0][10].ToString();
            txtoffmob.Text = dsstn.Tables[0].Rows[0][9].ToString();

            txtEmail1.Text = dsstn.Tables[0].Rows[0][11].ToString();
            txtEmail2.Text = dsstn.Tables[0].Rows[0][12].ToString();

            txtph1.Text = dsstn.Tables[0].Rows[0][3].ToString();
            txtph2.Text = dsstn.Tables[0].Rows[0][4].ToString();
            txtph3.Text = dsstn.Tables[0].Rows[0][5].ToString();

            txtreforderno_stn.Text= dsstn.Tables[0].Rows[0][20].ToString();

            trsection.Visible = true;
            trhooempcode.Visible = true;
            lblhooempcode.Visible = false;
            divhooempcode.Visible = true;
            string hooempcode = dsstn.Tables[0].Rows[0][15].ToString();
            if (hooempcode == "0")
                hooempcode = "";
            txthooempcode.Text = hooempcode;

            trddoempcode.Visible = true;
            divddoempcode.Visible = true;
            lblempcodeddo.Visible = false;

            string ddoempcode = dsstn.Tables[0].Rows[0][16].ToString();
            if (ddoempcode == "0")
                ddoempcode = "";
            txtddoempcode.Text = ddoempcode;

            string engg_empcode = dsstn.Tables[0].Rows[0][17].ToString();
            if (engg_empcode == "0")
                engg_empcode = "";
            txtenggheadempcode.Text = engg_empcode;

            string prog_empcode = dsstn.Tables[0].Rows[0][18].ToString();
            if (prog_empcode == "0")
                prog_empcode = "";
            txtprogH_empcode.Text = prog_empcode;

            string sec_empcode = dsstn.Tables[0].Rows[0][19].ToString();
            if (sec_empcode == "0")
                sec_empcode = "";
            txtsec_head_empcode.Text = sec_empcode;

            if (dsstn.Tables[0].Rows[0][16].ToString() != "0" && dsstn.Tables[0].Rows[0][16].ToString() != "")
            {
                ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode.Text.Trim())),
                                                                   new SqlParameter("@flag", 2));
                if (ds.Tables[0].Rows.Count > 0)
                    lblddoname.Text = ds.Tables[0].Rows[0][5].ToString();
                else
                    lblddoname.Text = "DDO-Emp Code is Not Correct!!";
            }
            if (dsstn.Tables[0].Rows[0][17].ToString() != "0" && dsstn.Tables[0].Rows[0][17].ToString() != "")
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtenggheadempcode.Text.Trim())),
                                                                   new SqlParameter("@flag", 2));
                if (ds1.Tables[0].Rows.Count > 0)
                    lblenggheadname.Text = ds1.Tables[0].Rows[0][5].ToString();
                else
                    lblenggheadname.Text = "Engg. Head Emp Code is Not Correct!!";
            }

            if (dsstn.Tables[0].Rows[0][18].ToString() != "0" && dsstn.Tables[0].Rows[0][18].ToString() != "")
            {
                DataSet ds2 = new DataSet();
                
                    ds2 = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtprogH_empcode.Text.Trim())),
                                                                   new SqlParameter("@flag", 2));
                if (ds2.Tables[0].Rows.Count > 0)
                    lblprogheadname.Text = ds2.Tables[0].Rows[0][5].ToString();
                else
                    lblprogheadname.Text = "Prog. Head Emp Code is Not Correct!!";
            }

            if (dsstn.Tables[0].Rows[0][19].ToString() != "0" && dsstn.Tables[0].Rows[0][19].ToString() != "")
            {
                DataSet ds3 = new DataSet();
                ds3 = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtsec_head_empcode.Text.Trim())),
                                                                   new SqlParameter("@flag", 2));
                if (ds3.Tables[0].Rows.Count > 0)
                    lblsecheadname.Text = ds3.Tables[0].Rows[0][5].ToString();
                else
                    lblsecheadname.Text = "Security Head Emp Code is Not Correct!!";
            }
            divedit.Visible = false;
        }

        protected void ddlwingstn_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                divdesgnhoowing.Visible = true;
                ddldesgnstn.Visible = true;
                cmm.bindDDLWidParam(ddldesgnstn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwingstn.SelectedValue));
                ddldesgnstn.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            try
            {
                lblhos.Visible = true;
                lblstndesgn.Visible = true;
                lblhosmobile.Visible = true;
                lblstnemail.Visible = true;
                lblstncontact.Visible = true;

                divstnname.Visible = false;
                txtfirst.Visible = false;
                txtmiddle.Visible = false;
                txtlast.Visible = false;

                divdesgnstn.Visible = false;
                ddldesgnstn.Visible = false;
                ddlwingstn.Visible = false;

                divmobstn.Visible = false;
                txthoomob.Visible = false;
                txtoffmob.Visible = false;

                divstnemail.Visible = false;
                txtEmail1.Visible = false;
                txtEmail2.Visible = false;

                divLLno.Visible = false;
                txtph1.Visible = false;
                txtph2.Visible = false;
                txtph3.Visible = false;


                trsection.Visible = false;
                trhooempcode.Visible = true;
                lblhooempcode.Visible = true;
                divhooempcode.Visible = false;

                trddoempcode.Visible = true;
                divddoempcode.Visible = false;
                lblempcodeddo.Visible = true;
                //Label Binding
                DataSet dsstn = new DataSet();
                dsstn = cmm.RunSpReturnDSParam("PN18_stationinfo", "PRASARNETConnectionString", new SqlParameter("@stnid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 1));
                lblhos.Text = Convert.ToString(dsstn.Tables[0].Rows[0][6]);
                lblstndesgn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][10]);
                string per = "--", off = "--";
                if (dsstn.Tables[0].Rows[0][8].ToString() != "")
                    per = dsstn.Tables[0].Rows[0][8].ToString();
                if (dsstn.Tables[0].Rows[0][7].ToString() != "")
                    off = dsstn.Tables[0].Rows[0][7].ToString();

                lblhosmobile.Text = "Personal: " + per + " Official: " + off;
                lblstnemail.Text = Convert.ToString(dsstn.Tables[0].Rows[0][9]);
                lblstncontact.Text = Convert.ToString(dsstn.Tables[0].Rows[0][11]);
                if (Convert.ToString(dsstn.Tables[0].Rows[0][13]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][13]) != "0")
                    lblempcodeddo.Text = Convert.ToString(dsstn.Tables[0].Rows[0][13]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][14]) + ")";
                else
                {
                    lblempcodeddo.Text = "";
                }
                lblhooempcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][12]);
                divorder_stn.Visible = false;
                lblrefordernumber_stn.Visible = true;
                txtreforderno_stn.Visible = false;

                divengg_head.Visible = false;
                lbleng_head_empcode.Visible = true;
                txtenggheadempcode.Visible = false;

                divprog_head.Visible = false;
                lblproghead_empcode.Visible = true;
                txtprogH_empcode.Visible = false;

                divsec_head.Visible = false;
                lblsec_head_empcode.Visible = true;
                txtsec_head_empcode.Visible = false;

                lblrefordernumber_stn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][21]);

                if (Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "0")//EnggHead
                    lbleng_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][15]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][16]) + ")";
                else
                {
                    lbleng_head_empcode.Text = "";
                }

                if (Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "0")//ProgHead
                    lblproghead_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][17]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][18]) + ")";
                else
                {
                    lblproghead_empcode.Text = "";
                }

                if (Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "0")//ProgHead
                    lblsec_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][19]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][20]) + ")";
                else
                {
                    lblsec_head_empcode.Text = "";
                }
                divedit.Visible = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                string updatedby = "PN_" + Convert.ToString(Session["UserName"]);
                int engghead_EC = 0;
                int proghead_EC = 0;
                int sechead_EC = 0;
                if(txtenggheadempcode.Text.Trim()!="")
                {
                    engghead_EC = Convert.ToInt32(txtenggheadempcode.Text.Trim());
                }
                if (txtprogH_empcode.Text.Trim() != "")
                {
                    proghead_EC = Convert.ToInt32(txtprogH_empcode.Text.Trim());
                }
                if (txtsec_head_empcode.Text.Trim() != "")
                {
                    sechead_EC = Convert.ToInt32(txtsec_head_empcode.Text.Trim());
                }

                int i = cmm.RunSP("PN18_stationinfo", "PRASARNETConnectionString", new SqlParameter("@llno1", txtph1.Text.Trim()),
                                                                                                 new SqlParameter("@llno2", txtph2.Text.Trim()),
                                                                                                 new SqlParameter("@llno3", txtph3.Text.Trim()),
                                                                                                 new SqlParameter("@hoof", txtfirst.Text.Trim()),
                                                                                                 new SqlParameter("@hoom", txtmiddle.Text.Trim()),
                                                                                                 new SqlParameter("@hool", txtlast.Text.Trim()),
                                                                                                  new SqlParameter("@mob", txthoomob.Text.Trim()),
                                                                                                 new SqlParameter("@moboff", txtoffmob.Text.Trim()),

                                                                                                 new SqlParameter("@wingid", Convert.ToInt16(ddlwingstn.SelectedValue)),
                                                                                                 new SqlParameter("@degnid", Convert.ToInt32(ddldesgnstn.SelectedValue)),

                                                                                                 new SqlParameter("@email2", txtEmail1.Text.Trim()),
                                                                                                 new SqlParameter("@email1", txtEmail2.Text.Trim()),
                                                                                                 new SqlParameter("@stnid", Convert.ToInt32(Session["Station_SectionID"])),

                                                                                                 new SqlParameter("@enggcode", engghead_EC),

                                                                                                 new SqlParameter("@progcode", proghead_EC),

                                                                                                 new SqlParameter("@seccode", sechead_EC),

                                                                                                 new SqlParameter("@refordernum", txtreforderno_stn.Text.Trim()),

                                                                                                 new SqlParameter("@ip", ip),

                                                                                                 new SqlParameter("@Updatedby", updatedby),

                                                                                                 new SqlParameter("@HOO_PN_EmpCode", Convert.ToInt32(txthooempcode.Text.Trim())),
                                                                                                 new SqlParameter("@DDONameID", Convert.ToInt32(txtddoempcode.Text.Trim())),
                                                                                                 new SqlParameter("@flag", 2));

                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
                    lblhos.Visible = true;
                    lblstndesgn.Visible = true;
                    lblhosmobile.Visible = true;
                    lblstnemail.Visible = true;
                    lblstncontact.Visible = true;

                    divstnname.Visible = false;
                    txtfirst.Visible = false;
                    txtmiddle.Visible = false;
                    txtlast.Visible = false;

                    divdesgnstn.Visible = false;
                    ddldesgnstn.Visible = false;
                    ddlwingstn.Visible = false;

                    divmobstn.Visible = false;
                    txthoomob.Visible = false;
                    txtoffmob.Visible = false;

                    divstnemail.Visible = false;
                    txtEmail1.Visible = false;
                    txtEmail2.Visible = false;

                    divLLno.Visible = false;
                    txtph1.Visible = false;
                    txtph2.Visible = false;
                    txtph3.Visible = false;


                    trsection.Visible = false;
                    trhooempcode.Visible = true;
                    lblhooempcode.Visible = true;
                    divhooempcode.Visible = false;

                    trddoempcode.Visible = true;
                    divddoempcode.Visible = false;
                    lblempcodeddo.Visible = true;
                    //Label Binding
                    DataSet dsstn = new DataSet();
                    dsstn = cmm.RunSpReturnDSParam("PN18_stationinfo", "PRASARNETConnectionString", new SqlParameter("@stnid", Convert.ToInt32(Session["Station_SectionID"])), new SqlParameter("@flag", 1));
                    lblhos.Text = Convert.ToString(dsstn.Tables[0].Rows[0][6]);
                    lblstndesgn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][10]);
                    string per = "--", off = "--";
                    if (dsstn.Tables[0].Rows[0][8].ToString() != "")
                        per = dsstn.Tables[0].Rows[0][8].ToString();
                    if (dsstn.Tables[0].Rows[0][7].ToString() != "")
                        off = dsstn.Tables[0].Rows[0][7].ToString();

                    lblhosmobile.Text = "Personal: " + per + " Official: " + off;
                    lblstnemail.Text = Convert.ToString(dsstn.Tables[0].Rows[0][9]);
                    lblstncontact.Text = Convert.ToString(dsstn.Tables[0].Rows[0][11]);
                    if (Convert.ToString(dsstn.Tables[0].Rows[0][13]) != ""  || Convert.ToString(dsstn.Tables[0].Rows[0][13]) != "0")
                    {
                        lblempcodeddo.Text = Convert.ToString(dsstn.Tables[0].Rows[0][13]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][14]) + ")";
                    }
                    else
                    {
                        lblempcodeddo.Text = "";
                    }
                    lblhooempcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][12]);

                    divorder_stn.Visible = false;
                    lblrefordernumber_stn.Visible = true;
                    txtreforderno_stn.Visible = false;

                    divengg_head.Visible = false;
                    lbleng_head_empcode.Visible = true;
                    txtenggheadempcode.Visible = false;

                    divprog_head.Visible = false;
                    lblproghead_empcode.Visible = true;
                    txtprogH_empcode.Visible = false;

                    divsec_head.Visible = false;
                    lblsec_head_empcode.Visible = true;
                    txtsec_head_empcode.Visible = false;

                    lblrefordernumber_stn.Text = Convert.ToString(dsstn.Tables[0].Rows[0][21]);

                    if (Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][15]) != "0")//EnggHead
                        lbleng_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][15]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][16]) + ")";
                    else
                    {
                        lbleng_head_empcode.Text = "";
                    }

                    if (Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][17]) != "0")//ProgHead
                        lblproghead_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][17]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][18]) + ")";
                    else
                    {
                        lblproghead_empcode.Text = "";
                    }

                    if (Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "" || Convert.ToString(dsstn.Tables[0].Rows[0][19]) != "0")//ProgHead
                        lblsec_head_empcode.Text = Convert.ToString(dsstn.Tables[0].Rows[0][19]) + " (" + Convert.ToString(dsstn.Tables[0].Rows[0][20]) + ")";
                    else
                    {
                        lblsec_head_empcode.Text = "";
                    }

                    divedit.Visible = true;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void txthooempcode_TextChanged(object sender, EventArgs e)//stn
        {
            try
            {
                if (txthooempcode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txthooempcode.Text.Trim())),
                                                                            new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('HOO with mentioned employee code is not Active/Incorrect!!');", true);
                        trsection.Visible = false;
                    }
                    else
                    {
                        trsection.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txthooempcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        txtfirst.Text = ds.Tables[0].Rows[0][0].ToString();
                        txtmiddle.Text = ds.Tables[0].Rows[0][1].ToString();
                        txtlast.Text = ds.Tables[0].Rows[0][2].ToString();
                        txthoomob.Text = ds.Tables[0].Rows[0][4].ToString();
                        string desgid = ds.Tables[0].Rows[0][6].ToString();
                        string wingid = ds.Tables[0].Rows[0][7].ToString();
                        if (wingid != "" || wingid != "0")
                        {
                            ddlwingstn.ClearSelection();
                            ddlwingstn.Items.FindByValue(wingid).Selected = true;
                            if (desgid != "" || desgid != "0")
                            {
                                divdesgnhoowing.Visible = true;
                                ddldesgnstn.Visible = true;
                                cmm.bindDDLWidParam(ddldesgnstn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwingstn.SelectedValue));
                                ddldesgnstn.ClearSelection();
                                ddldesgnstn.Items.FindByValue(desgid).Selected = true;
                            }
                        }
                    }
                    ddlwingstn.Focus();
                }
                txthooempcode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in HOO/HOS Employee Code!!');", true);
            }
        }

        protected void txtddoempcode_TextChanged(object sender, EventArgs e)//stn
        {
            try
            {
                if (txtddoempcode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode.Text.Trim())),
                                                                            new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('DDO with mentioned employee code is not Active/Incorrect!!');", true);
                        trsection.Visible = false;
                        txtddoempcode.Focus();
                    }
                    else
                    {
                        trsection.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        lblddoname.Text = ds.Tables[0].Rows[0][5].ToString();
                        txtddoempcode.Focus();
                    }
                }
                txtddoempcode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in DDO Employee Code!!');", true);
            }
        }


        protected void txthoo_EmpCode_sec_TextChanged(object sender, EventArgs e)//Section
        {
            try
            {
                if (txthoo_EmpCode_sec.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txthoo_EmpCode_sec.Text.Trim())),
                                                                                                                      new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('HOO/HOS with mentioned employee code is not Active/Incorrect!!!!');", true);
                        tr1.Visible = false;
                    }
                    else
                    {
                        tr1.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txthoo_EmpCode_sec.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        TextBox3.Text = ds.Tables[0].Rows[0][5].ToString();
                        TextBox4.Text = ds.Tables[0].Rows[0][4].ToString();
                        string desgid = ds.Tables[0].Rows[0][6].ToString();
                        string wingid = ds.Tables[0].Rows[0][7].ToString();
                        if (wingid != "" || wingid != "0")
                        {
                            ddlwing.ClearSelection();
                            ddlwing.Items.FindByValue(wingid).Selected = true;
                            if (desgid != "" || desgid != "0")
                            {
                                ddldesgn.Visible = true;
                                cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
                                ddldesgn.ClearSelection();
                                ddldesgn.Items.FindByValue(desgid).Selected = true;
                            }
                        }
                    }
                    ddlwing.Focus();
                }
                txthoo_EmpCode_sec.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in HOO/HOS Employee Code!!');", true);
            }
        }

        protected void txtddoempcode_sec_TextChanged(object sender, EventArgs e)//Section
        {
            try
            {
                if (txtddoempcode_sec.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode_sec.Text.Trim())),
                                                                            new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('DDO with mentioned employee code is not Active/Incorrect!!!!');", true);
                        tr1.Visible = false;
                    }
                    else
                    {
                        tr1.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtddoempcode_sec.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        lblddoname_sec.Text = ds.Tables[0].Rows[0][5].ToString();
                    }
                    txtddoempcode_sec.Focus();
                }
                txtddoempcode_sec.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in DDO Employee Code!!');", true);
            }
        }

        protected void txtenggheadempcode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtenggheadempcode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtenggheadempcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Engg Head with mentioned employee code is not Active/Incorrect!!!!');", true);
                        trsection.Visible = false;
                        txtenggheadempcode.Focus();
                    }
                    else
                    {
                        trsection.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtenggheadempcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        lblenggheadname.Text = ds.Tables[0].Rows[0][5].ToString();
                        txtenggheadempcode.Focus();
                    }
                }
                txtenggheadempcode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in Engg. Head Employee Code!!');", true);
            }
        }

        protected void txtprogH_empcode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtprogH_empcode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtprogH_empcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Programme Head with mentioned employee code is not Active/Incorrect!!!!');", true);
                        trsection.Visible = false;
                        txtprogH_empcode.Focus();
                    }
                    else
                    {
                        trsection.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtprogH_empcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        lblprogheadname.Text = ds.Tables[0].Rows[0][5].ToString();
                        txtprogH_empcode.Focus();
                    }
                }
                txtprogH_empcode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in Prog. Head Employee Code!!');", true);
            }
        }

        protected void txtsec_head_empcode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtsec_head_empcode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtsec_head_empcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 1));
                    if (verifyempcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Security Officer with mentioned employee code is not Active/Incorrect!!');", true);
                        trsection.Visible = false;
                        txtsec_head_empcode.Focus();
                    }
                    else
                    {
                        trsection.Visible = true;
                        ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtsec_head_empcode.Text.Trim())),
                                                                           new SqlParameter("@flag", 2));
                        lblsecheadname.Text = ds.Tables[0].Rows[0][5].ToString();
                        txtsec_head_empcode.Focus();
                    }
                }
                txtsec_head_empcode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured in Security Officer Employee Code!!');", true);
            }
        }
    }
}