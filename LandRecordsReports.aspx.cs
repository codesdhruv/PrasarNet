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
using System.Data.SqlTypes;
using System.Collections;
using System.Web.Services;
using System.Web.Configuration;
using PrasarNet.BLL;
using System.Collections.Generic;
using System.Text;

namespace PrasarNet
{
    public partial class LandRecordsReports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
            {
                divmonthlystationreports.Visible = false;
                divmonthlystationreportsforadg.Visible = false;
                if (!IsPostBack)
                {
                    ViewState["search"] = "";
                    if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
                    {
                        divlandrecords.Visible = true;
                    }
                    else
                    {
                        divlandrecords.Visible = false;
                    }
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    cmm.bindDDLWidParam(ddlorgsearch, "PN18_LR_orgProc", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--All--",
                                                                                                         new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlzone, "PN18_Zone", "ShortCode", "IT_ZONEID", "PRASARNETConnectionString", "--All--",
                                                                                                     new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlsitesearch, "PN18_LR_SiteFor", "sitefor", "Id", "PRASARNETConnectionString", "--All--",
                                                                                                        new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlhold, "PN18_LR_hold", "HoldType", "Id", "PRASARNETConnectionString", "--All--",
                                                                                                 new SqlParameter("@flag", 1));

                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandRecordEntry.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            divgrd.Visible = true;
            gridbind();
            grdexp.Focus();
        }
        private void gridbind()
        {
            try
            {
                int orgid = 0, disid = 0, stateid = 0, siteid = 0, locationid = 0, zoneid = 0, holdid = 0;
                if (ddlorgsearch.SelectedIndex != 0)
                {
                    orgid = Convert.ToInt16(ddlorgsearch.SelectedValue);
                }
                if (ddlhold.SelectedIndex != 0)
                {
                    holdid = Convert.ToInt32(ddlhold.SelectedValue);
                }
                if (ddlzone.SelectedIndex != 0)
                {
                    zoneid = Convert.ToInt16(ddlzone.SelectedValue);
                    if (ddlstatesearch.SelectedIndex != 0)
                    {
                        stateid = Convert.ToInt16(ddlstatesearch.SelectedValue);
                        if (ddldistrictsearch.SelectedIndex != 0)
                        {
                            disid = Convert.ToInt16(ddldistrictsearch.SelectedValue);
                            if (ddllocation.SelectedIndex != 0)
                            {
                                locationid = Convert.ToInt32(ddllocation.SelectedValue);
                            }
                        }
                    }
                }
                if (ddlsitesearch.SelectedIndex != 0)
                {
                    siteid = Convert.ToInt16(ddlsitesearch.SelectedValue);
                }
                Boolean? verify = null;
                if (ddlverify.SelectedValue == "1")
                {
                    verify = true;
                }
                else if (ddlverify.SelectedValue == "0")
                    verify = false;
                string enc = "", boundary = "", comment = "", tax = "";
                if (ddlenc.SelectedValue == "1")
                    enc = "Yes";
                else if (ddlenc.SelectedValue == "0")
                    enc = "No";

                if (ddlstatusofBoundary.SelectedValue == "1")
                    boundary = "Yes";
                else if (ddlstatusofBoundary.SelectedValue == "0")
                    boundary = "No";

                if (ddlcomment.SelectedValue == "1")
                    comment = "Yes";
                else if (ddlcomment.SelectedValue == "0")
                    comment = "No";

                if (ddltax.SelectedValue == "1")
                    tax = "Yes";
                else if (ddltax.SelectedValue == "0")
                    tax = "No";

                ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@IsVerified", verify)
                                                                                            , new SqlParameter("@ZoneId", zoneid)
                                                                                            , new SqlParameter("@stateid", stateid)
                                                                                            , new SqlParameter("@districtid", disid)
                                                                                            , new SqlParameter("@locationid", locationid)
                                                                                            , new SqlParameter("@orgid", orgid)
                                                                                            , new SqlParameter("@Enchrochment", enc)
                                                                                            , new SqlParameter("@CommentsOfRetiredRevenueOfficer", comment)
                                                                                            , new SqlParameter("@StatusOfBoundaryWall", boundary)
                                                                                            , new SqlParameter("@holdid", holdid)
                                                                                            , new SqlParameter("@siteforid", siteid)
                                                                                            , new SqlParameter("@StatusofSC_PT_leivedbyMun_locadm", tax)
                                                                                            , new SqlParameter("@flag", "5"));
                grdexp.DataSource = ds;
                grdexp.DataBind();
                divresults.Visible = true;
                int count = cmm.RunSPReturnCountParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@IsVerified", verify)
                                                                                      , new SqlParameter("@ZoneId", zoneid)
                                                                                      , new SqlParameter("@stateid", stateid)
                                                                                      , new SqlParameter("@districtid", disid)
                                                                                      , new SqlParameter("@locationid", locationid)
                                                                                      , new SqlParameter("@orgid", orgid)
                                                                                      , new SqlParameter("@Enchrochment", enc)
                                                                                      , new SqlParameter("@CommentsOfRetiredRevenueOfficer", comment)
                                                                                      , new SqlParameter("@StatusOfBoundaryWall", boundary)
                                                                                      , new SqlParameter("@holdid", holdid)
                                                                                      , new SqlParameter("@siteforid", siteid)
                                                                                      , new SqlParameter("@StatusofSC_PT_leivedbyMun_locadm", tax)
                                                                                      , new SqlParameter("@flag", "6"));
                lblresults.Text = count.ToString();
                grdexp.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        protected void btnclearsearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdexp.AllowPaging = false;
                //grdgemprocDetails.Columns[0].Visible = false;

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
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
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

