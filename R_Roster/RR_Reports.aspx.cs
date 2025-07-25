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
    public partial class RR_Reports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../Logout.aspx");
            }
            else if ((Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3))
            {
                if (Convert.ToInt16(Session["Usertype"]) == 28)
                {
                    if (!IsPostBack)
                    {
                        ViewState["search"] = 0;
                        Label1.Text = Convert.ToString(Session["UserName"]);
                        cmm.bindDDLWidParam(ddldept, "PN18_RR_Deptt", "department", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                      new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--All--",
                                                                                                                   new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlzone, "PN18_RR_Zone", "zn", "ZoneID", "PRASARNETConnectionString", "--All--",
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
                            if (Convert.ToInt16(Session["Usertype"]) == 27)
                            {
                                StationSectionMenu.Visible = false;
                                AdminMenu.Visible = false;
                                //AdminMenuIT.Visible = true;
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
                                //AdminMenuIT.Visible = false;
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("../Logout.aspx");
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }

        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("PN18_ReservationRoster1", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", "2"));

            grddoc.DataSource = ds;
            grddoc.DataBind();
        }

        protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldept.SelectedIndex != 0)
            {
                if (ddldept.SelectedValue != "8")
                {
                    ds = cmm.RunSpReturnDSParam("PN18_RR_Deptt", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(ddldept.SelectedValue))
                                                                                           , new SqlParameter("@flag", 2));
                    int flag = 0, orgid, secORstn;
                    orgid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    secORstn = Convert.ToInt32(ds.Tables[0].Rows[0][2]);

                    if (secORstn == 1)
                    {
                        flag = 1;
                    }
                    else if (secORstn == 2)
                    {
                        flag = 2;
                    }
                    else if (secORstn == 3)
                    {
                        flag = 3;
                    }
                    else if (secORstn == 4)
                    {
                        flag = 4;
                    }
                    else if (secORstn == 5)
                    {
                        flag = 5;
                    }
                    cmm.bindDDLWidParam(ddlsection, "PN18_RR_section", "Expr1", "secstnid", "PRASARNETConnectionString", "--All--", new SqlParameter("@orgid", orgid),
                                                                                                                      new SqlParameter("@flag", flag));
                }
            }
            else
            {
                ddlsection.Items.Clear();
                ddlsection.SelectedIndex = -1;
                ddlsection.SelectedValue = null;
            }
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddoc.PageIndex = e.NewPageIndex;
            if (Convert.ToInt32(ViewState["search"]) == 0)
                gridbind();
            else
            {
                gridbindseacrh();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            ViewState["search"] = 1;
            try
            {

                gridbindseacrh();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);

            }
        }
        private void gridbindseacrh()
        {
            int usertypeid = 0, sec_stnid = 0, zoneid = 0, wingid = 0, desgnid = 0,deptid=0;
            if (ddldept.SelectedIndex != 0)
            {
                deptid = Convert.ToInt16(ddldept.SelectedValue);
                if (ddldept.SelectedValue == "1")
                    usertypeid = 26;
                else if (ddldept.SelectedValue == "2")
                    usertypeid = 25;

                else if (ddldept.SelectedValue == "3" || ddldept.SelectedValue == "11")
                    usertypeid = 20;

                else if (ddldept.SelectedValue == "4")
                    usertypeid = 12;

                else if (ddldept.SelectedValue == "5" || ddldept.SelectedValue == "6" || ddldept.SelectedValue == "12")
                    usertypeid = 11;

                else if (ddldept.SelectedValue == "9")
                    usertypeid = 22;
                else if (ddldept.SelectedValue == "10")
                {
                    ds = cmm.RunSpReturnDSParam("pn18_gre_fetchUsertype", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                     , new SqlParameter("@uid", Convert.ToInt32(ddlsection.SelectedValue)));
                    usertypeid = Convert.ToInt32(ds.Tables[0].Rows[0][0]); 
                }
                if (ddlsection.SelectedIndex != 0)
                {
                    sec_stnid = Convert.ToInt32(ddlsection.SelectedValue);
                }
            }

            if (ddlzone.SelectedIndex != 0)
            {
                zoneid = Convert.ToInt16(ddlzone.SelectedValue);
            }
            if (ddlwing.SelectedIndex != 0)
            {
                wingid = Convert.ToInt16(ddlwing.SelectedValue);
                if (ddldesgn.SelectedIndex != 0)
                {
                    desgnid = Convert.ToInt16(ddldesgn.SelectedValue);
                }
            }
            
            ds = cmm.RunSpReturnDSParam("PN18_ReservationRoster1", "PRASARNETConnectionString",
                                                                  new SqlParameter("@stationid", sec_stnid),
                                                                  new SqlParameter("@usertypeid", usertypeid),
                                                                  new SqlParameter("@zoneid", zoneid),
                                                                  new SqlParameter("@wingid", wingid),
                                                                  new SqlParameter("@designationid", desgnid),
                                                                  new SqlParameter("@deptid", deptid),
                                                                  new SqlParameter("@flag", "7"));

            grddoc.DataSource = ds;
            grddoc.DataBind();
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
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + str.Substring(0, (str.Length - 5)) + ".pdf");
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
                //try
                //{
                //string urlfixedpath = Server.MapPath("RRDocuments");
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rrid = (int)grddoc.DataKeys[row.RowIndex].Value;

                Label docname = row.FindControl("lbldocname") as Label;
                Session["RRLOPath"] = "RRDocuments/" + docname.Text;
                //string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"1000px\" height=\"700px\">";
                //embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                //embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                //embed += "</object>";
                //ltEmbed.Text = string.Format(embed, ResolveUrl(Session["RRLOPath"].ToString()));
                Response.Redirect("~/R_Roster/RR_DocumentView.aspx", true);
                //}
                //catch (Exception ex)
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                //}
                //grddoc.Focus();
            }
        }

        protected void ddlwing_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--All--", new SqlParameter("@wingid", ddlwing.SelectedValue));
            ddldesgn.Focus();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            ddlwing.SelectedIndex = 0;
            ddldesgn.Items.Clear();
            ddldesgn.SelectedIndex = -1;
            ddldesgn.SelectedValue = null;

            ddldept.SelectedIndex = 0;
            ddlsection.Items.Clear();
            ddlsection.SelectedIndex = -1;
            ddlsection.SelectedValue = null;

            ddlzone.SelectedIndex = 0;
            gridbind();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grddoc.AllowPaging = false;
            if (Convert.ToInt32(ViewState["search"]) == 0)
                gridbind();
            else
            {
                gridbindseacrh();
            }
            grddoc.UseAccessibleHeader = true;
            grddoc.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            //sb.Append("printWin.document.title = newTitle");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "PrasarNet-Prasar Bharati", sb.ToString());
            grddoc.AllowPaging = true;
            if (Convert.ToInt32(ViewState["search"]) == 0)
                gridbind();
            else
            {
                gridbindseacrh();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}