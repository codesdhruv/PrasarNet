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
    public partial class TransferApp_Action : System.Web.UI.Page
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
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
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
            ds = cmm.RunSpReturnDSParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
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

        protected void grdapplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "takeaction")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblbasicid = row.FindControl("lblbasicid") as Label;
                Label lblappNo = row.FindControl("lblappNo") as Label;
                Label lblempemail = row.FindControl("Label18") as Label;
                Label lblsubmittedon = row.FindControl("Label50") as Label;
                Label lblempname = row.FindControl("lblop1") as Label;
                Label lblempdesgn = row.FindControl("lblop2") as Label;

                Label lblempstn_offc = row.FindControl("lblop3") as Label;
                Label lblempmob = row.FindControl("Label21") as Label;

                int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;

                ViewState["AppNo_action_"] = lblappNo.Text;
                ViewState["subOn_action"] = lblsubmittedon.Text;
                ViewState["EmpName_action_"] = lblempname.Text;
                ViewState["empdesgn_action"] = lblempdesgn.Text;
                ViewState["empstn_action_"] = lblempstn_offc.Text;
                ViewState["empmob_action"] = lblempmob.Text;

                ViewState["basicid_action_"] = lblbasicid.Text;
                ViewState["empemail_"] = lblempemail.Text;
                ViewState["trnid_action"] = trnid;
                //mpeaction.Show();
                divresorfor.Visible = true;
                lbltrackApp.Text = lblappNo.Text;
                CheckBoxList1.Focus();
            }
            if (e.CommandName == "Trackinfo")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblappNo = row.FindControl("lblappNo") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    lbltrackApp.Text = lblappNo.Text;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup_track"] = lblbasicid.Text;
                    mpetrack.Show();
                    bindapplicationTrack();

                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName == "Approve")
            {
                try
                {
                    mpeapprove.Show();
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
                }
                catch (Exception ex)
                {

                }
            }
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
        protected void grdapplications_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkapplicationstatus = (LinkButton)e.Row.FindControl("lnkapplicationstatus");
                Label lnkstatus = (Label)e.Row.FindControl("lnkstatus");
                LinkButton lnktrack = (LinkButton)e.Row.FindControl("lnktrack");
                LinkButton lnkviewapplication = (LinkButton)e.Row.FindControl("lnkviewapplication");
                Label lblstatusid = (Label)e.Row.FindControl("lblstatusid");
                Label lblfinalsubmitid = (Label)e.Row.FindControl("lblfinalsubmitid");

                Boolean lblfinalsubmit = false;
                if (lblfinalsubmitid.Text != "")
                    lblfinalsubmit = Convert.ToBoolean(lblfinalsubmitid.Text);
                int id = Convert.ToInt32(grdapplications.DataKeys[e.Row.RowIndex].Values[0]);//trnid

            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CheckBoxList1.SelectedValue == "1") //close
            {
                int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                ds = cmm.RunSpReturnDSParam("PN21_Trans_Basic_Option", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                  , new SqlParameter("@basicid", basicid));
                divresolvedaction.Visible = true;
                divforwardedaction.Visible = false;
                lbloptions_res.Text = "Option1: " + ds.Tables[0].Rows[0][11].ToString() + ", Option2: " + ds.Tables[0].Rows[0][13].ToString() + ", Option3: " + ds.Tables[0].Rows[0][15].ToString();
                lbltenure_res.Text = "Tenure Option1: " + ds.Tables[0].Rows[0][17].ToString() + ", Tenure Option2: " + ds.Tables[0].Rows[0][19].ToString() + ", Tenure Option3: " + ds.Tables[0].Rows[0][21].ToString();
                lblname_res.Text = "Name: " + ds.Tables[0].Rows[0][24].ToString() + " (" + ds.Tables[0].Rows[0][27].ToString() + ")" + ", Mobile No: " + ds.Tables[0].Rows[0][25].ToString() + ", E-Mail: " + ds.Tables[0].Rows[0][26].ToString();
                txtEmailres.Text = ds.Tables[0].Rows[0][26].ToString();
                txtEmailres.Focus();
                DataSet dsActionOfficername = new DataSet();
                dsActionOfficername = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                          new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
                ViewState["actionOfficer_EmailClosed"] = dsActionOfficername.Tables[0].Rows[0][5];
                //ViewState["actionOfficer_Email"] = dsActionOfficername.Tables[0].Rows[0][5];
                txtccresto.Text = dsActionOfficername.Tables[0].Rows[0][5].ToString();
                // ViewState["empemail_"]
            }
            else if (CheckBoxList1.SelectedValue == "3") //forward
            {
                divresolvedaction.Visible = false;
                divforwardedaction.Visible = true;
                int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                ds = cmm.RunSpReturnDSParam("PN21_Trans_Basic_Option", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                  , new SqlParameter("@basicid", basicid));

                Label30.Text = "Option1: " + ds.Tables[0].Rows[0][11].ToString() + ", Option2: " + ds.Tables[0].Rows[0][13].ToString() + ", Option3: " + ds.Tables[0].Rows[0][15].ToString();
                Label43.Text = "Tenure Option1: " + ds.Tables[0].Rows[0][17].ToString() + ", Tenure Option2: " + ds.Tables[0].Rows[0][19].ToString() + ", Tenure Option3: " + ds.Tables[0].Rows[0][21].ToString();
                lblnamefwd.Text = "Name: " + ds.Tables[0].Rows[0][24].ToString() + " (" + ds.Tables[0].Rows[0][27].ToString() + ")" + ", Mobile No: " + ds.Tables[0].Rows[0][25].ToString() + ", E-Mail: " + ds.Tables[0].Rows[0][26].ToString();
                txtemailforwarded.Focus();
                DataSet dsActionOfficername = new DataSet();
                dsActionOfficername = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                          new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
                ViewState["actionOfficer_Email"] = dsActionOfficername.Tables[0].Rows[0][5];
                //DataSet dsActionOfficername1 = new DataSet();
                //dsActionOfficername1 = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                //                                                                          new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));

                txtcc.Text = dsActionOfficername.Tables[0].Rows[0][5].ToString();// ViewState["empemail_"].ToString() + "," +
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string ipaddress2 = cmm.GetIp_Priyank();
                if (FileUpload1.HasFile)
                {
                    int ret = uploaddoc(FileUpload1, "Action_Docs", lblcloseresult);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        string filename = Convert.ToString(ViewState["filename"]);
                        int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                        int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                        string remarks = txtremarksres.Text;

                        string emailofapp = ViewState["empemail_"].ToString();
                        string nameofapp = ViewState["EmpName_action_"].ToString();
                        string degnEmp = ViewState["empdesgn_action"].ToString();

                        string mobnoofapp = ViewState["empmob_action"].ToString();
                        string referenceappNo = ViewState["AppNo_action_"].ToString();

                        string app_RegdOn = ViewState["subOn_action"].ToString();
                        string StationofEmployee = ViewState["empstn_action_"].ToString();

                        string Subofemail = "";
                        string bodyofemail = "";

                        if (txtemailforwarded.Text != "")
                        {
                            Subofemail = "Regarding Transfer request having Reference Id: " + referenceappNo;
                            bodyofemail = "Your Transfer Request has been closed and answered. Kindly login into PrasarNet for more details.";
                            //bodyofemail += "<br/>If you have any query then you may write to action Officer at " + ViewState["actionOfficer_EmailClosed"].ToString() + ", mentioning the transfer application reference id: "
                            //            + referenceappNo + " in a subject.";
                            bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                        }

                        int i = cmm.RunSP("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                      , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                      , new SqlParameter("@filename", filename)
                                                                                      , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                      , new SqlParameter("@trnid", trnid)
                                                                                      , new SqlParameter("@ClosedbyUserTypeId", 10)
                                                                                      , new SqlParameter("@Closedbyoffcid", Convert.ToInt32(Session["empid"]))
                                                                                      , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                      , new SqlParameter("@appid", basicid));
                        if (i > 0)
                        {
                            if (txtemailforwarded.Text != "")
                            {
                                sendEmailforward(Subofemail, txtEmailres.Text.Trim(), txtccresto.Text.Trim(), bodyofemail, filename);
                            }
                            if (mobnoofapp != "")
                            {
                                string msgsend = "Your Transfer Request,having reference id " + referenceappNo + ", has been closed and answered. Kindly login into PrasarNet for more details.";
                                Boolean re2t = cmm.sendMobileOTP1(mobnoofapp, "", msgsend);
                            }
                            divresolvedaction.Visible = false;
                            divresorfor.Visible = false;
                            txtremarksres.Text = "";
                            txtEmailres.Text = "";
                            txtccresto.Text = "";
                            //txtEmailres.ReadOnly = true;
                            txtEmailres.CssClass = "select font2 widthofboxes1";

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Transfer Request with Reference ID " + referenceappNo + ". has been closed.')", true);
                            gridbind();
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {
                    int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                    int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                    string remarks = txtremarksres.Text;

                    string emailofapp = ViewState["empemail_"].ToString();
                    string nameofapp = ViewState["EmpName_action_"].ToString();
                    string degnEmp = ViewState["empdesgn_action"].ToString();

                    string mobnoofapp = ViewState["empmob_action"].ToString();
                    string referenceappNo = ViewState["AppNo_action_"].ToString();

                    string app_RegdOn = ViewState["subOn_action"].ToString();
                    string StationofEmployee = ViewState["empstn_action_"].ToString();

                    string Subofemail = "";
                    string bodyofemail = "";

                    if (txtemailforwarded.Text != "")
                    {
                        Subofemail = "Regarding Transfer request having Reference Id: " + referenceappNo;
                        bodyofemail = "Your Transfer Request has been closed and answered. Kindly login into PrasarNet for more details.";
                        //bodyofemail += "<br/>If you have any query then you may write to action Officer at " + ViewState["actionOfficer_EmailClosed"].ToString() + ", mentioning the transfer application reference id: "
                        //            + referenceappNo + " in a subject.";
                        bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                    }

                    int i = cmm.RunSP("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                     , new SqlParameter("@remarks", remarks)
                                                                                     , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                     , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                     , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                     , new SqlParameter("@trnid", trnid)
                                                                                     , new SqlParameter("@ClosedbyUserTypeId", 10)
                                                                                     , new SqlParameter("@Closedbyoffcid", Convert.ToInt32(Session["empid"]))
                                                                                     , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                     , new SqlParameter("@appid", basicid));
                    if (i > 0)
                    {
                        if (txtemailforwarded.Text != "")
                        {
                            sendEmailforward(Subofemail, txtEmailres.Text.Trim(), txtccresto.Text.Trim(), bodyofemail, "");
                        }
                        if (mobnoofapp != "")
                        {
                            string msgsend = "Your Transfer Request,having reference id " + referenceappNo + ", has been closed and answered. Kindly login into PrasarNet for more details.";
                            Boolean re2t = cmm.sendMobileOTP1(mobnoofapp, "", msgsend);
                        }
                        divresolvedaction.Visible = false;
                        divresorfor.Visible = false;
                        txtremarksres.Text = "";
                        txtEmailres.Text = "";
                        txtccresto.Text = "";
                        //txtEmailres.ReadOnly = true;
                        txtEmailres.CssClass = "select font2 widthofboxes1";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Transfer Request with Reference ID " + referenceappNo + ". has been closed.')", true);
                        gridbind();
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtEmailres.Text = "";
            //txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
            txtremarksres.Text = "";
            txtccresto.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            txtemailforwarded.Text = "";
            txtappforwarded.Text = "";
            txtremarksforward.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            txtcc.Text = "";
        }
        private int uploaddoc(FileUpload FileUpload1, string foldername, Label lblResultUpload)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".pdf")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        //if ((lastline.IndexOf("%PDF") > -1))
                        //{
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 363520)//355kB
                        {
                            lblResultUpload.Text = "Maximum file size(350kbB) exceeded..";
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/Transfer_M/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "Transfer_M\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "Doc_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["filename"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                        return 0;
                    }

                }
                else
                {
                    lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                    return 0;
                }
            }
            catch (Exception ex)
            {
                lblResultUpload.Text = "Error Occured while Uploading a Document!!";
                return 0;

            }
        }
        private int sendEmailforward(string appsub, string empEmail, string ccemail, string body, string docname)
        {
            try
            {
                string urlfixedpath = Server.MapPath("~/Transfer_M/Action_Docs");
                string paths1 = "";
                int w = 0;
                SmtpClient _smtpClient;
                System.Net.Configuration.SmtpSection section = (System.Net.Configuration.SmtpSection)ConfigurationManager.GetSection("mailSettings/smtp_hrispb");
                _smtpClient = new SmtpClient();

                if (section != null)
                {
                    if (section.Network != null)
                    {
                        _smtpClient.Host = section.Network.Host;
                        _smtpClient.Port = section.Network.Port;
                        //  _smtpClient.UseDefaultCredentials = section.Network.DefaultCredentials;
                        _smtpClient.Credentials = new NetworkCredential(section.Network.UserName, section.Network.Password, section.Network.ClientDomain);
                        _smtpClient.EnableSsl = section.Network.EnableSsl;

                        if (section.Network.TargetName != null)
                            _smtpClient.TargetName = section.Network.TargetName;
                    }

                    _smtpClient.DeliveryMethod = section.DeliveryMethod;
                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(section.Network.UserName);

                    if (docname != "")
                    {
                        paths1 = urlfixedpath + docname;
                        FileInfo file = new FileInfo(paths1);
                        if (file.Exists)
                        {
                            var attachment = new System.Net.Mail.Attachment(paths1);
                            message.Attachments.Add(attachment);
                            body = "<br /> Please, find an attachment.";
                        }
                    }
                    message.To.Add(empEmail);
                    if (ccemail != "")
                    {
                        string[] CCId = ccemail.Split(',');
                        foreach (string CCEmail in CCId)
                        {
                            message.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                        }
                    }
                    message.Subject = appsub;
                    message.Body = body;
                    message.IsBodyHtml = true;

                    _smtpClient.Send(message);
                    w = 1;
                    return w;



                }

                return w;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        protected void btnfwd_Click(object sender, EventArgs e)
        {
            try
            {
                lblfwdresult.Text = "";
                string ipaddress2 = cmm.GetIp_Priyank();
                if (FileUpload2.HasFile)
                {
                    int ret = uploaddoc(FileUpload2, "Action_Docs", lblfwdresult);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                        int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                        string filename = Convert.ToString(ViewState["filename"]);
                        string remarks = txtremarksforward.Text;
                        int empid_fwd_ = Convert.ToInt32(hdnValue.Value);
                        int usertypeid_fwd = 10;
                        DataSet dsdetoffwdOfficer = new DataSet();
                        dsdetoffwdOfficer = cmm.RunSpReturnDSParam("PN21_Trans_EmployeeDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                                                     new SqlParameter("@employeeid", empid_fwd_));
                        string mobilefwdofficer = dsdetoffwdOfficer.Tables[0].Rows[0][1].ToString();

                        string emailofapp = ViewState["empemail_"].ToString();
                        string nameofapp = ViewState["EmpName_action_"].ToString();
                        string degnEmp = ViewState["empdesgn_action"].ToString();

                        string mobnoofapp = ViewState["empmob_action"].ToString();
                        string referenceappNo = ViewState["AppNo_action_"].ToString();

                        string app_RegdOn = ViewState["subOn_action"].ToString();
                        string StationofEmployee = ViewState["empstn_action_"].ToString();

                        string Subofemail = "";
                        string bodyofemail = "";

                        if (txtemailforwarded.Text != "")
                        {
                            Subofemail = "Recieved a new transfer request of" + nameofapp + " having Reference Id " + referenceappNo;

                            bodyofemail += "The details of received application are given below: <br /> <br />";
                            bodyofemail += "<b>1. Application Reference ID: <b>";
                            bodyofemail += referenceappNo + "<br /><br />";
                            bodyofemail += "2. Application Received On: ";
                            bodyofemail += app_RegdOn + "<br /><br />";
                            bodyofemail += "3. Forwarded By: ";
                            bodyofemail += Convert.ToString(Session["UserName"]) + "-" + Session["DesignationName_login"].ToString() + "<br /><br />";
                            bodyofemail += "4. Remarks/Comments given by forwarding officer while forwarding this Application: ";
                            bodyofemail += remarks + "<br /><br />";
                            bodyofemail += "5. Name of the Applicant: ";
                            bodyofemail += nameofapp + "<br /><br />";
                            bodyofemail += "6. Email of the Applicant: ";
                            bodyofemail += emailofapp + "<br /><br />";
                            bodyofemail += "7. Mobile No. of the Applicant: ";
                            bodyofemail += mobnoofapp + "<br /><br />";
                            bodyofemail += "8. Present place of posting of the Applicant: ";
                            bodyofemail += StationofEmployee + "<br /><br />";
                            bodyofemail += "Kindly login into PrasarNet to take a necessary action." + "<br />";
                            bodyofemail += "If you have any query then you may write to Forwarding Officer at " + ViewState["actionOfficer_Email"].ToString() + ", mentioning the transfer application reference id: "
                                        + referenceappNo + " in a subject.";
                            bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                        }

                        int i = cmm.RunSP("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 5)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                      , new SqlParameter("@ccmail", txtcc.Text.Trim())
                                                                                      , new SqlParameter("@filename", filename)
                                                                                      , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                      , new SqlParameter("@trnid", trnid)
                                                                                      , new SqlParameter("@fwdtoUserTypeId", usertypeid_fwd)
                                                                                      , new SqlParameter("@fwdtooffcid", empid_fwd_)
                                                                                      , new SqlParameter("@appid", basicid));
                        if (i > 0)
                        {
                            if (txtemailforwarded.Text != "")
                            {
                                sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, filename);
                            }
                            if (mobilefwdofficer != "")
                            {
                                string msgsend = "A new transfer application has been received, with Application RefID " + referenceappNo + ". Kindly login into PrasarNet for necessary actions.";
                                Boolean re1t = cmm.sendMobileOTP1(mobilefwdofficer, "", msgsend);
                            }
                            divforwardedaction.Visible = false;
                            divresolvedaction.Visible = false;
                            divresorfor.Visible = false;

                            txtemailforwarded.Text = "";
                            txtcc.Text = "";
                            txtremarksforward.Text = "";
                            CheckBoxList1.ClearSelection();
                            CheckBoxList1.Focus();

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Application with Reference ID " + referenceappNo + " has been sucessfully forwarded to " + txtappforwarded.Text.Trim() + " ')", true);
                            txtappforwarded.Text = "";
                            gridbind();
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {

                    int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                    int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                    string remarks = txtremarksforward.Text;
                    int empid_fwd_ = Convert.ToInt32(hdnValue.Value);
                    int usertypeid_fwd = 10;
                    DataSet dsdetoffwdOfficer = new DataSet();
                    dsdetoffwdOfficer = cmm.RunSpReturnDSParam("PN21_Trans_EmployeeDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                                                     new SqlParameter("@employeeid", empid_fwd_));
                    string mobilefwdofficer = dsdetoffwdOfficer.Tables[0].Rows[0][1].ToString();

                    string emailofapp = ViewState["empemail_"].ToString();
                    string nameofapp = ViewState["EmpName_action_"].ToString();
                    string degnEmp = ViewState["empdesgn_action"].ToString();

                    string mobnoofapp = ViewState["empmob_action"].ToString();
                    string referenceappNo = ViewState["AppNo_action_"].ToString();

                    string app_RegdOn = ViewState["subOn_action"].ToString();
                    string StationofEmployee = ViewState["empstn_action_"].ToString();

                    string Subofemail = "";
                    string bodyofemail = "";

                    if (txtemailforwarded.Text != "")
                    {
                        Subofemail = "Recieved a new transfer request of" + nameofapp + " having Reference Id " + referenceappNo;

                        bodyofemail += "The details of received application are given below: <br /> <br />";
                        bodyofemail += "<b>1. Application Reference ID: <b>";
                        bodyofemail += referenceappNo + "<br /><br />";
                        bodyofemail += "2. Application Received On: ";
                        bodyofemail += app_RegdOn + "<br /><br />";
                        bodyofemail += "3. Forwarded By: ";
                        bodyofemail += Convert.ToString(Session["UserName"]) + "-" + Session["DesignationName_login"].ToString() + "<br /><br />";
                        bodyofemail += "4. Remarks/Comments given by forwarding officer while forwarding this Application: ";
                        bodyofemail += remarks + "<br /><br />";
                        bodyofemail += "5. Name of the Applicant: ";
                        bodyofemail += nameofapp + "<br /><br />";
                        bodyofemail += "6. Email of the Applicant: ";
                        bodyofemail += emailofapp + "<br /><br />";
                        bodyofemail += "7. Mobile No. of the Applicant: ";
                        bodyofemail += mobnoofapp + "<br /><br />";
                        bodyofemail += "8. Present place of posting of the Applicant: ";
                        bodyofemail += StationofEmployee + "<br /><br />";
                        bodyofemail += "Kindly login into PrasarNet to take a necessary action." + "<br />";
                        bodyofemail += "If you have any query then you may write to Forwarding Officer at " + ViewState["actionOfficer_Email"].ToString() + ", mentioning the transfer application reference id: "
                                    + referenceappNo + " in a subject.";
                        bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                    }

                    int i = cmm.RunSP("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 5)
                                                                                      , new SqlParameter("@remarks", remarks)
                                                                                      , new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                      , new SqlParameter("@ccmail", txtcc.Text.Trim())
                                                                                      , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                      , new SqlParameter("@trnid", trnid)
                                                                                      , new SqlParameter("@fwdtoUserTypeId", usertypeid_fwd)
                                                                                      , new SqlParameter("@fwdtooffcid", empid_fwd_)
                                                                                      , new SqlParameter("@appid", basicid));
                    if (i > 0)
                    {
                        if (txtemailforwarded.Text != "")
                        {
                            sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, "");
                        }

                        if (mobilefwdofficer != "")
                        {
                            string msgsend = "A new transfer application has been received, with Application RefID " + referenceappNo + ". Kindly login into PrasarNet for necessary actions.";
                            Boolean re2t = cmm.sendMobileOTP1(mobilefwdofficer, "", msgsend);
                        }

                        divforwardedaction.Visible = false;
                        divresolvedaction.Visible = false;
                        divresorfor.Visible = false;


                        txtemailforwarded.Text = "";
                        txtcc.Text = "";
                        txtremarksforward.Text = "";
                        CheckBoxList1.ClearSelection();
                        CheckBoxList1.Focus();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The Application with Reference ID " + referenceappNo + " has been sucessfully forwarded to " + txtappforwarded.Text.Trim() + " ')", true);
                        txtappforwarded.Text = "";
                        gridbind();
                    }


                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }

        protected void ddldeptfwd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
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
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
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
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
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

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchbyName_empcode(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            ds = cmm.RunSpReturnDSParam("PN21_Trans_SearchByName_EmpCode", "PRASARNETConnectionString", new SqlParameter("@prefixtext", prefixText),
                                                              new SqlParameter("@flag", 2));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string str = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString());
                Output.Add(str);
            }
            return Output;

        }
        //[System.Web.Script.Services.ScriptMethod()]
        //[System.Web.Services.WebMethod]
        //public static string getemailid(string empid)
        //{
        //    Commonclass1 cmm = new Commonclass1();
        //    DataSet dsActionOfficername1 = new DataSet();
        //    dsActionOfficername1 = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
        //                                                                              new SqlParameter("@empid", empid));
        //    string email = dsActionOfficername1.Tables[0].Rows[0][5].ToString();
        //    return email;
        //    //txtcc.Text = ViewState["empemail_"].ToString() + "," + dsActionOfficername1.Tables[0].Rows[0][5].ToString();
        //}
    }
}