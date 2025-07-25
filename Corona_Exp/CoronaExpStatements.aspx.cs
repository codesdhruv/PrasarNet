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
    public partial class CoronaExpStatements : System.Web.UI.Page
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

                    cmm.bindDDLWidParam(ddlfinyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select--",
                                                                                                        new SqlParameter("@flag", 1));

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
        private void clear()
        {
            ddlfinyear.SelectedIndex = 0;
            txtexponmasks_PPE.Text = "";
            txtofficial.Text = "";
            txttotalexp.Text = "";
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("Pn18_corona_exp", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                       new SqlParameter("@station_sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                       new SqlParameter("@flag", 5));
            grdexp.DataSource = ds;
            grdexp.DataBind();

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string ipaddress = cmm.GetIp_Priyank();
            int i = 0;
            int flag = 0;
            if (btnsubmit.Text != "Update")
            {
                flag = 1;
            }
            else
            {
                flag = 2;
            }
            i = cmm.RunSP("Pn18_corona_exp", "PRASARNETConnectionString", new SqlParameter("@financialyearid", Convert.ToInt32(ddlfinyear.SelectedItem.Value)),
                                                                            new SqlParameter("@OfficialTotalExp", Convert.ToDecimal(txtofficial.Text.Trim())),
                                                                            new SqlParameter("@total_capital_exp_incurred_finyear", Convert.ToDecimal(txttotalexp.Text.Trim())),
                                                                            new SqlParameter("@exp_on_procurement_masks_n_PPE", Convert.ToDecimal(txtexponmasks_PPE.Text.Trim())),
                                                                            new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                            new SqlParameter("@station_sectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                            new SqlParameter("@IPaddress", ipaddress),
                                                                            new SqlParameter("@flag", flag),
                                                                            new SqlParameter("@id", Convert.ToInt32(ViewState["id"])));
            if (i > 0)
            {
                if (btnsubmit.Text != "Update")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Submitted Successfully!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Updated Successfully!!');", true);
                    btnsubmit.Text = "Submit";
                    btncncl.Text = "Clear";
                    Button1.Visible = true;
                    divexpentry.Visible = true;
                    divgrd.Visible = true;
                }
                clear();
                gridbind();
                grdexp.Focus();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void grdexp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdexp.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grdexp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                btnsubmit.Text = "Update";
                btncncl.Text = "Cancel";
                Button1.Visible = false;
                divexpentry.Visible = true;
                divgrd.Visible = false;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int id = (int)grdexp.DataKeys[row.RowIndex].Value;
                ViewState["id"] = id;
                ds = cmm.RunSpReturnDSParam("Pn18_corona_exp", "PRASARNETConnectionString", new SqlParameter("@flag", 6)
                                                                                    , new SqlParameter("@id", id));
                ddlfinyear.ClearSelection();
                ddlfinyear.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;
                txtofficial.Text = ds.Tables[0].Rows[0][1].ToString();
                txttotalexp.Text = ds.Tables[0].Rows[0][2].ToString();
                txtexponmasks_PPE.Text = ds.Tables[0].Rows[0][3].ToString();
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            if (btncncl.Text == "Clear")
            {
                clear();
            }
            else
            {
                btnsubmit.Text = "Submit";
                btncncl.Text = "Clear";
                Button1.Visible = true;
                divexpentry.Visible = true;
                divgrd.Visible = true;
                clear();
            }
        }

        protected void grdexp_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdexp_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void grdexp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void Unnamed9_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/Corona_Exp/Documents/ParliamentQuestionU1945.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "ParliamentQuestionU1945.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }
        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdexp.AllowPaging = false;
                grdexp.Columns[5].Visible = false;

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
                grdexp.Columns[5].Visible = true;
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