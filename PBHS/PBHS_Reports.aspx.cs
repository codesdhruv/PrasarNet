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

using ClosedXML.Excel;
using Ionic.Zip;

namespace PrasarNet.PBHS
{
    public partial class PBHS_Reports : System.Web.UI.Page
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
                                                                                               new SqlParameter("@flag", "4"));//Visible Certify right usertable and PBIT,ADGHR, CEO
                if (Convert.ToInt16(dsstn.Tables[0].Rows[0][0]) != 0)//Visible Certify right usertable and PBIT,ADGHR, CEO
                {
                    if (!IsPostBack)
                    {
                        Label1.Text = Convert.ToString(Session["UserName"]);
                        using (SqlConnection conn = new SqlConnection(cont))// Bind a ddlWing
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

        protected void btnUpdateBasic_Click(object sender, EventArgs e)
        {
            bindbutton();
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../All_Reports/Reports.aspx");
        }
        public void bindbutton()
        {
            try
            {
                DateTime? from = null;
                DateTime? to = null;
                string desgn = null;
                Boolean? isapproved = null;
                Boolean? iscardformed = null;
                int wingid = 0;

                if (ddlisapproved.SelectedValue == "1")
                {
                    isapproved = true;
                }
                else if (ddlisapproved.SelectedValue == "0")
                {
                    isapproved = false;
                }
                if (ddlstatus.SelectedValue == "1")
                {
                    iscardformed = true;
                }
                else if (ddlstatus.SelectedValue == "0")
                {
                    iscardformed = false;
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
                int total = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                      , new SqlParameter("@status", null)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@approvedbit", isapproved)
                                                                                                      , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                      , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                      , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btntotal.Text = "Total Request Recieved: " + total.ToString();

                int inprocess = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                      , new SqlParameter("@status", 2)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@approvedbit", isapproved)
                                                                                                      , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                      , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                      , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btninprocess.Text = "In Process: " + inprocess.ToString();

                int closed = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                      , new SqlParameter("@status", 1)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@approvedbit", isapproved)
                                                                                                      , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                      , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                      , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btnclosed.Text = "Closed: " + closed.ToString();

                int appwelf = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                      , new SqlParameter("@status", 6)
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@approvedbit", isapproved)
                                                                                                      , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                      , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                      , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btnapprovedwelfare.Text = "approved by Welfare: " + appwelf.ToString();
                int cardissued = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                     , new SqlParameter("@status", 5)
                                                                                                     , new SqlParameter("@empdegn", desgn)
                                                                                                     , new SqlParameter("@datefrom", from)
                                                                                                     , new SqlParameter("@dateto", to)
                                                                                                     , new SqlParameter("@wingid", wingid)
                                                                                                     , new SqlParameter("@approvedbit", isapproved)
                                                                                                     , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                     , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                     , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btncardissued.Text = "Card issued: " + cardissued.ToString();
                int approvedbyhoo = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                                     , new SqlParameter("@status", 2)
                                                                                                     , new SqlParameter("@empdegn", desgn)
                                                                                                     , new SqlParameter("@datefrom", from)
                                                                                                     , new SqlParameter("@dateto", to)
                                                                                                     , new SqlParameter("@wingid", wingid)
                                                                                                     , new SqlParameter("@approvedbit", 1)
                                                                                                     //, new SqlParameter("@cardissuedbit", 0)
                                                                                                     , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                     , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));

                btnapprovedbyhoo.Text = "Card Approved by HOO: " + approvedbyhoo.ToString();


            }
            catch (Exception ex)
            {

            }
        }
        public void bindgrid()
        {
            try
            {
                divgrd.Visible = true;
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
                if (ddlisapproved.SelectedIndex != 0)
                {
                    str = str + ", Is Applicant's Information Approved: " + ddlisapproved.SelectedItem.Text;
                }
                else
                {
                    str = str + ", Is Applicant's Information Approved: All";
                }
                if (ddlstatus.SelectedIndex != 0)
                {
                    str = str + ", Status of Card: " + ddlstatus.SelectedItem.Text;
                }
                else
                {
                    str = str + ", Status of Card: Any";
                }
                lblfiltercriterion.Text = str;
                DateTime? from = null;
                DateTime? to = null;
                string desgn = null;
                Boolean? isapproved = null;
                Boolean? iscardformed = null;
                int wingid = 0;

                if (ddlisapproved.SelectedValue == "1")
                {
                    isapproved = true;
                }
                else if (ddlisapproved.SelectedValue == "0")
                {
                    isapproved = false;
                }
                if (ddlstatus.SelectedValue == "1")
                {
                    iscardformed = true;
                }
                else if (ddlstatus.SelectedValue == "0")
                {
                    iscardformed = false;
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
                divgrd.Visible = true;
                int? finalsub = null;
                if (ViewState["grid"].ToString() == "InProcess")
                {
                    finalsub = 2;
                }
                else if (ViewState["grid"].ToString() == "Closed")
                {
                    finalsub = 1;
                }
                else if (ViewState["grid"].ToString() == "Approved by Welfare")
                {
                    finalsub = 6;
                }
                else if (ViewState["grid"].ToString() == "Card Issued")
                {
                    finalsub = 5;
                }
                else if (ViewState["grid"].ToString() == "Approved by HOO")
                {
                    finalsub = 2;
                    isapproved = true;
                }
                ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 14)
                                                                                                      , new SqlParameter("@status", finalsub)
                                                                                                      , new SqlParameter("@appno", txtappno.Text.Trim())
                                                                                                      , new SqlParameter("@empdegn", desgn)
                                                                                                      , new SqlParameter("@datefrom", from)
                                                                                                      , new SqlParameter("@dateto", to)
                                                                                                      , new SqlParameter("@wingid", wingid)
                                                                                                      , new SqlParameter("@approvedbit", isapproved)
                                                                                                      , new SqlParameter("@cardissuedbit", iscardformed)
                                                                                                      , new SqlParameter("@empname", txtnameapplicant.Text.Trim()));
                grdapplications.DataSource = ds;
                grdapplications.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void btninprocess_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "InProcess";
            lnkExporttoExcel.Visible = false;
            lnkBulkphotu.Visible = false;
            bindgrid();
            lblrecordsfound.Text = btninprocess.Text;
            grdapplications.Focus();
        }
        protected void btnapprovedwelfare_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Approved by Welfare";
            bindgrid();
            lnkExporttoExcel.Visible = true;
            lnkBulkphotu.Visible = true;
            lblrecordsfound.Text = btnapprovedwelfare.Text;
            grdapplications.Focus();
        }

        protected void btnclosed_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Closed";
            lnkExporttoExcel.Visible = false;
            lnkBulkphotu.Visible = false;
            bindgrid();
            lblrecordsfound.Text = btnclosed.Text;
            grdapplications.Focus();
        }

        protected void btntotal_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Total";
            lnkExporttoExcel.Visible = false;
            lnkBulkphotu.Visible = false;
            bindgrid();
            lblrecordsfound.Text = btntotal.Text;
            grdapplications.Focus();
        }
        protected void btnapprovedbyhoo_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Approved by HOO";
            lnkExporttoExcel.Visible = false;
            lnkBulkphotu.Visible = false;
            bindgrid();
            lblrecordsfound.Text = btnapprovedbyhoo.Text;
            grdapplications.Focus();
        }

        protected void btncardissued_Click(object sender, EventArgs e)
        {
            bindbutton();
            ViewState["grid"] = "Card Issued";
            lnkExporttoExcel.Visible = false;
            lnkBulkphotu.Visible = false;
            bindgrid();
            lblrecordsfound.Text = btncardissued.Text;
            grdapplications.Focus();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {

            //string str = "";
            //if (txtdatefrom.Text != "")
            //{
            //    str = "From: " + txtdatefrom.Text.Trim();
            //}
            //else
            //{
            //    str = "From: All";
            //}
            //if (txtdateto.Text != "")
            //{
            //    str = str + ", To: " + txtdateto.Text.Trim();
            //}
            //else
            //{
            //    str = str + ", To: All";
            //}
            //if (ddlwingfilter.SelectedIndex != 0)
            //{
            //    str = str + ", Wing: " + ddlwingfilter.SelectedItem.Text;
            //    if (ddldesignationfilter.SelectedIndex != 0)
            //    {
            //        str = str + ", Designation: " + ddldesignationfilter.SelectedItem.Text;
            //    }
            //    else
            //    {
            //        str = str + ", Designation: All";
            //    }
            //}
            //else
            //{
            //    str = str + ", Wing: All, Designation: All";
            //}
            //if (ddlisapproved.SelectedIndex != 0)
            //{
            //    str = str + ", Is Applicant's Information Approved: " + ddlisapproved.SelectedItem.Text;
            //}
            //else
            //{
            //    str = str + ", Is Applicant's Information Approved: All";
            //}
            //if (ddlstatus.SelectedIndex != 0)
            //{
            //    str = str + ", Status of Card: " + ddlstatus.SelectedItem.Text;
            //}
            //else
            //{
            //    str = str + ", Status of Card: Any";
            //}

            //lblfiltercriterion.Text = str;
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
            ClientScript.RegisterStartupScript(this.GetType(), "PBHS Reports", sb.ToString());
            grdapplications.AllowPaging = true;
            bindgrid();
            divmsg.Visible = false;
            lblmsgprint.Text = "";
        }

        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            bindgrid();
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
                    bindbasicinfo();
                    bindgrid_Family_prev();
                    bindgridupload_prev();
                }
                catch (Exception ex)
                {

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

        protected void lnkExporttoExcel_Click(object sender, EventArgs e)
        {

            DateTime? from = null;
            DateTime? to = null;
            string desgn = null;
            Boolean? isapproved = null;
            Boolean? iscardformed = null;
            int wingid = 0;

            if (ddlisapproved.SelectedValue == "1")
            {
                isapproved = true;
            }
            else if (ddlisapproved.SelectedValue == "0")
            {
                isapproved = false;
            }
            if (ddlstatus.SelectedValue == "1")
            {
                iscardformed = true;
            }
            else if (ddlstatus.SelectedValue == "0")
            {
                iscardformed = false;
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



            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {


                DataSet ds = new DataSet();

                using (SqlCommand cmd = new SqlCommand())
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        cmd.CommandText = "[PN22_PBHS_Reports]";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@flag", 19));
                        cmd.Parameters.Add(new SqlParameter("@status", 6));
                        cmd.Parameters.Add(new SqlParameter("@empdegn", desgn));
                        cmd.Parameters.Add(new SqlParameter("@datefrom", from));
                        cmd.Parameters.Add(new SqlParameter("@dateto", to));
                        cmd.Parameters.Add(new SqlParameter("@wingid", wingid));
                        cmd.Parameters.Add(new SqlParameter("@approvedbit", isapproved));
                        cmd.Parameters.Add(new SqlParameter("@appno", txtappno.Text.Trim()));
                        cmd.Parameters.Add(new SqlParameter("@empname", txtnameapplicant.Text.Trim()));
                        cmd.Parameters.Add(new SqlParameter("@cardissuedbit", iscardformed));


                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            using (XLWorkbook wb = new XLWorkbook())
                            {
                                wb.Worksheets.Add(dt, "Customers");

                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                Response.AddHeader("content-disposition", "attachment;filename=SqlExport.xlsx");
                                using (MemoryStream MyMemoryStream = new MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void lnkbulkphotu_Click(object sender, EventArgs e)
        {
            bulkdownload();

        }
        protected void bulkdownload()
        {
            using (ZipFile zip = new ZipFile())
            {
                string newFolderPath = Server.MapPath("~/New/");

                DateTime? from = null;
                DateTime? to = null;
                string desgn = null;
                Boolean? isapproved = null;
                Boolean? iscardformed = null;
                int wingid = 0;

                if (ddlisapproved.SelectedValue == "1")
                {
                    isapproved = true;
                }
                else if (ddlisapproved.SelectedValue == "0")
                {
                    isapproved = false;
                }
                if (ddlstatus.SelectedValue == "1")
                {
                    iscardformed = true;
                }
                else if (ddlstatus.SelectedValue == "0")
                {
                    iscardformed = false;
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

                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                DataSet dsrep = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString",

                                               new SqlParameter("@status", 6),
                                               new SqlParameter("@empdegn", desgn),
                                               new SqlParameter("@datefrom", from),
                                               new SqlParameter("@dateto", to),
                                               new SqlParameter("@wingid", wingid),
                                               new SqlParameter("@approvedbit", isapproved),
                                               new SqlParameter("@appno", txtappno.Text.Trim()),
                                               new SqlParameter("@empname", txtnameapplicant.Text.Trim()),
                                               new SqlParameter("@cardissuedbit", iscardformed),

                                               // new SqlParameter("@postid", postid),
                                               new SqlParameter("@flag", 20));
                //zip.AddDirectoryByName("Files");
                // Check if DataSet is not null and it has tables
                if (dsrep != null && dsrep.Tables[0].Rows.Count > 0)
                {
                    
                    if (!Directory.Exists(newFolderPath))
                    {
                        Directory.CreateDirectory(newFolderPath);
                    }
                    
                    foreach (DataRow row_basid in dsrep.Tables[0].Rows)
                    {

                        int empcode = Convert.ToInt32(row_basid["employeecode"]);
                        //btndownloadallcand(basid);
                        string cerpath = Server.MapPath("~/PBHS/Photo/");
                        string emp_name = Convert.ToString(row_basid["employeename"]);
                        string emp_code = Convert.ToString(row_basid["employeecode"]);
                        //string emp_appno = ds.Tables[0].Rows[0]["ApplicationNo"].ToString();
                        string canfilepath = emp_code + "-" + emp_name;
                        //zip.AddDirectoryByName(canfilepath);
                        ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@status", 6),
                                               new SqlParameter("@empdegn", desgn),
                                               new SqlParameter("@datefrom", from),
                                               new SqlParameter("@dateto", to),
                                               new SqlParameter("@wingid", wingid),
                                               new SqlParameter("@approvedbit", isapproved),
                                               new SqlParameter("@appno", txtappno.Text.Trim()),
                                               new SqlParameter("@empname", txtnameapplicant.Text.Trim()),
                                               new SqlParameter("@cardissuedbit", iscardformed),

                                               // new SqlParameter("@postid", postid),
                                               new SqlParameter("@employeecode", empcode),
                                               new SqlParameter("@flag", 21),
                                                                 new SqlParameter("@medpath", cerpath)
                                               );
                        string cand_name = ds.Tables[0].Rows[0]["Name"].ToString();
                        string cand_empcode = ds.Tables[0].Rows[0]["EMPLOYEE ID"].ToString();
                        // string cand_appno = ds.Tables[0].Rows[0]["ApplicationNo"].ToString();
                        //zip.AddDirectoryByName("Files");
                        //string canfilepath = cand_empcode + "-" + cand_name;
                      
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            string cand_name1 = row["Name"].ToString();
                            String cand_empcode1 = row["EMPLOYEE ID"].ToString();
                            //if ((row.FindControl("chkSelect") as CheckBox).Checked)
                            //{
                            string filePath = row["docpath"].ToString();
                            if (File.Exists(filePath))
                            {
                                File.Copy(filePath, newFolderPath + cand_empcode1 + "-" + cand_name1 + Path.GetExtension(filePath));
                                zip.AddFile(newFolderPath + cand_empcode1 +"-"+ cand_name1 + Path.GetExtension(filePath), canfilepath);
                                
                                //zip.AddFile(filePath,canfilepath);
                            }
                            //}
                        }

                    }
                }

                Response.Clear();
                Response.BufferOutput = false;
                //string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                string zipName = "Photos"+DateTime.Now.ToString() +".zip";
                Response.ContentType = "application/zip";
                Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                zip.Save(Response.OutputStream);
                ClearFolder(newFolderPath);
                Response.End();


            }

        }

        private void ClearFolder(string folderPath)
        {
            DirectoryInfo directory = new DirectoryInfo(folderPath);
            foreach (FileInfo file in directory.GetFiles())
            {
                file.Delete();
            }
            foreach (DirectoryInfo subDir in directory.GetDirectories())
            {
                subDir.Delete(true); // Delete subdirectories and their contents
            }
        }

    }
}