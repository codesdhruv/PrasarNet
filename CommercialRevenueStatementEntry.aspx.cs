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
    public partial class CommercialRevenueStatementEntry : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        Decimal total = 0;
        Decimal total2 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) == "")
            {
                Response.Redirect("homepage.aspx");
            }
            else
            {
                if (!IsPostBack)
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
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = false;
                    divprev.Visible = false;

                    ddlnameofcomwing.Enabled = false;
                    ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
                    //if (ddlnameofbillingunit.SelectedIndex != 0)
                    //{
                    //    ddlchannel.SelectedIndex = 0;
                    //    ddlchannel.Items.Clear();
                    //}
                    ddlchannel.Enabled = false;
                    ddlchannel.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofbillingunit.Enabled = false;
                    ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

                    txttotalgrossbillingamyt.ReadOnly = true;
                    txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
                    txtdiscountamount.ReadOnly = true;
                    txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
                    txtGSTamt.ReadOnly = true;
                    txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
                    txtnetbilling.ReadOnly = true;
                    txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
                    txttotalamtrealised.ReadOnly = true;
                    txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
                    Label1.Text = Convert.ToString(Session["UserName"]);


                    cmm.bindDDLWidParam(ddlmonth, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select Month--",
                                                                                                            new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlyear, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select Year--",
                                                                                                            new SqlParameter("@flag", 1));

                    // Session["Orgid"]
                    cmm.bindDDLWidParam(ddlagency, "PN18_commercialrevenueSP", "NameOfAgencies", "id", "PRASARNETConnectionString", "--Agency--",
                                                                                                             new SqlParameter("@flag", 1));

                    cmm.bindDDLWidParam(ddltypofbilling, "PN18_commercialrevenueSP", "TypeofBilling", "id", "PRASARNETConnectionString", "--Billing Type--",
                                                                                                             new SqlParameter("@flag", 2));
                    cmm.bindDDLWidParam(ddlnameofcomwing, "PN18_commercialrevenueSP", "NameofCommercialWing", "id", "PRASARNETConnectionString", "--Commercial Wing--"
                                                                                                            , new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"]))
                                                                                                            , new SqlParameter("@flag", 3));
                    cmm.bindDDLWidParam(ddlnameofbillingunit, "PN18_commercialrevenueSP", "NameOfBillingUnit", "BillingUnitID", "PRASARNETConnectionString", "--Name Of Billing Unit--"
                                                                                                            , new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"]))
                                                                                                            , new SqlParameter("@flag", 4));
                }
            }
        }

        protected void ddlnameofbillingunit_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddlchannel, "PN18_commercialrevenueSP", "ChannelName", "Id", "PRASARNETConnectionString", "--Name of Channel--"
                                                                                                          , new SqlParameter("@BillingUnitId", Convert.ToInt32(ddlnameofbillingunit.SelectedValue))
                                                                                                          , new SqlParameter("@flag", 5));
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            ddlmonth.SelectedIndex = 0;
            ddlyear.SelectedIndex = 0;
            ddlagency.SelectedIndex = 0;
            ddltypofbilling.SelectedIndex = 0;
            ddlnameofcomwing.SelectedIndex = 0;
            if (ddlnameofbillingunit.SelectedIndex != 0)
            {
                ddlchannel.SelectedIndex = 0;
                ddlchannel.Items.Clear();
            }
            ddlnameofbillingunit.SelectedIndex = 0;
            txttotalgrossbillingamyt.Text = "";
            txtdiscountamount.Text = "";
            txtGSTamt.Text = "";
            txtnetbilling.Text = "";
            txttotalamtrealised.Text = "";

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn;
            cn = cmm.OpenConnection("PRASARNETConnectionString");

            SqlCommand cmd = new SqlCommand("PN18_commercialrevenueSP", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"]));
            cmd.Parameters.AddWithValue("@Usertypeid", Convert.ToInt16(Session["Usertype"]));
            cmd.Parameters.AddWithValue("@orgid", Convert.ToInt16(Session["Orgid"]));
            cmd.Parameters.AddWithValue("@commercialwingid", Convert.ToInt16(ddlnameofcomwing.SelectedValue));
            cmd.Parameters.AddWithValue("@BillingUnitId", Convert.ToInt16(ddlnameofbillingunit.SelectedValue));
            cmd.Parameters.AddWithValue("@ChannelId", Convert.ToInt32(ddlchannel.SelectedValue));
            cmd.Parameters.AddWithValue("@Reporting_MonthId", Convert.ToInt16(ddlmonth.SelectedValue));
            cmd.Parameters.AddWithValue("@Reporting_financialID", Convert.ToInt16(ddlyear.SelectedValue));

            cmd.Parameters.AddWithValue("@TypeofAgencyId", Convert.ToInt16(ddlagency.SelectedValue));
            cmd.Parameters.AddWithValue("@TypeofBillingId", Convert.ToInt16(ddltypofbilling.SelectedValue));
            cmd.Parameters.AddWithValue("@TotalgrossBillingAmt", Convert.ToDecimal(txttotalgrossbillingamyt.Text.Trim()));
            cmd.Parameters.AddWithValue("@TotalDiscountAmt", Convert.ToDecimal(txtdiscountamount.Text.Trim()));
            cmd.Parameters.AddWithValue("@TotalGSTAmt", Convert.ToDecimal(txtGSTamt.Text.Trim()));
            cmd.Parameters.AddWithValue("@TotalNetBillingAmt", Convert.ToDecimal(txtnetbilling.Text.Trim()));
            cmd.Parameters.AddWithValue("@TotalAmtRecieved", Convert.ToDecimal(txttotalamtrealised.Text.Trim()));
            cmd.Parameters.AddWithValue("@createdby", Convert.ToString(Session["UserName"]));
            cmd.Parameters.AddWithValue("@flag", 6);


            cmd.Parameters.Add("@comrevidout", SqlDbType.Int);
            cmd.Parameters["@comrevidout"].Direction = ParameterDirection.Output;
            int j = cmd.ExecuteNonQuery();
            int comrevidout = (int)cmd.Parameters["@comrevidout"].Value;
            cmm.CloseConnection(cn);


            //int i = cmm.RunSP("PN18_GEMProcurementSP", "PRASARNETConnectionString", new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
            //                                                                                  new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
            //                                                                                  new SqlParameter("@orgid", Convert.ToInt16(Session["Orgid"])),
            //                                                                                  new SqlParameter("@commercialwingid", Convert.ToInt16(ddlnameofcomwing.SelectedValue)),
            //                                                                                  new SqlParameter("@BillingUnitId", Convert.ToInt16(ddlnameofbillingunit.SelectedValue)),
            //                                                                                  new SqlParameter("@ChannelId", Convert.ToInt32(ddlchannel.SelectedValue)),
            //                                                                                  new SqlParameter("@Reporting_MonthId", Convert.ToInt16(ddlmonth.SelectedValue)),
            //                                                                                  new SqlParameter("@Reporting_financialID", Convert.ToInt16(ddlyear.SelectedValue)),
            //                                                                                  new SqlParameter("@TypeofAgencyId", Convert.ToInt16(ddlagency.SelectedValue)),
            //                                                                                  new SqlParameter("@TypeofBillingId", Convert.ToInt16(ddltypofbilling.SelectedValue)),
            //                                                                                  new SqlParameter("@TotalgrossBillingAmt", Convert.ToDecimal(txttotalgrossbillingamyt.Text.Trim())),
            //                                                                                  new SqlParameter("@TotalDiscountAmt", Convert.ToDecimal(txtdiscountamount.Text.Trim())),
            //                                                                                  new SqlParameter("@TotalGSTAmt", Convert.ToDecimal(txtGSTamt.Text.Trim())),
            //                                                                                  new SqlParameter("@TotalNetBillingAmt", Convert.ToDecimal(txtnetbilling.Text.Trim())),
            //                                                                                  new SqlParameter("@TotalAmtRecieved", Convert.ToDecimal(txttotalamtrealised.Text.Trim())),
            //                                                                                  new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
            //                                                                                  new SqlParameter("@flag", 6));
            if (j > 0)
            {
                ViewState["comrevid"] = Convert.ToInt32(comrevidout);
                if (Convert.ToDecimal(txttotalamtrealised.Text) == 0)
                {
                    Boolean submittedtopb = false;
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = false;
                    divprev.Visible = true;
                    divcommercialrevMasterDataentry.Visible = false;
                    btncancelprev.Visible = false;
                    grdprev.Visible = false;
                    btnEditPart2.Visible = false;
                    btneditpart1.Visible = true;
                    lblpanelheadingprev.Text = ":: Preview and Submit ::";
                    DataSet ds1 = new DataSet();
                    ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                         new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                                       new SqlParameter("@flag", 9));
                    lblmnthprev.Text = ds1.Tables[0].Rows[0][7].ToString();
                    lblyearprev.Text = ds1.Tables[0].Rows[0][5].ToString();
                    lblagencyprev.Text = ds1.Tables[0].Rows[0][15].ToString();
                    lbltypofbillingprev.Text = ds1.Tables[0].Rows[0][17].ToString();
                    lblnameofcommbillingprev.Text = ds1.Tables[0].Rows[0][9].ToString();
                    lblnamofbillingunitprev.Text = ds1.Tables[0].Rows[0][11].ToString();
                    lblchannelprev.Text = ds1.Tables[0].Rows[0][13].ToString();
                    lblgrossbillprev.Text = ds1.Tables[0].Rows[0][18].ToString();
                    lbldicountprev.Text = ds1.Tables[0].Rows[0][19].ToString();
                    lblgstprev.Text = ds1.Tables[0].Rows[0][20].ToString();
                    lblnetbillprev.Text = ds1.Tables[0].Rows[0][21].ToString();
                    lblamountrealisedprev.Text = ds1.Tables[0].Rows[0][22].ToString();


                }
                else
                {
                    Label42.Text = ":: Enter Details of Amount Realised ::";
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = true;
                    divprev.Visible = false;

                    divcommercialrevMasterDataentry.Visible = true;

                    BindGrid();//binding here due to footer
                    ddlmonth.Enabled = false;
                    ddlmonth.CssClass = "select widthofboxes backgroundcolor";
                    ddlyear.Enabled = false;
                    ddlyear.CssClass = "select widthofboxes backgroundcolor";
                    ddlagency.Enabled = false;
                    ddlagency.CssClass = "select widthofboxes backgroundcolor";
                    ddltypofbilling.Enabled = false;
                    ddltypofbilling.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofcomwing.Enabled = false;
                    ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
                    //if (ddlnameofbillingunit.SelectedIndex != 0)
                    //{
                    //    ddlchannel.SelectedIndex = 0;
                    //    ddlchannel.Items.Clear();
                    //}
                    ddlchannel.Enabled = false;
                    ddlchannel.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofbillingunit.Enabled = false;
                    ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

                    txttotalgrossbillingamyt.ReadOnly = true;
                    txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
                    txtdiscountamount.ReadOnly = true;
                    txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
                    txtGSTamt.ReadOnly = true;
                    txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
                    txtnetbilling.ReadOnly = true;
                    txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
                    txttotalamtrealised.ReadOnly = true;
                    txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
                }
            }
        }
        protected void BindGrid()
        {
            DataSet ds8 = new DataSet();
            ds8 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                  new SqlParameter("@flag", 8));
            if (ds8.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = ds8;
                gvDetails.DataBind();
            }
            else
            {
                DataTable dt = new DataTable();
                //Here ensure that you have added all the column available in your gridview
                dt.Columns.Add("Id", typeof(Int32));
                dt.Columns.Add("Year", typeof(string));
                dt.Columns.Add("month", typeof(string));
                dt.Columns.Add("AmountRecieved", typeof(decimal));


                dt.Rows.Add(dt.NewRow());
                gvDetails.DataSource = dt;
                gvDetails.DataBind();


                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";

            }
        }
        protected void BindGrid2()
        {
            DataSet ds1 = new DataSet();

            ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                              new SqlParameter("@PaymentFinancialId", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                                              new SqlParameter("@paymentMonthId", Convert.ToInt32(ddlmonth.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 8));
            if (ds1.Tables[0].Rows.Count > 0)
            {
                grdprev.DataSource = ds1;
                grdprev.DataBind();
            }
            //else
            //{
            //    DataTable dt = new DataTable();
            //    //Here ensure that you have added all the column available in your gridview
            //    dt.Columns.Add("Id", typeof(Int32));
            //    dt.Columns.Add("Year", typeof(string));
            //    dt.Columns.Add("month", typeof(string));
            //    dt.Columns.Add("AmountRecieved", typeof(decimal));


            //    dt.Rows.Add(dt.NewRow());
            //    gvDetails.DataSource = dt;
            //    gvDetails.DataBind();


            //    int columncount = gvDetails.Rows[0].Cells.Count;
            //    gvDetails.Rows[0].Cells.Clear();
            //    gvDetails.Rows[0].Cells.Add(new TableCell());
            //    gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
            //    gvDetails.Rows[0].Cells[0].Text = "No Records Found";

            //}
        }
        protected void txtGSTamt_TextChanged(object sender, EventArgs e)
        {
            decimal totalnetbill = 0, totalgrossamt = 0, totaldiscount = 0, totalGSTamt = 0;
            if (txttotalgrossbillingamyt.Text.Trim() != "")
            {
                totalgrossamt = Convert.ToDecimal(txttotalgrossbillingamyt.Text.Trim());
            }
            if (txtdiscountamount.Text.Trim() != "")
            {
                totaldiscount = Convert.ToDecimal(txtdiscountamount.Text.Trim());
            }
            if (txtGSTamt.Text.Trim() != "")
            {
                totalGSTamt = Convert.ToDecimal(txtGSTamt.Text.Trim());
            }
            totalnetbill = totalgrossamt + totalGSTamt - totaldiscount;
            txtnetbilling.Text = Convert.ToString(totalnetbill);
        }

        protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlfinyearfootergrd = e.Row.FindControl("ddlfinyearfootergrd") as DropDownList;
                DropDownList ddlmonthfootergrd = e.Row.FindControl("ddlmonthfootergrd") as DropDownList;
                Label lbltotal = e.Row.FindControl("lbltotal") as Label;

                cmm.bindDDLWidParam(ddlmonthfootergrd, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select Month--",
                                                                                                               new SqlParameter("@flag", 2));
                cmm.bindDDLWidParam(ddlfinyearfootergrd, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select Year--",
                                                                                                        new SqlParameter("@flag", 1));
                if (total == 0)
                {
                    lbltotal.Text = "";
                }
                else
                    lbltotal.Text = total.ToString();

            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (gvDetails.EditIndex == e.Row.RowIndex)
                {
                    Label lblamtrealisededitemgrd2 = e.Row.FindControl("lblamtrealisededitemgrd2") as Label;
                    if (lblamtrealisededitemgrd2.Text != "")
                    {
                        total += Convert.ToDecimal(lblamtrealisededitemgrd2.Text);
                    }

                }
                else
                {
                    Label lblamtrealisededitemgrd = e.Row.FindControl("lblamtrealisededitemgrd") as Label;
                    if (lblamtrealisededitemgrd.Text != "")
                    {
                        total += Convert.ToDecimal(lblamtrealisededitemgrd.Text);
                    }
                    ViewState["total"] = total;
                }
                e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
            }
            if (e.Row.RowType == DataControlRowType.DataRow && gvDetails.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlfinyearEditgrd = e.Row.FindControl("ddlfinyearEditgrd") as DropDownList;
                DropDownList ddlmonthEditgrd = e.Row.FindControl("ddlmonthEditgrd") as DropDownList;





                cmm.bindDDLWidParam(ddlmonthEditgrd, "PN18_year_month", "month", "monthid", "PRASARNETConnectionString", "--Select Month--",
                                                                                                          new SqlParameter("@flag", 2));
                cmm.bindDDLWidParam(ddlfinyearEditgrd, "PN18_year_month", "Year", "yearid", "PRASARNETConnectionString", "--Select Year--",
                                                                                                        new SqlParameter("@flag", 1));
                string selectedmonth = DataBinder.Eval(e.Row.DataItem, "month").ToString();
                ddlmonthEditgrd.Items.FindByText(selectedmonth).Selected = true;

                string selectedyear = DataBinder.Eval(e.Row.DataItem, "Year").ToString();
                ddlfinyearEditgrd.Items.FindByText(selectedyear).Selected = true;
            }

        }
        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                Label lbltotal = (Label)((GridView)sender).FooterRow.FindControl("lbltotal");
                TextBox txtamtrealisedfootergrd = (TextBox)gvDetails.FooterRow.FindControl("txtamtrealisedfootergrd");
                DropDownList ddlfinyearfootergrd = (DropDownList)gvDetails.FooterRow.FindControl("ddlfinyearfootergrd");
                DropDownList ddlmonthfootergrd = (DropDownList)gvDetails.FooterRow.FindControl("ddlmonthfootergrd");
                decimal prior = 0;
                if (lbltotal.Text != "")
                    prior = Convert.ToDecimal(lbltotal.Text);
                decimal totalcheck = prior + Convert.ToDecimal(txtamtrealisedfootergrd.Text);
                int i = 0;
                if (totalcheck <= Convert.ToDecimal(txttotalamtrealised.Text))
                {
                    i = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@paymentMonthId", Convert.ToInt16(ddlmonthfootergrd.SelectedValue)),
                                                                                                                    new SqlParameter("@PaymentFinancialId", Convert.ToInt16(ddlfinyearfootergrd.SelectedValue)),
                                                                                                                    new SqlParameter("@AmountRecieved", Convert.ToDecimal(txtamtrealisedfootergrd.Text.Trim())),
                                                                                                                    new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                                                    new SqlParameter("@flag", 7));

                    if (i == 1)
                    {
                        BindGrid();
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Saved Successfully!');", true);
                        if (totalcheck == Convert.ToDecimal(txttotalamtrealised.Text))
                        {
                            btnpreviewandsubmit.Enabled = true;
                            btnpreviewandsubmit.BackColor = System.Drawing.Color.Lavender;
                        }
                        else
                        {
                            btnpreviewandsubmit.Enabled = false;
                            btnpreviewandsubmit.BackColor = System.Drawing.Color.LightBlue;
                        }

                    }
                    else
                    {
                        BindGrid();
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!');", true);

                    }

                }
                else
                {
                    BindGrid();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Total of Bifurcated figures (included a figure you was trying to add now) did not match with the Total Amount Realised (as subscribed in Part 1)!');", true);
                }

            }
        }

        protected void btnpreviewandsubmit_Click(object sender, EventArgs e)
        {
            Boolean submittedtopb = false;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;
            divcommercialrevMasterDataentry.Visible = false;

            divprev.Visible = true;
            btncancelprev.Visible = false;

            grdprev.Visible = true;
            btnEditPart2.Visible = true;

            lblpanelheadingprev.Text = ":: Preview and Submit ::";
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                 new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                               new SqlParameter("@flag", 9));
            lblmnthprev.Text = ds1.Tables[0].Rows[0][7].ToString();
            lblyearprev.Text = ds1.Tables[0].Rows[0][5].ToString();
            lblagencyprev.Text = ds1.Tables[0].Rows[0][15].ToString();
            lbltypofbillingprev.Text = ds1.Tables[0].Rows[0][17].ToString();
            lblnameofcommbillingprev.Text = ds1.Tables[0].Rows[0][9].ToString();
            lblnamofbillingunitprev.Text = ds1.Tables[0].Rows[0][11].ToString();
            lblchannelprev.Text = ds1.Tables[0].Rows[0][13].ToString();
            lblgrossbillprev.Text = ds1.Tables[0].Rows[0][18].ToString();
            lbldicountprev.Text = ds1.Tables[0].Rows[0][19].ToString();
            lblgstprev.Text = ds1.Tables[0].Rows[0][20].ToString();
            lblnetbillprev.Text = ds1.Tables[0].Rows[0][21].ToString();
            lblamountrealisedprev.Text = ds1.Tables[0].Rows[0][22].ToString();
            BindGrid2();
        }

        protected void Button1_Click(object sender, EventArgs e)//final submit
        {
            if(Convert.ToDecimal(ViewState["total2"])==Convert.ToDecimal(lblamountrealisedprev.Text))
            {
                int ret = 0;
                DataSet dschk1 = new DataSet();
                DataSet dstrnchk = new DataSet();

                //if (Convert.ToInt16(ViewState["alreadyexists"]) == 1)//already exists in records
                //{

                dschk1 = cmm.RunSpRtnDsParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                          new SqlParameter("@flag", 8));
                if (dschk1.Tables[0].Rows.Count > 0)// check weather a replated entry exists in trn table
                {// ifyes
                    ret = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                                              new SqlParameter("@flag", 10));
                }
                else// if  NO
                {
                    ret = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                           new SqlParameter("@flag", 15));
                }
                //}
                //else
                //{
                //    dschk1 = cmm.RunSpRtnDsParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                //                                                                             new SqlParameter("@flag", 8));
                //    if (dschk1.Tables[0].Rows.Count > 0)// check weather a replated entry exists in trn table
                //    {// ifyes
                //        ret = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                //                                                                                                                  new SqlParameter("@flag", 10));
                //    }
                //    else// if  NO
                //    {
                //        ret = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                //                                                                                               new SqlParameter("@flag", 15));
                //    }
                //}
                if (ret > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully!');", true);
                    divsubupdate1.Visible = true;
                    divtransentry.Visible = false;
                    divcommercialrevMasterDataentry.Visible = true;
                    divprev.Visible = false;

                    ddlmonth.SelectedIndex = 0;
                    ddlyear.SelectedIndex = 0;
                    ddlagency.SelectedIndex = 0;
                    ddltypofbilling.SelectedIndex = 0;
                    ddlnameofcomwing.SelectedIndex = 0;
                    if (ddlnameofbillingunit.SelectedIndex != 0)
                    {
                        ddlchannel.SelectedIndex = 0;
                        ddlchannel.Items.Clear();
                    }
                    ddlnameofbillingunit.SelectedIndex = 0;
                    txttotalgrossbillingamyt.Text = "";
                    txtdiscountamount.Text = "";
                    txtGSTamt.Text = "";
                    txtnetbilling.Text = "";
                    txttotalamtrealised.Text = "";

                    ddlmonth.Enabled = true;
                    ddlmonth.CssClass = "select widthofboxes backgroundcolor1";
                    ddlyear.Enabled = true;
                    ddlyear.CssClass = "select widthofboxes backgroundcolor1";
                    ddlagency.Enabled = true;
                    ddlagency.CssClass = "select widthofboxes backgroundcolor1";
                    ddltypofbilling.Enabled = true;
                    ddltypofbilling.CssClass = "select widthofboxes backgroundcolor1";
                    ddlnameofcomwing.Enabled = true;
                    ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor1";
                    //if (ddlnameofbillingunit.SelectedIndex != 0)
                    //{
                    //    ddlchannel.SelectedIndex = 0;
                    //    ddlchannel.Items.Clear();
                    //}
                    ddlchannel.Enabled = false;
                    ddlchannel.CssClass = "select widthofboxes backgroundcolor1";
                    ddlnameofbillingunit.Enabled = false;
                    ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor1";

                    txttotalgrossbillingamyt.ReadOnly = true;
                    txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor1";
                    txtdiscountamount.ReadOnly = true;
                    txtdiscountamount.CssClass = "select widthofboxes backgroundcolor1";
                    txtGSTamt.ReadOnly = true;
                    txtGSTamt.CssClass = "select widthofboxes backgroundcolor1";
                    txtnetbilling.ReadOnly = true;
                    txtnetbilling.CssClass = "select widthofboxes backgroundcolor1";
                    txttotalamtrealised.ReadOnly = true;
                    txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor1";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Since, the total amount realised subscribed in part1 is not matched with the Total of the bifurcated amount subscribed in part 2!! Kindly,Edit Part2.');", true);
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void ddltypofbilling_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlmonth.SelectedIndex != 0 && ddlyear.SelectedIndex != 0 && ddlagency.SelectedIndex != 0)
            {
                if (ddltypofbilling.SelectedIndex != 0)
                {
                    ds = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@Reporting_MonthId", Convert.ToInt32(ddlmonth.SelectedValue)),
                                                                                                     new SqlParameter("@Reporting_financialID", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                                     new SqlParameter("@TypeofBillingId", Convert.ToInt32(ddltypofbilling.SelectedValue)),
                                                                                                     new SqlParameter("@TypeofAgencyId", Convert.ToInt32(ddlagency.SelectedValue)),
                                                                                                     new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                     new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                      new SqlParameter("@flag", 11));
                    if (ds.Tables[0].Rows.Count == 0)// No records Exists in comrevtable or table1
                    {
                        ViewState["alreadyexists"] = 0;
                        divcommercialrevMasterDataentry.Visible = true;
                        divsubupdate1.Visible = true;
                        divtransentry.Visible = false;
                        divprev.Visible = false;

                        ddlnameofcomwing.Enabled = true;
                        ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor1";
                        //if (ddlnameofbillingunit.SelectedIndex != 0)
                        //{
                        //    ddlchannel.SelectedIndex = 0;
                        //    ddlchannel.Items.Clear();
                        //}
                        ddlchannel.Enabled = true;
                        ddlchannel.CssClass = "select widthofboxes backgroundcolor1";
                        ddlnameofbillingunit.Enabled = true;
                        ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor1";

                        txttotalgrossbillingamyt.ReadOnly = false;
                        txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor1";
                        txtdiscountamount.ReadOnly = false;
                        txtdiscountamount.CssClass = "select widthofboxes backgroundcolor1";
                        txtGSTamt.ReadOnly = false;
                        txtGSTamt.CssClass = "select widthofboxes backgroundcolor1";
                        txtnetbilling.ReadOnly = true;
                        txtnetbilling.CssClass = "select widthofboxes backgroundcolor1";
                        txttotalamtrealised.ReadOnly = false;
                        txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor1";
                        btncancelprev.Visible = false;
                    }
                    else// Records already exists
                    {
                        DataSet dschk = new DataSet();
                        ViewState["alreadyexists"] = 1;
                        divcommercialrevMasterDataentry.Visible = false;
                        divprev.Visible = true;
                        divsubupdate1.Visible = false;
                        divtransentry.Visible = false;
                        DataSet ds2 = new DataSet();
                        //fetch Comrevid
                        ds2 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@Reporting_MonthId", Convert.ToInt32(ddlmonth.SelectedValue)),
                                                                                                     new SqlParameter("@Reporting_financialID", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                                     new SqlParameter("@TypeofBillingId", Convert.ToInt32(ddltypofbilling.SelectedValue)),
                                                                                                     new SqlParameter("@TypeofAgencyId", Convert.ToInt32(ddlagency.SelectedValue)),
                                                                                                     new SqlParameter("@stationsectionid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                     new SqlParameter("@Usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                     new SqlParameter("@flag", 12));// to findout comrevid

                        Int64 comrevid = Convert.ToInt64(ds2.Tables[0].Rows[0][0]);
                        ViewState["comrevid"] = comrevid;
                        Boolean submittedtopb = Convert.ToBoolean(ds2.Tables[0].Rows[0][1]);

                        DataSet ds1 = new DataSet();
                        ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", comrevid),
                                                                                                new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                              new SqlParameter("@flag", 9));// bind in preview content box
                        lblmnthprev.Text = ds1.Tables[0].Rows[0][7].ToString();
                        lblyearprev.Text = ds1.Tables[0].Rows[0][5].ToString();
                        lblagencyprev.Text = ds1.Tables[0].Rows[0][15].ToString();
                        lbltypofbillingprev.Text = ds1.Tables[0].Rows[0][17].ToString();
                        lblnameofcommbillingprev.Text = ds1.Tables[0].Rows[0][9].ToString();
                        lblnamofbillingunitprev.Text = ds1.Tables[0].Rows[0][11].ToString();
                        lblchannelprev.Text = ds1.Tables[0].Rows[0][13].ToString();
                        lblgrossbillprev.Text = ds1.Tables[0].Rows[0][18].ToString();
                        lbldicountprev.Text = ds1.Tables[0].Rows[0][19].ToString();
                        lblgstprev.Text = ds1.Tables[0].Rows[0][20].ToString();
                        lblnetbillprev.Text = ds1.Tables[0].Rows[0][21].ToString();
                        lblamountrealisedprev.Text = ds1.Tables[0].Rows[0][22].ToString();
                        // BindGrid
                        DataSet ds3 = new DataSet();
                        ds3 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", comrevid),
                                                                                                              new SqlParameter("@PaymentFinancialId", Convert.ToInt32(ddlyear.SelectedValue)),
                                                                                                              new SqlParameter("@paymentMonthId", Convert.ToInt32(ddlmonth.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 8));
                        if (ds3.Tables[0].Rows.Count > 0)// binding of grid2 in preview content box
                        {
                            grdprev.DataSource = ds3;
                            grdprev.DataBind();
                        }
                        // Hide or unhide the Final Submit and Edit Button
                        if (submittedtopb)
                        {
                            div3.Visible = false;
                            lblpanelheadingprev.Text = ":: Details of Record(s) Submitted ::";
                        }
                        else
                        {
                            div3.Visible = true;
                            lblpanelheadingprev.Text = ":: Preview and Submit ::";
                            //Check the Entry exists in Trnamount Recieved Table in respect of commercial revid
                            dschk = cmm.RunSpRtnDsParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                            new SqlParameter("@flag", 8));// check whether record exists in Trn_amountrecieved table
                            if (dschk.Tables[0].Rows.Count > 0)// records exists=yes
                            {
                                btneditpart1.Visible = true;
                                btnEditPart2.Visible = true;
                            }
                            else//No record
                            {
                                btneditpart1.Visible = true;
                                btnEditPart2.Visible = false;
                            }
                        }

                        ddlnameofcomwing.Enabled = false;
                        ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
                        //if (ddlnameofbillingunit.SelectedIndex != 0)
                        //{
                        //    ddlchannel.SelectedIndex = 0;
                        //    ddlchannel.Items.Clear();
                        //}
                        ddlchannel.Enabled = false;
                        ddlchannel.CssClass = "select widthofboxes backgroundcolor";
                        ddlnameofbillingunit.Enabled = false;
                        ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

                        txttotalgrossbillingamyt.ReadOnly = true;
                        txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
                        txtdiscountamount.ReadOnly = true;
                        txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
                        txtGSTamt.ReadOnly = true;
                        txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
                        txtnetbilling.ReadOnly = true;
                        txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
                        txttotalamtrealised.ReadOnly = true;
                        txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Record(s) in respect of Selected year, month, Type of Billing and Agency already submitted by you!');", true);
                        btncancelprev.Visible = true;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please select an appropriate Type Of Billing!!');", true);
                    ddltypofbilling.SelectedIndex = 0;
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = false;
                    divprev.Visible = false;
                    ddlnameofcomwing.SelectedIndex = 0;
                    if (ddlnameofbillingunit.SelectedIndex != 0)
                    {
                        ddlchannel.SelectedIndex = 0;
                        ddlchannel.Items.Clear();
                    }
                    ddlnameofbillingunit.SelectedIndex = 0;
                    txttotalgrossbillingamyt.Text = "";
                    txtdiscountamount.Text = "";
                    txtGSTamt.Text = "";
                    txtnetbilling.Text = "";
                    txttotalamtrealised.Text = "";
                    ddlnameofcomwing.Enabled = false;
                    ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
                    //if (ddlnameofbillingunit.SelectedIndex != 0)
                    //{
                    //    ddlchannel.SelectedIndex = 0;
                    //    ddlchannel.Items.Clear();
                    //}
                    ddlchannel.Enabled = false;
                    ddlchannel.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofbillingunit.Enabled = false;
                    ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

                    txttotalgrossbillingamyt.ReadOnly = true;
                    txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
                    txtdiscountamount.ReadOnly = true;
                    txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
                    txtGSTamt.ReadOnly = true;
                    txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
                    txtnetbilling.ReadOnly = true;
                    txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
                    txttotalamtrealised.ReadOnly = true;
                    txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";


                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please select an appropriate Month,Year and Agencies before proceeding!!');", true);
                ddltypofbilling.SelectedIndex = 0;
            }
        }

        protected void btncancelprev_Click(object sender, EventArgs e)
        {
            divcommercialrevMasterDataentry.Visible = true;
            divprev.Visible = false;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;

            ddlmonth.SelectedIndex = 0;
            ddlyear.SelectedIndex = 0;
            ddlagency.SelectedIndex = 0;
            ddltypofbilling.SelectedIndex = 0;

            ddlmonth.CssClass = "select widthofboxes backgroundcolor1";
            ddlyear.CssClass = "select widthofboxes backgroundcolor1";
            ddlagency.CssClass = "select widthofboxes backgroundcolor1";
            ddltypofbilling.CssClass = "select widthofboxes backgroundcolor1";

            ddlnameofcomwing.SelectedIndex = 0;
            if (ddlnameofbillingunit.SelectedIndex != 0)
            {
                ddlchannel.SelectedIndex = 0;
                ddlchannel.Items.Clear();
            }
            ddlnameofbillingunit.SelectedIndex = 0;
            txttotalgrossbillingamyt.Text = "";
            txtdiscountamount.Text = "";
            txtGSTamt.Text = "";
            txtnetbilling.Text = "";
            txttotalamtrealised.Text = "";
            ddlmonth.Enabled = true;
            ddlyear.Enabled = true;
            ddlagency.Enabled = true;
            ddltypofbilling.Enabled = true;
            ddlnameofcomwing.Enabled = false;
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
            //if (ddlnameofbillingunit.SelectedIndex != 0)
            //{
            //    ddlchannel.SelectedIndex = 0;
            //    ddlchannel.Items.Clear();
            //}
            ddlchannel.Enabled = false;
            ddlchannel.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofbillingunit.Enabled = false;
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

            txttotalgrossbillingamyt.ReadOnly = true;
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
            txtdiscountamount.ReadOnly = true;
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
            txtGSTamt.ReadOnly = true;
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
            txtnetbilling.ReadOnly = true;
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
            txttotalamtrealised.ReadOnly = true;
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
        }

        protected void ddlmonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlyear.SelectedIndex = 0;
            ddlagency.SelectedIndex = 0;
            ddltypofbilling.SelectedIndex = 0;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;
            divprev.Visible = false;

            ddlnameofcomwing.Enabled = false;
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
            //if (ddlnameofbillingunit.SelectedIndex != 0)
            //{
            //    ddlchannel.SelectedIndex = 0;
            //    ddlchannel.Items.Clear();
            //}
            ddlchannel.Enabled = false;
            ddlchannel.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofbillingunit.Enabled = false;
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

            txttotalgrossbillingamyt.ReadOnly = true;
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
            txtdiscountamount.ReadOnly = true;
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
            txtGSTamt.ReadOnly = true;
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
            txtnetbilling.ReadOnly = true;
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
            txttotalamtrealised.ReadOnly = true;
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlagency.SelectedIndex = 0;
            ddltypofbilling.SelectedIndex = 0;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;
            divprev.Visible = false;

            ddlnameofcomwing.Enabled = false;
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
            //if (ddlnameofbillingunit.SelectedIndex != 0)
            //{
            //    ddlchannel.SelectedIndex = 0;
            //    ddlchannel.Items.Clear();
            //}
            ddlchannel.Enabled = false;
            ddlchannel.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofbillingunit.Enabled = false;
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

            txttotalgrossbillingamyt.ReadOnly = true;
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
            txtdiscountamount.ReadOnly = true;
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
            txtGSTamt.ReadOnly = true;
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
            txtnetbilling.ReadOnly = true;
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
            txttotalamtrealised.ReadOnly = true;
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
        }

        protected void ddlagency_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddltypofbilling.SelectedIndex = 0;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;
            divprev.Visible = false;

            ddlnameofcomwing.Enabled = false;
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
            //if (ddlnameofbillingunit.SelectedIndex != 0)
            //{
            //    ddlchannel.SelectedIndex = 0;
            //    ddlchannel.Items.Clear();
            //}
            ddlchannel.Enabled = false;
            ddlchannel.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofbillingunit.Enabled = false;
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

            txttotalgrossbillingamyt.ReadOnly = true;
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
            txtdiscountamount.ReadOnly = true;
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
            txtGSTamt.ReadOnly = true;
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
            txtnetbilling.ReadOnly = true;
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
            txttotalamtrealised.ReadOnly = true;
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
        }

        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Label lblfinyeareditemgrd = (Label)gvDetails.Rows[e.NewEditIndex].FindControl("lblfinyeareditemgrd");
            //Label lblmontheditemgrd = (Label)gvDetails.Rows[e.NewEditIndex].FindControl("lblmontheditemgrd");
            //DropDownList ddlmonthfootergrd = (DropDownList)gvDetails.Rows[e.NewEditIndex].FindControl("ddlmonthfootergrd");
            //DropDownList ddlfinyearfootergrd = (DropDownList)gvDetails.Rows[e.NewEditIndex].FindControl("ddlfinyearfootergrd");
            //ddlmonthfootergrd.ClearSelection(); //making sure the previous selection has been cleared
            //ddlmonthfootergrd.Items.FindByText(lblmontheditemgrd.Text).Selected = true;
            //ddlfinyearfootergrd.ClearSelection(); //making sure the previous selection has been cleared
            //ddlfinyearfootergrd.Items.FindByText(lblfinyeareditemgrd.Text).Selected = true;
            gvDetails.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lbltotal = (Label)((GridView)sender).FooterRow.FindControl("lbltotal");
            Label Id = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblid");
            Label lblfinyeareditemgrd = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblfinyeareditemgrd");
            Label lblmontheditemgrd = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblmontheditemgrd");
            Label lblamtrealisededitemgrd2 = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblamtrealisededitemgrd2");

            TextBox txtamtrealisededitgrd = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtamtrealisededitgrd");
            DropDownList ddlmonthEditgrd = (DropDownList)gvDetails.Rows[e.RowIndex].FindControl("ddlmonthEditgrd");
            DropDownList ddlfinyearEditgrd = (DropDownList)gvDetails.Rows[e.RowIndex].FindControl("ddlfinyearEditgrd");

            decimal prior = 0;
            decimal newtotal = 0;
            if (lbltotal.Text != "")
                prior = Convert.ToDecimal(lbltotal.Text);
            newtotal = prior - Convert.ToDecimal(lblamtrealisededitemgrd2.Text) + Convert.ToDecimal(txtamtrealisededitgrd.Text);

            //int i = 0;
            if (newtotal <= Convert.ToDecimal(txttotalamtrealised.Text))
            {
                int i = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@paymentMonthId", Convert.ToInt32(ddlmonthEditgrd.SelectedValue)),
                                                                                                            new SqlParameter("@PaymentFinancialId", Convert.ToInt32(ddlfinyearEditgrd.SelectedValue)),
                                                                                                            new SqlParameter("@AmountRecieved", Convert.ToDecimal(txtamtrealisededitgrd.Text)),
                                                                                                            new SqlParameter("@UpdatedBy", Convert.ToString(Session["UserName"])),
                                                                                                            new SqlParameter("@trnid", Convert.ToInt32(Id.Text)),
                                                                                                            new SqlParameter("@flag", 13));
                if (i == 1)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                    gvDetails.EditIndex = -1;
                    BindGrid();
                    if (newtotal == Convert.ToDecimal(txttotalamtrealised.Text))
                    {
                        btnpreviewandsubmit.Enabled = true;

                        btnpreviewandsubmit.BackColor = System.Drawing.Color.Lavender;
                    }
                    else
                    {
                        btnpreviewandsubmit.Enabled = false;
                        btnpreviewandsubmit.BackColor = System.Drawing.Color.LightBlue;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    BindGrid();
                }

            }
            else
            {
                BindGrid();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Total of Bifurcated figures (included a figure you was trying to add now) did not match with the Total Amount Realised (as subscribed in Part 1)!!!');", true);


            }



        }

        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int Id = int.Parse(gvDetails.Rows[e.RowIndex].FindControl("lblid2").ToString());
            Label lblid2 = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblid2");
            int Id = Convert.ToInt32(lblid2.Text);
            int i = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@DeletedBy", Convert.ToString(Session["UserName"])),
                                                                                                                new SqlParameter("@trnid", Id),
                                                                                                                new SqlParameter("@flag", 14));


            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Successfully Deleted!!');", true);
                gvDetails.EditIndex = -1;
                BindGrid();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                BindGrid();
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {

            int j = cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@commercialwingid", Convert.ToInt16(ddlnameofcomwing.SelectedValue)),
                                                                                              new SqlParameter("@BillingUnitId", Convert.ToInt16(ddlnameofbillingunit.SelectedValue)),
                                                                                              new SqlParameter("@ChannelId", Convert.ToInt32(ddlchannel.SelectedValue)),
                                                                                              new SqlParameter("@TotalgrossBillingAmt", Convert.ToDecimal(txttotalgrossbillingamyt.Text.Trim())),
                                                                                              new SqlParameter("@TotalDiscountAmt", Convert.ToDecimal(txtdiscountamount.Text.Trim())),
                                                                                              new SqlParameter("@TotalGSTAmt", Convert.ToDecimal(txtGSTamt.Text.Trim())),
                                                                                              new SqlParameter("@TotalNetBillingAmt", Convert.ToDecimal(txtnetbilling.Text.Trim())),
                                                                                              new SqlParameter("@TotalAmtRecieved", Convert.ToDecimal(txttotalamtrealised.Text.Trim())),
                                                                                              new SqlParameter("@UpdatedBy", Convert.ToString(Session["UserName"])),
                                                                                              new SqlParameter("@comrevid", Convert.ToString(ViewState["comrevid"])),
                                                                                              new SqlParameter("@flag", 16));
            if (j > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                if (Convert.ToDecimal(txttotalamtrealised.Text) == 0)
                {
                    DataSet dschk1 = new DataSet();
                    
                    dschk1 = cmm.RunSpRtnDsParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                              new SqlParameter("@flag", 8));
                    if (dschk1.Tables[0].Rows.Count > 0)// check weather a replated entry exists in trn table
                    {// ifyes
                        int del=cmm.RunSP("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                   new SqlParameter("@DeletedBy", Convert.ToString(Session["UserName"])),
                                                                                                   new SqlParameter("@flag", 17));
                    }
                    Boolean submittedtopb = false;
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = false;
                    divprev.Visible = true;
                    divcommercialrevMasterDataentry.Visible = false;
                    btncancelprev.Visible = false;
                    grdprev.Visible = false;
                    btnEditPart2.Visible = false;
                    btneditpart1.Visible = true;
                    lblpanelheadingprev.Text = ":: Preview and Submit ::";
                    DataSet ds1 = new DataSet();
                    ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                                         new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                                         new SqlParameter("@flag", 9));
                    lblmnthprev.Text = ds1.Tables[0].Rows[0][7].ToString();
                    lblyearprev.Text = ds1.Tables[0].Rows[0][5].ToString();
                    lblagencyprev.Text = ds1.Tables[0].Rows[0][15].ToString();
                    lbltypofbillingprev.Text = ds1.Tables[0].Rows[0][17].ToString();
                    lblnameofcommbillingprev.Text = ds1.Tables[0].Rows[0][9].ToString();
                    lblnamofbillingunitprev.Text = ds1.Tables[0].Rows[0][11].ToString();
                    lblchannelprev.Text = ds1.Tables[0].Rows[0][13].ToString();
                    lblgrossbillprev.Text = ds1.Tables[0].Rows[0][18].ToString();
                    lbldicountprev.Text = ds1.Tables[0].Rows[0][19].ToString();
                    lblgstprev.Text = ds1.Tables[0].Rows[0][20].ToString();
                    lblnetbillprev.Text = ds1.Tables[0].Rows[0][21].ToString();
                    lblamountrealisedprev.Text = ds1.Tables[0].Rows[0][22].ToString();


                }
                else
                {
                    Label42.Text = ":: Edit Details ::";
                    divsubupdate1.Visible = false;
                    divtransentry.Visible = true;
                    divprev.Visible = false;

                    divcommercialrevMasterDataentry.Visible = true;
                   
                    BindGrid();//binding here due to footer
                    if (Convert.ToDecimal(txttotalamtrealised.Text) == Convert.ToDecimal(ViewState["total"]))
                    {
                        btnpreviewandsubmit.Enabled = true;
                    }
                    else
                    {
                        btnpreviewandsubmit.Enabled = false;
                    }
                    ddlmonth.Enabled = false;
                    ddlmonth.CssClass = "select widthofboxes backgroundcolor";
                    ddlyear.Enabled = false;
                    ddlyear.CssClass = "select widthofboxes backgroundcolor";
                    ddlagency.Enabled = false;
                    ddlagency.CssClass = "select widthofboxes backgroundcolor";
                    ddltypofbilling.Enabled = false;
                    ddltypofbilling.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofcomwing.Enabled = false;
                    ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
                    //if (ddlnameofbillingunit.SelectedIndex != 0)
                    //{
                    //    ddlchannel.SelectedIndex = 0;
                    //    ddlchannel.Items.Clear();
                    //}
                    ddlchannel.Enabled = false;
                    ddlchannel.CssClass = "select widthofboxes backgroundcolor";
                    ddlnameofbillingunit.Enabled = false;
                    ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";

                    txttotalgrossbillingamyt.ReadOnly = true;
                    txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
                    txtdiscountamount.ReadOnly = true;
                    txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
                    txtGSTamt.ReadOnly = true;
                    txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
                    txtnetbilling.ReadOnly = true;
                    txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
                    txttotalamtrealised.ReadOnly = true;
                    txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetails.EditIndex = -1;
            BindGrid();
        }



        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDetails.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btneditpart1_Click(object sender, EventArgs e)
        {
            ddlmonth.CssClass = "select widthofboxes backgroundcolor";
            ddlyear.CssClass = "select widthofboxes backgroundcolor";
            ddlagency.CssClass = "select widthofboxes backgroundcolor";
            ddltypofbilling.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor1";
            ddlchannel.CssClass = "select widthofboxes backgroundcolor1";
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor1";
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor1";
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor1";
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor1";
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor1";
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor1";

            bool submittedtopb = false;
            divcommercialrevMasterDataentry.Visible = true;
            divprev.Visible = false;
            divsubupdate1.Visible = true;
            divtransentry.Visible = false;
            btnsubmit.Visible = false;
            btncncl.Visible = false;
            btnupdate.Visible = true;
            btncancelforedit.Visible = true;



            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                    new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                  new SqlParameter("@flag", 9));


            ddlmonth.Enabled = false;
            ddlyear.Enabled = false;
            ddlagency.Enabled = false;
            ddltypofbilling.Enabled = false;
            ddlmonth.Items.FindByText(ds1.Tables[0].Rows[0][7].ToString()).Selected = true;
            ddlyear.Items.FindByText(ds1.Tables[0].Rows[0][5].ToString()).Selected = true;
            ddlagency.Items.FindByText(ds1.Tables[0].Rows[0][15].ToString()).Selected = true;
            ddltypofbilling.Items.FindByText(ds1.Tables[0].Rows[0][17].ToString()).Selected = true;

            ddlnameofcomwing.Enabled = true;
            ddlnameofcomwing.ClearSelection();
            ddlnameofcomwing.Items.FindByText(ds1.Tables[0].Rows[0][9].ToString()).Selected = true;

            ddlnameofbillingunit.Enabled = true;
            ddlnameofbillingunit.ClearSelection();
            ddlnameofbillingunit.Items.FindByText(ds1.Tables[0].Rows[0][11].ToString()).Selected = true;
            ddlchannel.Enabled = true;
            cmm.bindDDLWidParam(ddlchannel, "PN18_commercialrevenueSP", "ChannelName", "Id", "PRASARNETConnectionString", "--Name of Channel--"
                                                                                                         , new SqlParameter("@BillingUnitId", Convert.ToInt32(ddlnameofbillingunit.SelectedValue))
                                                                                                         , new SqlParameter("@flag", 5));
            ddlchannel.ClearSelection();
            ddlchannel.SelectedValue = ds1.Tables[0].Rows[0][12].ToString();
            //ddlchannel.Items.FindByText(ds1.Tables[0].Rows[0][13].ToString()).Selected = true;


            txttotalgrossbillingamyt.ReadOnly = false;
            txttotalgrossbillingamyt.Text = ds1.Tables[0].Rows[0][18].ToString();
            txtdiscountamount.ReadOnly = false;
            txtdiscountamount.Text = ds1.Tables[0].Rows[0][19].ToString();

            txtGSTamt.ReadOnly = false;
            txtGSTamt.Text = ds1.Tables[0].Rows[0][20].ToString();
            txtnetbilling.ReadOnly = false;
            txtnetbilling.Text = ds1.Tables[0].Rows[0][21].ToString();
            txttotalamtrealised.ReadOnly = false;
            txttotalamtrealised.Text = ds1.Tables[0].Rows[0][22].ToString();
            //divcommercialrevMasterDataentry.Visible = true;
            //divprev.Visible = false;
            //divsubupdate1.Visible = true;
            //divtransentry.Visible = false;
            //btnsubmit.Visible = false;
            //btncncl.Visible = false;
            //btnupdate.Visible = true;
            //btncancelforedit.Visible = true;
        }

        protected void btncancelforedit_Click(object sender, EventArgs e)
        {
            divcommercialrevMasterDataentry.Visible = false;
            divprev.Visible = true;
            divsubupdate1.Visible = false;
            divtransentry.Visible = false;
            btnsubmit.Visible = false;
            btncncl.Visible = false;
            btnupdate.Visible = true;
            btncancelforedit.Visible = true;
            Boolean submittedtopb = false;
            //Check the Entry exists in Trnamount Recieved Table in respect of commercial revid
            btncancelprev.Visible = true;
            div3.Visible = true;

            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                    new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                  new SqlParameter("@flag", 9));
            lblmnthprev.Text = ds1.Tables[0].Rows[0][7].ToString();
            lblyearprev.Text = ds1.Tables[0].Rows[0][5].ToString();
            lblagencyprev.Text = ds1.Tables[0].Rows[0][15].ToString();
            lbltypofbillingprev.Text = ds1.Tables[0].Rows[0][17].ToString();
            lblnameofcommbillingprev.Text = ds1.Tables[0].Rows[0][9].ToString();
            lblnamofbillingunitprev.Text = ds1.Tables[0].Rows[0][11].ToString();
            lblchannelprev.Text = ds1.Tables[0].Rows[0][13].ToString();
            lblgrossbillprev.Text = ds1.Tables[0].Rows[0][18].ToString();
            lbldicountprev.Text = ds1.Tables[0].Rows[0][19].ToString();
            lblgstprev.Text = ds1.Tables[0].Rows[0][20].ToString();
            lblnetbillprev.Text = ds1.Tables[0].Rows[0][21].ToString();
            lblamountrealisedprev.Text = ds1.Tables[0].Rows[0][22].ToString();
        }

        protected void btnEditPart2_Click(object sender, EventArgs e)
        {
            ddlnameofcomwing.CssClass = "select widthofboxes backgroundcolor";
            ddlchannel.CssClass = "select widthofboxes backgroundcolor";
            ddlnameofbillingunit.CssClass = "select widthofboxes backgroundcolor";
            txttotalgrossbillingamyt.CssClass = "select widthofboxes backgroundcolor";
            txtdiscountamount.CssClass = "select widthofboxes backgroundcolor";
            txtGSTamt.CssClass = "select widthofboxes backgroundcolor";
            txtnetbilling.CssClass = "select widthofboxes backgroundcolor";
            txttotalamtrealised.CssClass = "select widthofboxes backgroundcolor";
            ddlmonth.CssClass = "select widthofboxes backgroundcolor";
            ddlyear.CssClass = "select widthofboxes backgroundcolor";
            ddlagency.CssClass = "select widthofboxes backgroundcolor";
            ddltypofbilling.CssClass = "select widthofboxes backgroundcolor";
            btnpreviewandsubmit.Enabled = true;
            btnpreviewandsubmit.BackColor = System.Drawing.Color.Lavender;
            bool submittedtopb = false;
            divcommercialrevMasterDataentry.Visible = true;
            divprev.Visible = false;
            divsubupdate1.Visible = false;
            divtransentry.Visible = true;
            Label42.Text = ":: Edit Details ::";
            BindGrid();

            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18_commercialrevenueSP", "PRASARNETConnectionString", new SqlParameter("@comrevid", Convert.ToInt32(ViewState["comrevid"])),
                                                                                    new SqlParameter("@submittedtoPB", submittedtopb),
                                                                                  new SqlParameter("@flag", 9));


            ddlmonth.Enabled = false;
            ddlyear.Enabled = false;
            ddlagency.Enabled = false;
            ddltypofbilling.Enabled = false;
            ddlmonth.Items.FindByText(ds1.Tables[0].Rows[0][7].ToString()).Selected = true;
            ddlyear.Items.FindByText(ds1.Tables[0].Rows[0][5].ToString()).Selected = true;
            ddlagency.Items.FindByText(ds1.Tables[0].Rows[0][15].ToString()).Selected = true;
            ddltypofbilling.Items.FindByText(ds1.Tables[0].Rows[0][17].ToString()).Selected = true;

            ddlnameofcomwing.Enabled = false;
            ddlnameofcomwing.ClearSelection();
            ddlnameofcomwing.Items.FindByText(ds1.Tables[0].Rows[0][9].ToString()).Selected = true;

            ddlnameofbillingunit.Enabled = false;
            ddlnameofbillingunit.ClearSelection();
            ddlnameofbillingunit.Items.FindByText(ds1.Tables[0].Rows[0][11].ToString()).Selected = true;
            ddlchannel.Enabled = false;
            cmm.bindDDLWidParam(ddlchannel, "PN18_commercialrevenueSP", "ChannelName", "Id", "PRASARNETConnectionString", "--Name of Channel--"
                                                                                                         , new SqlParameter("@BillingUnitId", Convert.ToInt32(ddlnameofbillingunit.SelectedValue))
                                                                                                         , new SqlParameter("@flag", 5));
            ddlchannel.ClearSelection();
            ddlchannel.SelectedValue = ds1.Tables[0].Rows[0][12].ToString();
            //ddlchannel.Items.FindByText(ds1.Tables[0].Rows[0][13].ToString()).Selected = true;


            txttotalgrossbillingamyt.ReadOnly = true;
            txttotalgrossbillingamyt.Text = ds1.Tables[0].Rows[0][18].ToString();
            txtdiscountamount.ReadOnly = true;
            txtdiscountamount.Text = ds1.Tables[0].Rows[0][19].ToString();

            txtGSTamt.ReadOnly = true;
            txtGSTamt.Text = ds1.Tables[0].Rows[0][20].ToString();
            txtnetbilling.ReadOnly = true;
            txtnetbilling.Text = ds1.Tables[0].Rows[0][21].ToString();
            txttotalamtrealised.ReadOnly = true;
            txttotalamtrealised.Text = ds1.Tables[0].Rows[0][22].ToString();



        }

        protected void grdprev_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblamtrealisededitemgrdprev = e.Row.FindControl("lblamtrealisededitemgrdprev") as Label;
                if (lblamtrealisededitemgrdprev.Text != "")
                {
                    total2 += Convert.ToDecimal(lblamtrealisededitemgrdprev.Text);

                }
                ViewState["total2"] = total2;
                e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
            }
        }

        protected void btngemreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CommercialRevenueReports.aspx", true);
        }
    }
}