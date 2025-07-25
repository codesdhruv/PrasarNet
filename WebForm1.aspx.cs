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
    public partial class WebForm1 : System.Web.UI.Page
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
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12)// station and Section
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// management
                    {

                        if (Convert.ToInt16(Session["Usertype"]) == 27)//PBIT
                        {
                            divapprove.Visible = true;
                            divmotquote.Visible = true;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else
                        {
                            divmotquote.Visible = false;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                        if (Convert.ToInt16(Session["Usertype"]) == 14)// Add CEO-Message Button Visible
                        {
                            divceo.Visible = true;
                            divdgair.Visible = false;
                            divdgdd.Visible = false;
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 15)//dgdd
                        {
                            divceo.Visible = false;
                            divdgair.Visible = false;
                            divdgdd.Visible = true;
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 16)//dgair
                        {
                            divceo.Visible = false;
                            divdgair.Visible = true;
                            divdgdd.Visible = false;
                        }
                        else
                        {
                            divceo.Visible = false;
                            divdgair.Visible = false;
                            divdgdd.Visible = false;
                        }
                    }
                    lbluser.Text = Convert.ToString(Session["UserName"]);
                    bindslide();
                    DataSet ds2 = new DataSet();
                    ds2 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 14),
                                                                                        new SqlParameter("@flag", 8));
                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds2.Tables[0].Rows[0][3]).Trim().Length > 0)
                        {
                            divviewdoc.Visible = true;
                        }
                        else
                        {
                            divviewdoc.Visible = false;
                        }
                        int msgid = Convert.ToInt32(ds2.Tables[0].Rows[0][1]);
                        ViewState["msgidv"] = msgid;
                        lblceomessage.Text = Convert.ToString(ds2.Tables[0].Rows[0][0]);
                    }
                    DataSet ds3 = new DataSet();

                    ds3 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 15),
                                                                                        new SqlParameter("@flag", 8));
                    if (ds3.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds3.Tables[0].Rows[0][3]).Trim().Length > 0)
                        {
                            divviewdgdd.Visible = true;
                        }
                        else
                        {
                            divviewdgdd.Visible = false;
                        }
                        lbldgdd.Text = Convert.ToString(ds3.Tables[0].Rows[0][0]);
                        int msgid2 = Convert.ToInt32(ds3.Tables[0].Rows[0][1]);
                        ViewState["msgidvdgdd"] = msgid2;
                    }
                    DataSet ds4 = new DataSet();
                    ds4 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@usertypeid", 16),
                                                                           new SqlParameter("@flag", 8));
                    if (ds4.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToString(ds4.Tables[0].Rows[0][3]).Trim().Length >0)
                        {
                            divviewdgair.Visible = true;
                        }
                        else
                        {
                            divviewdgair.Visible = false;
                        }
                        lbldgair.Text = Convert.ToString(ds4.Tables[0].Rows[0][0]);
                        int msgid3 = Convert.ToInt32(ds4.Tables[0].Rows[0][1]);
                        ViewState["msgidvdgair"] = msgid3;
                    }

                    DataSet ds5 = new DataSet();
                    ds5 = cmm.RunSpReturnDSParam("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@flag", 5));
                    if (ds5.Tables[0].Rows.Count > 0)
                        lblquote.Text = Convert.ToString(ds5.Tables[0].Rows[0][1]);
                }
            }

        }
        public void bindslide() // for binding of crousel
        {
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                      new SqlParameter("@flag", "3"));
            if (ds1.Tables[0].Rows.Count != 0)
            {
                Rgallary.DataSource = ds1;
                Rgallary.DataBind();
            }
        }
        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string max = cmm.SelectMaxId("select max(cid) from PN18_tblcalender", "PRASARNETConnectionString");
                int RowID = Convert.ToInt32(max);
                if (max != "")
                {
                    ds = cmm.RunSQLReturnDS("Select calendername from PN18_tblcalender where cid=" + RowID, "PRASARNETConnectionString");
                    string calendername = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=PBCalender.pdf");
                    Response.WriteFile(Server.MapPath("~/Calender/" + ds.Tables[0].Rows[0][0].ToString()));
                    Response.End();
                    //string paths = "Calender/" + calendername;
                    //Response.Redirect("showDocument.aspx", false);
                    //Session["showDocFilePath"] = paths;// Holds the path of the file..

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('No Calender to Download!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MonthlyRetirements.aspx");
        }

        protected void Image2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("birthday.aspx");
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEOMessage.aspx");
        }

        protected void lnkdgair_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEOMessage.aspx");
        }

        protected void lnkdgdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEOMessage.aspx");
        }

        protected void lnkhere_Click(object sender, EventArgs e)
        {
            Response.Redirect("MotivationalQuote.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Approve.aspx");
        }

        protected void lnkviewdoc_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidv"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=CEOMessage.pdf");
                    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }

        protected void lnkviewdgair_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidvdgair"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=DGAIRMessage.pdf");
                    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }

        protected void lnkviewdgdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds1 = new DataSet();
                ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", Convert.ToInt32(ViewState["msgidvdgdd"])),
                                                                                              new SqlParameter("@flag", 4));

                string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows[0][3].ToString() != "")
                {
                     Response.Clear();
    Response.ContentType = "application/octet-stream";
    Response.AddHeader("Content-Disposition", "attachment; filename=DGDD.pdf");
    Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
    Response.End();


                    //Response.Clear();
                    //Response.ContentType = "CEO_Docs/";
                    //Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][3].ToString());
                    //Response.Write("thanks god, finally file got downloaded.");
                    //Response.End();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
        }

    }
}



//Response.Redirect("showDocument.aspx")

//Session("showDocFilePath") - Holds the path of the file..

//****************showDocument.aspx***********************

//Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

//        Dim filePath As String = Session("showDocFilePath")
//        System.Web.HttpContext.Current.Response.Clear()
//        System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" & fileName)

//        System.Web.HttpContext.Current.Response.ContentType = "application/pdf"
//        Try
//            System.Web.HttpContext.Current.Response.TransmitFile(Server.MapPath(filePath))
//            'System.Web.HttpContext.Current.Response.Redirect(Server.MapPath(lb.CommandArgument))
//        Catch ex As Exception

//        End Try


//        System.Web.HttpContext.Current.Response.End()

//    End Sub