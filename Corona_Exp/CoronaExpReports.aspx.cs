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

namespace PrasarNet.Corona_Exp
{
    public partial class CoronaExpReports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);                   

                    gridbind();
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
                    {
                        StationSectionMenu.Visible = true;
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
                    else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
                    {
                        StationSectionMenu.Visible = true;
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

                }

            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }

        protected void grdexp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdexp.PageIndex = e.NewPageIndex;
            gridbind();
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("Pn18_corona_exp", "PRASARNETConnectionString",  new SqlParameter("@flag", 4));
            grdexp.DataSource = ds;
            grdexp.DataBind();

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdexp.AllowPaging = false;
                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdexp.RenderControl(hw);
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
                ClientScript.RegisterStartupScript(this.GetType(), "PrasarNet: GridPrint", sb.ToString());
                grdexp.AllowPaging = true;
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

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx", true);
        }
    }
}