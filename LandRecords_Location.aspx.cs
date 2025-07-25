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
    public partial class LandRecords_Location : System.Web.UI.Page
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

                    cmm.bindDDLWidParam(ddlorg, "PN18_LR_orgProc", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--Select--",
                                                                                                         new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--Select--",
                                                                                                          new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlsiteusedfor, "PN18_LR_SiteFor", "sitefor", "Id", "PRASARNETConnectionString", "--Select--",
                                                                                                        new SqlParameter("@flag", 1));
                    gridbind();
                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlstate.SelectedIndex != 0)
            {
                cmm.bindDDLWidParam(ddldistrict, "PN18_District", "DistrictName", "DistrictId", "PRASARNETConnectionString", "--Select--",
                                                                                                              new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                                              new SqlParameter("@flag", 1));
            }
        }

        protected void ddlsiteusedfor_SelectedIndexChanged(object sender, EventArgs e)
        {
            string siteid = ddlsiteusedfor.SelectedValue.Trim();
            string sitename = ddlsiteusedfor.SelectedItem.Text;
            lstsiteusedfor.Items.Add(new ListItem(sitename, siteid));
            ddlsiteusedfor.SelectedIndex = 0;
            ddlsiteusedfor.Focus();

            for (int i = lstsiteusedfor.Items.Count - 1; i >= 0; i--)
            {
                string id = lstsiteusedfor.Items[i].Value;
                ddlsiteusedfor.Items.FindByValue(id).Enabled = false;
            }
        }

        protected void txtlocation_TextChanged(object sender, EventArgs e)
        {
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_LR_SiteFor", "PRASARNETConnectionString", new SqlParameter("@stateid", Convert.ToInt32(ddlstate.SelectedItem.Value)),
                                                                                       new SqlParameter("@districtid", Convert.ToInt32(ddlstate.SelectedItem.Value)),
                                                                                       new SqlParameter("@location", txtlocation.Text.Trim()),
                                                                                       new SqlParameter("@flag", 2));
            int n = Convert.ToInt32(ds1.Tables[0].Rows.Count);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < n; i++)
                {
                    string row = ds1.Tables[0].Rows[i][0].ToString();
                    ddlsiteusedfor.Items.FindByValue(row).Enabled = false;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            for (int i = lstsiteusedfor.Items.Count - 1; i >= 0; i--)
            {
                string id = lstsiteusedfor.Items[i].Value;
                if (lstsiteusedfor.Items[i].Selected)
                {
                    lstsiteusedfor.Items.Remove(lstsiteusedfor.Items[i]);
                }
                ddlsiteusedfor.Items.FindByValue(id).Enabled = true;
            }
        }
        public string getsitefor_string()
        {

            string str = "";
            foreach (ListItem liItem in lstsiteusedfor.Items)
                str += liItem.Value + ",";
            str = str.Substring(0, str.Length);
            return str;

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                if (lstsiteusedfor.Items.Count > 0)
                {
                    int i;
                    string siteforid = getsitefor_string();

                    i = cmm.RunSP("PN18_LR_Locations", "PRASARNETConnectionString", new SqlParameter("@siteusedforidString", siteforid),
                                                                                        new SqlParameter("@districtid", Convert.ToInt32(ddldistrict.SelectedValue)),
                                                                                        new SqlParameter("@LocationName", txtlocation.Text.Trim()),
                                                                                        new SqlParameter("@ip", ip),
                                                                                        new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                        new SqlParameter("@orgid", Convert.ToInt16(ddlorg.SelectedValue)),
                                                                                        new SqlParameter("@flag", "6"));
                    if (i > 0)
                    {
                        clear();
                        gridbind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Location(s) added successfully..');", true);
                        grdexp.Focus();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please select atleast one option from the 'site/location used for'.. );", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Please,Try Again!!');", true);
            }
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("PN18_LR_Locations", "PRASARNETConnectionString", new SqlParameter("@flag", "7"));
            grdexp.DataSource = ds;
            grdexp.DataBind();
        }
        private void clear()
        {
            ddlorg.SelectedIndex = 0;
            ddlstate.SelectedIndex = 0;
            ddldistrict.Items.Clear();
            ddldistrict.SelectedIndex = -1;
            ddldistrict.SelectedValue = null;
            txtlocation.Text = "";
            lstsiteusedfor.Items.Clear();

        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandRecordEntry.aspx", true);
        }

        protected void grdexp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdexp.PageIndex = e.NewPageIndex;
            if (ViewState["search"].ToString() == "search")
                search();
            else
                gridbind();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdexp.AllowPaging = false;
                grdexp.Columns[6].Visible = false;
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
                ClientScript.RegisterStartupScript(this.GetType(), "Land Location- PrasarNet ", sb.ToString());
                grdexp.AllowPaging = true;
                grdexp.Columns[6].Visible = true;
                gridbind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            ViewState["search"] = "search";
            divgrd.Visible = true;
            search();
        }
        private void search()
        {
            try
            {
                int orgid = 0, disid = 0, stateid = 0, siteid = 0;
                string loc = txtlocsearch.Text.Trim();
                if (ddlorgsearch.SelectedIndex != 0)
                {
                    orgid = Convert.ToInt16(ddlorgsearch.SelectedValue);
                }
                if (ddlstatesearch.SelectedIndex != 0)
                {
                    stateid = Convert.ToInt16(ddlstatesearch.SelectedValue);
                    if (ddldistrictsearch.SelectedIndex != 0)
                    {
                        disid = Convert.ToInt16(ddldistrictsearch.SelectedValue);
                    }
                }
                if (ddlsitesearch.SelectedIndex != 0)
                {
                    siteid = Convert.ToInt16(ddlsitesearch.SelectedValue);
                }
                ds = cmm.RunSpReturnDSParam("PN18_LR_Locations", "PRASARNETConnectionString", new SqlParameter("@orgid", orgid)
                                                                                            , new SqlParameter("@stateid", stateid)
                                                                                            , new SqlParameter("@districtid", disid)
                                                                                            , new SqlParameter("@siteusedforid", siteid)
                                                                                            , new SqlParameter("@LocationName", loc)
                                                                                            , new SqlParameter("@flag", "8"));
                grdexp.DataSource = ds;
                grdexp.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void lnksearch_Click(object sender, EventArgs e)
        {
            divsearch.Visible = true;
            diventry.Visible = false;
            divgrd.Visible = false;
            txtlocsearch.Focus();
            cmm.bindDDLWidParam(ddlorgsearch, "PN18_LR_orgProc", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--Select--",
                                                                                                      new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlstatesearch, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--Select--",
                                                                                                  new SqlParameter("@flag", 2));
            cmm.bindDDLWidParam(ddlsitesearch, "PN18_LR_SiteFor", "sitefor", "Id", "PRASARNETConnectionString", "--Select--",
                                                                                                new SqlParameter("@flag", 1));
        }

        protected void ddlstatesearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlstatesearch.SelectedIndex != 0)
            {
                cmm.bindDDLWidParam(ddldistrictsearch, "PN18_District", "DistrictName", "DistrictId", "PRASARNETConnectionString", "--Select--",
                                                                                                      new SqlParameter("@stateid", Convert.ToInt16(ddlstatesearch.SelectedValue)),
                                                                                                      new SqlParameter("@flag", 1));
            }
        }

        protected void grdexp_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdexp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grdexp_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            divsearch.Visible = false;
            diventry.Visible = true;
            divgrd.Visible = true;
            ddlstate.Focus();
        }
    }
}