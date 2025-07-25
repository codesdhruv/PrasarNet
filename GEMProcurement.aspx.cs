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

namespace PrasarNet
{
    public partial class GEMProcurement : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (Convert.ToInt16(Session["Usertype"]) == 26)
                {
                    lnkbtnsearch.Text = "Final Submit";
                }
                else
                {
                    lnkbtnsearch.Text = "Forward this record to Directorate";
                }
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
                    ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                              new SqlParameter("@flag", 4));
                }

                if (Convert.ToString(ds.Tables[0].Rows[0][0]) != "")
                {
                    if (!IsPostBack)
                    {
                        Label1.Text = Convert.ToString(Session["UserName"]);
                        Label13.Text = Convert.ToString(ds.Tables[0].Rows[0][2]);
                        divgemprocuremententry.Visible = true;
                        //divsearch.Visible = false;
                        lnkbtnsearch.Visible = true;
                        cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select Month--",
                                                                                                                new SqlParameter("@flag", 2));
                        cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select Year--",
                                                                                                                new SqlParameter("@flag", 1));

                        if ((Convert.ToInt16(Session["Usertype"]) == 12 && (Convert.ToInt32(Session["Station_SectionID"]) == 228)) || (Convert.ToInt16(Session["Usertype"]) == 25 && (Convert.ToInt32(Session["Station_SectionID"]) == 237)) ||
                        (Convert.ToInt16(Session["Usertype"]) == 26 && (Convert.ToInt32(Session["Station_SectionID"]) == 215))) // GA Section of DGAIR and DGDD and PB Sectt
                        {
                            btngemreports.Visible = true;
                            lnkcheck.Visible = false;
                        }
                        else
                        {
                            btngemreports.Visible = false;
                            lnkcheck.Visible = true;
                        }
                        if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 242))
                        {
                            divlandrecords.Visible = true;
                        }
                        else{
                            divlandrecords.Visible = false;
                        }
                    }
                   

                }
                else
                {
                    Response.Redirect("~/AttachDDO.aspx", true);
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 24) // Stations
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@flag", 5));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26) // Sections
            {
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@flag", 6));
            }
            grdgemprocDetails.DataSource = ds;
            grdgemprocDetails.DataBind();
        }
        protected void btnsubmit0_Click(object sender, EventArgs e)
        {
            divgrd.Visible = false;
            div12.Visible = true;
            int count = cmm.RunSPReturnCountParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                            new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                            new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                            new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                            new SqlParameter("@flag", 7));
            if (count > 0)// Disable the GEM entry Block
            {
                divgrd.Visible = true;
                grdgemprocDetails.Focus();
                txtorderplacedGEM.Enabled = false;
                txtamountprocuremnt_GEM.Enabled = false;
                //txtamountprocuremnt_otherGEM.Enabled = false;
                //txtnumberofTransPending_GEM.Enabled = false;
                //txttotalamountpending_GEM.Enabled = false;
                //txtreasonsforDelay.Enabled = false;
                //txtstepforrectification.Enabled = false;

                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = false;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                div12.Visible = false;
                txttotalcontractValue.Enabled = false;
                txtpaymentmadefortotalorders.Enabled = false;
                txtpaymentmadeforGeMorders.Enabled = false;
                txtgemorderpaymentsareaffected_10days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = false;
                txtgemorderpaymentsareaffected_20days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = false;
                txtgemorderpaymentsareaffected_30days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = false;
                txtnoofGeMOrdersDelinedByseller.Enabled = false;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = false;
                txtnorejdurtoinferiorsup.Enabled = false;
                txtnoofincidentsraisedagasellers.Enabled = false;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = false;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                txtnoincidentsresolvedraisedBysellers.Enabled = false;
                txtanyothermatterofrelevance.Enabled = false;
                btnsubmit.Enabled = false;
                btncncl.Enabled = false;
                gridbind();
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@flag", 10));
                if (!Convert.ToBoolean(ds.Tables[0].Rows[0][0]))// check the status of SubmittedtoDirectorate if it is false then btn visible
                {
                    lnkbtnsearch.Visible = true;
                    grdgemprocDetails.Columns[0].Visible = true;
                    btnprint1.Visible = false;
                    Lblmsg.Text = "Data inrespect of selected month and year already submitted. Now, You can only Edit the data....";
                }
                else
                {
                    lnkbtnsearch.Visible = false;
                    grdgemprocDetails.Columns[0].Visible = false;
                    btnprint1.Visible = true;
                    Lblmsg.Text = "Data inrespect of selected month and year already submitted and forwarded to directorate ";
                }
                
               
            }
            else// Enable the GEM entry Block
            {
                lnkbtnsearch.Visible = false;
                txtorderplacedGEM.Enabled = true;
                txtamountprocuremnt_GEM.Enabled = true;
                //txtamountprocuremnt_otherGEM.Enabled = true;
                //txtnumberofTransPending_GEM.Enabled = true;
                //txttotalamountpending_GEM.Enabled = true;
                //txtreasonsforDelay.Enabled = true;
                //txtstepforrectification.Enabled = true;
                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                div12.Visible = true;
                divgrd.Visible = false;
                txttotalcontractValue.Enabled = true;
                txtpaymentmadefortotalorders.Enabled = true;
                txtpaymentmadeforGeMorders.Enabled = true;
                txtgemorderpaymentsareaffected_10days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = true;
                txtgemorderpaymentsareaffected_20days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = true;
                txtgemorderpaymentsareaffected_30days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = true;
                txtnoofGeMOrdersDelinedByseller.Enabled = true;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = true;
                txtnorejdurtoinferiorsup.Enabled = true;
                txtnoofincidentsraisedagasellers.Enabled = true;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = true;
                txtnoincidentsresolvedraisedBysellers.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                txtanyothermatterofrelevance.Enabled = true;

                btnsubmit.Enabled = true;
                btncncl.Enabled = true;
                Lblmsg.Text = "";
                txtpaymentmadefortotalorders.Focus();
                //gridbind();
            }
            
        }
        private void clear()
        {
            //ddlmonth.SelectedIndex = 0;
            //ddlyear.SelectedIndex = 0;
            txtorderplacedGEM.Text = "";
            txtamountprocuremnt_GEM.Text = "";
            txttotalnoOrders_Inc_GEM_NonGEM.Text = "";
            txttotalcontractValue.Text = "";
            txtpaymentmadefortotalorders.Text = "";
            txtpaymentmadeforGeMorders.Text = "";
            txtgemorderpaymentsareaffected_10days.Text = "";
            txtpaymntsgemorderpaymentsareaffected_10days.Text = "";
            txtgemorderpaymentsareaffected_20days.Text = "";
            txtpaymntsgemorderpaymentsareaffected_20days.Text = "";
            txtgemorderpaymentsareaffected_30days.Text = "";
            txtpaymntsgemorderpaymentsareaffected_30days.Text = "";
            txtnoofGeMOrdersDelinedByseller.Text = "";
            txtnoofGeMOrdersacceptedBysellernotdel.Text = "";
            txtnorejdurtoinferiorsup.Text = "";
            txtnoofincidentsraisedagasellers.Text = "";
            txtnoincidentsresolvedraisedagainstsellers.Text = "";
            txtnoincidentsresolvedraisedBysellers.Text = "";
            txtnoincidentsresolvedraisedBysellers.Text = "";
            txtanyothermatterofrelevance.Text = "";

        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                               //new SqlParameter("@DDOid", ),
                                                                                               new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                               new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                                               new SqlParameter("@No_Of_OrdersPlaced_byGEM", Convert.ToInt16(txtorderplacedGEM.Text.Trim())),
                                                                                               new SqlParameter("@TotalAmountofProcurement_GEM", Convert.ToDecimal(txtamountprocuremnt_GEM.Text.Trim())),

                                                                                               new SqlParameter("@TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM", Convert.ToInt32(txttotalnoOrders_Inc_GEM_NonGEM.Text.Trim())),
                                                                                               new SqlParameter("@TotalContractValue_GEM_NonGEM", Convert.ToDecimal(txttotalcontractValue.Text)),
                                                                                               new SqlParameter("@PaymentmadefortotalNoofOrders_Gem_NONGem", Convert.ToDecimal(txtpaymentmadefortotalorders.Text.Trim())),
                                                                                               new SqlParameter("@PaymentmadeforNoofOrders_Gem", Convert.ToDecimal(txtpaymentmadeforGeMorders.Text.Trim())),
                                                                                               new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_10days.Text.Trim())),
                                                                                               new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_10days.Text.Trim())),
                                                                                               new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_20days.Text.Trim())),

                                                                                               new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_20days.Text.Trim())),
                                                                                               new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_30days.Text)),
                                                                                               new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_30days.Text.Trim())),
                                                                                               new SqlParameter("@NoofGEMOrdersDeclinedBySeller", Convert.ToInt32(txtnoofGeMOrdersDelinedByseller.Text.Trim())),
                                                                                               new SqlParameter("@NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate", Convert.ToInt32(txtnoofGeMOrdersacceptedBysellernotdel.Text.Trim())),
                                                                                               new SqlParameter("@NoOfRejectionduetoinferior_nonConfirmingSupply", Convert.ToInt32(txtnorejdurtoinferiorsup.Text.Trim())),

                                                                                                new SqlParameter("@NoofIncidentsRaisedAgainstSellers", Convert.ToInt32(txtnoofincidentsraisedagasellers.Text.Trim())),
                                                                                               new SqlParameter("@NoofIncidentsresolved_closedOut_asraisedagainstsellers", Convert.ToInt32(txtnoincidentsresolvedraisedagainstsellers.Text)),
                                                                                               new SqlParameter("@NoofIncidentsRaisedBySellersagainstDeptt", Convert.ToInt32(txtnoofincidentsraisedbysellersagadeptt.Text.Trim())),
                                                                                               new SqlParameter("@Noofincidentsresolved_closedout_asraisedbysellers", Convert.ToInt32(txtnoincidentsresolvedraisedBysellers.Text.Trim())),
                                                                                               new SqlParameter("@AnyOthersMattersofRelevance", txtanyothermatterofrelevance.Text.Trim()),

                                                                                               new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                               new SqlParameter("@flag", 1));
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully!!');", true);
                clear();
                txtorderplacedGEM.Enabled = false;
                txtamountprocuremnt_GEM.Enabled = false;

                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = false;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                div12.Visible = false;
                divgrd.Focus();
                txttotalcontractValue.Enabled = false;
                txtpaymentmadefortotalorders.Enabled = false;
                txtpaymentmadeforGeMorders.Enabled = false;
                txtgemorderpaymentsareaffected_10days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = false;
                txtgemorderpaymentsareaffected_20days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = false;
                txtgemorderpaymentsareaffected_30days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = false;
                txtnoofGeMOrdersDelinedByseller.Enabled = false;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = false;
                txtnorejdurtoinferiorsup.Enabled = false;
                txtnoofincidentsraisedagasellers.Enabled = false;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = false;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                txtnoincidentsresolvedraisedBysellers.Enabled = false;
                txtanyothermatterofrelevance.Enabled = false;

                divgrd.Visible = true;
                btnsubmit.Enabled = false;
                btncncl.Enabled = false;
                btnprint1.Visible = false;
                lnkbtnsearch.Visible = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                txtorderplacedGEM.Enabled = true;
                txtamountprocuremnt_GEM.Enabled = true;
                divgrd.Visible = false;
                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                div12.Visible = true;
                txttotalcontractValue.Enabled = true;
                txtpaymentmadefortotalorders.Enabled = true;
                txtpaymentmadeforGeMorders.Enabled = true;
                txtgemorderpaymentsareaffected_10days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = true;
                txtgemorderpaymentsareaffected_20days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = true;
                txtgemorderpaymentsareaffected_30days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = true;
                txtnoofGeMOrdersDelinedByseller.Enabled = true;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = true;
                txtnorejdurtoinferiorsup.Enabled = true;
                txtnoofincidentsraisedagasellers.Enabled = true;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                txtnoincidentsresolvedraisedBysellers.Enabled = true;
                txtanyothermatterofrelevance.Enabled = true;

                btnsubmit.Enabled = true;
                btncncl.Enabled = true;
                btnprint1.Visible = true;
                lnkbtnsearch.Visible = false;
            }
            gridbind();

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        //protected void btncalculate_Click(object sender, EventArgs e)
        //{
        //    if (txtamountprocuremnt_GEM.Text != "" && txtamountprocuremnt_otherGEM.Text != "")
        //    {
        //        decimal gem = 0;
        //        decimal nongem = 0;
        //        decimal per = 0;
        //        if (txtamountprocuremnt_GEM.Text != "")
        //        {
        //            gem = Convert.ToDecimal(txtamountprocuremnt_GEM.Text);
        //        }
        //        if (txtamountprocuremnt_otherGEM.Text != "")
        //        {
        //            nongem = Convert.ToDecimal(txtamountprocuremnt_otherGEM.Text);
        //        }
        //        decimal sum = gem + nongem;
        //        decimal ratio = gem / sum;
        //        per = ratio * 100;

        //        txtpercentageofProcurement.Text = Convert.ToString(Math.Round(per, 2));
        //    }
        //}

        //protected void txtamountprocuremnt_otherGEM_TextChanged(object sender, EventArgs e)
        //{
        //    txtpercentageofProcurement.Text = "";
        //}

        protected void grdgemprocDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdgemprocDetails.PageIndex = e.NewPageIndex;
            gridbind();

        }

        protected void grdgemprocDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int gem_transid = (int)grdgemprocDetails.DataKeys[row.RowIndex].Value;
                Label totalnoordersplacedthroughgemandnongem = (Label)row.FindControl("Label16");
                Label totalcontractValue = (Label)row.FindControl("lbltotalcontractval");
                Label Nooforders_thrGeM = (Label)row.FindControl("lblordersplacedthrGEM");
                Label TotalAmtProcGEM = (Label)row.FindControl("Label26");
                Label paymntmadefortotalgemnongem = (Label)row.FindControl("lblpaymntmadefortotalgemnongem");
                Label lblpaymntmadeforgem = (Label)row.FindControl("lblpaymntmadeforgem");
                Label NoofGEM_10 = (Label)row.FindControl("lblnum11");
                Label Amt_NoofGEM_10 = (Label)row.FindControl("lblamt11");

                Label NoofGEM_20 = (Label)row.FindControl("lblnum22");
                Label Amt_NoofGEM_20 = (Label)row.FindControl("lblamt22");

                Label NoofGEM_30 = (Label)row.FindControl("lblnum33");
                Label Amt_NoofGEM_30 = (Label)row.FindControl("lblamt33");

                Label noofGemOrderDeclinedbyseller = (Label)row.FindControl("Label344");
                Label noofGemOrderaccptbyseller = (Label)row.FindControl("Label121");
                Label rejectionduenonconfirmingSupplies = (Label)row.FindControl("Label11s");
                Label lblincidentsraisedagainstseller = (Label)row.FindControl("lblnum44");

                Label lblincidentsraisedagainstseller_res = (Label)row.FindControl("lblres11");
                Label incidentraisedbyseller = (Label)row.FindControl("Label1632");
                Label incidentraisedbyseller_resolved = (Label)row.FindControl("Label342");
                Label anyothermatter  = (Label)row.FindControl("Labeloo3");

                Session["gem_transid"] = gem_transid;
                txtorderplacedGEM.Enabled = true;
                txtamountprocuremnt_GEM.Enabled = true;

                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = true;
                txttotalcontractValue.Enabled = true;
                txtpaymentmadefortotalorders.Enabled = true;
                txtpaymentmadeforGeMorders.Enabled = true;
                txtgemorderpaymentsareaffected_10days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = true;
                txtgemorderpaymentsareaffected_20days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = true;
                txtgemorderpaymentsareaffected_30days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = true;
                txtnoofGeMOrdersDelinedByseller.Enabled = true;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = true;
                txtnorejdurtoinferiorsup.Enabled = true;
                txtnoofincidentsraisedagasellers.Enabled = true;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                txtnoincidentsresolvedraisedBysellers.Enabled = true;
                txtanyothermatterofrelevance.Enabled = true;
                btnsubmit.Visible = false;
                btncncl.Visible = false;
                btnupdate.Visible = true;
                btncancelforedit.Visible = true;
                
                txtorderplacedGEM.Text = Nooforders_thrGeM.Text;
                txtamountprocuremnt_GEM.Text = TotalAmtProcGEM.Text;


                txttotalnoOrders_Inc_GEM_NonGEM.Text = totalnoordersplacedthroughgemandnongem.Text;
                totalcontractValue.Text = totalcontractValue.Text;
                txttotalcontractValue.Text = totalcontractValue.Text;
                txtpaymentmadefortotalorders.Text = paymntmadefortotalgemnongem.Text;
                txtpaymentmadeforGeMorders.Text = lblpaymntmadeforgem.Text;
                txtgemorderpaymentsareaffected_10days.Text = NoofGEM_10.Text;
                txtpaymntsgemorderpaymentsareaffected_10days.Text = Amt_NoofGEM_10.Text;
                txtgemorderpaymentsareaffected_20days.Text = NoofGEM_20.Text;
                txtpaymntsgemorderpaymentsareaffected_20days.Text = Amt_NoofGEM_20.Text;
                txtgemorderpaymentsareaffected_30days.Text = NoofGEM_30.Text;
                txtpaymntsgemorderpaymentsareaffected_30days.Text = Amt_NoofGEM_30.Text;
                txtnoofGeMOrdersDelinedByseller.Text = noofGemOrderDeclinedbyseller.Text;
                txtnoofGeMOrdersacceptedBysellernotdel.Text = noofGemOrderaccptbyseller.Text;
                txtnorejdurtoinferiorsup.Text = rejectionduenonconfirmingSupplies.Text;
                txtnoofincidentsraisedagasellers.Text = lblincidentsraisedagainstseller.Text;
                txtnoincidentsresolvedraisedagainstsellers.Text = lblincidentsraisedagainstseller_res.Text;
                txtnoofincidentsraisedbysellersagadeptt.Text = incidentraisedbyseller.Text;
                txtnoincidentsresolvedraisedBysellers.Text = incidentraisedbyseller_resolved.Text;
                txtanyothermatterofrelevance.Text = anyothermatter.Text;
                div12.Visible = true;
                divgrd.Visible = false;


                tblgementry2.Focus();
                txtorderplacedGEM.Focus();
               
            }
        }

        protected void lnkbtnsearch_Click(object sender, EventArgs e)
        {
            int i;
            if (Convert.ToInt16(Session["Usertype"]) == 26)
            {
                i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                               new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                               new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                               new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                               new SqlParameter("@flag", 17));
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Successfully Submitted..');", true);
                    lnkbtnsearch.Visible = false;
                    btnprint1.Visible = true;
                    gridbind();
                    grdgemprocDetails.Columns[0].Visible = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    lnkbtnsearch.Visible = true;
                    btnprint1.Visible = false;
                    gridbind();
                    grdgemprocDetails.Columns[0].Visible = true;
                }
            }
            else
            {
                i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                               new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                               new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                               new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                               new SqlParameter("@flag", 9));
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Record forwarded to Directorate Sucessfully..');", true);
                    lnkbtnsearch.Visible = false;
                    btnprint1.Visible = true;
                    gridbind();
                    grdgemprocDetails.Columns[0].Visible = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    lnkbtnsearch.Visible = true;
                    btnprint1.Visible = false;
                    gridbind();
                    grdgemprocDetails.Columns[0].Visible = true;
                }
            }
            
         

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

            int i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                             new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                              new SqlParameter("@gem_transid", Convert.ToInt64(Session["gem_transid"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@No_Of_OrdersPlaced_byGEM", Convert.ToInt16(txtorderplacedGEM.Text.Trim())),
                                                                                              new SqlParameter("@TotalAmountofProcurement_GEM", Convert.ToDecimal(txtamountprocuremnt_GEM.Text.Trim())),

                                                                                              new SqlParameter("@TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM", Convert.ToInt32(txttotalnoOrders_Inc_GEM_NonGEM.Text.Trim())),
                                                                                              new SqlParameter("@TotalContractValue_GEM_NonGEM", Convert.ToDecimal(txttotalcontractValue.Text)),
                                                                                              new SqlParameter("@PaymentmadefortotalNoofOrders_Gem_NONGem", Convert.ToDecimal(txtpaymentmadefortotalorders.Text.Trim())),
                                                                                              new SqlParameter("@PaymentmadeforNoofOrders_Gem", Convert.ToDecimal(txtpaymentmadeforGeMorders.Text.Trim())),
                                                                                              new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_10days.Text.Trim())),
                                                                                              new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_10days.Text.Trim())),
                                                                                              new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_20days.Text.Trim())),

                                                                                              new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_20days.Text.Trim())),
                                                                                              new SqlParameter("@NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC", Convert.ToInt32(txtgemorderpaymentsareaffected_30days.Text)),
                                                                                              new SqlParameter("@AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC", Convert.ToDecimal(txtpaymntsgemorderpaymentsareaffected_30days.Text.Trim())),
                                                                                              new SqlParameter("@NoofGEMOrdersDeclinedBySeller", Convert.ToInt32(txtnoofGeMOrdersDelinedByseller.Text.Trim())),
                                                                                              new SqlParameter("@NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate", Convert.ToInt32(txtnoofGeMOrdersacceptedBysellernotdel.Text.Trim())),
                                                                                              new SqlParameter("@NoOfRejectionduetoinferior_nonConfirmingSupply", Convert.ToInt32(txtnorejdurtoinferiorsup.Text.Trim())),

                                                                                               new SqlParameter("@NoofIncidentsRaisedAgainstSellers", Convert.ToInt32(txtnoofincidentsraisedagasellers.Text.Trim())),
                                                                                              new SqlParameter("@NoofIncidentsresolved_closedOut_asraisedagainstsellers", Convert.ToInt32(txtnoincidentsresolvedraisedagainstsellers.Text)),
                                                                                              new SqlParameter("@NoofIncidentsRaisedBySellersagainstDeptt", Convert.ToInt32(txtnoofincidentsraisedbysellersagadeptt.Text.Trim())),
                                                                                              new SqlParameter("@Noofincidentsresolved_closedout_asraisedbysellers", Convert.ToInt32(txtnoincidentsresolvedraisedBysellers.Text.Trim())),
                                                                                              new SqlParameter("@AnyOthersMattersofRelevance", txtanyothermatterofrelevance.Text.Trim()),

                                                                                              new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                              new SqlParameter("@updatedby", Convert.ToString(Session["UserName"])),
                                                                                              new SqlParameter("@flag", 11));




            //int i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
            //                                                                                  new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
            //                                                                                  new SqlParameter("@gem_transid", Convert.ToInt64(Session["gem_transid"])),
            //                                                                                   new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
            //                                                                                   new SqlParameter("@year", Convert.ToInt16(ddlyear.SelectedValue)),
            //                                                                                   new SqlParameter("@No_Of_OrdersPlaced_byGEM", Convert.ToInt16(txtorderplacedGEM.Text.Trim())),
            //                                                                                   new SqlParameter("@TotalAmountofProcurement_GEM", Convert.ToDecimal(txtamountprocuremnt_GEM.Text.Trim())),
            //                                                                                   new SqlParameter("@TotalAmountofProcurement_NonGEM", Convert.ToDecimal(txtamountprocuremnt_otherGEM.Text.Trim())),
            //                                                                                   new SqlParameter("@PercentageofProcurementThroughGEM", Convert.ToDecimal(txtpercentageofProcurement.Text)),
            //                                                                                   new SqlParameter("@TotalNoOfTransactionsPending_GEMPymnt", Convert.ToInt32(txtnumberofTransPending_GEM.Text.Trim())),
            //                                                                                   new SqlParameter("@TotalAmountofTransactionpending_GEM", Convert.ToDecimal(txttotalamountpending_GEM.Text.Trim())),
            //                                                                                   new SqlParameter("@ReasonsfordelayinmakingPaymnts", txtreasonsforDelay.Text.Trim()),
            //                                                                                   new SqlParameter("@StepsTakentoRectifyDelay", txtstepforrectification.Text.Trim()),
            //                                                                                   new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
            //                                                                                   new SqlParameter("@updatedby", Convert.ToString(Session["UserName"])),
            //                                                                                   new SqlParameter("@flag", 11));
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                clear();
                txtorderplacedGEM.Enabled = false;
                txtamountprocuremnt_GEM.Enabled = false;
             
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                div12.Visible = false;
                divgrd.Visible = true;
                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = true;
                txttotalcontractValue.Enabled = false;
                txtpaymentmadefortotalorders.Enabled = false;
                txtpaymentmadeforGeMorders.Enabled = false;
                txtgemorderpaymentsareaffected_10days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = false;
                txtgemorderpaymentsareaffected_20days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = false;
                txtgemorderpaymentsareaffected_30days.Enabled = false;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = false;
                txtnoofGeMOrdersDelinedByseller.Enabled = false;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = false;
                txtnorejdurtoinferiorsup.Enabled = false;
                txtnoofincidentsraisedagasellers.Enabled = false;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = false;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
                txtnoincidentsresolvedraisedBysellers.Enabled = false;
                txtanyothermatterofrelevance.Enabled = false;

                btnsubmit.Visible = true;
                btnsubmit.Enabled = false;
                btncncl.Visible = true;
                btncncl.Enabled = false;
                btnupdate.Visible = false;
                btncancelforedit.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                txtorderplacedGEM.Enabled = true;
                txtamountprocuremnt_GEM.Enabled = true;
                txttotalnoOrders_Inc_GEM_NonGEM.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                div12.Visible = true;
                divgrd.Visible = false;
                txttotalcontractValue.Enabled = true;
                txtpaymentmadefortotalorders.Enabled = true;
                txtpaymentmadeforGeMorders.Enabled = true;
                txtgemorderpaymentsareaffected_10days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_10days.Enabled = true;
                txtgemorderpaymentsareaffected_20days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_20days.Enabled = true;
                txtgemorderpaymentsareaffected_30days.Enabled = true;
                txtpaymntsgemorderpaymentsareaffected_30days.Enabled = true;
                txtnoofGeMOrdersDelinedByseller.Enabled = true;
                txtnoofGeMOrdersacceptedBysellernotdel.Enabled = true;
                txtnorejdurtoinferiorsup.Enabled = true;
                txtnoofincidentsraisedagasellers.Enabled = true;
                txtnoincidentsresolvedraisedagainstsellers.Enabled = true;
                txtnoofincidentsraisedbysellersagadeptt.Enabled = true;
                txtnoincidentsresolvedraisedBysellers.Enabled = true;
                txtanyothermatterofrelevance.Enabled = true;

                btnsubmit.Visible = false;
                btnsubmit.Enabled = true;
                btncncl.Visible = false;
                btncncl.Enabled = true;
                btnupdate.Visible = true;
                btncancelforedit.Visible = true;
            }
            gridbind();
           
        }

        protected void grdgemprocDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btncancelforedit_Click(object sender, EventArgs e)
        {
            clear();
            txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
            txtorderplacedGEM.Enabled = false;
            txtamountprocuremnt_GEM.Enabled = false;
            txttotalcontractValue.Enabled = false;
            txtpaymentmadefortotalorders.Enabled = false;
            txtpaymentmadeforGeMorders.Enabled = false;
            txtgemorderpaymentsareaffected_10days.Enabled = false;
            txtpaymntsgemorderpaymentsareaffected_10days.Enabled = false;
            txtgemorderpaymentsareaffected_20days.Enabled = false;
            txtpaymntsgemorderpaymentsareaffected_20days.Enabled = false;
            txtgemorderpaymentsareaffected_30days.Enabled = false;
            txtpaymntsgemorderpaymentsareaffected_30days.Enabled = false;
            txtnoofGeMOrdersDelinedByseller.Enabled = false;
            txtnoofGeMOrdersacceptedBysellernotdel.Enabled = false;
            txtnorejdurtoinferiorsup.Enabled = false;
            txtnoofincidentsraisedagasellers.Enabled = false;
            txtnoincidentsresolvedraisedagainstsellers.Enabled = false;
            txtnoofincidentsraisedbysellersagadeptt.Enabled = false;
            txtnoincidentsresolvedraisedBysellers.Enabled = false;
            txtanyothermatterofrelevance.Enabled = false;

            btnsubmit.Visible = true;
            btnsubmit.Enabled = false;
            btncncl.Visible = true;
            btncncl.Enabled = false;
            btnupdate.Visible = false;
            btncancelforedit.Visible = false;
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdgemprocDetails.AllowPaging = false;
                grdgemprocDetails.Columns[0].Visible = false;
               
                    gridbind();
              
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdgemprocDetails.RenderControl(hw);
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
                grdgemprocDetails.AllowPaging = true;
                ds = cmm.RunSpReturnDSParam("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                              new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                              new SqlParameter("@Month", Convert.ToInt16(ddlmonth.SelectedValue)),
                                                                                              new SqlParameter("@year", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                              new SqlParameter("@flag", 10));
                if (!Convert.ToBoolean(ds.Tables[0].Rows[0][0]))// check the status of SubmittedtoDirectorate if it is false then btn visible
                {
                    grdgemprocDetails.Columns[0].Visible = true;
                }
                else
                    grdgemprocDetails.Columns[0].Visible = false;
              
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

        protected void btngemreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GEMReports.aspx", true);
        }

        protected void btneditddo_Click(object sender, EventArgs e)
        {
            Session["EditDDOflag"] = 1;
            Response.Redirect("~/AttachDDO.aspx", true);
        }

        protected void lnkdownload_Click(object sender, EventArgs e)
        {
          
            string paths = Server.MapPath("~/Mannual/PRASARNETGeMUserManual.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "PrasarNet_GeM_Portal_Manual.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }
    }
}