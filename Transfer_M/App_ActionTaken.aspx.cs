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

namespace PrasarNet.Transfer_M
{
    public partial class App_ActionTaken : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        string cont = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10 || Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//employee/sections/stations
            {
                
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        gridbind();
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)
                    {
                        gridbind();
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
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
                            ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                       new SqlParameter("@flag", 1));
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
                        {
                            divmonthlystationreports.Visible = false;
                            divmonthlystationreportsforadg.Visible = false;
                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244) || (Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 242))
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
                            ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                      new SqlParameter("@flag", 4));
                        }

                    }
                    else
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

                    }

                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        private void gridbind()
        {
            int offc_empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                offc_empid = Convert.ToInt32(Session["empid"]);
            }
            else
            {
                offc_empid = Convert.ToInt32(Session["Station_SectionID"]);
            }
            ds = cmm.RunSpReturnDSParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 6),
                                                                                          new SqlParameter("@dealingOffc", offc_empid),
                                                                                          new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
            grdapplications.DataSource = ds;
            grdapplications.DataBind();
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/Transfer.aspx");
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdapplications.AllowPaging = false;
                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdapplications.RenderControl(hw);
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
                ClientScript.RegisterStartupScript(this.GetType(), "Report Print", sb.ToString());
                grdapplications.AllowPaging = true;
                gridbind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }

        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            gridbind();
        }
        private void bindapplicationTrack()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Track", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                  , new SqlParameter("@basid", Convert.ToInt32(ViewState["basid_popup_track"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdtrack.DataSource = dsedu;
                grdtrack.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdtrack.DataSource = dsedu;
                grdtrack.DataBind();
                int columncount = grdtrack.Rows[0].Cells.Count;
                grdtrack.Rows[0].Cells.Clear();
                grdtrack.Rows[0].Cells.Add(new TableCell());
                grdtrack.Rows[0].Cells[0].ColumnSpan = columncount;
                grdtrack.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindapplicationTrack_view()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Track", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                  , new SqlParameter("@basid", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdviewtrack_.DataSource = dsedu;
                grdviewtrack_.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdviewtrack_.DataSource = dsedu;
                grdviewtrack_.DataBind();
                int columncount = grdviewtrack_.Rows[0].Cells.Count;
                grdviewtrack_.Rows[0].Cells.Clear();
                grdviewtrack_.Rows[0].Cells.Add(new TableCell());
                grdviewtrack_.Rows[0].Cells[0].ColumnSpan = columncount;
                grdviewtrack_.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void grdapplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Trackinfo")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblappNo = row.FindControl("lblappNo") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup_track"] = lblbasicid.Text;
                    mpetrack.Show();
                    bindapplicationTrack();

                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName == "GetaPdf")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup"] = lblbasicid.Text;
                    mpe1.Show();
                    bind_prev_Info();
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                    bindapplicationTrack_view();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void grdapplications_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg3.Visible = true;
                lblmsg3.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                panelprint.RenderControl(hw);
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
                ClientScript.RegisterStartupScript(this.GetType(), "Application", sb.ToString());
                divmsg3.Visible = false;
                lblmsg3.Text = "";
                mpe1.Show();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                mpe1.Show();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void grdviewtrack_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Action_Docs/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdviewtrack_.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("[PN21_Trans_Track]", "PRASARNETConnectionString", new SqlParameter("@flag", "2"),
                                                                                                                new SqlParameter("@trnid", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindapplicationTrack_view();
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }
                        bindapplicationTrack();
                    }
                    else
                    {
                        bindapplicationTrack_view();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindapplicationTrack_view();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdviewtrack_.Focus();
                mpe1.Show();
            }
        }

        protected void grdhealth_pre_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth_pre.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_THealthcategoryPWDSD", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                                new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                Bind_Healthcategorygrid_prev();
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        Bind_Healthcategorygrid_prev();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    Bind_Healthcategorygrid_prev();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdhealth_pre.Focus();
                mpe1.Show();
            }
        }
        private void Bind_Healthcategorygrid_prev()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_THealthcategoryPWDSD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "4");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
                    cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(ViewState["basid_popup"]));

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            grdhealth_pre.DataSource = ds;
                            grdhealth_pre.DataBind();



                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            grdhealth_pre.DataSource = ds;
                            grdhealth_pre.DataBind();
                            int columnsCount = grdhealth_pre.Columns.Count - 1;
                            grdhealth_pre.Rows[0].Cells.Clear();
                            grdhealth_pre.Rows[0].Cells.Add(new TableCell());
                            grdhealth_pre.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            grdhealth_pre.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            grdhealth_pre.Rows[0].Cells[0].Font.Bold = true;
                            grdhealth_pre.Rows[0].Cells[0].Font.Size = 10;
                            grdhealth_pre.Rows[0].Cells[0].Text = "No Record(s) Found...";
                            grdhealth_pre.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }
        protected void grdUpload_pre_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdUpload_pre.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString",
                                                                                                       new SqlParameter("@flag", "5"),
                                                                                                       new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][5]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][5].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][5].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][5].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgridupload_prev();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgridupload_prev();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgridupload_prev();
                    //lblResultUpload.Text = "Some Issue occured while downloading a document.Try Again!!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdUpload_pre.Focus();
                mpe1.Show();
            }
        }
        private void bindgridupload_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 6)
                                                                 , new SqlParameter("@bid", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdUpload_pre.DataSource = dsedu;
                grdUpload_pre.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdUpload_pre.DataSource = dsedu;
                grdUpload_pre.DataBind();
                int columncount = grdUpload_pre.Rows[0].Cells.Count;
                grdUpload_pre.Rows[0].Cells.Clear();
                grdUpload_pre.Rows[0].Cells.Add(new TableCell());
                grdUpload_pre.Rows[0].Cells[0].ColumnSpan = columncount;
                grdUpload_pre.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bind_prev_Info()
        {
            int id = 0;
            id = Convert.ToInt32(ViewState["basid_popup"]);

            ds = cmm.RunSpReturnDSParam("PN21_Tran_EmpAppliaction", "PRASARNETConnectionString", new SqlParameter("@flag", 4),
                                                                                  new SqlParameter("@id", id));
            Label4.Text = ds.Tables[0].Rows[0][2].ToString();
            lblname_pre.Text = ds.Tables[0].Rows[0][32].ToString();
            lblDOB_pre.Text = ds.Tables[0].Rows[0][33].ToString();
            lblDesgn_Pre.Text = ds.Tables[0].Rows[0][34].ToString();
            lblcontact_pre.Text = ds.Tables[0].Rows[0][35].ToString();
            lblemail_pre.Text = ds.Tables[0].Rows[0][36].ToString();
            lblpresent_pre.Text = ds.Tables[0].Rows[0][37].ToString();
            lblDOJ_Pre.Text = ds.Tables[0].Rows[0][38].ToString();
            lblnoofYears_pre.Text = ds.Tables[0].Rows[0][39].ToString();
            lblDOS_Pre.Text = ds.Tables[0].Rows[0][40].ToString();
            lblpresent_Place_Ten_Pre.Text = ds.Tables[0].Rows[0][41].ToString();
            lblten_Years_Pre.Text = ds.Tables[0].Rows[0][42].ToString();
            lbldays_remain_Pre.Text = ds.Tables[0].Rows[0][43].ToString();
            lbldaysexceed_pre.Text = ds.Tables[0].Rows[0][44].ToString();

            lbllanguage_pre.Text = ds.Tables[0].Rows[0][3].ToString();
            lblapplicationfwd_pre.Text = ds.Tables[0].Rows[0][18].ToString();

            lblstate1_pre.Text = ds.Tables[0].Rows[0][20].ToString();
            lblCity1_Pre.Text = ds.Tables[0].Rows[0][19].ToString();

            lblstate2_pre.Text = ds.Tables[0].Rows[0][22].ToString();
            lblcity2_pre.Text = ds.Tables[0].Rows[0][21].ToString();

            lblstate3_Pre.Text = ds.Tables[0].Rows[0][24].ToString();
            lblCity3_Pre.Text = ds.Tables[0].Rows[0][23].ToString();

            lblstateop1_pre.Text = ds.Tables[0].Rows[0][26].ToString();
            lblcityop1_pre.Text = ds.Tables[0].Rows[0][25].ToString();

            lblstateop2_pre.Text = ds.Tables[0].Rows[0][28].ToString();
            lblcityop2_pre.Text = ds.Tables[0].Rows[0][27].ToString();

            lblstateop3_pre.Text = ds.Tables[0].Rows[0][30].ToString();
            lblcityop3_pre.Text = ds.Tables[0].Rows[0][29].ToString();

            lblreason_selc_None_Pre.Text = ds.Tables[0].Rows[0][8].ToString();

            lblhometown_pre.Text = ds.Tables[0].Rows[0][4].ToString();
            lblgrnd_pre.Text = ds.Tables[0].Rows[0][31].ToString();
            lblsub_pre.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldetails_pre.Text = ds.Tables[0].Rows[0][14].ToString();
            lblmedicalgrnd_pre.Text = ds.Tables[0].Rows[0][15].ToString();
            lblreadyTrans_ben_Pre.Text = ds.Tables[0].Rows[0][16].ToString();
            lblappempid.Text = ds.Tables[0].Rows[0][45].ToString();

        }
        private void bindgrid_Training_prev()
        {
            DataSet dstraining = new DataSet();
            dstraining = cmm.RunSpReturnDSParam("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 6)
                                                                        , new SqlParameter("@bid", Convert.ToInt32(ViewState["basid_popup"])));
            if (dstraining.Tables[0].Rows.Count > 0)
            {
                gvtraining_pre.DataSource = dstraining;
                gvtraining_pre.DataBind();
            }
            else
            {
                dstraining.Tables[0].Rows.Add(dstraining.Tables[0].NewRow());
                gvtraining_pre.DataSource = dstraining;
                gvtraining_pre.DataBind();
                int columncount = gvtraining_pre.Rows[0].Cells.Count;
                gvtraining_pre.Rows[0].Cells.Clear();
                gvtraining_pre.Rows[0].Cells.Add(new TableCell());
                gvtraining_pre.Rows[0].Cells[0].ColumnSpan = columncount;
                gvtraining_pre.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void Bind_Transfergrid_prev()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "9");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
                    cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(ViewState["basid_popup"]));
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gvtransfer_pre.DataSource = ds;
                            gvtransfer_pre.DataBind();
                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            gvtransfer_pre.DataSource = ds;
                            gvtransfer_pre.DataBind();
                            int columnsCount = gvtransfer_pre.Columns.Count - 1;
                            gvtransfer_pre.Rows[0].Cells.Clear();
                            gvtransfer_pre.Rows[0].Cells.Add(new TableCell());
                            gvtransfer_pre.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            gvtransfer_pre.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            gvtransfer_pre.Rows[0].Cells[0].Font.Bold = true;
                            gvtransfer_pre.Rows[0].Cells[0].Font.Size = 10;
                            gvtransfer_pre.Rows[0].Cells[0].Text = "No Record(s) Found";
                            gvtransfer_pre.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }
        private void bindgrid_Records_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                , new SqlParameter("@flag", 6)
                                                                , new SqlParameter("@bid", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdrecord_per.DataSource = dsedu;
                grdrecord_per.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdrecord_per.DataSource = dsedu;
                grdrecord_per.DataBind();
                int columncount = grdrecord_per.Rows[0].Cells.Count;
                grdrecord_per.Rows[0].Cells.Clear();
                grdrecord_per.Rows[0].Cells.Add(new TableCell());
                grdrecord_per.Rows[0].Cells[0].ColumnSpan = columncount;
                grdrecord_per.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
    }
}