        protected void grdexp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdexp.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddlstatesearch, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--All--",
                                                                                                          new SqlParameter("@zoneid", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 1));
        }

        protected void ddlstatesearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddldistrictsearch, "PN18_District", "DistrictName", "DistrictId", "PRASARNETConnectionString", "--All--",
                                                                                                          new SqlParameter("@stateid", Convert.ToInt16(ddlstatesearch.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 1));
        }

        protected void ddldistrictsearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddllocation, "PN18_LR_Locations", "LocationName", "LocationId", "PRASARNETConnectionString", "--All--",
                                                                                                                      new SqlParameter("@districtid", Convert.ToInt32(ddldistrictsearch.SelectedValue)),
                                                                                                                      new SqlParameter("@flag", 9));
        }

        protected void grdexp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                Label id = (Label)e.Row.FindControl("lbllandid");
                Label lblmap = (Label)e.Row.FindControl("lblmap");
                Label lblpapers = (Label)e.Row.FindControl("lblpapers");
                int map = 0,paper=0;

                map = cmm.RunSPReturnCountParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(id.Text))
                                                                                      , new SqlParameter("@flag", "7"));
                paper = cmm.RunSPReturnCountParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(id.Text))
                                                                                      , new SqlParameter("@flag", "8"));
                if(map>0)
                {
                    lblmap.Text = "Available";
                    lblmap.ForeColor = System.Drawing.Color.Blue;
                    lblmap.Font.Bold = true;
                    lblmap.CssClass = "fontingrid";
                }
                else
                {
                    lblmap.Text = "Not-Available";
                    lblmap.ForeColor = System.Drawing.Color.Red;
                    lblmap.Font.Bold = true;
                    lblmap.CssClass = "fontingrid";
                }
                if (paper > 0)
                {
                    lblpapers.Text = "Available";
                    lblpapers.ForeColor = System.Drawing.Color.Blue;
                    lblpapers.Font.Bold = true;
                    lblpapers.CssClass = "fontingrid";
                }
                else
                {
                    lblpapers.Text = "Not-Available";
                    lblpapers.ForeColor = System.Drawing.Color.Red;
                    lblpapers.Font.Bold = true;
                    lblpapers.CssClass = "fontingrid";
                }
            }
        }
    }
}