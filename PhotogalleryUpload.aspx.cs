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

namespace PrasarNet
{
    public partial class PhotogalleryUpload : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("Logout.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    cmm.bindDDLWidParam(ddlsubtitle, "PN21_PhotoGallery_Cat_SP", "category", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
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
                    bindgrid();
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        public void bindgrid()
        {

            DataSet ds1 = new DataSet();
            if (Convert.ToInt16(Session["Usertype"]) == 11)//station
            {
                ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                              new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),
                                                              new SqlParameter("@flag", "4"),
                                                              new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])));

            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12)//section
            {
                ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                              new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),
                                                              new SqlParameter("@flag", "4"),
                                                              new SqlParameter("@sectionid", Convert.ToInt32(Session["Station_SectionID"])));
            }
            else
            {
                ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                              new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),
                                                              new SqlParameter("@flag", "4"));
            }
            grdgallery.DataSource = ds1;
            grdgallery.DataBind();

        }
        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }
        private void clear()
        {
            txtSub.Text = "";
            txtdes.Text = "";
            ddlsubtitle.SelectedIndex = 0;
            FileUpload1.Attributes.Clear();
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            DataSet ds1 = new DataSet();
            System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            int height = img.Height;
            int width = img.Width;
            decimal size = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
            if (height <= 720 && width <= 1280 && size <= 500)
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
                        string max = cmm.SelectMaxId("select isnull(max(PicId),0)+1 from PN18_Gallery", "PRASARNETConnectionString");
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".jpeg" || filetype == ".jpg")
                        {
                            char[] chartrim = { '/', ':' };
                            string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                            string files = "";
                            string target = MapPath("~/Gallery/" + FileUpload1.FileName.ToString());
                            FileUpload1.PostedFile.SaveAs(MapPath("~/Gallery/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            path = Server.MapPath("~") + "\\Gallery\\";
                            string Fromfile = path + files;
                            string savefile = txtSub.Text + "_" + Convert.ToInt64(Session["Usertype"]) + "_" + max + "_" + dtetm + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            string imagepath = "~/Gallery/" + savefile;
                            int d;
                            if (Convert.ToInt16(Session["Usertype"]) == 11)//station
                            {
                                d = cmm.RunSP("PN18_galleryProc", "PRASARNETConnectionString", new SqlParameter("@sub", txtSub.Text.Trim()),
                                                          new SqlParameter("@PicFileName", savefile),
                                                          new SqlParameter("@PicDescription", txtdes.Text.Trim()),
                                                          new SqlParameter("@Pic_tobe_Display", false),
                                                          new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),// usertype=usertypeid                                                          
                                                          new SqlParameter("@OrgID", Convert.ToInt32(Session["Orgid"])),
                                                          new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                          new SqlParameter("@flag", "1"),
                                                          new SqlParameter("@imagepath", imagepath), 
                                                          new SqlParameter("@subtitleid", Convert.ToInt32(ddlsubtitle.SelectedValue)),
                                                          new SqlParameter("@Station_SectionID", Convert.ToInt32(Session["Station_SectionID"])));
                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12)//section
                            {
                                d = cmm.RunSP("PN18_galleryProc", "PRASARNETConnectionString", new SqlParameter("@sub", txtSub.Text.Trim()),
                                                          new SqlParameter("@PicFileName", savefile),
                                                          new SqlParameter("@PicDescription", txtdes.Text.Trim()),
                                                          new SqlParameter("@Pic_tobe_Display", false),
                                                          new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),// usertype=usertypeid                                                          
                                                          new SqlParameter("@OrgID", Convert.ToInt32(Session["Orgid"])),
                                                          new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                          new SqlParameter("@flag", "1"),
                                                          new SqlParameter("@imagepath", imagepath),
                                                          new SqlParameter("@subtitleid", Convert.ToInt32(ddlsubtitle.SelectedValue)),
                                                          new SqlParameter("@Station_SectionID", Convert.ToInt32(Session["Station_SectionID"])));
                            }
                            else
                            {
                                d = cmm.RunSP("PN18_galleryProc", "PRASARNETConnectionString", new SqlParameter("@sub", txtSub.Text.Trim()),
                                                          new SqlParameter("@PicFileName", savefile),
                                                          new SqlParameter("@PicDescription", txtdes.Text.Trim()),
                                                          new SqlParameter("@Pic_tobe_Display", false),
                                                          new SqlParameter("@UsertypeID", Convert.ToInt32(Session["Usertype"])),// usertype=usertypeid                                                          
                                                          new SqlParameter("@OrgID", Convert.ToInt32(Session["Orgid"])),
                                                          new SqlParameter("@CreatedBy", Convert.ToString(Session["UserName"])),
                                                          new SqlParameter("@flag", "1"),
                                                          new SqlParameter("@subtitleid", Convert.ToInt32(ddlsubtitle.SelectedValue)),
                                                          new SqlParameter("@imagepath", imagepath),
                                                          new SqlParameter("@Station_SectionID", Convert.ToInt32(Session["Station_SectionID"])));
                            }

                            if (d > 0)
                            {
                                clear();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Images in .jpeg and .jpg format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Try Again!!');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Choose a file to Upload!!');", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Dimensions of uploaded image is not matched!!');", true);
            }
            bindgrid();
        }

        protected void lnkdimensions_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('JPEG/JPG image with dimensions Height<= 720px and width<= 1280px and size <= 500Kb are allowed');", true);
        }
        // 1280 X 720
        protected void grdgallery_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int picid = (int)grdgallery.DataKeys[row.RowIndex].Value;
                ds = cmm.RunSQLReturnDS("Select PicFileName from PN18_Gallery where PicId=" + picid, "PRASARNETConnectionString");
                string picfilename = Convert.ToString(ds.Tables[0].Rows[0][0]);
                string path = Server.MapPath("~/Gallery/" + picfilename);
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    file.Delete();
                    i = cmm.RunSP("PN18_galleryProc", "PRASARNETConnectionString",
                                                      new SqlParameter("@picid", picid),
                                                      new SqlParameter("@flag", "5"));
                }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Image Deleted Sucessfully!!');", true);
                    bindgrid();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void grdgallery_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            bindgrid();
        }

        protected void grdgallery_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bindgrid();
        }

        protected void grdgallery_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdgallery.PageIndex = e.NewPageIndex;
            bindgrid();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txtSub.Text = "";
            txtdes.Text = "";
            ddlsubtitle.SelectedIndex = 0;
            FileUpload1.Attributes.Clear();
        }
    }
}