using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;
using System.Data;
using System.Data.SqlClient;

namespace PrasarNet.ManageSoft_Module
{
    public partial class PBHSManageApp : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    gridbind();
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Sections
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
                    else// management
                    {

                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else//14,15,16,18,19
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
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Dashboard.aspx", true);
        }

        protected void btnfilter_Click(object sender, EventArgs e)
        {
            gridbind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnprint1_Click(object sender, EventArgs e)
        {
            divmsg.Visible = true;
            lblmsgprint.Text = "This Data is taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
            grdapplications.AllowPaging = false;
            gridbind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            pnlprint.RenderControl(hw);
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
            ClientScript.RegisterStartupScript(this.GetType(), "PBHS Reports", sb.ToString());
            grdapplications.AllowPaging = true;
            gridbind();
            divmsg.Visible = false;
            lblmsgprint.Text = "";
        }

        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            gridbind();
        }
        private void gridbind()
        {
            divgrdreports.Visible = true;
            divgrd.Visible = true;
            Boolean? isactive = null;
            string appno = "";
            if (txtappno.Text.Trim() != "")
            {
                appno = txtappno.Text.Trim();
            }
            if (ddlappstatus.SelectedValue == "1")
            {
                isactive = true;
            }
            else if (ddlappstatus.SelectedValue == "0")
            {
                isactive = false;
            }
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Active_Inactive", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                     , new SqlParameter("@appno", appno)
                                                                                                     , new SqlParameter("@empname", txtnameapplicant.Text.Trim())
                                                                                                     , new SqlParameter("@active_inactive", isactive));

            lblrecordsfound.Text = ds.Tables[0].Rows.Count.ToString();
            grdapplications.DataSource = ds;
            grdapplications.DataBind();
        }
        private void bindapplicationTrack()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN22_PBHS_Track", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
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
        private void bindbasicinfo()
        {
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 7),
                                                                                            new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            lblname_bas.Text = ds.Tables[0].Rows[0][0].ToString();
            lbldeptt_bas.Text = ds.Tables[0].Rows[0][1].ToString();
            lbldesgn_bas.Text = ds.Tables[0].Rows[0][2].ToString();
            lblcontact_bas.Text = ds.Tables[0].Rows[0][3].ToString();
            lblemail_bas.Text = ds.Tables[0].Rows[0][4].ToString();
            lbldate_superannu_bas.Text = ds.Tables[0].Rows[0][5].ToString();
            lblrenew_bas.Text = ds.Tables[0].Rows[0][6].ToString();

            lblrenew_no.Text = ds.Tables[0].Rows[0][7].ToString();
            lblgazetted.Text = ds.Tables[0].Rows[0][8].ToString();
            lblbasiclbl.Text = ds.Tables[0].Rows[0][9].ToString();

            lbllevelLBL.Text = ds.Tables[0].Rows[0][10].ToString();
            lblOfficialAdd.Text = ds.Tables[0].Rows[0][11].ToString();
            lblresAdd_Lbl.Text = ds.Tables[0].Rows[0][12].ToString();

            lblOnDep.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldep_LBL.Text = ds.Tables[0].Rows[0][14].ToString();
            lbltransfer_lbl.Text = ds.Tables[0].Rows[0][15].ToString();

            lblapplforwared_bas.Text = ds.Tables[0].Rows[0][16].ToString();
            lblresidingwithme.Text = ds.Tables[0].Rows[0][17].ToString();
            lblapprovemsg2.Text = ds.Tables[0].Rows[0][18].ToString();
        }
        private void bindgridupload_prev()
        {
            DataSet dsupload = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString"
                                                                        //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 9)
                                                                        , new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsupload.Tables[0].Rows.Count > 0)
            {
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
            }
            else
            {
                dsupload.Tables[0].Rows.Add(dsupload.Tables[0].NewRow());
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
                int columncount = grdupload.Rows[0].Cells.Count;
                grdupload.Rows[0].Cells.Clear();
                grdupload.Rows[0].Cells.Add(new TableCell());
                grdupload.Rows[0].Cells[0].ColumnSpan = columncount;
                grdupload.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindgrid_Family_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString"
                                                                        //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 8)
                                                                        , new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
                int columncount = grdhealth.Rows[0].Cells.Count;
                grdhealth.Rows[0].Cells.Clear();
                grdhealth.Rows[0].Cells.Add(new TableCell());
                grdhealth.Rows[0].Cells[0].ColumnSpan = columncount;
                grdhealth.Rows[0].Cells[0].Text = "No Records Found";
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
                    int id = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup"] = lblbasicid.Text;
                    mpe1.Show();
                    bindbasicinfo();
                    bindgrid_Family_prev();
                    bindgridupload_prev();
                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName == "active_Inactive")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                    Label lblst = (Label)row.FindControl("lblst");
                    ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                    ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                    ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");
                    lblst.Visible = false;
                    chk.Visible = true;
                    imgedit.Visible = false;
                    imgupdate.Visible = true;
                    imgcancel.Visible = true;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Error Occured.Try Again!!');", true);
                }

            }
            if (e.CommandName == "update")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);

                    CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                    Label lblst = (Label)row.FindControl("lblst");

                    ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                    ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                    ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");

                    Boolean active_inactive = false;
                    if (chk.Checked)
                    {
                        active_inactive = true;
                    }

                    Label lblbasicid = row.FindControl("lblbasicid") as Label;

                    int i = cmm.RunSP("PN22_PBHS_Active_Inactive", "PRASARNETConnectionString", new SqlParameter("@flag", 2)
                                                                                            , new SqlParameter("@active_inactive", active_inactive)
                                                                                            , new SqlParameter("@updatedby", Convert.ToString(Session["UserName"]))
                                                                                            , new SqlParameter("@id", Convert.ToInt32(lblbasicid.Text)));

                    if (i > 0)
                    {
                        lblst.Visible = true;
                        chk.Visible = false;
                        imgedit.Visible = true;
                        imgupdate.Visible = false;
                        imgcancel.Visible = false;
                        gridbind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully...');", true);
                    }
                    else
                    {
                        lblst.Visible = false;
                        chk.Visible = true;
                        imgedit.Visible = false;
                        imgupdate.Visible = true;
                        imgcancel.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Error Occured.Try Again!!');", true);
                }
            }
            if (e.CommandName == "cancel")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);

                    CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                    Label lblst = (Label)row.FindControl("lblst");

                    ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                    ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                    ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");

                    lblst.Visible = true;
                    chk.Visible = false;
                    imgedit.Visible = true;
                    imgupdate.Visible = false;
                    imgcancel.Visible = false;
                    gridbind();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Error Occured.Try Again!!');", true);
                }
            }
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

        protected void grdhealth_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloadresiding"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                 new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][1].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][1].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgrid_Family_prev();
                                //Label59.Text = "There is no document to download!!";
                            }
                            grdhealth.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgrid_Family_prev();
                        // Label59.Text = "There is no document to download!!";
                        grdhealth.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgrid_Family_prev();
                    //  Label59.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdhealth.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
        }

        protected void grdupload_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloaddoc"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdupload.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@flag", "4"),
                                                                                                 new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][1].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][1].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgridupload_prev();
                                //Label22.Text = "There is no document to download!!";
                            }
                            grdupload.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgridupload_prev();
                        // Label22.Text = "There is no document to download!!";
                        grdupload.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgridupload_prev();
                    // Label22.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdupload.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
        }

        protected void grdapplications_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grdapplications_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdapplications_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}