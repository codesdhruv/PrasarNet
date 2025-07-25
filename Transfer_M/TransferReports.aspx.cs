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
    public partial class TransferReports : System.Web.UI.Page
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
            else
            {
                int stn_sec_emp_oth = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22
                     || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//Station
                {
                    stn_sec_emp_oth = 1;
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//Section
                {
                    stn_sec_emp_oth = 2;
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 10)//Employee
                {
                    stn_sec_emp_oth = 4;
                }
                else//Management
                {
                    stn_sec_emp_oth = 3;
                }
                DataSet dsstn = new DataSet();
                dsstn = cmm.RunSpReturnDSParam("reports_visible", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                               new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                               new SqlParameter("@stn_sec_other", stn_sec_emp_oth),
                                                                                               new SqlParameter("@flag", "3"));
                if (Convert.ToInt16(dsstn.Tables[0].Rows[0][0]) != 0)//ADG Offices
                {
                    if (!IsPostBack)
                    {
                        using (SqlConnection conn = new SqlConnection(cont))
                        {
                            using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@flag", "1");
                                using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                                {
                                    DataSet ds = new DataSet();
                                    adap.Fill(ds);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {

                                        ddlwingfilter.DataSource = ds;
                                        ddlwingfilter.DataValueField = "wingid";
                                        ddlwingfilter.DataTextField = "wing";
                                        ddlwingfilter.DataBind();
                                        ddlwingfilter.Items.Insert(0, new ListItem("Select Wing", ""));
                                    }

                                }
                            }
                        }
                        Label1.Text = Convert.ToString(Session["UserName"]);

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
                else
                {
                    Response.Redirect("../Logout.aspx");
                }
            }
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../All_Reports/Reports.aspx");
        }

        protected void btnUpdateBasic_Click(object sender, EventArgs e)
        {
            bindbutton();
        }
        public void bindbutton()
        {
            try
            {
                DateTime? from = null;
                DateTime? to = null;
                string desgn = null;
                Boolean? istransferred = null;
                Boolean? isVIPRef = null;
                int wingid = 0;

                if (ddlistransferred.SelectedValue == "1")
                {
                    istransferred = true;
                }
                else if (ddlistransferred.SelectedValue == "0")
                {
                    istransferred = false;
                }
                if (ddlvipref.SelectedValue == "1")
                {
                    isVIPRef = true;
                }
                else if (ddlvipref.SelectedValue == "0")
                {
                    isVIPRef = false;
                }
                if (ddlwingfilter.SelectedIndex != 0)
                {
                    wingid = Convert.ToInt16(ddlwingfilter.SelectedValue);
                    if (ddldesignationfilter.SelectedIndex != 0)
                    {
                        desgn = Convert.ToString(ddldesignationfilter.SelectedItem.Text);
                    }
                }

                if (txtdatefrom.Text != "")
                {
                    from = DateTime.ParseExact(txtdatefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }
                if (txtdateto.Text != "")
                {
                    to = DateTime.ParseExact(txtdateto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }

                divgrdreports.Visible = true;
                divtransferStats.Visible = true;
                divgrd.Visible = false;
                int total = cmm.RunSPReturnCountParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 10)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@istransfer", istransferred)
                                                                                                      , new SqlParameter("@isvipref", isVIPRef));

                btntotal.Text = "Total Request Recieved: " + total.ToString();

                int inprocess = cmm.RunSPReturnCountParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 11)
                                                                                                      , new SqlParameter("@status", 2)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@istransfer", istransferred)
                                                                                                      , new SqlParameter("@isvipref", isVIPRef));

                btninprocess.Text = "In Process: " + inprocess.ToString();

                int closed = cmm.RunSPReturnCountParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 11)
                                                                                                      , new SqlParameter("@status", 1)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@istransfer", istransferred)
                                                                                                      , new SqlParameter("@isvipref", isVIPRef));

                btnclosed.Text = "Closed: " + closed.ToString();
            }
            catch (Exception ex)
            {

            }
        }
        protected void ddlwingfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlwingfilter.SelectedIndex != 0)
                {
                    using (SqlConnection conn = new SqlConnection(cont))
                    {
                        using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@flag", "2");
                            cmd.Parameters.AddWithValue("@wingid", ddlwingfilter.SelectedValue.ToString());
                            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                            {
                                DataSet ds = new DataSet();
                                adap.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {

                                    ddldesignationfilter.DataSource = ds;
                                    ddldesignationfilter.DataValueField = "DesignationID";
                                    ddldesignationfilter.DataTextField = "DesignationName";
                                    ddldesignationfilter.DataBind();
                                    ddldesignationfilter.Items.Insert(0, new ListItem("Select Designation", ""));
                                }

                            }
                        }
                    }
                    ddldesignationfilter.Focus();
                }
                else
                {
                    ddldesignationfilter.ClearSelection();
                    ddldesignationfilter.Items.Clear();
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void bindgrid()
        {
            try
            {
                string str = "";
                if (txtdatefrom.Text != "")
                {
                    str = "From: " + txtdatefrom.Text.Trim();
                }
                else
                {
                    str = "From: All";
                }
                if (txtdateto.Text != "")
                {
                    str = str + ", To: " + txtdateto.Text.Trim();
                }
                else
                {
                    str = str + ", To: All";
                }
                if (ddlwingfilter.SelectedIndex != 0)
                {
                    str = str + ", Wing: " + ddlwingfilter.SelectedItem.Text;
                    if (ddldesignationfilter.SelectedIndex != 0)
                    {
                        str = str + ", Designation: " + ddldesignationfilter.SelectedItem.Text;
                    }
                    else
                    {
                        str = str + ", Designation: All";
                    }
                }
                else
                {
                    str = str + ", Wing: All, Designation: All";
                }
                lblfiltercriterion.Text = str;
                DateTime? from = null;
                DateTime? to = null;
                string desgn = null;
                int wingid = 0;

                if (ddlwingfilter.SelectedIndex != 0)
                {
                    wingid = Convert.ToInt16(ddlwingfilter.SelectedValue);
                    if (ddldesignationfilter.SelectedIndex != 0)
                    {
                        desgn = Convert.ToString(ddldesignationfilter.SelectedItem.Text);
                    }
                }

                if (txtdatefrom.Text != "")
                {
                    from = DateTime.ParseExact(txtdatefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }
                if (txtdateto.Text != "")
                {
                    to = DateTime.ParseExact(txtdateto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }

                divgrdreports.Visible = true;
                divtransferStats.Visible = true;
                divgrd.Visible = true;
                int finalsub = 0, flag = 12;
                if (ViewState["grid"].ToString() == "InProcess")
                {
                    finalsub = 2;
                    flag = 13;
                }
                else if (ViewState["grid"].ToString() == "Closed")
                {
                    finalsub = 1;
                    flag = 13;
                }
                ds = cmm.RunSpReturnDSParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", flag)
                                                                                                  , new SqlParameter("@status", finalsub)
                                                                                                  , new SqlParameter("@empdegn", desgn)
                                                                                                  , new SqlParameter("@datefrom", from)
                                                                                                  , new SqlParameter("@dateto", to)
                                                                                                  , new SqlParameter("@wingid", wingid));
                grdapplications.DataSource = ds;
                grdapplications.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void btntotal_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Total";
            bindgrid();
            lblrecordsfound.Text = btntotal.Text;
            grdapplications.Focus();
        }

        protected void btnclosed_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Closed";
            bindgrid();
            lblrecordsfound.Text = btnclosed.Text;
            grdapplications.Focus();
        }

        protected void btninprocess_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "InProcess";
            bindgrid();
            lblrecordsfound.Text = btninprocess.Text;
            grdapplications.Focus();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            string str = "";
            if (txtdatefrom.Text != "")
            {
                str = "From: " + txtdatefrom.Text.Trim();
            }
            else
            {
                str = "From: All";
            }
            if (txtdateto.Text != "")
            {
                str = str + ", To: " + txtdateto.Text.Trim();
            }
            else
            {
                str = str + ", To: All";
            }
            if (ddlwingfilter.SelectedIndex != 0)
            {
                str = str + ", Wing: " + ddlwingfilter.SelectedItem.Text;
                if (ddldesignationfilter.SelectedIndex != 0)
                {
                    str = str + ", Designation: " + ddldesignationfilter.SelectedItem.Text;
                }
                else
                {
                    str = str + ", Designation: All";
                }
            }
            else
            {
                str = str + ", Wing: All, Designation: All";
            }

            lblfiltercriterion.Text = str;
            divmsg.Visible = true;
            lblmsgprint.Text = "This Data is taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
            grdapplications.AllowPaging = false;
            bindgrid();
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
            ClientScript.RegisterStartupScript(this.GetType(), "Transfer Request Reports", sb.ToString());
            grdapplications.AllowPaging = true;
            bindgrid();
            divmsg.Visible = false;
            lblmsg.Text = "";
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            bindgrid();
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
        protected void grdapplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Trackinfo")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblappNo = row.FindControl("lblappNo") as Label;
                    Label lblemployeeid = row.FindControl("lblemployeeid") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label55.Text = lblappNo.Text;
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
                    Label lblemployeeid = row.FindControl("lblemployeeid") as Label;
                    ViewState["basid_popup"] = lblbasicid.Text;
                    mpe1.Show();
                    bind_prev_Info();
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                    //UpdatePanel3.Update();
                    mpe1.Show();
                }
                catch (Exception ex)
                {

                }
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
                    //cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
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
            dstraining = cmm.RunSpReturnDSParam("PN21_Trans_Training_SP", "PRASARNETConnectionString"
                                                                        //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
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
                    // cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
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
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Records_SP", "PRASARNETConnectionString"
                                                                //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
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
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString"
                                                                 //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
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
        protected void grdapplications_RowDataBound(object sender, GridViewRowEventArgs e)
        {

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
    }
}