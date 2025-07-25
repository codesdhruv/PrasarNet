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
    public partial class Policies : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("Logout.aspx");
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
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station section
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
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// mnagement
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
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    ds = cmm.RunSpReturnDSParam("PN18_Policytyp", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                    rblpoltyp.DataSource = ds;
                    rblpoltyp.DataTextField = "PolicyType";
                    rblpoltyp.DataValueField = "ptypid";
                    rblpoltyp.DataBind();
                    rblpoltyp.SelectedIndex = 0;
                    
                    ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                                new SqlParameter("@typeid", "1"));
                    grdpolicy.DataSource = ds;
                    grdpolicy.DataBind();
                    lblcat.Text = "Admin";
                }
            }
             else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void rblpoltyp_SelectedIndexChanged(object sender, EventArgs e)
        {
            divgrd.Visible = true;
            ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                        new SqlParameter("@typeid", Convert.ToInt32(rblpoltyp.SelectedValue)));
            grdpolicy.DataSource = ds;
            grdpolicy.DataBind();
            lblcat.Text = rblpoltyp.SelectedItem.Text;
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void grdpolicy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int polid = (int)grdpolicy.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "3"),
                                                   new SqlParameter("@policyid", polid));


                string paths = Server.MapPath("~/Policies/" + ds1.Tables[0].Rows[0][6].ToString());
                //Response.Redirect(paths);
                //if (ds1.Tables[0].Rows[0][0].ToString() != "")
                //{
                FileInfo file = new FileInfo(paths);
                //if (ds1.Tables[0].Rows.Count != 0)
                if (file.Exists)
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=DownloadPolicy.pdf");
                    Response.WriteFile(Server.MapPath("~/Policies/" + ds1.Tables[0].Rows[0][6].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no Policy to download!!');", true);

            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdpolicy.AllowPaging = false;
                
                ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                      new SqlParameter("@typeid", Convert.ToInt32(rblpoltyp.SelectedValue)));
                grdpolicy.DataSource = ds;
                grdpolicy.DataBind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdpolicy.RenderControl(hw);
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
                grdpolicy.AllowPaging = true;             
                ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                      new SqlParameter("@typeid", Convert.ToInt32(rblpoltyp.SelectedValue)));
                grdpolicy.DataSource = ds;
                grdpolicy.DataBind();
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

        protected void grdpolicy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdpolicy.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
                                                                                       new SqlParameter("@typeid", Convert.ToInt32(rblpoltyp.SelectedValue)));
            grdpolicy.DataSource = ds;
            grdpolicy.DataBind();
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }
    }
}