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
    public partial class PB_Corona_Vaccination_Status : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("HomePage.aspx", false);
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3 || Session["UserName"].ToString() == "Guest")
            {
                if (!IsPostBack)
                {
                    string currentDate = DateTime.Today.ToShortDateString();
                    //  DateTime currentDate = DateTime.ParseExact(DateTime.Today, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    // cmpIstvac.ValueToCompare = currentDate;
                    //cmp2ndvac.ValueToCompare = currentDate;
                    //cmpistfrom.ValueToCompare = currentDate;
                    //cmpistNeg.ValueToCompare = currentDate;
                    //cmp2ndfrom.ValueToCompare = currentDate;
                    //cmp2ndneg.ValueToCompare = currentDate;

                    Label1.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlnameofVaccination, "PN18_C_Name_Vacination", "NameofVaccination", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        txtemployeecode.Text = Session["empcode"].ToString();
                        txtemployeecode.Enabled = false;
                        int empdataexists = cmm.RunSPReturnCountParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(Session["empcode"])),
                                                                                                                         new SqlParameter("@flag", 1));
                        if (empdataexists == 0)
                        {
                            divfillvacc_details.Visible = true;
                            divgrid.Visible = true;
                            ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                                                       new SqlParameter("@flag", 2));
                            lblempname.Text = ds.Tables[0].Rows[0][5].ToString();
                            ddlvaccinationtaken.Focus();
                        }
                        else
                        {
                            divfillvacc_details.Visible = false;
                            divgrid.Visible = true;
                            grdvaccinationdet.Focus();
                        }
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
                        txtemployeecode.Text = "";
                        txtemployeecode.Enabled = true;
                        txtemployeecode.Focus();
                    }

                    gridbind();

                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(Session["empcode"]))
                                                                                                                               , new SqlParameter("@flag", 2));
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Sections
            {
                if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                {
                    ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@usertypeid_office", Convert.ToInt32(Session["Usertype"]))
                                                                                                  , new SqlParameter("@stn_secid", Convert.ToInt32(Session["Station_SectionID"]))
                                                                                                  , new SqlParameter("@flag", 8));
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                {
                    if (Convert.ToInt16(Session["Usertype"]) == 12)//DGAIR
                    {
                        ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString"
                                                                                                  , new SqlParameter("@flag", 9));
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 25)//DGDD
                    {
                        ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString"
                                                                                                  , new SqlParameter("@flag", 10));
                    }
                    else// PBsectt
                    {
                        ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString"
                                                                                                  , new SqlParameter("@flag", 11));
                    }
                }
            }

            grdvaccinationdet.DataSource = ds;
            grdvaccinationdet.DataBind();
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void txtemployeecode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtemployeecode.Text != "")
                {
                    int verifyempcount = cmm.RunSPReturnCountParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtemployeecode.Text.Trim())),
                                                                               new SqlParameter("@flag", 1));

                    if (verifyempcount == 0)
                    {
                        lblempname.Text = "";
                        ddlvaccinationtaken.SelectedValue = "0";
                        // ddlnameofVaccination.SelectedValue = "0";
                        txtvac1date.Text = "";
                        txtvac2date.Text = "";
                        ddlcovidpositive.SelectedValue = "0";
                        txtcoronapositivefrom.Text = "";
                        txtcoronapositiveto.Text = "";
                        txtdateofcoronaneg.Text = "";
                        divsubmit.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee with mentioned employee code is not Active/Incorrect!!');", true);
                        divsubmit.Visible = false;
                        txtemployeecode.Focus();
                    }
                    else
                    {
                        DataSet dsempdataexists = new DataSet();
                        dsempdataexists = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim())),
                                                                            new SqlParameter("@flag", 6));
                        if (dsempdataexists.Tables[0].Rows.Count == 0)
                        {
                            DataSet verifymappingofemp_stn = new DataSet();
                            if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                            {
                                verifymappingofemp_stn = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim()))
                                                                                                                                    , new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"]))
                                                                                                                                    , new SqlParameter("@flag", 3));

                            }
                            else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                            {
                                if (Convert.ToInt16(Session["Usertype"]) == 12)//DGAIR
                                {
                                    verifymappingofemp_stn = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim()))
                                                                                                                                    , new SqlParameter("@flag", 4));
                                }
                                else if (Convert.ToInt16(Session["Usertype"]) == 25)//DGDD
                                {
                                    verifymappingofemp_stn = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim()))
                                                                                                                                    , new SqlParameter("@flag", 5));
                                }
                                if (Convert.ToInt16(Session["Usertype"]) == 26)
                                {
                                    verifymappingofemp_stn.Tables.Add();
                                    verifymappingofemp_stn.Tables[0].Rows.Add();
                                }
                            }
                            if (verifymappingofemp_stn.Tables[0].Rows.Count > 0)//Mapping exists
                            {
                                divsubmit.Visible = true;

                                divsubmit.Visible = true;
                                ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtemployeecode.Text.Trim())),
                                                                                   new SqlParameter("@flag", 2));
                                lblempname.Text = ds.Tables[0].Rows[0][5].ToString();
                                ddlvaccinationtaken.Focus();
                            }
                            else
                            {
                                lblempname.Text = "";
                                ddlvaccinationtaken.SelectedValue = "0";
                                // ddlnameofVaccination.SelectedValue = "0";
                                txtvac1date.Text = "";
                                txtvac2date.Text = "";
                                ddlcovidpositive.SelectedValue = "0";
                                txtcoronapositivefrom.Text = "";
                                txtcoronapositiveto.Text = "";
                                txtdateofcoronaneg.Text = "";
                                string stn = "";
                                ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim())),
                                                                                   new SqlParameter("@flag", 7));
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    stn = ds.Tables[0].Rows[0][0].ToString();
                                }
                                divsubmit.Visible = false;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Sorry, You are not allowed to enter the mentioned employee code information. Only, employee and  " + stn + " are allowed!!');", true);
                            }
                        }
                        else
                        {
                            lblempname.Text = "";
                            ddlvaccinationtaken.SelectedValue = "0";
                            // ddlnameofVaccination.SelectedValue = "0";
                            txtvac1date.Text = "";
                            txtvac2date.Text = "";
                            ddlcovidpositive.SelectedValue = "0";
                            txtcoronapositivefrom.Text = "";
                            txtcoronapositiveto.Text = "";
                            txtdateofcoronaneg.Text = "";
                            divsubmit.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Vaccination Information related to mentioned Employee Code already exists and provided by " + dsempdataexists.Tables[0].Rows[0][0].ToString().Replace(' ', '_') + "!!');", true);
                        }

                    }


                }
                txtemployeecode.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);

            }
        }
        private void clear()
        {
            lblempname.Text = "";
            //txtemployeecode.Text = "";
            ddlvaccinationtaken.SelectedValue = "0";
            ddlnameofVaccination.SelectedIndex = 0;
            txtvac1date.Text = "";
            txtvac2date.Text = "";
            ddlcovidpositive.SelectedValue = "0";
            txtcoronapositivefrom.Text = "";
            txtcoronapositiveto.Text = "";
            txtdateofcoronaneg.Text = "";
            txtvac1date.Enabled = false;
            txtvac2date.Enabled = false;
            ddlnameofVaccination.Enabled = false;
            txtcoronapositivefrom.Enabled = false;
            txtcoronapositiveto.Enabled = false;
            txtdateofcoronaneg.Enabled = false;
            txtdateofcoronacase2.Enabled = false;
            txtdateofcoronaneg_case2.Enabled = false;
        }
        protected void ddlvaccinationtaken_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlvaccinationtaken.SelectedValue == "1")//Yes
                {
                    txtvac1date.Enabled = true;
                    txtvac2date.Enabled = true;
                    rfvvac1Date.Enabled = true;
                    Label18.Visible = true;

                    ddlnameofVaccination.Enabled = true;
                    Label3354.Visible = true;
                    rfvnameofvaccination.Enabled = true;
                    ddlnameofVaccination.SelectedIndex = 0;
                    divsubmit.Visible = true;

                }
                else//NO
                {
                    txtvac1date.Enabled = false;
                    txtvac2date.Enabled = false;
                    txtvac1date.Text = "";
                    txtvac2date.Text = "";
                    rfvvac1Date.Enabled = false;
                    Label18.Visible = false;

                    ddlnameofVaccination.Enabled = false;
                    Label3354.Visible = false;
                    rfvnameofvaccination.Enabled = false;
                    ddlnameofVaccination.SelectedIndex = 0;
                    divsubmit.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void ddlcovidpositive_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlcovidpositive.SelectedValue == "1")//Yes
                {
                    txtcoronapositivefrom.Enabled = true;
                    txtcoronapositiveto.Enabled = true;
                    txtdateofcoronaneg.Enabled = true;
                    txtdateofcoronacase2.Enabled = true;
                    txtdateofcoronaneg_case2.Enabled = true;
                    rfvfrom.Enabled = true;
                    Label37.Visible = true;
                }
                else//NO
                {
                    txtcoronapositivefrom.Enabled = false;
                    txtcoronapositiveto.Enabled = false;
                    txtdateofcoronaneg.Enabled = false;
                    txtdateofcoronacase2.Enabled = false;
                    txtdateofcoronaneg_case2.Enabled = false;

                    txtcoronapositivefrom.Text = "";
                    txtcoronapositiveto.Text = "";
                    txtdateofcoronaneg.Text = "";
                    txtdateofcoronacase2.Text = "";
                    txtdateofcoronaneg_case2.Text = "";

                    rfvfrom.Enabled = false;
                    Label37.Visible = false;

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                if (btnsubmit.Text == "Submit")// Inserting a new Row
                {
                    if (txtemployeecode.Text != "")
                    {
                        DataSet dsempdataexists = new DataSet();
                        dsempdataexists = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim())),
                                                                            new SqlParameter("@flag", 6));
                        if (dsempdataexists.Tables[0].Rows.Count == 0)
                        {
                            int empcode = Convert.ToInt32(txtemployeecode.Text.Trim());
                            Boolean whethervaccinated = false;
                            if (ddlvaccinationtaken.SelectedValue == "1")
                                whethervaccinated = true;

                            int vaccinationid = 0;
                            DateTime? vac1date = null;
                            DateTime? vac2date = null;
                            DateTime? vac3date = null;
                            DateTime? vac4date = null;
                            Boolean vac1done = false, vac2done = false, vac3done = false, vac4done = false;
                            string vac3_free_paid = null, vac4_free_paid = null;

                            if (whethervaccinated)
                            {
                                vaccinationid = Convert.ToInt16(ddlnameofVaccination.SelectedValue);
                                if (txtvac1date.Text.Trim() != "")
                                {
                                    vac1date = DateTime.ParseExact(txtvac1date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                    vac1done = true;
                                }
                                if (txtvac2date.Text.Trim() != "")
                                {
                                    vac2date = DateTime.ParseExact(txtvac2date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                    vac2done = true;
                                }
                                if (txtvac3date.Text.Trim() != "")
                                {
                                    vac3date = DateTime.ParseExact(txtvac3date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                                    vac3done = true;
                                    vac3_free_paid = ddlvac3dose.SelectedItem.Text;
                                }
                                if (txtvac4.Text.Trim() != "")
                                {
                                    vac4date = DateTime.ParseExact(txtvac4.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                                    vac4done = true;
                                    vac4_free_paid = ddlvac4dose.SelectedItem.Text;
                                }
                            }
                            Boolean whethercoronaVic = false;
                            if (ddlcovidpositive.SelectedValue == "1")
                                whethercoronaVic = true;

                            DateTime? coronafrom = null;
                            DateTime? coronato = null;
                            DateTime? negative = null;
                            DateTime? coronafrom_case2 = null;
                            DateTime? negative_case2 = null;
                            if (whethercoronaVic)
                            {
                                if (txtcoronapositivefrom.Text.Trim() != "")
                                {
                                    coronafrom = DateTime.ParseExact(txtcoronapositivefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                }
                                if (txtcoronapositiveto.Text.Trim() != "")
                                {
                                    coronato = DateTime.ParseExact(txtcoronapositiveto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                }
                                if (txtdateofcoronaneg.Text.Trim() != "")
                                {
                                    negative = DateTime.ParseExact(txtdateofcoronaneg.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                }
                                if (txtdateofcoronacase2.Text.Trim() != "")
                                {
                                    coronafrom_case2 = DateTime.ParseExact(txtdateofcoronacase2.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                }
                                if (txtdateofcoronaneg_case2.Text.Trim() != "")
                                {
                                    negative_case2 = DateTime.ParseExact(txtdateofcoronaneg_case2.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                }
                            }
                            Boolean entrymade = false;
                            string createdby = "";
                            int usertypeid = 0, stnsecid = 0, secid = 0;
                            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                            {
                                entrymade = false;
                                createdby = Session["UserName"].ToString();

                            }
                            else//Stations or Section
                            {
                                if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                                {
                                    secid = Convert.ToInt32(Session["Station_SectionID"]);
                                }
                                entrymade = true;
                                createdby = Session["UserName"].ToString();

                            }

                            DataSet dsinfo = new DataSet();
                            dsinfo = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(txtemployeecode.Text.Trim()))
                                                                                                                                    , new SqlParameter("@flag", 13));
                            stnsecid = Convert.ToInt32(dsinfo.Tables[0].Rows[0][1]);
                            if (Convert.ToInt32(dsinfo.Tables[0].Rows[0][0]) == 3)//AIR
                                usertypeid = 11;
                            else if (Convert.ToInt32(dsinfo.Tables[0].Rows[0][0]) == 2)//DD
                                usertypeid = 20;

                            int i = 0;

                            i = cmm.RunSP("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@flag", 12)
                                                                                                  , new SqlParameter("@employeecode", empcode)
                                                                                                  , new SqlParameter("@weathervaccinated", whethervaccinated)
                                                                                                  , new SqlParameter("@Name_Vaccine_Takenid", vaccinationid)
                                                                                                  , new SqlParameter("@vaccination1_done", vac1done)
                                                                                                  , new SqlParameter("@dateofVaccination1", vac1date)
                                                                                                  , new SqlParameter("@vaccination2_done", vac2done)
                                                                                                  , new SqlParameter("@dateofVaccination2", vac2date)
                                                                                                  , new SqlParameter("@CoronaVictim", whethercoronaVic)
                                                                                                  , new SqlParameter("@Dateof_IstCoronafrom", coronafrom)
                                                                                                  , new SqlParameter("@Dateof_IstCoronaTo", coronato)
                                                                                                  , new SqlParameter("@DateofCoronaNegative", negative)
                                                                                                  , new SqlParameter("@Last_OpIP", ip)
                                                                                                  , new SqlParameter("@createdby", createdby)
                                                                                                  , new SqlParameter("@EntryMadebyOffc", entrymade)
                                                                                                  , new SqlParameter("@usertypeid_office", usertypeid)
                                                                                                  , new SqlParameter("@sectionid", secid)
                                                                                                  , new SqlParameter("@stn_secid", stnsecid)
                                                                                                  , new SqlParameter("@Dateof_IIndCoronaFrom", coronafrom_case2)
                                                                                                  , new SqlParameter("@DateofCoronaNegative2", negative_case2)
                                                                                                  , new SqlParameter("@vaccination3_done", vac3done)
                                                                                                  , new SqlParameter("@dateofVaccination3", vac3date)
                                                                                                  , new SqlParameter("@vaccination4_done", vac4done)
                                                                                                  , new SqlParameter("@dateofVaccination4", vac4date)
                                                                                                  , new SqlParameter("@vac3_free_paid", vac3_free_paid)
                                                                                                  , new SqlParameter("@vac4_free_paid", vac4_free_paid));
                            if (i > 0)
                            {
                                clear();
                                divsubmit.Visible = true;
                                if (Convert.ToInt16(Session["Usertype"]) == 10)
                                {
                                    divfillvacc_details.Visible = false;
                                }
                                else
                                {
                                    divfillvacc_details.Visible = true;
                                    txtemployeecode.Text = "";
                                    lblempname.Text = "";
                                }
                                grdvaccinationdet.Focus();
                                gridbind();
                                grdvaccinationdet.Focus();
                                rfvnameofvaccination.Enabled = false;
                                rfvvac1Date.Enabled = false;
                                rfvfrom.Enabled = false;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Information Added Successfully...')", true);
                            }

                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                        }

                        else
                        {
                            divsubmit.Visible = true;
                            if (Convert.ToInt16(Session["Usertype"]) == 10)
                            {
                                divfillvacc_details.Visible = false;
                            }
                            else
                            {
                                divfillvacc_details.Visible = true;
                            }
                            gridbind();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Information related to Employee Code already exists!!')", true);
                            txtemployeecode.Focus();

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Employee Code can't be left blank!!')", true);
                        txtemployeecode.Focus();
                    }
                }
                else//Update
                {
                    if (txtemployeecode.Text != "")
                    {
                        int empcode = Convert.ToInt32(txtemployeecode.Text.Trim());
                        Boolean whethervaccinated = false;
                        if (ddlvaccinationtaken.SelectedValue == "1")
                            whethervaccinated = true;

                        int vaccinationid = 0;
                        DateTime? vac1date = null;
                        DateTime? vac2date = null;
                        DateTime? vac3date = null;
                        DateTime? vac4date = null;
                        Boolean vac1done = false, vac2done = false, vac3done = false, vac4done = false;
                        string vac3_free_paid = null, vac4_free_paid = null;

                        if (whethervaccinated)
                        {
                            vaccinationid = Convert.ToInt16(ddlnameofVaccination.SelectedValue);
                            if (txtvac1date.Text.Trim() != "")
                            {
                                vac1date = DateTime.ParseExact(txtvac1date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                vac1done = true;
                            }
                            if (txtvac2date.Text.Trim() != "")
                            {
                                vac2date = DateTime.ParseExact(txtvac2date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                                vac2done = true;
                            }
                            if (txtvac3date.Text.Trim() != "")
                            {
                                vac3date = DateTime.ParseExact(txtvac3date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                                vac3done = true;
                                vac3_free_paid = ddlvac3dose.SelectedItem.Text;
                            }
                            if (txtvac4.Text.Trim() != "")
                            {
                                vac4date = DateTime.ParseExact(txtvac4.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                                vac4done = true;
                                vac4_free_paid = ddlvac4dose.SelectedItem.Text;
                            }
                        }
                        Boolean whethercoronaVic = false;
                        if (ddlcovidpositive.SelectedValue == "1")
                            whethercoronaVic = true;

                        DateTime? coronafrom = null;
                        DateTime? coronato = null;
                        DateTime? negative = null;
                        DateTime? coronafrom_case2 = null;
                        DateTime? negative_case2 = null;
                        if (whethercoronaVic)
                        {
                            if (txtcoronapositivefrom.Text.Trim() != "")
                            {
                                coronafrom = DateTime.ParseExact(txtcoronapositivefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                            }
                            if (txtcoronapositiveto.Text.Trim() != "")
                            {
                                coronato = DateTime.ParseExact(txtcoronapositiveto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                            }
                            if (txtdateofcoronaneg.Text.Trim() != "")
                            {
                                negative = DateTime.ParseExact(txtdateofcoronaneg.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                            }
                            if (txtdateofcoronacase2.Text.Trim() != "")
                            {
                                coronafrom_case2 = DateTime.ParseExact(txtdateofcoronacase2.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                            }
                            if (txtdateofcoronaneg_case2.Text.Trim() != "")
                            {
                                negative_case2 = DateTime.ParseExact(txtdateofcoronaneg_case2.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                            }
                        }
                        string updatedby = "";
                        if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                        {
                            updatedby = Session["UserName"].ToString();

                        }
                        else//Stations or Section
                        {
                            updatedby = Session["UserName"].ToString();

                        }


                        int i = 0;

                        i = cmm.RunSP("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@flag", 14)
                                                                                              , new SqlParameter("@weathervaccinated", whethervaccinated)
                                                                                              , new SqlParameter("@Name_Vaccine_Takenid", vaccinationid)
                                                                                              , new SqlParameter("@vaccination1_done", vac1done)
                                                                                              , new SqlParameter("@dateofVaccination1", vac1date)
                                                                                              , new SqlParameter("@vaccination2_done", vac2done)
                                                                                              , new SqlParameter("@dateofVaccination2", vac2date)
                                                                                              , new SqlParameter("@CoronaVictim", whethercoronaVic)
                                                                                              , new SqlParameter("@Dateof_IstCoronafrom", coronafrom)
                                                                                              , new SqlParameter("@Dateof_IstCoronaTo", coronato)
                                                                                              , new SqlParameter("@DateofCoronaNegative", negative)
                                                                                              , new SqlParameter("@Last_OpIP", ip)
                                                                                              , new SqlParameter("@updatedby", updatedby)
                                                                                              , new SqlParameter("@Dateof_IIndCoronaFrom", coronafrom_case2)
                                                                                              , new SqlParameter("@DateofCoronaNegative2", negative_case2)
                                                                                              , new SqlParameter("@vaccination3_done", vac3done)
                                                                                              , new SqlParameter("@dateofVaccination3", vac3date)
                                                                                              , new SqlParameter("@vaccination4_done", vac4done)
                                                                                              , new SqlParameter("@dateofVaccination4", vac4date)
                                                                                              , new SqlParameter("@vac3_free_paid", vac3_free_paid)
                                                                                              , new SqlParameter("@vac4_free_paid", vac4_free_paid)
                                                                                              , new SqlParameter("@id", Convert.ToInt32(ViewState["vacid"])));
                        if (i > 0)
                        {
                            txtemployeecode.Enabled = true;
                            ddlvaccinationtaken.Enabled = true;
                            ddlnameofVaccination.Enabled = false;
                            txtvac1date.Enabled = false;
                            txtvac2date.Enabled = false;
                            btnsubmit.Text = "Submit";
                            divsubmit.Visible = true;
                            divgrid.Visible = true;
                            clear();
                            grdvaccinationdet.Focus();
                            gridbind();
                            grdvaccinationdet.Focus();
                            if (Convert.ToInt16(Session["Usertype"]) == 10)
                            {
                                divfillvacc_details.Visible = false;
                            }
                            else
                            {
                                divfillvacc_details.Visible = true;
                                txtemployeecode.Text = "";
                            }
                            rfvnameofvaccination.Enabled = false;
                            rfvvac1Date.Enabled = false;
                            rfvfrom.Enabled = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Information Updated Successfully...')", true);

                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }


                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Employee Code can't be left blank!!')", true);
                        txtemployeecode.Focus();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + " by " + Session["UserName"].ToString();
                grdvaccinationdet.AllowPaging = false;
                grdvaccinationdet.Columns[7].Visible = false;
                gridbind();
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
                ClientScript.RegisterStartupScript(this.GetType(), "Corona Vaccination-Prasar Bharati", sb.ToString());
                grdvaccinationdet.AllowPaging = true;
                grdvaccinationdet.Columns[7].Visible = true;
                gridbind();
                divmsg.Visible = false;
                lblmsg.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + " by " + Session["UserName"].ToString();
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=Corona_Vaccination_Report_PrasarNet.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);
                grdvaccinationdet.Columns[7].Visible = false;
                grdvaccinationdet.AllowPaging = false;
                gridbind();
                grdvaccinationdet.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in grdvaccinationdet.HeaderRow.Cells)
                {
                    cell.BackColor = grdvaccinationdet.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grdvaccinationdet.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        cell.BackColor = grdvaccinationdet.RowStyle.BackColor;
                    }
                }
                panelprint.RenderControl(ht);
                Response.Write(sw.ToString());
                grdvaccinationdet.AllowPaging = true;
                grdvaccinationdet.Columns[7].Visible = true;
                gridbind();
                divmsg.Visible = false;
                lblmsg.Text = "";
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }

        }

        protected void grdvaccinationdet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvaccinationdet.PageIndex = e.NewPageIndex;
            gridbind();
            grdvaccinationdet.Focus();
        }

        protected void grdvaccinationdet_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdvaccinationdet_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void grdvaccinationdet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grdvaccinationdet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                try
                {
                    divfillvacc_details.Visible = true;
                    txtemployeecode.Enabled = false;

                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grdvaccinationdet.DataKeys[row.RowIndex].Value;
                    ViewState["vacid"] = id;

                    ds = cmm.RunSpReturnDSParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@flag", 15)
                                                                                        , new SqlParameter("@id", id));

                    txtemployeecode.Text = ds.Tables[0].Rows[0][0].ToString();
                    lblempname.Text = ds.Tables[0].Rows[0][11].ToString();

                    Boolean isvaccinated = Convert.ToBoolean(ds.Tables[0].Rows[0][1].ToString());
                    cmm.bindDDLWidParam(ddlnameofVaccination, "PN18_C_Name_Vacination", "NameofVaccination", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));

                    if (isvaccinated)
                    {
                        ddlvaccinationtaken.Enabled = false;
                        ddlnameofVaccination.Enabled = true;
                        txtvac1date.Enabled = true;

                        txtvac2date.Enabled = true;
                        ddlvaccinationtaken.SelectedValue = "1";

                        rfvvac1Date.Enabled = true;
                        Label18.Visible = true;
                        rfvnameofvaccination.Enabled = true;
                    }

                    else
                    {
                        ddlvaccinationtaken.Enabled = true;
                        ddlnameofVaccination.Enabled = false;
                        txtvac1date.Enabled = false;
                        txtvac2date.Enabled = false;
                        ddlvaccinationtaken.SelectedValue = "0";
                        rfvvac1Date.Enabled = false;
                        Label18.Visible = false;
                        rfvnameofvaccination.Enabled = false;
                    }
                    if (Convert.ToInt16(ds.Tables[0].Rows[0][2]) == 0)
                    {
                        ddlnameofVaccination.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlnameofVaccination.SelectedValue = ds.Tables[0].Rows[0][2].ToString();
                    }

                    if (ds.Tables[0].Rows[0][3].ToString() != "")
                        txtvac1date.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][3]).Date.ToString("dd-MM-yyyy");
                    else
                        txtvac1date.Text = "";

                    if (ds.Tables[0].Rows[0][4].ToString() != "")
                        txtvac2date.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][4]).Date.ToString("dd-MM-yyyy");
                    else
                        txtvac2date.Text = "";

                    if (ds.Tables[0].Rows[0][12].ToString() != "")
                        txtvac3date.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][12]).Date.ToString("dd-MM-yyyy");
                    else
                        txtvac3date.Text = "";

                    if (ds.Tables[0].Rows[0][13].ToString() != "")
                        txtvac4.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][13]).Date.ToString("dd-MM-yyyy");
                    else
                        txtvac4.Text = "";


                    Boolean iscoronavictim = Convert.ToBoolean(ds.Tables[0].Rows[0][5].ToString());

                    if (iscoronavictim)
                    {
                        ddlcovidpositive.SelectedValue = "1";
                        txtcoronapositivefrom.Enabled = true;
                        txtcoronapositiveto.Enabled = true;
                        txtdateofcoronaneg.Enabled = true;
                        txtdateofcoronacase2.Enabled = true;
                        txtdateofcoronaneg_case2.Enabled = true;
                        rfvfrom.Enabled = true;
                        Label37.Visible = true;
                    }
                    else
                    {
                        ddlcovidpositive.SelectedValue = "0";
                        txtcoronapositivefrom.Enabled = false;
                        txtcoronapositiveto.Enabled = false;
                        txtdateofcoronaneg.Enabled = false;
                        txtdateofcoronacase2.Enabled = false;
                        txtdateofcoronaneg_case2.Enabled = false;
                        rfvfrom.Enabled = false;
                        Label37.Visible = false;

                    }
                    if (ds.Tables[0].Rows[0][6].ToString() != "")
                        txtcoronapositivefrom.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][6]).Date.ToString("dd-MM-yyyy");
                    else
                        txtcoronapositivefrom.Text = "";

                    if (ds.Tables[0].Rows[0][7].ToString() != "")
                        txtcoronapositiveto.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][7]).Date.ToString("dd-MM-yyyy");
                    else
                        txtcoronapositiveto.Text = "";

                    if (ds.Tables[0].Rows[0][8].ToString() != "")
                        txtdateofcoronaneg.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][8]).Date.ToString("dd-MM-yyyy");
                    else
                        txtdateofcoronaneg.Text = "";
                    if (ds.Tables[0].Rows[0][9].ToString() != "")
                        txtdateofcoronacase2.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][9]).Date.ToString("dd-MM-yyyy");
                    else
                        txtdateofcoronacase2.Text = "";
                    if (ds.Tables[0].Rows[0][10].ToString() != "")
                        txtdateofcoronaneg_case2.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][10]).Date.ToString("dd-MM-yyyy");
                    else
                        txtdateofcoronaneg_case2.Text = "";

                    btnsubmit.Text = "Update";
                    divsubmit.Visible = true;
                    divgrid.Visible = false;
                    txtvac1date.Focus();
                    if (ds.Tables[0].Rows[0][14].ToString() !="no")
                    {
                        ddlvac3dose.ClearSelection();
                        ddlvac3dose.Items.FindByText(ds.Tables[0].Rows[0][14].ToString()).Selected = true;
                        rfv3.Enabled = true;
                    }
                    if (ds.Tables[0].Rows[0][15].ToString() != "no")
                    {
                        ddlvac4dose.ClearSelection();
                        ddlvac4dose.Items.FindByText(ds.Tables[0].Rows[0][15].ToString()).Selected = true;
                        rfv4.Enabled = true;
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                }
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            try
            {
                clear();
                rfvnameofvaccination.Enabled = false;
                rfvvac1Date.Enabled = false;
                rfvfrom.Enabled = false;
                divsubmit.Visible = true;
                if (btnsubmit.Text == "Submit")
                {
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {

                        int empdataexists = cmm.RunSPReturnCountParam("PN18_C_Vaccination", "PRASARNETConnectionString", new SqlParameter("@employeecode", Convert.ToInt32(Session["empcode"])),
                                                                                                                         new SqlParameter("@flag", 1));
                        if (empdataexists == 0)
                        {
                            divfillvacc_details.Visible = true;
                            divgrid.Visible = true;
                            ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])),
                                                                                                       new SqlParameter("@flag", 2));
                            lblempname.Text = ds.Tables[0].Rows[0][5].ToString();
                            ddlvaccinationtaken.Focus();
                        }
                        else
                        {
                            divfillvacc_details.Visible = false;
                            divgrid.Visible = true;
                            grdvaccinationdet.Focus();
                        }
                    }
                    else
                    {
                        divgrid.Visible = true;
                        grdvaccinationdet.Focus();
                        txtemployeecode.Text = "";
                    }
                }
                else
                {
                    btnsubmit.Text = "Submit";
                    ddlvaccinationtaken.Enabled = true;
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        txtemployeecode.Enabled = false;
                        divfillvacc_details.Visible = false;
                        divgrid.Visible = true;
                        grdvaccinationdet.Focus();
                    }
                    else
                    {
                        txtemployeecode.Enabled = true;
                        divfillvacc_details.Visible = true;
                        divgrid.Visible = true;
                        grdvaccinationdet.Focus();
                        txtemployeecode.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void txtvac4_TextChanged(object sender, EventArgs e)
        {
            if(txtvac4.Text!="")
            {
                rfv4.Enabled = true;
            }
            else
            {
                rfv4.Enabled = false;
            }
            ddlvac4dose.Focus();
        }

        protected void txtvac3date_TextChanged(object sender, EventArgs e)
        {
            if (txtvac3date.Text != "")
            {
                rfv3.Enabled = true;
            }
            else
            {
                rfv3.Enabled = false;
            }
            ddlvac3dose.Focus();
        }
    }
}

