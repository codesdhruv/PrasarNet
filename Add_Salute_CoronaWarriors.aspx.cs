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

    public partial class Add_Salute_CoronaWarriors : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) != 10)
            {
                if (!IsPostBack)
                {
                    gridbind();
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Section Menu
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
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["UserId"]) == 4)// Management
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
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else//14,15,16,18,19
                        {
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
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (rbldeceased.SelectedValue == "0")//Not-Yet
                {
                    trdateofdischarge.Visible = false;
                    trdateofjoining.Visible = false;
                    rfvdateofdischarge.Enabled = false;
                    rfvdateofjoining.Enabled = false;
                    txtdateofdischarged.Text = "";
                    txtjoiningback.Text = "";
                    rbldeceased.Focus();
                }
                else if (rbldeceased.SelectedValue == "3")// deceased
                {
                    trdateofdischarge.Visible = true;
                    trdateofjoining.Visible = false;
                    rfvdateofdischarge.Enabled = true;
                    rfvdateofjoining.Enabled = false;
                    txtdateofdischarged.Focus();
                }
                else
                {
                    trdateofdischarge.Visible = true;
                    trdateofjoining.Visible = true;
                    rfvdateofdischarge.Enabled = true;
                    rfvdateofjoining.Enabled = true;
                    txtjoiningback.Focus();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
            }
        }


        protected void btnaddmsg_Click(object sender, EventArgs e)
        {
            divOPTIONS.Visible = false;
            diventry.Visible = true;
            divcoronawarriors_entry.Visible = false;
            divadd_Cwarriors.Visible = true;
            //divtrackgridprimary.Visible = true;
            divmsg_entry.Visible = true;
            btnback.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            diventry.Visible = true;
            divOPTIONS.Visible = true;
            clear2();
            btnback.Visible = true;
            divcoronawarriors_entry.Visible = true;
            divadd_Cwarriors.Visible = false;
            divtrackgridprimary.Visible = true;
            divbtnbckform.Visible = false;
            divmsg_entry.Visible = false;
        }
        private void clear2()
        {
            ddlemptype.SelectedIndex = 0;
            txtempcode.Text = "";
            txtdesgn.Text = "";
            txtname.Text = "";
            txtsec_stn.Text = "";
            ddlcat_nonemp.SelectedIndex = 0;
            rblcorona.SelectedIndex = 0;
            txtD_O_CPositive.Text = "";
            txtlastvisit.Text = "";
            txtmob.Text = "";
            txtnearfamily.Text = "";
            ddltypofquar.SelectedIndex = 0;
            txtdetailsofHospital.Text = "";
            rblcorona.SelectedIndex = 0;
            txtdateofdischarged.Text = "";
            txtjoiningback.Text = "";
            txtage.Text = "";
            if (ddlemptype.SelectedIndex != 0)
            {
                ddlstate.SelectedIndex = 0;
                ddlstate.Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            diventry.Visible = false;
            divOPTIONS.Visible = true;
            txtmessage.Text = "";
            btnback.Visible = true;
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }
        private void gridbind()
        {//@createdbyusertypeid and createdbystnsecID=@createdbystnsecID
            ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                      , new SqlParameter("@createdbyusertypeid", Convert.ToInt32(Session["Usertype"]))
                                                                                      , new SqlParameter("@createdbystnsecID", Convert.ToInt32(Session["Uidmanagement"])));
            grdcon_war_details.DataSource = ds;
            grdcon_war_details.DataBind();
        }
        protected void btnaddcorona_Click(object sender, EventArgs e)
        {
            try
            {
                divOPTIONS.Visible = false;
                diventry.Visible = true;
                divcoronawarriors_entry.Visible = true;
                divadd_Cwarriors.Visible = true;
                divtrackgridprimary.Visible = false;
                divmsg_entry.Visible = false;
                btnback.Visible = false;
                divbtnbckform.Visible = true;
                cmm.bindDDLWidParam(ddlemptype, "Corona_PN18_emptype", "emp_type", "emptypeid", "PRASARNETConnectionString", "--Select--",
                                                                                                                new SqlParameter("@flag", 1));
                gridbind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
            }
        }
        protected void ddlemptype_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--Select--",
                                                                                                              new SqlParameter("@flag", 2));
                if (ddlemptype.SelectedValue == "1")//regular
                {
                    trempcode.Visible = true;
                    trname.Visible = true;
                    trage.Visible = true;
                    trdeptt_sec.Visible = true;
                    trstate.Visible = true;
                    trdesignation_reg_emp.Visible = true;
                    trrelationshipwithpb.Visible = false;
                    txtempcode.ReadOnly = false;
                }
                else
                {
                    trempcode.Visible = false;
                    trstate.Visible = true;
                    trname.Visible = true;
                    trage.Visible = true;
                    trdeptt_sec.Visible = true;
                    trdesignation_reg_emp.Visible = true;
                    if (ddlemptype.SelectedValue == "2")
                        trrelationshipwithpb.Visible = false;
                    else if (ddlemptype.SelectedValue == "3")
                        trrelationshipwithpb.Visible = true;
                }

                
                txtname.ReadOnly = false;
                txtage.ReadOnly = false;
                txtage.ReadOnly = false;
                ddlstate.Enabled = true;
                txtsec_stn.ReadOnly = false;
                txtdesgn.ReadOnly = false;
                txtmob.ReadOnly = false;

                trfinaladd.Visible = true;
                txtempcode.Text = "";
                txtdesgn.Text = "";
                txtname.Text = "";
                txtsec_stn.Text = "";
                ddlcat_nonemp.SelectedIndex = 0;
                rblcorona.SelectedIndex = 0;
                txtD_O_CPositive.Text = "";
                txtlastvisit.Text = "";
                txtmob.Text = "";
                txtnearfamily.Text = "";
                ddltypofquar.SelectedIndex = 0;
                txtdetailsofHospital.Text = "";
                rblcorona.SelectedIndex = 0;
                txtdateofdischarged.Text = "";
                txtjoiningback.Text = "";
                txtage.Text = "";
                ddlstate.Enabled = true;
                ddlstate.SelectedIndex = 0;
                ddlstate.CssClass = "select widthofboxes1";
                txtname.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
            }
        }

        protected void txtempcode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DataSet dsempdet = new DataSet();
                dsempdet = cmm.RunSpReturnDSParam("Corona_PN18_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2)
                                                                                                     , new SqlParameter("@empcode", Convert.ToInt32(txtempcode.Text.Trim())));
                trname.Visible = true;

                trdeptt_sec.Visible = true;
                trdesignation_reg_emp.Visible = true;
                if (dsempdet.Tables[0].Rows.Count > 0)
                {
                    //DataSet dsdatachk = new DataSet();
                    //dsdatachk = cmm.RunSpReturnDSParam("PN21_CheckCoronaEmpCode", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                    //                                                                                     , new SqlParameter("@empcode", Convert.ToInt32(txtempcode.Text.Trim())));
                    //if (dsdatachk.Tables[0].Rows.Count == 0)
                    //{
                        txtname.Text = dsempdet.Tables[0].Rows[0][0].ToString();
                        txtsec_stn.Text = dsempdet.Tables[0].Rows[0][4].ToString();
                        txtdesgn.Text = dsempdet.Tables[0].Rows[0][2].ToString();
                        txtmob.Text = dsempdet.Tables[0].Rows[0][8].ToString();
                        txtage.Text = dsempdet.Tables[0].Rows[0][11].ToString();
                        ddlstate.ClearSelection();
                        if (dsempdet.Tables[0].Rows[0][9].ToString() != "")
                        {
                            ddlstate.Items.FindByValue(dsempdet.Tables[0].Rows[0][9].ToString()).Selected = true;
                        }
                        ddlstate.Enabled = true;
                        ddlstate.CssClass = "select widthofboxes1";
                        trfinaladd.Visible = true;

                        txtname.ReadOnly = true;
                        txtage.ReadOnly = true;
                        txtage.ReadOnly = true;
                        ddlstate.Enabled = false;
                        txtsec_stn.ReadOnly = true;
                        txtdesgn.ReadOnly = true;
                        txtmob.ReadOnly = true;
                    //}
                    //else
                    //{
                    //    trfinaladd.Visible = false;
                    //    txtname.Text = "";
                    //    txtempcode.Text = "";
                    //    txtdesgn.Text = "";
                    //    txtsec_stn.Text = "";
                    //    txtmob.Text = "";
                    //    ddlstate.Enabled = true;
                    //    ddlstate.SelectedIndex = 0;
                    //    ddlstate.CssClass = "select widthofboxes1";
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information related to mentioned Employee Code already exists and provided by " + dsdatachk.Tables[0].Rows[0][0].ToString().Replace(' ', '.') + "!!');", true);

                    //}

                }
                else
                {
                    trfinaladd.Visible = false;
                    txtname.Text = "";
                    txtempcode.Text = "";
                    txtdesgn.Text = "";
                    txtsec_stn.Text = "";
                    txtmob.Text = "";
                    ddlstate.Enabled = true;
                    ddlstate.SelectedIndex = 0;
                    ddlstate.CssClass = "select widthofboxes1";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Employee Code is not Available, in our Records!!')", true);

                }
                txtname.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error Occured.Try Again!!')", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                Boolean coronapositive = true;
                DateTime? dateofdischarge = null;
                DateTime? dateofjoining = null;

                if (rblcorona.SelectedValue == "0")
                {
                    coronapositive = false;
                }
                DateTime? dateofCoronapositive = null;
                dateofCoronapositive = DateTime.ParseExact(txtD_O_CPositive.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime? lastvisited = null;
                lastvisited = DateTime.ParseExact(txtlastvisit.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                String finalstatus = rbldeceased.SelectedItem.Text.ToString();
                if (txtdateofdischarged.Text.Trim() != "")
                {
                    dateofdischarge = DateTime.ParseExact(txtdateofdischarged.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);


                }
                if (txtjoiningback.Text.Trim() != "")
                {
                    dateofjoining = DateTime.ParseExact(txtjoiningback.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);


                }
                int empcode = 0;
                if (ddlemptype.SelectedValue == "1")
                {
                    if (txtempcode.Text != "")
                        empcode = Convert.ToInt32(txtempcode.Text.Trim());
                    else
                        empcode = 0;
                }

                if (Button3.Text == "Add")
                {
                    int i = 0;
                    i = cmm.RunSP("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                          , new SqlParameter("@name", txtname.Text.Trim())
                                                                                          , new SqlParameter("@user", Convert.ToString(Session["UserName"]))
                                                                                          , new SqlParameter("@emptypeid", Convert.ToInt32(ddlemptype.SelectedValue))
                                                                                          , new SqlParameter("@empcode", empcode)
                                                                                          , new SqlParameter("@designation", txtdesgn.Text.Trim())
                                                                                          , new SqlParameter("@Sec_Stn", txtsec_stn.Text.Trim())
                                                                                          , new SqlParameter("@StatusCoronaPositive", coronapositive)
                                                                                          , new SqlParameter("@coronapositiveon", dateofCoronapositive)
                                                                                          , new SqlParameter("@relationwithPB_nonEmp", ddlcat_nonemp.SelectedItem.Text)
                                                                                          , new SqlParameter("@lastdateofvisit_Offc", lastvisited)
                                                                                          , new SqlParameter("@MobileNo", txtmob.Text.Trim())
                                                                                          , new SqlParameter("@MobileNo_Of_NearestFamilyMem", txtnearfamily.Text.Trim())
                                                                                          , new SqlParameter("@Hospitalised_HomeQurantine", ddltypofquar.SelectedItem.Text.Trim())
                                                                                          , new SqlParameter("@DetailsofHospital", txtdetailsofHospital.Text.Trim())
                                                                                          , new SqlParameter("@discharged_deceased_completionhomequran", finalstatus)
                                                                                          , new SqlParameter("@dateofdischarged_deceased_home", dateofdischarge)
                                                                                          , new SqlParameter("@dateofjoiningbackoffc", dateofjoining)
                                                                                          , new SqlParameter("@createdbyusertypeid", Convert.ToInt32(Session["Usertype"]))
                                                                                          , new SqlParameter("@createdbystnsecID", Convert.ToInt32(Session["Uidmanagement"]))
                                                                                          , new SqlParameter("@stateid", Convert.ToInt32(ddlstate.SelectedValue))
                                                                                          , new SqlParameter("@age", Convert.ToInt16(txtage.Text.Trim())));
                    if (i > 0)
                    {
                        trempcode.Visible = false;
                        trname.Visible = false;
                        trage.Visible = false;
                        trdesignation_reg_emp.Visible = false;
                        trdeptt_sec.Visible = false;
                        trstate.Visible = false;
                        clear2();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Added Successfully...')", true);
                        grdcon_war_details.Focus();
                        gridbind();
                        grdcon_war_details.Focus();
                        divtrackgridprimary.Visible = true;

                        ddlemptype.Enabled = true;
                        txtempcode.ReadOnly = false;
                        txtname.ReadOnly = false;
                        txtage.ReadOnly = false;
                        ddlstate.Enabled = true;
                        txtsec_stn.ReadOnly = false;
                        txtdesgn.ReadOnly = false;
                        txtmob.ReadOnly = false;
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
                else
                {
                    int i = 0;
                    i = cmm.RunSP("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 11)
                                                                                          , new SqlParameter("@name", txtname.Text.Trim())
                                                                                          , new SqlParameter("@user", Convert.ToString(Session["UserName"]))
                                                                                          , new SqlParameter("@emptypeid", Convert.ToInt32(ddlemptype.SelectedValue))
                                                                                          , new SqlParameter("@empcode", empcode)
                                                                                          , new SqlParameter("@designation", txtdesgn.Text.Trim())
                                                                                          , new SqlParameter("@Sec_Stn", txtsec_stn.Text.Trim())
                                                                                          , new SqlParameter("@StatusCoronaPositive", coronapositive)
                                                                                          , new SqlParameter("@coronapositiveon", dateofCoronapositive)
                                                                                          , new SqlParameter("@relationwithPB_nonEmp", ddlcat_nonemp.SelectedItem.Text)
                                                                                          , new SqlParameter("@lastdateofvisit_Offc", lastvisited)
                                                                                          , new SqlParameter("@MobileNo", txtmob.Text.Trim())
                                                                                          , new SqlParameter("@MobileNo_Of_NearestFamilyMem", txtnearfamily.Text.Trim())
                                                                                          , new SqlParameter("@Hospitalised_HomeQurantine", ddltypofquar.SelectedItem.Text.Trim())
                                                                                          , new SqlParameter("@DetailsofHospital", txtdetailsofHospital.Text.Trim())
                                                                                          , new SqlParameter("@discharged_deceased_completionhomequran", finalstatus)
                                                                                          , new SqlParameter("@dateofdischarged_deceased_home", dateofdischarge)
                                                                                          , new SqlParameter("@dateofjoiningbackoffc", dateofjoining)
                                                                                          , new SqlParameter("@createdbyusertypeid", Convert.ToInt32(Session["Usertype"]))
                                                                                          , new SqlParameter("@createdbystnsecID", Convert.ToInt32(Session["Uidmanagement"]))
                                                                                          , new SqlParameter("@age", Convert.ToInt16(txtage.Text.Trim()))
                                                                                          , new SqlParameter("@stateid", Convert.ToInt32(ddlstate.SelectedValue))
                                                                                          , new SqlParameter("@CoronaWarriorId", Convert.ToInt32(ViewState["CoronaWarriorId"])));
                    if (i > 0)
                    {
                        trempcode.Visible = false;
                        trname.Visible = false;
                        trage.Visible = false;
                        trdesignation_reg_emp.Visible = false;
                        trdeptt_sec.Visible = false;
                        trstate.Visible = false;
                        clear2();

                        gridbind();

                        Button3.Text = "Add";
                        Button4.Text = "Clear";
                        divOPTIONS.Visible = true;                       
                        divadd_Cwarriors.Visible = false;
                        divtrackgridprimary.Visible = true;
                        btnback.Visible = true;
                        divbtnbckform.Visible = false;
                        grdcon_war_details.Focus();

                        ddlemptype.Enabled = true;
                        txtempcode.ReadOnly = false;
                        txtname.ReadOnly = false;
                        txtage.ReadOnly = false;
                        ddlstate.Enabled = true;
                        txtsec_stn.ReadOnly = false;
                        txtdesgn.ReadOnly = false;
                        txtmob.ReadOnly = false;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updated Successfully...')", true);
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);

                }
                grdcon_war_details.Focus();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Button4.Text == "Clear")
            {
                try
                {
                    clear2();
                    ddlemptype.Focus();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            else
            {
                divadd_Cwarriors.Visible = true;
                divtrackgridprimary.Visible = true;
                divOPTIONS.Visible = false;
                clear2();
                Button3.Text = "Add";
                Button4.Text = "Clear";

            }
        }

        protected void grdcon_war_details_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblstatus_corona = (Label)e.Row.FindControl("lblf2");
                LinkButton imgedit = (LinkButton)e.Row.FindControl("imgedit");

                Label lbluplon2 = (Label)e.Row.FindControl("lbluplon2");
                Label lblcoronawarid = (Label)e.Row.FindControl("lblcoronawarid");
                LinkButton lnkstatus = (LinkButton)e.Row.FindControl("lnkstatus");
                DateTime todaydate = DateTime.Now.Date;
                DateTime uploadedon = Convert.ToDateTime(lbluplon2.Text.Trim()).Date;
                if (uploadedon == todaydate)
                {
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FEF5E7");
                }
                ds = cmm.RunSpReturnDSParam("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                     , new SqlParameter("@C_warriorsId", Convert.ToInt32(lblcoronawarid.Text)));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lnkstatus.CssClass = "btn statusupdate font2";
                }
                else
                {
                    lnkstatus.CssClass = "btn btn-info font2";
                }

                if(lblstatus_corona.Text==" Deceased ")
                {
                    imgedit.Visible = false;
                    lnkstatus.Visible = false;
                }
                else
                {
                    imgedit.Visible = true;
                    lnkstatus.Visible = true;
                }
            }
        }

        protected void grdcon_war_details_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcon_war_details.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grdcon_war_details_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                cmm.bindDDLWidParam(ddlemptype, "Corona_PN18_emptype", "emp_type", "emptypeid", "PRASARNETConnectionString", "--Select--",
                                                                                                               new SqlParameter("@flag", 1));
                gridbind();
                divadd_Cwarriors.Visible = true;
                divtrackgridprimary.Visible = false;
                divOPTIONS.Visible = false;
                // clear2();
                Button3.Text = "Update";
                Button4.Text = "Cancel";
                btnback.Visible = false;
                divbtnbckform.Visible = true;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int CoronaWarriorId = (int)grdcon_war_details.DataKeys[row.RowIndex].Value;
                ViewState["CoronaWarriorId"] = CoronaWarriorId;
                ds = cmm.RunSpReturnDSParam("corona_Pn18_warriorsDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 10)
                                                                                    , new SqlParameter("@CoronaWarriorId", CoronaWarriorId));
                ddlemptype.ClearSelection();
                ddlemptype.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;
                
                if (ds.Tables[0].Rows[0][0].ToString() != "")
                {
                    if (Convert.ToInt16(ds.Tables[0].Rows[0][0]) == 1)
                    {
                        txtempcode.Text = ds.Tables[0].Rows[0][2].ToString();
                        trempcode.Visible = true;

                    }
                }
                trname.Visible = true;
                //       trage.Visible = true;
                trdesignation_reg_emp.Visible = true;
                trdeptt_sec.Visible = true;
                trstate.Visible = true;
                cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--Select--",
                                                                                                          new SqlParameter("@flag", 2));
                ddlstate.ClearSelection();
                ddlstate.Items.FindByValue(ds.Tables[0].Rows[0][22].ToString()).Selected = true;
                txtname.Text = ds.Tables[0].Rows[0][19].ToString();
                txtdesgn.Text = ds.Tables[0].Rows[0][3].ToString();
                txtsec_stn.Text = ds.Tables[0].Rows[0][4].ToString();
                if (Convert.ToBoolean(ds.Tables[0].Rows[0][5]))
                    rblcorona.Items.FindByValue("1").Selected = true;
                else
                    rblcorona.Items.FindByValue("0").Selected = true;
                txtD_O_CPositive.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][6]).Date.ToString("dd-MM-yyyy");
                txtlastvisit.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][7]).Date.ToString("dd-MM-yyyy");
                txtmob.Text = ds.Tables[0].Rows[0][8].ToString();
                txtnearfamily.Text = ds.Tables[0].Rows[0][9].ToString();
                ddltypofquar.ClearSelection();
                ddltypofquar.Items.FindByText(ds.Tables[0].Rows[0][10].ToString()).Selected = true;
                txtdetailsofHospital.Text = ds.Tables[0].Rows[0][11].ToString();
                if (Convert.ToString(ds.Tables[0].Rows[0][12]) == " Not-Yet ")
                    rbldeceased.Items.FindByValue("0").Selected = true;
                else if (Convert.ToString(ds.Tables[0].Rows[0][12]) == " Discharged ")
                    rbldeceased.Items.FindByValue("1").Selected = true;
                else if (Convert.ToString(ds.Tables[0].Rows[0][12]) == " Deceased ")
                    rbldeceased.Items.FindByValue("3").Selected = true;
                else if (Convert.ToString(ds.Tables[0].Rows[0][12]) == " Completed a Home-Quarantine ")
                    rbldeceased.Items.FindByValue("2").Selected = true;
                if (ds.Tables[0].Rows[0][14].ToString() != "")
                {
                    txtjoiningback.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][14]).Date.ToString("dd-MM-yyyy");
                }
                if (ds.Tables[0].Rows[0][13].ToString() != "")
                {
                    txtdateofdischarged.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][13]).Date.ToString("dd-MM-yyyy");
                }
                if (ds.Tables[0].Rows[0][18].ToString() != "--Select--")
                {
                    ddlcat_nonemp.ClearSelection();
                    ddlcat_nonemp.Items.FindByText(ds.Tables[0].Rows[0][18].ToString()).Selected = true;
                }
                txtage.Text = ds.Tables[0].Rows[0][21].ToString();
                trfinaladd.Visible = true;
                if (ds.Tables[0].Rows[0][0].ToString() == "1")//Regular
                {
                    ddlemptype.Enabled = false;
                    txtempcode.ReadOnly = true;
                    txtname.ReadOnly = true;
                    txtage.ReadOnly = true;
                    ddlstate.Enabled = false;
                    txtsec_stn.ReadOnly = true;
                    txtdesgn.ReadOnly = true;
                    txtmob.ReadOnly = true;
                }
                else
                {
                    ddlemptype.Enabled = false;
                    txtname.ReadOnly = true;//Nochanges allowed
                    txtage.ReadOnly = true;//Nochanges allowed
                    ddlstate.Enabled = false;//Nochanges allowed
                    txtsec_stn.ReadOnly = true;//Nochanges allowed
                    txtdesgn.ReadOnly = true;//Nochanges allowed
                    txtmob.ReadOnly = false;//changes allowed
                }
            }
            if (e.CommandName == "status")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int CoronaWarriorId = (int)grdcon_war_details.DataKeys[row.RowIndex].Value;
                ViewState["CoronaWarriorId"] = CoronaWarriorId;
                Label lbln2 = row.FindControl("lbln2") as Label;

                lblnameUpdate.Text = lbln2.Text;
                ds = cmm.RunSpReturnDSParam("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                     , new SqlParameter("@C_warriorsId", CoronaWarriorId));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gvDetails.DataSource = ds;
                    gvDetails.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    gvDetails.DataSource = ds;
                    //  dpcvacancy.Tables[0].Rows[0][1] = 0;
                    gvDetails.DataBind();
                    int columncount = gvDetails.Rows[0].Cells.Count;
                    gvDetails.Rows[0].Cells.Clear();
                    gvDetails.Rows[0].Cells.Add(new TableCell());
                    gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                    gvDetails.Rows[0].Cells[0].Text = "No Records Found";
                }
                //Display the ModalPopup.
                mpeupdate.Show();
            }
        }

        protected void grdcon_war_details_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdcon_war_details_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void grdcon_war_details_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int statusid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());

                int i = cmm.RunSP("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@statusid", statusid),
                                                                           new SqlParameter("@createdbyusertypid", Convert.ToInt32(Session["Usertype"])),
                                                                           new SqlParameter("@createdbystn_secID", Convert.ToInt32(Session["Uidmanagement"])),
                                                                           new SqlParameter("@flag", 3));

                if (i > 0)
                {


                    lblresult.ForeColor = System.Drawing.Color.Green;
                    lblresult.Text = "Deleted Successfully..";
                    lblresult.Focus();
                }
                else
                {

                    lblresult.ForeColor = System.Drawing.Color.Red;
                    lblresult.Text = "Oops...Unable to Delete!!";
                    lblresult.Focus();
                }
                gvDetails.EditIndex = -1;
                Gridpop();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);
            }
        }
        protected void gvDetails_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("AddNew"))
            {
                try
                {

                    TextBox txtdatestatusfooter = (TextBox)gvDetails.FooterRow.FindControl("txtdatestatusfooter");
                    TextBox txtstatusAdd = (TextBox)gvDetails.FooterRow.FindControl("txtstatusAdd");

                    int i = cmm.RunSP("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@C_warriorsId", Convert.ToInt32(ViewState["CoronaWarriorId"])),
                                                                                       new SqlParameter("@status", txtstatusAdd.Text.Trim()),
                                                                                       new SqlParameter("@statusdate", DateTime.ParseExact(txtdatestatusfooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                                                       new SqlParameter("@createdbyusertypid", Convert.ToInt32(Session["Usertype"])),
                                                                                       new SqlParameter("@createdbystn_secID", Convert.ToInt32(Session["Uidmanagement"])),
                                                                                       new SqlParameter("@flag", 2));


                    if (i > 0)
                    {

                        Gridpop();
                        lblresult.ForeColor = System.Drawing.Color.Green;
                        lblresult.Text = "Added Successfully..";
                        lblresult.Focus();
                    }
                    else
                    {
                        Gridpop();
                        lblresult.ForeColor = System.Drawing.Color.Red;
                        lblresult.Text = "Oops...Unable to Add!!";
                        lblresult.Focus();
                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

                }
            }
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDetails.PageIndex = e.NewPageIndex;
            Gridpop();
        }
        private void Gridpop()
        {
            ds = cmm.RunSpReturnDSParam("Corona_PN18_Status", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                  , new SqlParameter("@C_warriorsId", Convert.ToInt32(ViewState["CoronaWarriorId"])));
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gvDetails.DataSource = ds;
                //  dpcvacancy.Tables[0].Rows[0][1] = 0;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grdcon_war_details.AllowPaging = false;
            gridbind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdcon_war_details.RenderControl(hw);
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
            grdcon_war_details.AllowPaging = true;
            gridbind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void txtD_O_CPositive_TextChanged(object sender, EventArgs e)
        {
            if (ddlemptype.SelectedValue == "1")
            {
                if (txtD_O_CPositive.Text != "")
                {
                    DataSet dsdatachk = new DataSet();
                    DateTime dt_positive = DateTime.ParseExact(txtD_O_CPositive.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    dsdatachk = cmm.RunSpReturnDSParam("PN21_CheckCoronaEmpCode", "PRASARNETConnectionString", new SqlParameter("@flag", 2)
                                                                                                             , new SqlParameter("@coronapositiveon", dt_positive)
                                                                                                             , new SqlParameter("@empcode", Convert.ToInt32(txtempcode.Text.Trim())));
                    if (dsdatachk.Tables[0].Rows.Count == 0)
                    {
                        trfinaladd.Visible = true;
                        txtlastvisit.Focus();
                    }
                    else
                    {
                        txtD_O_CPositive.Text = "";
                        trfinaladd.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information related to mentioned Employee Code in respect of date of corona positive is already exists and provided by " + dsdatachk.Tables[0].Rows[0][0].ToString().Replace(' ', '.') + "!!');", true);
                        txtD_O_CPositive.Focus();
                    }
                }

            }
            else
            {
                trfinaladd.Visible = true;
                txtlastvisit.Focus();

            }
            

        }
    }
}