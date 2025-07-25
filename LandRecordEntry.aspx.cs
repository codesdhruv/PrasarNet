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
    public partial class LandRecordEntry : System.Web.UI.Page
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
                    if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
                    {
                        divlandrecords.Visible = true;
                    }
                    else
                    {
                        divlandrecords.Visible = false;
                    }
                    Label1.Text = Convert.ToString(Session["UserName"]);

                    cmm.bindDDLWidParam(ddlzone, "PN18_Zone", "ShortCode", "IT_ZONEID", "PRASARNETConnectionString", "--Select Zone--",
                                                                                                         new SqlParameter("@flag", 1));

                    lnkuploaddocuments.CssClass = "font2";

                    lnkuploadmaps.CssClass = "font2";

                }

            }
              else
            {
                Response.Redirect("Logout.aspx");
            }
        }



        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--Select State--",
                                                                                                          new SqlParameter("@zoneid", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 1));
            ddlcity.Items.Clear();
            ddldistrict.Items.Clear();
            diventry.Visible = false;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            ddlstate.Focus();
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddldistrict, "PN18_District", "DistrictName", "DistrictId", "PRASARNETConnectionString", "--Select District--",
                                                                                                          new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                                          new SqlParameter("@flag", 1));
            ddlcity.Items.Clear();
            diventry.Visible = false;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            ddldistrict.Focus();
        }

        protected void ddldistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddlcity, "PN18_LR_Locations", "LocationName", "LocationId", "PRASARNETConnectionString", "--Select Location--",
                                                                                                   new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                                   new SqlParameter("@flag", 5));
            diventry.Visible = false;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            ddlcity.Focus();
            divuploadmaps.Visible = false;
        }

        protected void btnsubmit0_Click1(object sender, EventArgs e)
        {
            resetlandrecorddetailform();
            String enchrochment = "";
            Boolean isverifed = false;
            diventry.Visible = true;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;

            DataSet ds = new DataSet();
            ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                            new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                            new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                            new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));

            if (Convert.ToInt16(ds.Tables[0].Rows.Count) != 0)
            {
               
                isverifed = Convert.ToBoolean(ds.Tables[0].Rows[0][23]);
                enchrochment = Convert.ToString(ds.Tables[0].Rows[0][17]);

                //ddlzone.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][0]));
                if (isverifed)
                {
                    ViewState["LandrecID"] = ds.Tables[0].Rows[0][0];
                    if (enchrochment == "Yes")
                    {
                        divenchrochmentdetails.Visible = true;
                    }
                    else
                    {
                        divenchrochmentdetails.Visible = false;
                    }
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = false;
                    divRecordsverified.Visible = true;
                    divstatusrecord.Visible = false;
                    divstatusmap.Visible = false;
                    lnkuploaddocuments.Enabled = true;
                    lnkuploadmaps.Enabled = true;
                }
                else
                {
                    divenchrochmentdetails.Visible = false;
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = true;
                    divRecordsverified.Visible = false;
                    divstatusrecord.Visible = true;
                    divstatusmap.Visible = true;
                    lnkuploaddocuments.Enabled = false;
                    lnkuploadmaps.Enabled = false;
                }
            }
            else
            {
                divenchrochmentdetails.Visible = false;
                divRecords_not_submitted.Visible = true;
                divRecordssubnotverified.Visible = false;
                divRecordsverified.Visible = false;
                divstatusrecord.Visible = true;
                divstatusmap.Visible = true;
                lnkuploaddocuments.Enabled = false;
                lnkuploadmaps.Enabled = false;
            }
        }

        protected void ddlstatusofboundarywall_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt16(ddlstatusofboundarywall.SelectedValue) == 1)//yes
            {
                trtypofboundarywall.Visible = true;
                ddltypofbndrywall.Visible = true;
                cmm.bindDDLWidParam(ddltypofbndrywall, "PN18_LR_SPTypeofBoundarywall", "TypeOfBoundaryWall", "Id", "PRASARNETConnectionString", "--Select--",
                                                                                                        new SqlParameter("@flag", 1));
                ddltypofbndrywall.Focus();
            }
            else
            {
                trtypofboundarywall.Visible = false;
                ddlenchrochment.Focus();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            btneditlanddetails.CssClass = "font2";
            //txtcoveredarea.Focus();
            ddltax.Focus();
            cmm.bindDDLWidParam(ddlsitefor, "PN18_LR_SiteFor", "sitefor", "Id", "PRASARNETConnectionString", "--Select--",
                                                                                                     new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlhold, "PN18_LR_hold", "HoldType", "Id", "PRASARNETConnectionString", "--Select--",
                                                                                                 new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlorg, "PN18_LR_orgProc", "Abbreviation", "OrganizationId", "PRASARNETConnectionString", "--Select--",
                                                                                                new SqlParameter("@flag", 1));
            divlandrecform.Visible = true;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = false;
            String enchrochment = "";
            Boolean isverifed = false;
            DataSet ds = new DataSet();
            ds =  cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                            new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                            new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                            new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));

            if (Convert.ToInt16(ds.Tables[0].Rows.Count) != 0)
            {
                clearlanddetails();
                isverifed = Convert.ToBoolean(ds.Tables[0].Rows[0][23]);
                enchrochment = Convert.ToString(ds.Tables[0].Rows[0][17]);
                if (!isverifed)
                {
                    lbladdress.Visible = false;
                    lblorg.Visible = false;
                    lblsitefor.Visible = false;
                    lbltotalarea.Visible = false;
                    lblcoveredarea.Visible = false;
                    lblhold.Visible = false;
                    lblvaloflease.Visible = false;
                    lblwhethercommentbyrevoffcr.Visible = false;
                    lblremarkbyrevoffcr.Visible = false;
                    lblstatusoftax.Visible = false;
                    lblstatusofboundarywall.Visible = false;
                    lbltypofboundarywall.Visible = false;
                    lblenchrochment.Visible = false;
                    btnupdatelanddetails.Visible = false;
                    btneditlanddetails.Visible = false;
                    btnVerifydetails.Visible = true;

                    txtaddress.Visible = true;
                    ddlorg.Visible = true;
                    ddlsitefor.Visible = true;
                    txttotalarea.Visible = true;
                    txtcoveredarea.Visible = true;
                    ddlhold.Visible = true;
                    txtvaloflease.Visible = true;
                    ddlcommentbyretrevoffcr.Visible = true;
                    txtremarksbyretiredrevofficer.Visible = true;
                    ddltax.Visible = true;
                    ddlstatusofboundarywall.Visible = true;
                    ddltypofbndrywall.Visible = true;
                    ddlenchrochment.Visible = true;
                    trtypofboundarywall.Visible = false;
                    trremarksbyretiredrevenueofficer.Visible = false;
                    trvalidityofLease.Visible = false;

                    decimal totalarea, coveredarea, uncoveredarea;

                    if (Convert.ToString(ds.Tables[0].Rows[0][8]) != "")//covered area
                    {
                        coveredarea = Convert.ToDecimal(ds.Tables[0].Rows[0][8]);
                    }
                    else
                    {
                        coveredarea = 0;
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][9]) != "")//uncovered area
                    {
                        uncoveredarea = Convert.ToDecimal(ds.Tables[0].Rows[0][9]);
                    }
                    else
                    {
                        uncoveredarea = 0;
                    }
                    totalarea = coveredarea + uncoveredarea;
                    txttotalarea.Text = totalarea.ToString();
                    txtcoveredarea.Text = coveredarea.ToString();

                    lbllandetid.Text = Convert.ToString(ds.Tables[0].Rows[0][0]);//Id
                    if (Convert.ToString(ds.Tables[0].Rows[0][5]) != "")//Address
                    {
                        txtaddress.Text = Convert.ToString(ds.Tables[0].Rows[0][5]);
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][6]) != "")//org
                    {
                        ddlorg.ClearSelection();
                        ddlorg.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][6])).Selected = true;
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][7]) != "")//site
                    {
                        ddlsitefor.ClearSelection();
                        ddlsitefor.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][7])).Selected = true;
                    }


                    if (Convert.ToString(ds.Tables[0].Rows[0][10]) != "")//HoldID
                    {
                        ddlhold.ClearSelection();
                        ddlhold.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][10])).Selected = true;
                        if (Convert.ToInt16(ds.Tables[0].Rows[0][10]) == 2)//lease
                        {
                            trvalidityofLease.Visible = true;
                            if (Convert.ToString(ds.Tables[0].Rows[0][11]) != "")//ValidityofLease
                            {
                                txtvaloflease.Text = Convert.ToString(ds.Tables[0].Rows[0][11]);
                            }
                            else
                            {
                                txtvaloflease.Text = "";
                            }
                        }
                        else
                        {
                            trvalidityofLease.Visible = false;
                        }
                    }

                    if (Convert.ToString(ds.Tables[0].Rows[0][12]) != "")//whether comment from revenue officer
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0][12]) == "Yes")
                        {
                            ddlcommentbyretrevoffcr.ClearSelection();
                            ddlcommentbyretrevoffcr.Items.FindByValue("1").Selected = true;
                            trremarksbyretiredrevenueofficer.Visible = true;
                            if (Convert.ToString(ds.Tables[0].Rows[0][13]) != "")//remarksby revenue officer
                            {
                                txtremarksbyretiredrevofficer.Text = Convert.ToString(ds.Tables[0].Rows[0][13]);
                            }
                            else
                            {
                                txtremarksbyretiredrevofficer.Text = "";
                            }
                        }
                        else
                        {
                            ddlcommentbyretrevoffcr.ClearSelection();
                            ddlcommentbyretrevoffcr.Items.FindByValue("0").Selected = true;
                            trremarksbyretiredrevenueofficer.Visible = false;
                        }
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][14]) != "")//servicecharge
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0][14]) == "Yes")
                        {
                            ddltax.ClearSelection();
                            ddltax.Items.FindByValue("1").Selected = true;
                        }
                        else
                        {
                            ddltax.ClearSelection();
                            ddltax.Items.FindByValue("0").Selected = true;
                        }

                    }
                    else
                    {
                        ddltax.SelectedIndex = 0;
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][15]) != "")//statusofBoundaryWall
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0][15]) == "Yes")
                        {
                            ddlstatusofboundarywall.ClearSelection();
                            ddlstatusofboundarywall.Items.FindByValue("1").Selected = true;
                            trtypofboundarywall.Visible = true;
                            if (Convert.ToString(ds.Tables[0].Rows[0][16]) != "")//typeofboundarywall
                            {
                                ddltypofbndrywall.ClearSelection();
                                ddltypofbndrywall.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][16])).Selected = true;
                            }
                            else
                            {
                                ddltypofbndrywall.ClearSelection();
                                ddltypofbndrywall.SelectedIndex = 0;
                            }
                        }
                        else
                        {
                            trtypofboundarywall.Visible = false;
                            ddlstatusofboundarywall.ClearSelection();
                            ddlstatusofboundarywall.Items.FindByValue("0").Selected = true;
                        }

                    }
                    else
                    {
                        trtypofboundarywall.Visible = false;
                        ddlstatusofboundarywall.SelectedIndex = 0;
                    }
                    if (Convert.ToString(ds.Tables[0].Rows[0][17]) != "")//Enchroacment
                    {
                        if (Convert.ToString(ds.Tables[0].Rows[0][17]) == "Yes")
                        {
                            ddlenchrochment.ClearSelection();
                            ddlenchrochment.Items.FindByValue("1").Selected = true;
                        }
                        else
                        {
                            ddlenchrochment.ClearSelection();
                            ddlenchrochment.Items.FindByValue("0").Selected = true;
                        }

                    }
                    else
                    {
                        ddlenchrochment.SelectedIndex = 0;
                    }
                    txtaddress.Focus();
                }
                else//isverified==true
                {
                    lbladdress.Visible = true;
                    lblorg.Visible = true;
                    lblsitefor.Visible = true;
                    lbltotalarea.Visible = true;
                    lblcoveredarea.Visible = true;
                    lblhold.Visible = true;
                    lblvaloflease.Visible = true;
                    lblwhethercommentbyrevoffcr.Visible = true;
                    lblremarkbyrevoffcr.Visible = true;
                    lblstatusoftax.Visible = true;
                    lblstatusofboundarywall.Visible = true;
                    lbltypofboundarywall.Visible = true;
                    lblenchrochment.Visible = true;
                    btnupdatelanddetails.Visible = false;
                    btneditlanddetails.Visible = true;
                    btnVerifydetails.Visible = false;
                    trtypofboundarywall.Visible = true;
                    trremarksbyretiredrevenueofficer.Visible = true;
                    trvalidityofLease.Visible = true;

                    ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                            new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                            new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                            new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));

                    decimal totalareaaftersubmitted = Convert.ToDecimal(ds.Tables[0].Rows[0][8]) + Convert.ToDecimal(ds.Tables[0].Rows[0][9]);
                    lbllandetid.Text = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    lbladdress.Text = Convert.ToString(ds.Tables[0].Rows[0][5]);
                    lblorg.Text = Convert.ToString(ds.Tables[0].Rows[0][28]);
                    lblsitefor.Text = Convert.ToString(ds.Tables[0].Rows[0][29]);
                    lbltotalarea.Text = Convert.ToString(totalareaaftersubmitted);
                    lblcoveredarea.Text = Convert.ToString(ds.Tables[0].Rows[0][8]);
                    lblhold.Text = Convert.ToString(ds.Tables[0].Rows[0][30]);
                    lblvaloflease.Text = Convert.ToString(ds.Tables[0].Rows[0][11]);
                    lblwhethercommentbyrevoffcr.Text = Convert.ToString(ds.Tables[0].Rows[0][12]);
                    lblremarkbyrevoffcr.Text = Convert.ToString(ds.Tables[0].Rows[0][13]);
                    lblstatusoftax.Text = Convert.ToString(ds.Tables[0].Rows[0][14]);
                    lblstatusofboundarywall.Text = Convert.ToString(ds.Tables[0].Rows[0][15]);
                    lbltypofboundarywall.Text = Convert.ToString(ds.Tables[0].Rows[0][31]);
                    lblenchrochment.Text = Convert.ToString(ds.Tables[0].Rows[0][17]);

                    txtaddress.Visible = false;
                    ddlorg.Visible = false;
                    ddlsitefor.Visible = false;
                    txttotalarea.Visible = false;
                    txtcoveredarea.Visible = false;
                    ddlhold.Visible = false;
                    txtvaloflease.Visible = false;
                    ddlcommentbyretrevoffcr.Visible = false;
                    txtremarksbyretiredrevofficer.Visible = false;
                    ddltax.Visible = false;
                    ddlstatusofboundarywall.Visible = false;
                    ddltypofbndrywall.Visible = false;
                    ddlenchrochment.Visible = false;
                    btneditlanddetails.Focus();
                }
            }
            else
            {
                clearlanddetails();
                resetlandrecorddetailform();
            }
        }
        private void resetlandrecorddetailform()
        {
            lbladdress.Visible = false;
            lblorg.Visible = false;
            lblsitefor.Visible = false;
            lbltotalarea.Visible = false;
            lblcoveredarea.Visible = false;
            lblhold.Visible = false;
            lblvaloflease.Visible = false;
            lblwhethercommentbyrevoffcr.Visible = false;
            lblremarkbyrevoffcr.Visible = false;
            lblstatusoftax.Visible = false;
            lblstatusofboundarywall.Visible = false;
            lbltypofboundarywall.Visible = false;
            lblenchrochment.Visible = false;
            btnupdatelanddetails.Visible = false;
            btneditlanddetails.Visible = false;
            btnVerifydetails.Visible = true;

            txtaddress.Visible = true;
            ddlorg.Visible = true;
            ddlsitefor.Visible = true;
            txttotalarea.Visible = true;
            txtcoveredarea.Visible = true;
            ddlhold.Visible = true;
            txtvaloflease.Visible = true;
            ddlcommentbyretrevoffcr.Visible = true;
            txtremarksbyretiredrevofficer.Visible = true;
            ddltax.Visible = true;
            ddlstatusofboundarywall.Visible = true;
            ddltypofbndrywall.Visible = true;
            ddlenchrochment.Visible = true;
        }
        private void clearlanddetails()
        {
            txtaddress.Text = "";
            ddlorg.SelectedIndex = 0;
            ddlsitefor.SelectedIndex = 0;
            txttotalarea.Text = "";
            txtcoveredarea.Text = "";
            ddlhold.SelectedIndex = 0;
            if (trvalidityofLease.Visible == true)
            {
                txtvaloflease.Text = "";
            }
            trvalidityofLease.Visible = false;
            ddlcommentbyretrevoffcr.SelectedIndex = 0;
            if (trremarksbyretiredrevenueofficer.Visible == true || txtremarksbyretiredrevofficer.Visible!=false)
            {
                txtremarksbyretiredrevofficer.Text = "";
            }
            trremarksbyretiredrevenueofficer.Visible = false;
            ddltax.SelectedIndex = 0;
            ddlstatusofboundarywall.SelectedIndex = 0;
            if (trtypofboundarywall.Visible == true && ddltypofbndrywall.Visible!=false)
            {
                ddltypofbndrywall.SelectedIndex = 0;
            }
            trtypofboundarywall.Visible = false;
            ddlenchrochment.SelectedIndex = 0;
        }
        protected void btnVerifydetails_Click(object sender, EventArgs e)
        {
            decimal totalarea, coveredarea, uncoveredarea;
            int? typeofboundarywall = null;
            DateTime? valdityoflease = null;
            //DateTime valdityoflease = DateTime.MinValue.Date;
            //DateTime? valdityoflease = string.IsNullOrEmpty(txtvaloflease.Text.Trim()) ? null : Convert.ToDateTime(txtvaloflease.Text.Trim());
            string RemarksofRetiredRevenueOfficer = "";
            if (txtcoveredarea.Text.Trim() != "")
            {
                coveredarea = Convert.ToDecimal(txtcoveredarea.Text.Trim());
            }
            else
            {
                coveredarea = 0;
            }
            if (txttotalarea.Text.Trim() != "")//uncovered area
            {
                totalarea = Convert.ToDecimal(txttotalarea.Text.Trim());
            }
            else
            {
                totalarea = 0;
            }
            uncoveredarea = totalarea - coveredarea;
            if (ddlstatusofboundarywall.SelectedValue == "1")
            {
                typeofboundarywall = Convert.ToInt16(ddltypofbndrywall.SelectedValue);
            }
            if (ddlhold.SelectedValue == "2")
            {
                valdityoflease = Convert.ToDateTime(txtvaloflease.Text.Trim());
            }

            if (ddlcommentbyretrevoffcr.SelectedValue == "1")
            {
                RemarksofRetiredRevenueOfficer = Convert.ToString(txtremarksbyretiredrevofficer.Text.Trim());
            }
            int flag; Int64 id = 0;

            ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                            new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                            new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                            new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));

            if (Convert.ToInt16(ds.Tables[0].Rows.Count) != 0)// dataexists then need only updates
            {
                flag = 2;
                id = Convert.ToInt64(ds.Tables[0].Rows[0][0]);
                ViewState["LandrecID"] = id;
            }
            else
            {
                flag = 3;
            }

            int i;
            i = cmm.RunSP("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@Address", Convert.ToString(txtaddress.Text)),
                                                                            new SqlParameter("@orgid", Convert.ToInt16(ddlorg.SelectedValue)),
                                                                            new SqlParameter("@siteforid", Convert.ToInt16(ddlsitefor.SelectedValue)),
                                                                            new SqlParameter("@CoveredArea", coveredarea),
                                                                            new SqlParameter("@UncoveredArea", uncoveredarea),
                                                                            new SqlParameter("@HoldId", Convert.ToInt16(ddlhold.SelectedValue)),
                                                                            new SqlParameter("@validityoflease", valdityoflease),
                                                                            new SqlParameter("@CommentsOfRetiredRevenueOfficer", Convert.ToString(ddlcommentbyretrevoffcr.SelectedItem.Text)),
                                                                            new SqlParameter("@StatusofSC_PT_leivedbyMun_locadm", Convert.ToString(ddltax.SelectedItem.Text)),
                                                                            new SqlParameter("@StatusOfBoundaryWall", Convert.ToString(ddlstatusofboundarywall.SelectedItem.Text)),
                                                                            new SqlParameter("@Enchrochment", Convert.ToString(ddlenchrochment.SelectedItem.Text)),
                                                                            new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                            new SqlParameter("@RemarksofRetiredRevenueOfficer", RemarksofRetiredRevenueOfficer),
                                                                            new SqlParameter("@typeofboundarywallid", typeofboundarywall),
                                                                            new SqlParameter("@id", id),
                                                                            new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                            new SqlParameter("@stateid", Convert.ToInt32(ddlstate.SelectedValue)),
                                                                            new SqlParameter("@districtid", Convert.ToInt32(ddldistrict.SelectedValue)),
                                                                            new SqlParameter("@locationid", Convert.ToInt32(ddlcity.SelectedValue)),
                                                                            new SqlParameter("@flag", flag));
            if (i > 0)
            {
                if (ddlenchrochment.SelectedItem.Value == "1")
                {
                    divenchrochmentdetails.Visible = true;
                }
                else
                {
                    divenchrochmentdetails.Visible = false;
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted and Verified Successfully');", true);
                lbladdress.Visible = true;
                lblorg.Visible = true;
                lblsitefor.Visible = true;
                lbltotalarea.Visible = true;
                lblcoveredarea.Visible = true;
                lblhold.Visible = true;
                lblvaloflease.Visible = true;
                lblwhethercommentbyrevoffcr.Visible = true;
                lblremarkbyrevoffcr.Visible = true;
                lblstatusoftax.Visible = true;
                lblstatusofboundarywall.Visible = true;
                lbltypofboundarywall.Visible = true;
                lblenchrochment.Visible = true;
                btnupdatelanddetails.Visible = false;
                btneditlanddetails.Visible = true;
                btnVerifydetails.Visible = false;
                trtypofboundarywall.Visible = true;
                trremarksbyretiredrevenueofficer.Visible = true;
                trvalidityofLease.Visible = true;
                txtaddress.Visible = false;
                ddlorg.Visible = false;
                ddlsitefor.Visible = false;
                txttotalarea.Visible = false;
                txtcoveredarea.Visible = false;
                ddlhold.Visible = false;
                txtvaloflease.Visible = false;
                ddlcommentbyretrevoffcr.Visible = false;
                txtremarksbyretiredrevofficer.Visible = false;
                ddltax.Visible = false;
                ddlstatusofboundarywall.Visible = false;
                ddltypofbndrywall.Visible = false;
                ddlenchrochment.Visible = false;
                ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                            new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                            new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                            new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));


                ViewState["LandrecID"] = Convert.ToInt64(ds.Tables[0].Rows[0][0]);
                decimal totalareaaftersubmitted = Convert.ToDecimal(ds.Tables[0].Rows[0][8]) + Convert.ToDecimal(ds.Tables[0].Rows[0][9]);
                lbllandetid.Text = Convert.ToString(ds.Tables[0].Rows[0][0]);
                lbladdress.Text = Convert.ToString(ds.Tables[0].Rows[0][5]);
                lblorg.Text = Convert.ToString(ds.Tables[0].Rows[0][28]);
                lblsitefor.Text = Convert.ToString(ds.Tables[0].Rows[0][29]);
                lbltotalarea.Text = Convert.ToString(totalareaaftersubmitted);
                lblcoveredarea.Text = Convert.ToString(ds.Tables[0].Rows[0][8]);
                lblhold.Text = Convert.ToString(ds.Tables[0].Rows[0][30]);
                lblvaloflease.Text = Convert.ToString(ds.Tables[0].Rows[0][11]);
                lblwhethercommentbyrevoffcr.Text = Convert.ToString(ds.Tables[0].Rows[0][12]);
                lblremarkbyrevoffcr.Text = Convert.ToString(ds.Tables[0].Rows[0][13]);
                lblstatusoftax.Text = Convert.ToString(ds.Tables[0].Rows[0][14]);
                lblstatusofboundarywall.Text = Convert.ToString(ds.Tables[0].Rows[0][15]);
                lbltypofboundarywall.Text = Convert.ToString(ds.Tables[0].Rows[0][16]);
                lblenchrochment.Text = Convert.ToString(ds.Tables[0].Rows[0][17]);
                divRecordsverified.Visible = true;
                divRecords_not_submitted.Visible = false;
                divRecordssubnotverified.Visible = false;
                divstatusmap.Visible = false;
                divstatusrecord.Visible = false;
                lnkuploaddocuments.Enabled = true;
                lnkuploadmaps.Enabled = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                lbladdress.Visible = false;
                lblorg.Visible = false;
                lblsitefor.Visible = false;
                lbltotalarea.Visible = false;
                lblcoveredarea.Visible = false;
                lblhold.Visible = false;
                lblvaloflease.Visible = false;
                lblwhethercommentbyrevoffcr.Visible = false;
                lblremarkbyrevoffcr.Visible = false;
                lblstatusoftax.Visible = false;
                lblstatusofboundarywall.Visible = false;
                lbltypofboundarywall.Visible = false;
                lblenchrochment.Visible = false;
                btnupdatelanddetails.Visible = false;
                btneditlanddetails.Visible = false;
                btnVerifydetails.Visible = true;

                trtypofboundarywall.Visible = false;
                trremarksbyretiredrevenueofficer.Visible = false;
                trvalidityofLease.Visible = false;

                txtaddress.Visible = true;
                ddlorg.Visible = true;
                ddlsitefor.Visible = true;
                txttotalarea.Visible = true;
                txtcoveredarea.Visible = true;
                ddlhold.Visible = true;
                txtvaloflease.Visible = true;
                ddlcommentbyretrevoffcr.Visible = true;
                txtremarksbyretiredrevofficer.Visible = true;
                ddltax.Visible = true;
                ddlstatusofboundarywall.Visible = true;
                //trtypofboundarywall.Visible = false;
                ddlenchrochment.Visible = true;
            }
        }
        protected void btncncl_Click(object sender, EventArgs e)
        {
            String enchrochment = "";
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            Boolean isverifed = false;
            diventry.Visible = true;
            DataSet ds = new DataSet();

            ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                   new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                   new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                   new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                   new SqlParameter("@flag", 1));

            if (Convert.ToInt16(ds.Tables[0].Rows.Count) != 0)
            {
                isverifed = Convert.ToBoolean(ds.Tables[0].Rows[0][23]);
                enchrochment = Convert.ToString(ds.Tables[0].Rows[0][17]);
                //ddlzone.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][0]));
                if (isverifed)
                {
                    lnkuploaddocuments.Enabled = true;
                    lnkuploadmaps.Enabled = true;
                    if (enchrochment == "Yes")
                    {
                        divenchrochmentdetails.Visible = true;
                    }
                    else
                    {
                        divenchrochmentdetails.Visible = false;
                    }
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = false;
                    divRecordsverified.Visible = true;
                    divstatusrecord.Visible = false;
                    divstatusmap.Visible = false;
                    lnkuploaddocuments.Enabled = true;
                    lnkuploadmaps.Enabled = true;
                }
                else
                {
                    lnkuploaddocuments.Enabled = false;
                    lnkuploadmaps.Enabled = false;
                    divenchrochmentdetails.Visible = false;
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = true;
                    divRecordsverified.Visible = false;
                    divstatusrecord.Visible = true;
                    divstatusmap.Visible = true;
                    lnkuploaddocuments.Enabled = false;
                    lnkuploadmaps.Enabled = false;
                }
            }
            else
            {
                lnkuploaddocuments.Enabled = false;
                lnkuploadmaps.Enabled = false;
                divenchrochmentdetails.Visible = false;
                divRecords_not_submitted.Visible = true;
                divRecordssubnotverified.Visible = false;
                divRecordsverified.Visible = false;
                divstatusrecord.Visible = true;
                divstatusmap.Visible = true;
                lnkuploaddocuments.Enabled = false;
                lnkuploadmaps.Enabled = false;
            }
        }

        protected void ddlhold_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlhold.SelectedValue == "2")
            {
                txtvaloflease.Visible = true;
                trvalidityofLease.Visible = true;
                txtvaloflease.Focus();
            }
            else
            {
                trvalidityofLease.Visible = false;
                ddlcommentbyretrevoffcr.Focus();
            }
        }

        protected void ddlcommentbyretrevoffcr_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcommentbyretrevoffcr.SelectedValue == "1")
            {
                txtremarksbyretiredrevofficer.Visible = true;
                trremarksbyretiredrevenueofficer.Visible = true;
                txtremarksbyretiredrevofficer.Text = "";
                txtremarksbyretiredrevofficer.Focus();
            }
            else
            {
                trremarksbyretiredrevenueofficer.Visible = false;
                ddltax.Focus();
            }
           
        }
        //private void grdlocationbind()
        //{
        //    ds = cmm.RunSpReturnDSParam("PN18_LR_Locations", "PRASARNETConnectionString", new SqlParameter("@CityId", Convert.ToInt32(ddlcity.SelectedValue)),
        //                                                                                                new SqlParameter("@flag", 1));
        //    grdloc.DataSource = ds;
        //    grdloc.DataBind();
        //}
        //protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //grdlocationbind();
        //    //cmm.bindDDLWidParam(ddllocation, "PN18_LR_Locations", "LocationName", "LocationId", "PRASARNETConnectionString", "--Select Location--",
        //    //                                                                                             new SqlParameter("@CityId", Convert.ToInt32(ddlcity.SelectedValue)),
        //    //                                                                                             new SqlParameter("@flag", 1));

        //    //cmm.bindDDLWidParam(ddlsiteusedforpanel, "PN18_LR_SiteFor", "sitefor", "Id", "PRASARNETConnectionString", "--Select--",
        //    //                                                                                         new SqlParameter("@flag", 1));

        //    //Label39.Text = ddlcity.SelectedItem.Text;

        //    diventry.Visible = false;
        //    divlandrecform.Visible = false;
        //    divenchrochment.Visible = false;
        //    divuploaddoc.Visible = false;
        //    divuploadmaps.Visible = false;
        //    //lbladdlocation2.Visible = true;
        //}

        protected void lnkenchrochmentDetails_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = true;
            txtcourtcaseno.Text = "";
            txtcontrollingOffice.Text = "";
            txtremarks.Text = "";
            getencrecoreds();
            txtcourtcaseno.Focus();
        }
        private void getencrecoreds()
        {
            Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
            ds = cmm.RunSpReturnDSParam("PN18_LR_EnchrochmentSP", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                              new SqlParameter("@flag", 1));
            grdenc.DataSource = ds;
            grdenc.DataBind();
        }

        protected void btnsubenc_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnsubenc.Text == "Submit")
                {
                    Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
                    int i = cmm.RunSP("PN18_LR_EnchrochmentSP", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                    new SqlParameter("@CourtCaseNumber", txtcourtcaseno.Text.Trim()),
                                                                                    new SqlParameter("@ControllingOffice", txtcontrollingOffice.Text.Trim()),
                                                                                    new SqlParameter("@Remarks", txtremarks.Text.Trim()),
                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                    new SqlParameter("@flag", 2));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully');", true);
                        txtcourtcaseno.Text = "";
                        txtcontrollingOffice.Text = "";
                        txtremarks.Text = "";
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again');", true);
                    }
                    getencrecoreds();
                }
                else//update
                {
                    int j = cmm.RunSP("PN18_LR_EnchrochmentSP", "PRASARNETConnectionString",
                                                                                    new SqlParameter("@CourtCaseNumber", txtcourtcaseno.Text.Trim()),
                                                                                    new SqlParameter("@ControllingOffice", txtcontrollingOffice.Text.Trim()),
                                                                                    new SqlParameter("@Remarks", txtremarks.Text.Trim()),
                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                    new SqlParameter("@id", Convert.ToInt32(ViewState["encId"])),
                                                                                    new SqlParameter("@flag", 3));
                    if (j > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                        txtcourtcaseno.Text = "";
                        txtcontrollingOffice.Text = "";
                        txtremarks.Text = "";
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again');", true);
                    }
                    getencrecoreds();
                    divgrdenc.Visible = true;
                    btnsubenc.Text = "Submit";
                    btncloseenc.Text = "Clear";
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('contact with IT Team');", true);
            }
        }

        protected void grdenc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdenc.PageIndex = e.NewPageIndex;
            getencrecoreds();
        }

        protected void grdenc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grdenc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdenc.EditIndex = e.NewEditIndex;
            getencrecoreds();
        }

        protected void grdenc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdenc_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdenc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                divgrdenc.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int encId = (int)grdenc.DataKeys[row.RowIndex].Value;
                ViewState["encId"] = encId;
                ds1 = cmm.RunSpReturnDSParam("PN18_LR_EnchrochmentSP", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "4"),
                                                   new SqlParameter("@id", encId));
                txtcourtcaseno.Text = ds1.Tables[0].Rows[0][2].ToString();
                txtcontrollingOffice.Text = ds1.Tables[0].Rows[0][3].ToString();
                txtremarks.Text = ds1.Tables[0].Rows[0][4].ToString();
                btnsubenc.Text = "Update";
                btncloseenc.Text = "Close";

            }
        }

        protected void btncloseenc_Click(object sender, EventArgs e)
        {
            if (btnsubenc.Text != "Submit")
            {
                btnsubenc.Text = "Submit";
                btncloseenc.Text = "Clear";
                divgrdenc.Visible = true;
            }

            txtcourtcaseno.Text = "";
            txtcontrollingOffice.Text = "";
            txtremarks.Text = "";

        }

        protected void lnkcloseenc_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = false;
            txtcourtcaseno.Text = "";
            txtcontrollingOffice.Text = "";
            txtremarks.Text = "";
        }

        protected void lnkcloselandrec_Click(object sender, EventArgs e)
        {
            String enchrochment = "";
            diventry.Visible = true;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            Boolean isverifed = false;
            diventry.Visible = true;
            DataSet ds = new DataSet();

            ds = cmm.RunSpReturnDSParam("PN18_LR_landrecords", "PRASARNETConnectionString", new SqlParameter("@ZoneId", Convert.ToInt16(ddlzone.SelectedValue)),
                                                                                   new SqlParameter("@stateid", Convert.ToInt16(ddlstate.SelectedValue)),
                                                                                   new SqlParameter("@locationid", Convert.ToInt16(ddlcity.SelectedValue)),
                                                                                   new SqlParameter("@districtid", Convert.ToInt16(ddldistrict.SelectedValue)),
                                                                                   new SqlParameter("@flag", 1));

            if (Convert.ToInt16(ds.Tables[0].Rows.Count) != 0)
            {
                isverifed = Convert.ToBoolean(ds.Tables[0].Rows[0][23]);
                enchrochment = Convert.ToString(ds.Tables[0].Rows[0][17]);
                //ddlzone.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0][0]));
                if (isverifed)
                {
                    lnkuploaddocuments.Enabled = true;
                    lnkuploadmaps.Enabled = true;
                    if (enchrochment == "Yes")
                    {
                        divenchrochmentdetails.Visible = true;
                    }
                    else
                    {
                        divenchrochmentdetails.Visible = false;
                    }
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = false;
                    divRecordsverified.Visible = true;
                    divstatusrecord.Visible = false;
                    divstatusmap.Visible = false;
                    lnkuploaddocuments.Enabled = true;
                    lnkuploadmaps.Enabled = true;
                }
                else
                {
                    lnkuploaddocuments.Enabled = false;
                    lnkuploadmaps.Enabled = false;
                    divenchrochmentdetails.Visible = false;
                    divRecords_not_submitted.Visible = false;
                    divRecordssubnotverified.Visible = true;
                    divRecordsverified.Visible = false;
                    divstatusrecord.Visible = true;
                    divstatusmap.Visible = true;
                    lnkuploaddocuments.Enabled = false;
                    lnkuploadmaps.Enabled = false;
                }
            }
            else
            {
                lnkuploaddocuments.Enabled = false;
                lnkuploadmaps.Enabled = false;
                divenchrochmentdetails.Visible = false;
                divRecords_not_submitted.Visible = true;
                divRecordssubnotverified.Visible = false;
                divRecordsverified.Visible = false;
                divstatusrecord.Visible = true;
                divstatusmap.Visible = true;
                lnkuploaddocuments.Enabled = false;
                lnkuploadmaps.Enabled = false;
            }
        }

        protected void lnkuploaddocuments_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = true;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = false;


            getlandpaperrecoreds();
            cmm.bindDDLWidParam(ddltypeofpaper, "PN18_LR_landrecordpaper", "typeofpaper", "typid", "PRASARNETConnectionString", "--Select PaperType--",
                                                                                                        new SqlParameter("@flag", 1));
            ddltypeofpaper.SelectedIndex = 0;
            txtremarkslandrecordspaper.Text = "";

            txtpaperno.Text = "";
            divlandpapergrd.Visible = true;
            ddltypeofpaper.Focus();
        }
        private void getlandpaperrecoreds()
        {
            Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
            ds = cmm.RunSpReturnDSParam("pn18_LR_Landrecpapers", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                              new SqlParameter("@flag", 1));
            grdlandrecordpapers.DataSource = ds;
            grdlandrecordpapers.DataBind();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileuploadpaper.HasFile)
                {
                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(fileuploadpaper.FileName);
                    filetype = filetype.ToLower();
                    string max = "";
                    if (Button1.Text == "Submit")
                    {
                        max = cmm.SelectMaxId("select max(Id)+1 from PN18_LR_LandRecordsPaper", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                    }
                    else
                    {
                        max = Convert.ToString(ViewState["landpaperid"]);
                        ds = cmm.RunSQLReturnDS("Select [Filename] from PN18_LR_LandRecordsPaper where Id=" + Convert.ToInt64(ViewState["landpaperid"]), "PRASARNETConnectionString");
                        string docname1 = Convert.ToString(ds.Tables[0].Rows[0][0]);
                        string path1 = Server.MapPath("~/LandRecords/Papers/" + docname1);
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)
                        {
                            //file.Delete();
                        }
                    }

                    if (filetype == ".pdf")
                    {
                        string files = "";
                        fileuploadpaper.SaveAs(MapPath("~/LandRecords/Papers/" + fileuploadpaper.FileName.ToString()));
                        files = fileuploadpaper.FileName.ToString();
                        if (fileuploadpaper.PostedFile.ContentType == "application/pdf")
                        {
                            System.IO.Stream fs;
                            fs = fileuploadpaper.PostedFile.InputStream;
                            System.IO.StreamReader rs;
                            rs = new System.IO.StreamReader(fs, true);
                            string lastline = rs.ReadLine().ToString();

                            if ((fileuploadpaper.PostedFile.ContentType.ToString() == "application/pdf") & (lastline.IndexOf("%PDF") > -1))
                            {

                                path = Server.MapPath("~") + "LandRecords\\Papers\\";
                                string Fromfile = path + files;
                                string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                                string typeofpaper = ddltypeofpaper.SelectedItem.Text.Replace(' ', '_').Replace('/', '_');
                                string city = ddlcity.SelectedItem.Text.Replace(' ', '_');
                                string savefile = typeofpaper + "_" + city + "_" + max + "_" + dtetm + filetype;
                                string Tofile = path + savefile;
                                File.Move(Fromfile, Tofile);

                                if (Button1.Text == "Submit")
                                {
                                    Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
                                    int i = cmm.RunSP("pn18_LR_Landrecpapers", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                                    new SqlParameter("@TypeofPaperId", Convert.ToInt32(ddltypeofpaper.SelectedValue)),
                                                                                                    new SqlParameter("@TypeofPaperNumber", txtpaperno.Text.Trim()),
                                                                                                    new SqlParameter("@Filename", savefile),
                                                                                                    new SqlParameter("@Remarks", txtremarkslandrecordspaper.Text.Trim()),
                                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                                    new SqlParameter("@flag", 2));
                                    if (i > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully');", true);
                                        ddltypeofpaper.SelectedIndex = 0;
                                        txtpaperno.Text = "";
                                        txtremarkslandrecordspaper.Text = "";
                                    }
                                    else
                                    {

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again');", true);
                                    }
                                    getlandpaperrecoreds();
                                }
                                else//update
                                {
                                    int j = cmm.RunSP("pn18_LR_Landrecpapers", "PRASARNETConnectionString",
                                                                                                    new SqlParameter("@TypeofPaperId", Convert.ToInt32(ddltypeofpaper.SelectedValue)),
                                                                                                    new SqlParameter("@TypeofPaperNumber", txtpaperno.Text.Trim()),
                                                                                                    new SqlParameter("@Filename", savefile),
                                                                                                    new SqlParameter("@Remarks", txtremarkslandrecordspaper.Text.Trim()),
                                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                                    new SqlParameter("@id", Convert.ToInt32(ViewState["landpaperid"])),
                                                                                                    new SqlParameter("@flag", 3));
                                    if (j > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                                        if (btnsubenc.Text != "Submit")
                                        {
                                            divlandpapergrd.Visible = true;
                                            Button1.Text = "Submit";
                                            Button2.Text = "Clear";
                                        }

                                        ddltypeofpaper.SelectedIndex = 0;
                                        txtpaperno.Text = "";
                                        txtremarkslandrecordspaper.Text = "";
                                    }
                                    else
                                    {

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again');", true);
                                    }
                                    getlandpaperrecoreds();
                                    divlandpapergrd.Visible = true;
                                    Button1.Text = "Submit";
                                    Button2.Text = "Clear";
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only, pdf are allowed to upload!!');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only, pdf are allowed to upload!!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only, pdf are allowed to upload!!');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please attach a file !!');", true);

                grdlandrecordpapers.Focus();
                grdlandrecordpapers.PageIndex = 0;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There may some technical issues, you may contact IT Team');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Button1.Text != "Submit")
            {
                divlandpapergrd.Visible = true;
                Button1.Text = "Submit";
                Button2.Text = "Clear";              
            }
            divlandpapergrd.Visible = true;
            getlandpaperrecoreds();
            ddltypeofpaper.SelectedIndex = 0;
            txtpaperno.Text = "";
            txtremarkslandrecordspaper.Text = "";
        }

        protected void grdlandrecordpapers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdlandrecordpapers.PageIndex = e.NewPageIndex;
            getlandpaperrecoreds();
        }

        protected void grdlandrecordpapers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
               
                divlandpapergrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int landpaperid = (int)grdlandrecordpapers.DataKeys[row.RowIndex].Value;
                ViewState["landpaperid"] = landpaperid;
                ds1 = cmm.RunSpReturnDSParam("pn18_LR_Landrecpapers", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "4"),
                                                   new SqlParameter("@Id", landpaperid));
                ddltypeofpaper.ClearSelection();
                ddltypeofpaper.Items.FindByValue(ds1.Tables[0].Rows[0][2].ToString()).Selected = true;
                txtpaperno.Text = ds1.Tables[0].Rows[0][3].ToString();
                txtremarkslandrecordspaper.Text = ds1.Tables[0].Rows[0][5].ToString();
                Button1.Text = "Update";
                Button2.Text = "Close";

            }

            if (e.CommandName == "downloadpaper")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int id = (int)grdlandrecordpapers.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("pn18_LR_Landrecpapers", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 4),
                                                   new SqlParameter("@Id", id));
                string paths = "LandRecords/Papers/" + ds1.Tables[0].Rows[0][4].ToString();
                string str = ds1.Tables[0].Rows[0][4].ToString();
                string substr = str.Substring(str.Length - 3);
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows.Count != 0)
                {
                    if (substr == "pdf")
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][4].ToString());
                        Response.WriteFile(Server.MapPath("~/LandRecords/Papers/" + ds1.Tables[0].Rows[0][4].ToString()));
                        Response.End();
                    }

                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no file to download!!');", true);
            }
        }

        protected void grdlandrecordpapers_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdlandrecordpapers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdlandrecordpapers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdlandrecordpapers.EditIndex = e.NewEditIndex;
            getlandpaperrecoreds();
        }

        protected void lnkuploadmaps_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = true;
            divenchrochment.Visible = false;


            getlandmaps();
            divgrdmaps.Visible = true;
            txtremarksuploadmap.Focus();
        }
        private void getlandmaps()
        {
            Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
            ds = cmm.RunSpReturnDSParam("pn18_LR_LandMaps", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                              new SqlParameter("@flag", 1));
            grdlandmap.DataSource = ds;
            grdlandmap.DataBind();
        }

        protected void btnclosemap_Click(object sender, EventArgs e)
        {
            if (btnsubenc.Text != "Submit")
            {
                divgrdmaps.Visible = true;
                btnmapupload.Text = "Submit";
                btnclosemap.Text = "Clear";
            }
            txtremarksuploadmap.Text = "";
        }

        protected void btnmapupload_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileupload1.HasFile)
                {
                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(fileupload1.FileName);
                    filetype = filetype.ToLower();
                    string max = "";
                    if (Button1.Text == "Submit")
                    {
                        max = cmm.SelectMaxId("select max(Id)+1 from PN18_LR_MAP", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                    }

                    if (filetype == ".pdf" || filetype == ".jpg" || filetype == ".jpeg")
                    {
                        string files = "";
                        fileupload1.SaveAs(MapPath("~/LandRecords/Maps/" + fileupload1.FileName.ToString()));
                        files = fileupload1.FileName.ToString();
                        if (fileupload1.PostedFile.ContentType == "application/pdf" || fileupload1.PostedFile.ContentType == "image/jpg" || fileupload1.PostedFile.ContentType == "image/jpeg")
                        {
                            System.IO.Stream fs;
                            fs = fileupload1.PostedFile.InputStream;
                            System.IO.StreamReader rs;
                            rs = new System.IO.StreamReader(fs, true);
                            string lastline = rs.ReadLine().ToString();

                            if ((fileupload1.PostedFile.ContentType.ToString() == "application/pdf") & (lastline.IndexOf("%PDF") > -1) ||
                                (fileupload1.PostedFile.ContentType.ToString() == "image/jpg") || (fileupload1.PostedFile.ContentType.ToString() == "image/jpeg"))
                            {

                                path = Server.MapPath("~") + "LandRecords\\Maps\\";
                                string Fromfile = path + files;
                                string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                                string city = ddlcity.SelectedItem.Text.Replace(' ', '_');
                                string savefile = "Maps" + "_" + city + "_" + max + "_" + dtetm + filetype;
                                string Tofile = path + savefile;
                                File.Move(Fromfile, Tofile);

                                if (Button1.Text == "Submit")
                                {
                                    Int64 Landrecordid = Convert.ToInt64(ViewState["LandrecID"]);
                                    int i = cmm.RunSP("pn18_LR_LandMaps", "PRASARNETConnectionString", new SqlParameter("@LandRecordDetailsID", Landrecordid),
                                                                                                    new SqlParameter("@Filename", savefile),
                                                                                                    new SqlParameter("@Remarks", txtremarksuploadmap.Text.Trim()),
                                                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                                    new SqlParameter("@flag", 2));
                                    if (i > 0)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted/Uploaded Successfully');", true);
                                        txtremarksuploadmap.Text = "";
                                    }
                                    else
                                    {

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again');", true);
                                    }
                                    getlandmaps();
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only, pdf,jpeg and jpg are allowed to upload!!');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only, pdf,jpeg and jpg  are allowed to upload!!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,  pdf,jpeg and jpg  are allowed to upload!!');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please attach a file !!');", true);

                grdlandmap.Focus();
                grdlandmap.PageIndex = 0;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There may some technical issues, you may contact IT Team');", true);
            }
        }

        protected void grdlandmap_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdlandmap.PageIndex = e.NewPageIndex;
            getlandmaps();
        }

        protected void grdlandmap_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grdlandmap_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdlandmap_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int mapid = (int)grdlandmap.DataKeys[row.RowIndex].Value;
                int i = cmm.RunSP("pn18_LR_LandMaps", "PRASARNETConnectionString", new SqlParameter("@id", mapid),
                                                                                  new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                                  new SqlParameter("@flag", 4));
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Deleted Successfully');", true);
                }
                getlandmaps();

            }

            if (e.CommandName == "downloadmap")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int id = (int)grdlandmap.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("pn18_LR_LandMaps", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 5),
                                                   new SqlParameter("@Id", id));
                string paths = "LandRecords/Maps/" + ds1.Tables[0].Rows[0][1].ToString();
                string str = ds1.Tables[0].Rows[0][1].ToString();
                string substr = str.Substring(str.Length - 3);
                //Response.Redirect(paths);
                if (ds1.Tables[0].Rows.Count != 0)
                {
                    if (substr == "pdf" || substr == "jpg" || substr == "jpeg")
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                        Response.WriteFile(Server.MapPath("~/LandRecords/Maps/" + ds1.Tables[0].Rows[0][1].ToString()));
                        Response.End();
                    }

                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no file to download!!');", true);
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = false;
            ddltypeofpaper.SelectedIndex = 0;
            txtpaperno.Text = "";
            txtremarkslandrecordspaper.Text = "";
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            divlandrecform.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
            divenchrochment.Visible = false;
            txtremarksuploadmap.Text = "";
        }


        //protected void Button23_Click(object sender, EventArgs e)
        //{
        //    int i;
        //    i = cmm.RunSP("PN18_LR_Locations", "PRASARNETConnectionString", new SqlParameter("@CityId", Convert.ToInt64(ddlcity.SelectedValue)),
        //                                                                    new SqlParameter("@LocationName", txtlocationname.Text.Trim()),
        //                                                                    new SqlParameter("@siteusedforid", Convert.ToInt16(ddlsiteusedforpanel.SelectedValue)),
        //                                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
        //                                                                    new SqlParameter("@flag", 2));
        //    if (i > 0)
        //    {
        //        grdlocationbind();
        //        cmm.bindDDLWidParam(ddllocation, "PN18_LR_Locations", "LocationName", "LocationId", "PRASARNETConnectionString", "--Select Location--",
        //                                                                                              new SqlParameter("@CityId", Convert.ToInt32(ddlcity.SelectedValue)),
        //                                                                                              new SqlParameter("@flag", 1));
        //        Label36.Text = "Location Added Successfully!!";
        //        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Location Added Successfully!!');", true);
        //        ddlsiteusedforpanel.SelectedIndex = 0;
        //        txtlocationname.Text = "";

        //    }
        //    else
        //    {
        //        //grdlocationbind();
        //        Label36.Text = "Try Again!!";
        //        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
        //    }
        //}

        //protected void ddllocation_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        

        protected void ddlcity_SelectedIndexChanged1(object sender, EventArgs e)
        {
            diventry.Visible = false;
            divlandrecform.Visible = false;
            divenchrochment.Visible = false;
            divuploaddoc.Visible = false;
            divuploadmaps.Visible = false;
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandRecords_Location.aspx", true);
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {

        }

        protected void btngemreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandRecordsReports.aspx", true);
        }
    }
}