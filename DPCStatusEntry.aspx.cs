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
    public partial class DPCStatusEntry : System.Web.UI.Page
    {
        int totalvacancies = 0;
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24
                || Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 ||
                Convert.ToInt16(Session["Usertype"]) == 31 || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 ||
                Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25)//PBRB,DGAIR-DPC,DGDD-DPC

            {                
                if (!IsPostBack)
                {
                    ViewState["searchall"] = 0;
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(HR)
                    {
                        grddoc.Columns[11].Visible = true;//final status
                        grddoc.Columns[12].Visible = false;//edit or delete
                        grddoc.Columns[13].Visible = true;//Info given by
                        grddoc.Columns[14].Visible = true;//Edit Final Status
                        diventryform.Visible = true;
                        divdpcentry.Visible = false;
                        divsearch.Visible = true;
                        lnkbtnsearch.Visible = false;

                        cmm.bindDDLWidParam(ddlwingseacrh, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--All--",
                                                                                                              new SqlParameter("@flag", 1));
                        //cmm.bindDDLWidParam(ddlsectionsearch, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--All--",
                        //                                                                                      new SqlParameter("@orgid", 0),
                        //                                                                                      new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlmasteroOSecSearch, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                   new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlconauthsearch, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--All--",
                                                                                                         new SqlParameter("@flag", 1));
                        gridbind2();

                        btnsearchclose.Visible = false;
                        btnsearchclear.Visible = true;
                        divpbrb.Visible = false;
                        divgenusers.Visible = true;
                        div24.Visible = true;
                        div24.Attributes["class"] = "aligncenter col-lg-12";
                        div23.Visible = false;
                        lnkaddnew_genuser.Visible = false;
                        lnkdownload_genuser.Visible = true;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                    {
                        DataSet dsstn = new DataSet();
                        dsstn = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                        new SqlParameter("@flag", "3"));
                        if (dsstn.Tables[0].Rows.Count != 0)//ADG Offices
                        {

                            divpbrb.Visible = false;
                            divgenusers.Visible = true;
                            div24.Visible = true;
                            div24.Attributes["class"] = "alignright col-lg-6";
                            div23.Visible = true;
                            div23.Attributes["class"] = "alignleft col-lg-6";
                            divallentry.Visible = false;
                            divclose.Visible = false;

                            grddoc.Columns[11].Visible = false;//final status
                            grddoc.Columns[12].Visible = true;//edit or delete
                            grddoc.Columns[13].Visible = false;//Info given by
                            grddoc.Columns[14].Visible = false;//Edit Final Status
                            diventryform.Visible = false;
                            divdpcentry.Visible = false;
                            divsearch.Visible = false;
                            lnkbtnsearch.Visible = true;
                            cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--",
                                                                                                                    new SqlParameter("@flag", 1));
                            //cmm.bindDDLWidParam(ddlsection, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--Select Section--",
                            //                                                                                        new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
                            //                                                                                        new SqlParameter("@flag", 1));
                            cmm.bindDDLWidParam(ddlconvauth, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));
                            cmm.bindDDLWidParam(ddlmasterofficeofsection, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                   new SqlParameter("@flag", 1));

                            gridbind();

                        }
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25)// AIR Sections
                    {
                        DataSet dssecfordpc = new DataSet();
                        dssecfordpc = cmm.RunSpReturnDSParam("secforDPCinDirectorates", "PRASARNETConnectionString", new SqlParameter("@userid", Convert.ToInt32(Session["Uidmanagement"])),
                                                                                                                     new SqlParameter("@flag", "1"));// Only capital section
                        if (dssecfordpc.Tables[0].Rows.Count != 0)//AIR Offices
                        {
                            divpbrb.Visible = false;
                            divgenusers.Visible = true;
                            div24.Visible = true;
                            div24.Attributes["class"] = "alignright col-lg-6";
                            div23.Visible = true;
                            div23.Attributes["class"] = "alignleft col-lg-6";
                            divallentry.Visible = false;
                            divclose.Visible = false;

                            grddoc.Columns[11].Visible = false;//final status
                            grddoc.Columns[12].Visible = true;//edit or delete
                            grddoc.Columns[13].Visible = false;//Info given by
                            grddoc.Columns[14].Visible = false;//Edit Final Status
                            diventryform.Visible = false;
                            divdpcentry.Visible = false;
                            divsearch.Visible = false;
                            lnkbtnsearch.Visible = true;
                            cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--",
                                                                                                                    new SqlParameter("@flag", 1));
                            //cmm.bindDDLWidParam(ddlsection, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--Select Section--",
                            //                                                                                        new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
                            //                                                                                        new SqlParameter("@flag", 1));
                            cmm.bindDDLWidParam(ddlconvauth, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));
                            cmm.bindDDLWidParam(ddlmasterofficeofsection, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                   new SqlParameter("@flag", 1));

                            gridbind();

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
                        
                        if (Convert.ToInt16(Session["Usertype"]) == 28)//PBRB
                        {
                            divpbrb.Visible = true;
                            divgenusers.Visible = false;
                            divallentry.Visible = true;
                            divclose.Visible = false;

                        }
                        else
                        {
                            divpbrb.Visible = false;
                            divgenusers.Visible = true;
                            div24.Visible = true;
                            div24.Attributes["class"] = "alignright col-lg-6";
                            div23.Visible = true;
                            div23.Attributes["class"] = "alignleft col-lg-6";
                        }
                        grddoc.Columns[11].Visible = false;//final status
                        grddoc.Columns[12].Visible = true;//edit or delete
                        grddoc.Columns[13].Visible = false;//Info given by
                        grddoc.Columns[14].Visible = false;//Edit Final Status
                        divgrd.Visible = true;
                        diventryform.Visible = false;
                        divdpcentry.Visible = false;
                        divsearch.Visible = false;
                        lnkbtnsearch.Visible = true;
                        cmm.bindDDLWidParam(ddlwing, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--Select Wing--",
                                                                                                                new SqlParameter("@flag", 1));
                        //cmm.bindDDLWidParam(ddlsection, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--Select Section--",
                        //                                                                                        new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
                        //                                                                                        new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlconvauth, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                             new SqlParameter("@flag", 1));
                        cmm.bindDDLWidParam(ddlmasterofficeofsection, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                               new SqlParameter("@flag", 1));

                        gridbind();

                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        public string getfromdesignationid()
        {
            string str = "";

            foreach (ListItem liItem in lstsharewith.Items)
                str += liItem.Value + ",";
            str = str.Substring(0, str.Length - 1);

            return str;
        }
        public string getfromdesignationstring()
        {
            string str = "";

            foreach (ListItem liItem in lstsharewith.Items)
                str += liItem.Text + ",";
            str = str.Substring(0, str.Length - 1);

            return str;
        }
        private void gridbind2()//PBADG(E&A)
        {

            ds = cmm.RunSpReturnDSParam("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@flag", "6"));

            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        private void gridbind()
        {
            int createdbyid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
            {
                createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
            }
            else
            {
                createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
            }
            ds = cmm.RunSpReturnDSParam("PN18_SP_DPCStatus", "PRASARNETConnectionString",
                                                                  new SqlParameter("@createdbyid", createdbyid),
                                                                  new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                  new SqlParameter("@flag", "2"));

            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void ddlwing_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmm.bindDDLWidParam(ddldesgnfrom, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
            cmm.bindDDLWidParam(ddldesgnto, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwing.SelectedValue));
            lstsharewith.Items.Clear();
        }
        private void clear()
        {
            txtrmk.Text = "";
            txtreason.Text = "";
            txtstatus.Text = "";
            txtDPCto.Text = "";
            txtdpcfrom.Text = "";
            ddlconvauth.SelectedIndex = 0;
            ddlmasterofficeofsection.SelectedIndex = 0;
            txtD_O_C.Text = "";
            ddlsection.Items.Clear();
            ddldesgnto.Items.Clear();
            ddldesgnto.SelectedIndex = -1;
            ddldesgnto.SelectedValue = null;
            ddldesgnfrom.Items.Clear();
            ddldesgnfrom.SelectedIndex = -1;
            ddldesgnfrom.SelectedValue = null;
            ddlwing.SelectedIndex = 0;
            lstsharewith.Items.Clear();
            ddlconfirmedbyLO.SelectedIndex = 0;
            FileUpload1.Attributes.Clear();
            rblAPAR.SelectedValue = "0";
            rblRR.SelectedValue = "0";
            rblsenlist.SelectedValue = "0";
            rblvig.SelectedValue = "0";
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            int i;
            int createdbyid = 0;
            bool senlist = false;
            bool vigclearance = false;
            bool APAR = false;
            bool DPCasRR = false;
            if (rblsenlist.SelectedValue == "1")
            {
                senlist = true;
            }
            if (rblvig.SelectedValue == "1")
            {
                vigclearance = true;
            }
            if (rblAPAR.SelectedValue == "1")
            {
                APAR = true;
            }
            if (rblRR.SelectedValue == "1")
            {
                DPCasRR = true;
            }

            try
            {
                if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                    || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                {
                    createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                }
                else
                {
                    createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                }
                if (btnsubmit.Text == "Submit")
                {
                    if (lstsharewith.Items.Count != 0)
                    {
                        if (FileUpload1.HasFile)
                        {
                            int ret = uploaddoc();
                            if (ret == 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                            }
                            else
                            {
                                string fromdesignation = getfromdesignationstring();
                                string fromdesgnids = getfromdesignationid();
                                i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                                new SqlParameter("@todesignationid", ddldesgnto.SelectedValue),
                                                                                                new SqlParameter("@sectionid", ddlsection.SelectedValue),
                                                                                                new SqlParameter("@conveningAuthority", ddlconvauth.SelectedItem.Text.Trim()),
                                                                                                new SqlParameter("@DPCPendingfrom", Convert.ToString(txtdpcfrom.Text)),
                                                                                                new SqlParameter("@DPCPendingTo", Convert.ToString(txtDPCto.Text)),
                                                                                                new SqlParameter("@StatusofDPC", txtstatus.Text.Trim()),
                                                                                                new SqlParameter("@ReasonsforPending", txtreason.Text.Trim()),
                                                                                                new SqlParameter("@Remarks", txtrmk.Text.Trim()),
                                                                                                new SqlParameter("@Createdby", Convert.ToString(Session["UserName"])),
                                                                                                new SqlParameter("@createdbyid", createdbyid),
                                                                                                new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                                new SqlParameter("@convauthid", Convert.ToInt16(ddlconvauth.SelectedItem.Value)),
                                                                                                new SqlParameter("@mastersectionofcid", Convert.ToInt16(ddlmasterofficeofsection.SelectedItem.Value)),
                                                                                                new SqlParameter("@DateofCompletion", DateTime.ParseExact(txtD_O_C.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),

                                                                                                new SqlParameter("@seniorityListAvailable", senlist),
                                                                                                new SqlParameter("@VigilanceClearance", vigclearance),
                                                                                                new SqlParameter("@ACR_APAR_Available", APAR),
                                                                                                new SqlParameter("@DPC_constituted_asRR", DPCasRR),

                                                                                                new SqlParameter("@fromdesignation", fromdesignation),
                                                                                                new SqlParameter("@fromdegnstringid", fromdesgnids),
                                                                                                new SqlParameter("@ConfirmedbyLO", Convert.ToInt16(ddlconfirmedbyLO.SelectedValue)),
                                                                                                new SqlParameter("@LOFilename", ViewState["LOfilename"].ToString()),
                                                                                                new SqlParameter("@flag", 1));
                                if (i > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully!!');", true);
                                    clear();
                                    diventryform.Visible = false;
                                    divdpcentry.Visible = false;
                                    divsearch.Visible = false;
                                    divgrd.Visible = true;
                                    LinkButton1.Visible = true;
                                    divallentry.Visible = true;
                                    btnreport.Visible = true;
                                    btnsearchallpbrb.Visible = false;
                                    divclose.Visible = false;
                                    lnkdownloadmanualforPBRB.Visible = true;
                                    gridbind();
                                    grddoc.Focus();
                                }
                            }
                        }
                        else
                        {
                            //if (lstsharewith.Items.Count != 0)
                            //{

                            string fromdesignation = getfromdesignationstring();
                            string fromdesgnids = getfromdesignationid();
                            i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                            new SqlParameter("@todesignationid", ddldesgnto.SelectedValue),
                                                                                            new SqlParameter("@sectionid", ddlsection.SelectedValue),
                                                                                            new SqlParameter("@conveningAuthority", ddlconvauth.SelectedItem.Text.Trim()),
                                                                                            new SqlParameter("@DPCPendingfrom", Convert.ToString(txtdpcfrom.Text)),
                                                                                            new SqlParameter("@DPCPendingTo", Convert.ToString(txtDPCto.Text)),
                                                                                            new SqlParameter("@StatusofDPC", txtstatus.Text.Trim()),
                                                                                            new SqlParameter("@ReasonsforPending", txtreason.Text.Trim()),
                                                                                            new SqlParameter("@Remarks", txtrmk.Text.Trim()),
                                                                                            new SqlParameter("@Createdby", Convert.ToString(Session["UserName"])),
                                                                                            new SqlParameter("@createdbyid", createdbyid),
                                                                                            new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                            new SqlParameter("@convauthid", Convert.ToInt16(ddlconvauth.SelectedItem.Value)),
                                                                                            new SqlParameter("@mastersectionofcid", Convert.ToInt16(ddlmasterofficeofsection.SelectedItem.Value)),
                                                                                            new SqlParameter("@DateofCompletion", DateTime.ParseExact(txtD_O_C.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),

                                                                                            new SqlParameter("@seniorityListAvailable", senlist),
                                                                                            new SqlParameter("@VigilanceClearance", vigclearance),
                                                                                            new SqlParameter("@ACR_APAR_Available", APAR),
                                                                                            new SqlParameter("@DPC_constituted_asRR", DPCasRR),

                                                                                            new SqlParameter("@fromdesignation", fromdesignation),
                                                                                            new SqlParameter("@fromdegnstringid", fromdesgnids),
                                                                                            new SqlParameter("@ConfirmedbyLO", Convert.ToInt16(ddlconfirmedbyLO.SelectedValue)),
                                                                                            new SqlParameter("@flag", 1));
                            if (i > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully!!');", true);
                                clear();
                                diventryform.Visible = false;
                                divdpcentry.Visible = false;
                                divsearch.Visible = false;
                                divgrd.Visible = true;
                                LinkButton1.Visible = true;
                                divallentry.Visible = true;
                                btnreport.Visible = true;
                                btnsearchallpbrb.Visible = false;
                                divclose.Visible = false;
                                lnkdownloadmanualforPBRB.Visible = true;
                                gridbind();
                                grddoc.Focus();
                            }

                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('From Designation list cant be left empty!!');", true);
                            }

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Designation(from) cant be left empty!!');", true);
                    }
                }
                else//updating
                {
                    if (lstsharewith.Items.Count != 0)
                    {
                        if (FileUpload1.HasFile)
                        {

                            //ViewState["FilenameLO"]

                            int ret = uploaddoc();
                            if (ret == 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                            }
                            else
                            {
                                string fromdesignation = getfromdesignationstring();
                                string fromdesgnids = getfromdesignationid();
                                i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@DPCid", Convert.ToInt64(Session["DPCid"])),
                                                                                        new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                        new SqlParameter("@todesignationid", ddldesgnto.SelectedValue),
                                                                                        new SqlParameter("@sectionid", ddlsection.SelectedValue),
                                                                                        new SqlParameter("@conveningAuthority", ddlconvauth.SelectedItem.Text.Trim()),
                                                                                        new SqlParameter("@DPCPendingfrom", Convert.ToString(txtdpcfrom.Text)),
                                                                                        new SqlParameter("@DPCPendingTo", Convert.ToString(txtDPCto.Text)),
                                                                                        new SqlParameter("@StatusofDPC", txtstatus.Text.Trim()),
                                                                                        new SqlParameter("@ReasonsforPending", txtreason.Text.Trim()),
                                                                                        new SqlParameter("@Remarks", txtrmk.Text.Trim()),
                                                                                        new SqlParameter("@UpdatedBy", Convert.ToString(Session["UserName"])),
                                                                                        new SqlParameter("@createdbyid", createdbyid),
                                                                                        new SqlParameter("@fromdesignation", fromdesignation),
                                                                                        new SqlParameter("@fromdegnstringid", fromdesgnids),
                                                                                        new SqlParameter("@ConfirmedbyLO", Convert.ToInt16(ddlconfirmedbyLO.SelectedValue)),
                                                                                        new SqlParameter("@LOFilename", ViewState["LOfilename"].ToString()),
                                                                                        new SqlParameter("@convauthid", Convert.ToInt16(ddlconvauth.SelectedItem.Value)),
                                                                                        new SqlParameter("@mastersectionofcid", Convert.ToInt16(ddlmasterofficeofsection.SelectedItem.Value)),
                                                                                        new SqlParameter("@DateofCompletion", DateTime.ParseExact(txtD_O_C.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                                                        new SqlParameter("@seniorityListAvailable", senlist),
                                                                                                new SqlParameter("@VigilanceClearance", vigclearance),
                                                                                                new SqlParameter("@ACR_APAR_Available", APAR),
                                                                                                new SqlParameter("@DPC_constituted_asRR", DPCasRR),
                                                                                                new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                        new SqlParameter("@flag", 4));
                                if (i > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                                    btnsubmit.Text = "Submit";
                                    btncncl.Text = "Clear";
                                    grddoc.Columns[12].Visible = true;
                                    divprisearch.Visible = true;
                                    ddlwing.Enabled = true;
                                    ddlwing.CssClass = "select widthofboxes1";
                                    ddlwing.BackColor = System.Drawing.Color.WhiteSmoke;
                                    //ddlwing.Enabled = true;
                                    //ddldesgnfrom.Enabled = true;
                                    //ddldesgnto.Enabled = true;
                                    clear();
                                    diventryform.Visible = false;
                                    divdpcentry.Visible = false;
                                    divsearch.Visible = false;
                                    divgrd.Visible = true;
                                    LinkButton1.Visible = true;
                                    divallentry.Visible = true;
                                    btnreport.Visible = true;
                                    btnsearchallpbrb.Visible = false;
                                    divclose.Visible = false;
                                    lnkdownloadmanualforPBRB.Visible = true;
                                    gridbind();
                                    grddoc.Focus();
                                }
                            }

                        }
                        else//Updating while no file
                        {
                            DataSet dsfilename = new DataSet();

                            //
                            string fromdesignation = getfromdesignationstring();
                            string fromdesgnids = getfromdesignationid();
                            i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@DPCid", Convert.ToInt64(Session["DPCid"])),
                                                                                    new SqlParameter("@wingid", ddlwing.SelectedValue),
                                                                                    new SqlParameter("@todesignationid", ddldesgnto.SelectedValue),
                                                                                    new SqlParameter("@sectionid", ddlsection.SelectedValue),
                                                                                    new SqlParameter("@conveningAuthority", ddlconvauth.SelectedItem.Text.Trim()),
                                                                                    new SqlParameter("@DPCPendingfrom", Convert.ToString(txtdpcfrom.Text)),
                                                                                    new SqlParameter("@DPCPendingTo", Convert.ToString(txtDPCto.Text)),
                                                                                    new SqlParameter("@StatusofDPC", txtstatus.Text.Trim()),
                                                                                    new SqlParameter("@ReasonsforPending", txtreason.Text.Trim()),
                                                                                    new SqlParameter("@Remarks", txtrmk.Text.Trim()),
                                                                                    new SqlParameter("@UpdatedBy", Convert.ToString(Session["UserName"])),
                                                                                    new SqlParameter("@createdbyid", createdbyid),
                                                                                    new SqlParameter("@fromdesignation", fromdesignation),
                                                                                    new SqlParameter("@fromdegnstringid", fromdesgnids),
                                                                                    new SqlParameter("@ConfirmedbyLO", Convert.ToInt16(ddlconfirmedbyLO.SelectedValue)),
                                                                                    new SqlParameter("@LOFilename", ViewState["FilenameLOEdit"].ToString()),
                                                                                    new SqlParameter("@convauthid", Convert.ToInt16(ddlconvauth.SelectedItem.Value)),
                                                                                    new SqlParameter("@mastersectionofcid", Convert.ToInt16(ddlmasterofficeofsection.SelectedItem.Value)),
                                                                                    new SqlParameter("@DateofCompletion", DateTime.ParseExact(txtD_O_C.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)),
                                                                                    new SqlParameter("@seniorityListAvailable", senlist),
                                                                                                new SqlParameter("@VigilanceClearance", vigclearance),
                                                                                                new SqlParameter("@ACR_APAR_Available", APAR),
                                                                                                new SqlParameter("@DPC_constituted_asRR", DPCasRR),
                                                                                                new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                    new SqlParameter("@flag", 4));
                            if (i > 0)
                            {
                                btnsubmit.Text = "Submit";
                                btncncl.Text = "Clear";
                                grddoc.Columns[12].Visible = true;
                                divprisearch.Visible = true;
                                ddlwing.Enabled = true;
                                ddlwing.CssClass = "select widthofboxes1";
                                ddlwing.BackColor = System.Drawing.Color.WhiteSmoke;
                                //ddlwing.Enabled = true;
                                //ddldesgnfrom.Enabled = true;
                                //ddldesgnto.Enabled = true;
                                clear();
                                diventryform.Visible = false;
                                divdpcentry.Visible = false;
                                divsearch.Visible = false;
                                divgrd.Visible = true;
                                LinkButton1.Visible = true;
                                divallentry.Visible = true;
                                btnreport.Visible = true;
                                btnsearchallpbrb.Visible = false;
                                divclose.Visible = false;
                                lnkdownloadmanualforPBRB.Visible = true;
                                gridbind();
                                grddoc.Focus();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Designation(from) cant be left empty!!');", true);
                    }
                    gridbind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);

            }
        }

        private int uploaddoc()
        {

            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                string max = "";
                //if (btnsubmit.Text == "Submit")
                //{
                max = cmm.SelectMaxId("select max(DPCid)+1 from PN18_DPCStatus", "PRASARNETConnectionString");
                if (max == "")
                {
                    max = "1";
                }
                //}
                //else
                //{
                //    max = Convert.ToString(Session["fileid"]);

                //}
                if (filetype == ".pdf")
                {
                    string files = "";
                    FileUpload1.SaveAs(MapPath("~/DPC/" + FileUpload1.FileName.ToString()));
                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        if ((lastline.IndexOf("%PDF") > -1))
                        {
                            path = Server.MapPath("~") + "\\DPC\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();
                            string savefile = "LODPC" + max + "_" + dtetm + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["LOfilename"] = savefile;
                            return 1;

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                            return 0;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                        return 0;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                    return 0;
                }
            }
            catch (Exception ex)
            {

                lblexception.Visible = true;
                lblexception.Text = ex.Message.ToString();
                return 0;
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            if (btncncl.Text == "Cancel")
            {
                btnsubmit.Text = "Submit";
                btncncl.Text = "Clear";
                grddoc.Columns[12].Visible = true;
                divprisearch.Visible = true;
                ddlwing.Enabled = true;
                ddlwing.CssClass = "select widthofboxes1";
                ddlwing.BackColor = System.Drawing.Color.WhiteSmoke;
                //ddlwing.Enabled = true;
                //ddldesgnfrom.Enabled = true;
                //ddldesgnto.Enabled = true;
            }
            clear();
            gridbind();

        }

        protected void btnprint_Click(object sender, EventArgs e)
        {
            try
            {
                grddoc.AllowPaging = false;

                if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(E&A)
                {

                    gridbind2();
                    grddoc.Columns[11].Visible = true;//final status
                    grddoc.Columns[12].Visible = false;//edit or delete
                    grddoc.Columns[13].Visible = true;//Info given by
                    grddoc.Columns[14].Visible = false;//Edit Final Status

                }
                else
                {
                    if (Convert.ToInt16(ViewState["allreportspbrb"]) == 1 && Convert.ToInt16(Session["Usertype"]) == 28)
                    {

                        grddoc.Columns[12].Visible = false;//edit or delete
                        grddoc.Columns[14].Visible = false;//Edit Final Status
                        grddoc.Columns[11].Visible = true;//final status
                        grddoc.Columns[13].Visible = true;//Info given by
                        gridbind2();

                    }
                    else
                    {
                        gridbind();
                        grddoc.Columns[11].Visible = false;//final status
                        grddoc.Columns[12].Visible = true;//edit or delete
                        grddoc.Columns[13].Visible = false;//Info given by
                        grddoc.Columns[14].Visible = false;//Edit Final Status
                    }
                }
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grddoc.RenderControl(hw);
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
                grddoc.AllowPaging = true;
                if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(E&A)
                {

                    gridbind2();
                    grddoc.Columns[11].Visible = true;//final status
                    grddoc.Columns[12].Visible = false;//edit or delete
                    grddoc.Columns[13].Visible = true;//Info given by
                    grddoc.Columns[14].Visible = true;//Edit Final Status

                }
                else
                {
                    if (Convert.ToInt16(ViewState["allreportspbrb"]) == 1 && Convert.ToInt16(Session["Usertype"]) == 28)
                    {

                        grddoc.Columns[12].Visible = false;//edit or delete
                        grddoc.Columns[14].Visible = false;//Edit Final Status
                        grddoc.Columns[11].Visible = true;//final status
                        grddoc.Columns[13].Visible = true;//Info given by
                        gridbind2();

                    }
                    else
                    {
                        gridbind();
                        grddoc.Columns[11].Visible = false;//final status
                        grddoc.Columns[12].Visible = true;//edit or delete
                        grddoc.Columns[13].Visible = false;//Info given by
                        grddoc.Columns[14].Visible = false;//Edit Final Status
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void grddoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(E&A)
            {
                grddoc.PageIndex = e.NewPageIndex;
                gridbind2();
                //grddoc.Columns[8].Visible = false;

            }
            else
            {
                grddoc.PageIndex = e.NewPageIndex;
                gridbind();
                // grddoc.Columns[8].Visible = false;
            }

        }

        protected void grddoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Editp")
            {
                try
                {
                    //divgrd.Visible = false;
                    diventryform.Visible = true;
                    divdpcentry.Visible = true;
                    divsearch.Visible = false;
                    LinkButton1.Visible = true;
                    lnkdownloadmanualforPBRB.Visible = true;
                    divclose.Visible = true;
                    divallentry.Visible = true;
                    btnreport.Visible = true;
                    btnsearchallpbrb.Visible = false;

                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    Session["DPCid"] = DPCid;
                    ds1 = cmm.RunSpReturnDSParam("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@DPCid", DPCid),
                                                                                new SqlParameter("@flag", 3));
                    ddlwing.SelectedValue = ds1.Tables[0].Rows[0][1].ToString();
                    //ddlwing.Enabled = false;
                    cmm.bindDDLWidParam(ddldesgnfrom, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", Convert.ToInt32(ds1.Tables[0].Rows[0][1])));
                    cmm.bindDDLWidParam(ddldesgnto, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", Convert.ToInt32(ds1.Tables[0].Rows[0][1])));

                    string getd = ds1.Tables[0].Rows[0][24].ToString();
                    string[] ar = getd.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    for (int desgnto = 0; desgnto < ar.Length; desgnto++)
                    {

                        DataSet ds2;
                        ds2 = new DataSet();
                        ds2 = cmm.RunSpReturnDSParam("PN18_getdesgnbyid", "HRITConnectionString", new SqlParameter("@desgnid", ar[desgnto]));
                        string dsgnto = Convert.ToString(ds2.Tables[0].Rows[0][1]);
                        lstsharewith.Items.Add(new ListItem(dsgnto, ar[desgnto].ToString()));
                        //lstStation.Items.Add();
                    }
                    ViewState["FilenameLOEdit"] = ds1.Tables[0].Rows[0][25].ToString();
                    //ddldesgnfrom.SelectedValue = ds1.Tables[0].Rows[0][2].ToString();
                    //ddldesgnfrom.Enabled = false;
                    ddldesgnto.SelectedValue = ds1.Tables[0].Rows[0][4].ToString();
                    //ddldesgnto.Enabled = false;
                    // ddlconfirmedbyLO.SelectedValue = ds1.Tables[0].Rows[0][26].ToString();
                    ddlconfirmedbyLO.ClearSelection();
                    ddlconfirmedbyLO.Items.FindByText(ds1.Tables[0].Rows[0][26].ToString()).Selected = true;

                    // txtconauth.Text = ds1.Tables[0].Rows[0][8].ToString();
                    if (ds1.Tables[0].Rows[0][43].ToString() != "")
                    {

                        txtD_O_C.Text = Convert.ToDateTime(ds1.Tables[0].Rows[0][43].ToString()).Date.ToString("dd-MM-yyyy");
                    }
                    else
                    {
                        txtD_O_C.Text = "";
                    }
                    ddlconvauth.ClearSelection();
                    ddlconvauth.Items.FindByValue(ds1.Tables[0].Rows[0][41].ToString()).Selected = true;
                    ddlmasterofficeofsection.ClearSelection();
                    ddlmasterofficeofsection.Items.FindByValue(ds1.Tables[0].Rows[0][42].ToString()).Selected = true;
                    ddlsection.ClearSelection();
                    int flag = 0;
                    if (ds1.Tables[0].Rows[0][42].ToString() == "1")//pbs
                    { flag = 2; }
                    else if (ds1.Tables[0].Rows[0][42].ToString() == "2")//DGAIR
                    { flag = 3; }
                    else if (ds1.Tables[0].Rows[0][42].ToString() == "3")//DGDD
                    { flag = 4; }
                    else if (ds1.Tables[0].Rows[0][42].ToString() == "4")//Zonal
                    { flag = 5; }
                    if (Convert.ToString(ds1.Tables[0].Rows[0][45]) != "")
                    {
                        if (Convert.ToString(ds1.Tables[0].Rows[0][45]) == "Yes")//senrioitylist
                        {
                            rblsenlist.SelectedValue = "1";
                        }
                        else
                        {
                            rblsenlist.SelectedValue = "0";
                        }
                    }
                    else
                    {
                        rblsenlist.SelectedValue = "0";
                    }
                    if (Convert.ToString(ds1.Tables[0].Rows[0][46]) != "")
                    {
                        if (Convert.ToString(ds1.Tables[0].Rows[0][46]) == "Yes")//Vigilance
                        {
                            rblvig.SelectedValue = "1";
                        }
                        else
                        {
                            rblvig.SelectedValue = "0";
                        }
                    }
                    else
                    {
                        rblvig.SelectedValue = "0";
                    }
                    if (Convert.ToString(ds1.Tables[0].Rows[0][47]) != "")
                    {
                        if (Convert.ToString(ds1.Tables[0].Rows[0][47]) == "Yes")//ACR
                        {
                            rblAPAR.SelectedValue = "1";
                        }
                        else
                        {
                            rblAPAR.SelectedValue = "0";
                        }
                    }
                    else
                    {
                        rblAPAR.SelectedValue = "0";
                    }
                    if (Convert.ToString(ds1.Tables[0].Rows[0][48]) != "")
                    {
                        if (Convert.ToString(ds1.Tables[0].Rows[0][48]) == "Yes")//DPC
                        {
                            rblRR.SelectedValue = "1";
                        }
                        else
                        {
                            rblRR.SelectedValue = "0";
                        }
                    }
                    else
                    {
                        rblRR.SelectedValue = "0";
                    }
                    cmm.bindDDLWidParam(ddlsection, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--Select Section--",
                                                                                                            new SqlParameter("@flag", flag));
                    ddlsection.SelectedValue = ds1.Tables[0].Rows[0][6].ToString();
                    txtdpcfrom.Text = ds1.Tables[0].Rows[0][9].ToString();
                    txtDPCto.Text = (ds1.Tables[0].Rows[0][10]).ToString();
                    txtstatus.Text = ds1.Tables[0].Rows[0][11].ToString();
                    txtreason.Text = ds1.Tables[0].Rows[0][12].ToString();
                    txtrmk.Text = ds1.Tables[0].Rows[0][13].ToString();
                    grddoc.Columns[12].Visible = false;
                    divprisearch.Visible = false;
                    btnsubmit.Text = "Update";
                    btncncl.Text = "Cancel";
                    ddlwing.Enabled = false;
                    ddlwing.CssClass = "select widthofboxes1";
                    ddlwing.BackColor = System.Drawing.Color.LightGray;
                    if (Convert.ToString(ds1.Tables[0].Rows[0][26]) == "Yes")
                    {
                        divLOupload.Visible = true;

                    }
                    else
                    {
                        divLOupload.Visible = false;
                    }
                    div12.Focus();
                    ddldesgnto.Focus();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "Delete")
            {
                try
                {
                    int createdbyid = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                        || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                    {
                        createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                    }
                    else
                    {
                        createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                    }
                    int i = 0;
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString", new SqlParameter("@DPCid", DPCid),
                                                                                  new SqlParameter("@Createdby", Convert.ToString(Session["UserName"])),
                                                                                  new SqlParameter("@createdbyid", createdbyid),
                                                                                  new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                                                  new SqlParameter("@flag", 5));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                        gridbind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }
                    grddoc.Focus();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    grddoc.Focus();
                }

            }
            if (e.CommandName == "downloadLO")
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/DPC/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_SP_DPCStatus", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", "8"),
                                                       new SqlParameter("@DPCid", DPCid));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        //if (ds2.Tables[0].Rows.Count != 0)
                        //{
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        //Response.Redirect(paths);
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            //Response.Redirect(paths);
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                //Session["DPCLOpath"] = paths;
                                //Response.Redirect("DPC_LO_DocView.aspx", false);
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                                //Response.Write("<script>");
                                //Response.Write("window.open('" + paths + "','_blank')");
                                //Response.Write("</script>");
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grddoc.Focus();
            }
            if (e.CommandName == "AddNoOfVacancy")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblstatusfinalhidden = row.FindControl("lblstatusfinal") as Label;
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    ViewState["DPCidforvacancy"] = DPCid;
                    diventry.Visible = false;
                    divvacancy.Visible = true;
                    DataSet ds1 = new DataSet();
                    ds1 = cmm.RunSpReturnDSParam("PN18_DPCvacancy_SP", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", "4"),
                                                       new SqlParameter("@dpcid", DPCid));
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        lbldpcfromvaca.Text = ds1.Tables[0].Rows[0][0].ToString();
                        lbldpctovaca.Text = ds1.Tables[0].Rows[0][3].ToString();
                        lbldpcperiodvacancy.Text = ds1.Tables[0].Rows[0][4].ToString();

                    }
                    if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(HR)
                    {
                        gvdetails1.Visible = false;
                        gvdetails21.Visible = true;
                        bindgridvacancy2(DPCid);

                    }
                    else
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 28 && Convert.ToInt16(ViewState["allreportspbrb"]) == 1)//PBADG(HR)
                        {
                            gvdetails1.Visible = false;
                            gvdetails21.Visible = true;
                            bindgridvacancy2(DPCid);

                        }
                        else
                        {
                            if (Convert.ToInt16(lblstatusfinalhidden.Text) == 0)//closed
                            {
                                gvdetails1.Visible = false;
                                gvdetails21.Visible = true;
                                bindgridvacancy2(DPCid);
                            }
                            else
                            {
                                gvdetails1.Visible = true;
                                gvdetails21.Visible = false;
                                gvDetails.ShowFooter = true;
                                bindgridvacancy(DPCid);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issue occured.Try Again!!');", true);
                }
            }

            if (e.CommandName == "Editfinalstatus")
            {
                try
                {
                    //lblstatusfinal
                    // Label d = (Label)row.FindControl("Label16");
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    Label lblstatusfinalhidden = row.FindControl("lblstatusfinal") as Label;
                    DropDownList ddlstatus = (DropDownList)row.FindControl("ddlstatus");
                    Label lblstatusfinal = row.FindControl("Label26") as Label;
                    ImageButton imgedit = row.FindControl("imgeditfinalstatus") as ImageButton;
                    ImageButton imgbtnUpdate = row.FindControl("imgbtnUpdate") as ImageButton;
                    ImageButton imgbtnCancel = row.FindControl("imgbtnCancel") as ImageButton;
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;
                    //grddoc.Columns[10].Visible = true;//final status
                    //grddoc.Columns[11].Visible = false;//edit or delete
                    //grddoc.Columns[12].Visible = true;//Info given by
                    //grddoc.Columns[13].Visible = true;//Edit Final Status
                    lblstatusfinalhidden.Visible = true;
                    lblstatusfinal.Visible = false;
                    ddlstatus.Visible = true;
                    ddlstatus.Items.FindByValue(lblstatusfinalhidden.Text).Selected = true;
                    imgedit.Visible = false;
                    imgbtnCancel.Visible = true;
                    imgbtnUpdate.Visible = true;
                    grddoc.Focus();
                    ddlstatus.Focus();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "Updatefinalstatus")
            {
                try
                {
                    int createdbyid = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                        || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                    {
                        createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                    }
                    else
                    {
                        createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                    }
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    Label lblstatusfinalhidden = row.FindControl("lblstatusfinal") as Label;
                    DropDownList ddlstatus = row.FindControl("ddlstatus") as DropDownList;
                    Label lblstatusfinal = row.FindControl("Label26") as Label;
                    ImageButton imgedit = row.FindControl("imgeditfinalstatus") as ImageButton;
                    ImageButton imgbtnUpdate = row.FindControl("imgbtnUpdate") as ImageButton;
                    ImageButton imgbtnCancel = row.FindControl("imgbtnCancel") as ImageButton;
                    int DPCid = (int)grddoc.DataKeys[row.RowIndex].Value;

                    int i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString",
                                                           new SqlParameter("@flag", "9"),
                                                           new SqlParameter("@dpcid", DPCid),
                                                           new SqlParameter("@Createdby", Convert.ToString(Session["UserName"])),
                                                           new SqlParameter("@createdbyid", createdbyid),
                                                           new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])),
                                                           new SqlParameter("@statusfinal", Convert.ToInt16(ddlstatus.SelectedValue)));
                    if (i > 0)
                    {

                        ddlstatus.Visible = false;
                        lblstatusfinal.Visible = true;
                        imgedit.Visible = true;
                        imgbtnCancel.Visible = false;
                        imgbtnUpdate.Visible = false;
                        gridbind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Suceessfully!!');", true);
                    }
                    else
                    {
                        lblstatusfinalhidden.Visible = false;
                        lblstatusfinal.Visible = false;
                        ddlstatus.Visible = true;
                        imgedit.Visible = false;
                        imgbtnCancel.Visible = true;
                        imgbtnUpdate.Visible = true;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            if (e.CommandName == "Cancelfinalstatus")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    Label lblstatusfinalhidden = row.FindControl("lblstatusfinal") as Label;
                    DropDownList ddlstatus = row.FindControl("ddlstatus") as DropDownList;
                    Label lblstatusfinal = row.FindControl("Label26") as Label;
                    ImageButton imgedit = row.FindControl("imgeditfinalstatus") as ImageButton;
                    ImageButton imgbtnUpdate = row.FindControl("imgbtnUpdate") as ImageButton;
                    ImageButton imgbtnCancel = row.FindControl("imgbtnCancel") as ImageButton;
                    ddlstatus.Visible = false;
                    lblstatusfinal.Visible = true;
                    imgedit.Visible = true;
                    imgbtnCancel.Visible = false;

                    imgbtnUpdate.Visible = false;
                    gridbind();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
        }

        protected void grddoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grddoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grddoc.EditIndex = e.NewEditIndex;
            gridbind2();
            GridViewRow currentRow = this.grddoc.Rows[e.NewEditIndex];
            DropDownList ddlstatus = currentRow.FindControl("ddlstatus") as DropDownList;
            Label lblstatusfinalhidden = currentRow.FindControl("lblstatusfinaledit") as Label;


            ddlstatus.Items.FindByValue(lblstatusfinalhidden.Text).Selected = true;
            grddoc.Focus();
            ddlstatus.Focus();

        }

        protected void grddoc_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void lnkbtnsearch_Click(object sender, EventArgs e)
        {
            diventryform.Visible = true;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = true;// div conataing the Search form         
            LinkButton1.Visible = true;//add new DPC
            lnkdownloadmanualforPBRB.Visible = true;
            lnknewentry.Visible = false;
            divallentry.Visible = true;
            btnreport.Visible = true;
            btnsearchallpbrb.Visible = false;
            divclose.Visible = false;
            lnkbtnsearch.Visible = false;
            divgrd.Visible = false;

            cmm.bindDDLWidParam(ddlwingseacrh, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--All--",
                                                                                                            new SqlParameter("@flag", 1));
            //cmm.bindDDLWidParam(ddlsectionsearch, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--All--",
            //                                                                                                new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
            //                                                                                                new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlmasteroOSecSearch, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                   new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlconauthsearch, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                new SqlParameter("@flag", 1));
            ddlwingseacrh.Focus();
            btnsearchclose.Visible = true;

        }

        protected void btnsearchclose_Click(object sender, EventArgs e)
        {
            diventryform.Visible = false;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = false;// div conataing the Search form         
            LinkButton1.Visible = true;//add new DPC
            lnkdownloadmanualforPBRB.Visible = true;
            lnknewentry.Visible = false;
            divallentry.Visible = true;
            btnreport.Visible = true;
            btnsearchallpbrb.Visible = false;
            divclose.Visible = false;

            lnkbtnsearch.Visible = true;
            btnprint1.Visible = true;
            btnbackall.Visible = false;
            divgrd.Visible = true;
            gridbind();
            grddoc.PageIndex = 0;
            grddoc.Focus();

            txtdpcfromsearch.Text = "";
            txtDPCtosearch.Text = "";

            ddlwingseacrh.SelectedIndex = 0;
            ddlmasteroOSecSearch.SelectedIndex = 0;

            ddldesgntosearch.Items.Clear();

            ddldesgntosearch.SelectedIndex = -1;
            ddldesgntosearch.SelectedValue = null;
            ddlsectionsearch.Items.Clear();
            ddlsectionsearch.SelectedIndex = -1;
            ddlsectionsearch.SelectedValue = null;
            ddlconauthsearch.SelectedIndex = 0;
            ddlsensearch.SelectedIndex = 0;
            ddlvigsearch.SelectedIndex = 0;
            ddlRRsSearch.SelectedIndex = 0;
            ddlaparsearch.SelectedIndex = 0;
            ddlstatussearch.SelectedIndex = 0;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            bndgrid_search();
            ViewState["search"] = 1;
            divgrd.Visible = true;
            grddoc.Focus();
            grddoc.PageIndex = 0;
        }
        private void bndgrid_search()
        {
            int convauthid = 0;
            string datedpendingfrom = null;
            string datedpendingto = null;
            int master = 0;
            int secid = 0;
            int wingid = 0;
            int fromdegnid = 0;
            int todesgnid = 0;
            bool? sen = null;
            bool? vig = null;
            bool? APAR = null;
            bool? DPCRR = null;
            int statusfinal = 3;



            if (ddlconauthsearch.SelectedItem.Text != "--All--")
            {
                convauthid = Convert.ToInt32(ddlconauthsearch.SelectedValue);
            }
            if (ddlsensearch.SelectedIndex != 0)
            {
                if (ddlsensearch.SelectedValue == "0")
                {
                    sen = false;
                }
                else
                {
                    sen = true;
                }
            }
            if (ddlstatussearch.SelectedIndex != 0)
            {
                if (ddlstatussearch.SelectedValue == "0")
                {
                    statusfinal = 0;
                }
                else
                {
                    statusfinal = 1;
                }
            }
            if (ddlvigsearch.SelectedIndex != 0)
            {
                if (ddlvigsearch.SelectedValue == "1")
                {
                    vig = true;
                }
                else
                {
                    vig = false;
                }
            }
            if (ddlaparsearch.SelectedIndex != 0)
            {
                if (ddlaparsearch.SelectedValue == "1")
                {
                    APAR = true;
                }
                else
                {
                    APAR = false;
                }
            }
            if (ddlRRsSearch.SelectedIndex != 0)
            {
                if (ddlRRsSearch.SelectedValue == "1")
                {
                    DPCRR = true;
                }
                else
                {
                    DPCRR = false;
                }
            }
            if (txtdpcfromsearch.Text != "")
                datedpendingfrom = Convert.ToString(txtdpcfromsearch.Text);
            if (txtDPCtosearch.Text != "")
                datedpendingto = Convert.ToString(txtDPCtosearch.Text);


            if (ddlwingseacrh.SelectedItem.Text != "--All--")
            {
                wingid = Convert.ToInt32(ddlwingseacrh.SelectedValue);
                //if (ddldesgnfromsearch.SelectedItem.Text != "--Select Designation--")
                //{
                //    fromdegnid = Convert.ToInt32(ddldesgnfromsearch.SelectedValue);
                if (ddldesgntosearch.SelectedItem.Text != "--Select Designation--")
                {
                    todesgnid = Convert.ToInt32(ddldesgntosearch.SelectedValue);
                }
                // }

            }
            if (ddlmasteroOSecSearch.SelectedItem.Text != "--All--")
            {
                master = Convert.ToInt32(ddlmasteroOSecSearch.SelectedValue);
                if (ddlsectionsearch.SelectedItem.Text != "--All--")
                {
                    secid = Convert.ToInt32(ddlsectionsearch.SelectedValue);
                }
            }


            if (Convert.ToInt16(ViewState["searchall"]) != 1)
            {
                //cmm.RunSpReturnDSParam(
                if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(E&A)
                {
                    ds = cmm.RunSpReturnDSParam("PN18_dpcFilter", "PRASARNETConnectionString", new SqlParameter("@wingid", wingid),
                                                                                         new SqlParameter("@fromdesignationid", fromdegnid),
                                                                                         new SqlParameter("@todesignationid", todesgnid),
                                                                                         new SqlParameter("@sectionid", secid),
                                                                                         new SqlParameter("@master", master),
                                                                                         new SqlParameter("@convauthid", convauthid),
                                                                                         new SqlParameter("@DPCPendingfrom", datedpendingfrom),
                                                                                         new SqlParameter("@DPCPendingTo", datedpendingto),
                                                                                         new SqlParameter("@sen", sen),
                                                                                         new SqlParameter("@vig", vig),
                                                                                         new SqlParameter("@APAR", APAR),
                                                                                         new SqlParameter("@DPCRR", DPCRR),
                                                                                         new SqlParameter("@statusfinal", statusfinal));

                }
                else
                {
                    ds = cmm.RunSpReturnDSParam("PN18_dpcFilter", "PRASARNETConnectionString", new SqlParameter("@wingid", wingid),
                                                                                           new SqlParameter("@fromdesignationid", fromdegnid),
                                                                                           new SqlParameter("@todesignationid", todesgnid),
                                                                                           new SqlParameter("@sectionid", secid),
                                                                                           new SqlParameter("@master", master),
                                                                                           new SqlParameter("@convauthid", convauthid),
                                                                                           new SqlParameter("@DPCPendingfrom", datedpendingfrom),
                                                                                           new SqlParameter("@DPCPendingTo", datedpendingto),
                                                                                           new SqlParameter("@sen", sen),
                                                                                         new SqlParameter("@vig", vig),
                                                                                         new SqlParameter("@APAR", APAR),
                                                                                         new SqlParameter("@DPCRR", DPCRR),
                                                                                         new SqlParameter("@statusfinal", statusfinal),
                                                                                         new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                           new SqlParameter("@createdbyid", Convert.ToInt32(Session["Uidmanagement"])));
                }

            }
            else
            {
                ds = cmm.RunSpReturnDSParam("PN18_dpcFilter", "PRASARNETConnectionString", new SqlParameter("@wingid", wingid),
                                                                                         new SqlParameter("@fromdesignationid", fromdegnid),
                                                                                         new SqlParameter("@todesignationid", todesgnid),
                                                                                         new SqlParameter("@sectionid", secid),
                                                                                         new SqlParameter("@master", master),
                                                                                         new SqlParameter("@convauthid", convauthid),
                                                                                         new SqlParameter("@DPCPendingfrom", datedpendingfrom),
                                                                                         new SqlParameter("@DPCPendingTo", datedpendingto),
                                                                                         new SqlParameter("@sen", sen),
                                                                                         new SqlParameter("@vig", vig),
                                                                                         new SqlParameter("@APAR", APAR),
                                                                                         new SqlParameter("@DPCRR", DPCRR),
                                                                                         new SqlParameter("@statusfinal", statusfinal));
            }
            grddoc.DataSource = ds;
            grddoc.DataBind();
            divgrd.Focus();
            grddoc.Focus();
        }

        //protected void ddldesgnfromsearch_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddldesgnfromsearch.SelectedIndex != 0)
        //    {
        //        cmm.bindDDLWidParam(ddldesgntosearch, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwingseacrh.SelectedValue));
        //    }
        //    else
        //    {
        //        ddldesgntosearch.Items.Clear();
        //        ddldesgntosearch.SelectedIndex = -1;
        //    }

        //}

        protected void ddlwingseacrh_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlwingseacrh.SelectedIndex != 0)
            {
                cmm.bindDDLWidParam(ddldesgntosearch, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", ddlwingseacrh.SelectedValue));
                ddldesgntosearch.Focus();
            }
            else
            {
                //ddldesgnfromsearch.Items.Clear();
                //ddldesgnfromsearch.SelectedIndex = -1;
                ddldesgntosearch.Items.Clear();
                ddldesgntosearch.SelectedIndex = -1;
            }
        }

        protected void btnsearchclear_Click(object sender, EventArgs e)
        {
            txtDPCtosearch.Text = "";
            txtdpcfromsearch.Text = "";
            //txtconauthsearch.Text = "";
            ddlconauthsearch.SelectedIndex = 0;
            ddlsectionsearch.SelectedIndex = 0;
            ddldesgntosearch.Items.Clear();
            ddldesgntosearch.SelectedIndex = -1;
            ddldesgntosearch.SelectedValue = null;
            //ddldesgnfromsearch.Items.Clear();
            //ddldesgnfromsearch.SelectedIndex = -1;
            //ddldesgnfromsearch.SelectedValue = null;
            ddlwingseacrh.SelectedIndex = 0;
            gridbind2();
        }

        protected void lnknewentry_Click(object sender, EventArgs e)
        {
            divallentry.Visible = true;
            divdpcentry.Visible = true;
            divsearch.Visible = false;
            lnkbtnsearch.Visible = true;
            lnknewentry.Visible = false;
            ddlwing.Focus();
            txtdpcfromsearch.Text = "";
            txtDPCtosearch.Text = "";

            ddlwingseacrh.SelectedIndex = 0;
            ddlmasteroOSecSearch.SelectedIndex = 0;

            ddldesgntosearch.Items.Clear();

            ddldesgntosearch.SelectedIndex = -1;
            ddldesgntosearch.SelectedValue = null;
            ddlsectionsearch.Items.Clear();
            ddlsectionsearch.SelectedIndex = -1;
            ddlsectionsearch.SelectedValue = null;
            ddlconauthsearch.SelectedIndex = 0;
            ddlsensearch.SelectedIndex = 0;
            ddlvigsearch.SelectedIndex = 0;
            ddlRRsSearch.SelectedIndex = 0;
            ddlaparsearch.SelectedIndex = 0;
            ddlstatussearch.SelectedIndex = 0;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            for (int i = lstsharewith.Items.Count - 1; i >= 0; i--)
            {
                string id = lstsharewith.Items[i].Value;
                if (lstsharewith.Items[i].Selected)
                {
                    lstsharewith.Items.Remove(lstsharewith.Items[i]);
                }
                //ddldesgnfrom.Items.FindByValue(id).Enabled = true;
            }

        }

        protected void ddldesgnfrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strsharewithid = ddldesgnfrom.SelectedValue.Trim();
            string strsharewithname = ddldesgnfrom.SelectedItem.Text;
            lstsharewith.Items.Add(new ListItem(strsharewithname, strsharewithid));
            ddldesgnfrom.SelectedIndex = 0;
            ddldesgnfrom.Focus();

        }
        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)// Not in Use 
        {//gvdetails_rowcommand1 in use
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    //Get the value of column from the DataKeys using the RowIndex.
                    int id = Convert.ToInt32(gvDetails.DataKeys[rowIndex].Values[0]);
                    int DPCid = Convert.ToInt32(gvDetails.DataKeys[rowIndex].Values[1]);

                    TextBox txtyear = (TextBox)gvDetails.FooterRow.FindControl("txtyear");
                    TextBox txtgen = (TextBox)gvDetails.FooterRow.FindControl("txtgen");
                    TextBox txtSC = (TextBox)gvDetails.FooterRow.FindControl("txtSC");
                    TextBox txtST = (TextBox)gvDetails.FooterRow.FindControl("txtST");
                    TextBox txtOBC = (TextBox)gvDetails.FooterRow.FindControl("txtOBC");
                    TextBox txtPH = (TextBox)gvDetails.FooterRow.FindControl("txtPH");
                    TextBox txtSport = (TextBox)gvDetails.FooterRow.FindControl("txtSport");
                    TextBox txtother = (TextBox)gvDetails.FooterRow.FindControl("txtother");
                    int total = 0;

                    ds = cmm.RunSpReturnDSParam("PN18_DPCVacancySP", "PRASARNETConnectionString", new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim()))
                                                                     , new SqlParameter("@flag", 1));


                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        int i = cmm.RunSP("PN18_DPCVacancySP", "PRASARNETConnectionString", new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim()))
                            , new SqlParameter("@DPCid", DPCid), new SqlParameter("@total", total)
                            , new SqlParameter("@gen", txtgen.Text.Trim()), new SqlParameter("@sc", txtSC.Text.Trim())
                            , new SqlParameter("@st", Convert.ToInt32(txtyear.Text.Trim())), new SqlParameter("@obc", Convert.ToInt32(txtyear.Text.Trim()))
                            , new SqlParameter("@ph", Convert.ToInt32(txtyear.Text.Trim())), new SqlParameter("@sport", Convert.ToInt32(txtyear.Text.Trim()))
                            , new SqlParameter("@other", Convert.ToInt32(txtyear.Text.Trim())), new SqlParameter("@createdby", Convert.ToInt32(txtyear.Text.Trim()))
                            , new SqlParameter("@flag", 3));

                        if (i == 1)
                        {
                            //BindGrid();
                            lblresult.ForeColor = System.Drawing.Color.Green;
                            lblresult.Text = "Plan Insert Successfully!";
                        }
                        else
                        {
                            //BindGrid();
                            lblresult.ForeColor = System.Drawing.Color.Red;
                            lblresult.Text = "Plan has not been inserted!";

                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Entries for the mentioned year is already exists!!');", true);
                        //txtPlan.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some error ocuured. Please, Check your entries.');", true);
                }

            }

            //if (e.CommandName.Equals("Edit"))
            //{
            //    //int rowIndex = int.Parse(e.CommandArgument.ToString());
            //    //int RowId = Convert.ToInt32(gvDetails.DataKeys[rowIndex].Value.ToString());
            //    string str = "select FileName, File2, File3, File4 from PlanMaster where PlanId='" + e.CommandArgument.ToString() + "'";
            //    ds = cmm.RunSQLReturnDS(str);
            //    Session["FileNameEdit"] = Convert.ToString(ds.Tables[0].Rows[0][0]);
            //    //Session["File2"] = Convert.ToString(ds.Tables[0].Rows[0][1]);
            //    //Session["File3"] = Convert.ToString(ds.Tables[0].Rows[0][2]);
            //    //Session["File4"] = Convert.ToString(ds.Tables[0].Rows[0][3]);
            //}

        }

        protected void ddlconfirmedbyLO_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlconfirmedbyLO.SelectedValue == "1")
            {
                divLOupload.Visible = true;

            }
            else
            {
                divLOupload.Visible = false;
                FileUpload1.Attributes.Clear();
            }
            txtD_O_C.Focus();
        }
        private void bindgridvacancy(int dpcid)
        {
            DataSet dpcvacancy = cmm.RunSpReturnDSParam("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@dpcid", Convert.ToInt64(ViewState["DPCidforvacancy"]))
                                                                 , new SqlParameter("@flag", 1));
            if (dpcvacancy.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = dpcvacancy;
                gvDetails.DataBind();
            }
            else
            {
                dpcvacancy.Tables[0].Rows.Add(dpcvacancy.Tables[0].NewRow());
                gvDetails.DataSource = dpcvacancy;
                //  dpcvacancy.Tables[0].Rows[0][1] = 0;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindgridvacancy2(int dpcid)
        {
            DataSet dpcvacancy = cmm.RunSpReturnDSParam("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@dpcid", Convert.ToInt64(ViewState["DPCidforvacancy"]))
                                                                 , new SqlParameter("@flag", 1));
            gvdetails2.DataSource = dpcvacancy;
            gvdetails2.DataBind();


        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt16(ViewState["allreportspbrb"]) == 1 && Convert.ToInt16(Session["Usertype"]) == 28)
            {
                diventry.Visible = true;
                diventryform.Visible = false;
                divallentry.Visible = true;
                divclose.Visible = true;
                divsearch.Visible = false;
                divgrd.Visible = true;
                lnkbtnsearch.Visible = false;
                // btnprint1.Visible = false;
                divvacancy.Visible = false;

                LinkButton1.Visible = true;
                lnkdownloadmanualforPBRB.Visible = true;
                btnreport.Visible = false;
                btnsearchallpbrb.Visible = true;

                lblresult.Text = "";
                grddoc.Columns[12].Visible = false;//edit or delete
                grddoc.Columns[14].Visible = false;//Edit Final Status
                grddoc.Columns[11].Visible = true;//final status
                grddoc.Columns[13].Visible = true;//Info given by
                gridbind2();
                grddoc.Focus();
            }
            else
            {
                diventry.Visible = true;
                diventryform.Visible = false;
                divvacancy.Visible = false;
                LinkButton1.Visible = true;
                lnkdownloadmanualforPBRB.Visible = true;
                divallentry.Visible = true;
                btnreport.Visible = true;
                btnsearchallpbrb.Visible = false;
                divclose.Visible = false;
                divgrd.Visible = true;
                lnkbtnsearch.Visible = true;
                btnprint1.Visible = true;
                lblresult.Text = "";

                if (Convert.ToInt16(Session["Usertype"]) == 29)//PBADG(E&A)
                {
                    gridbind2();
                }
                else
                {
                    gridbind();
                }
                grddoc.Focus();
            }
        }

        protected void gvDetails_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {

                    TextBox txtyear = (TextBox)gvDetails.FooterRow.FindControl("txtyear");
                    TextBox txtgen = (TextBox)gvDetails.FooterRow.FindControl("txtgen");
                    TextBox txtSC = (TextBox)gvDetails.FooterRow.FindControl("txtSC");
                    TextBox txtST = (TextBox)gvDetails.FooterRow.FindControl("txtST");
                    TextBox txtOBC = (TextBox)gvDetails.FooterRow.FindControl("txtOBC");
                    TextBox txtPH = (TextBox)gvDetails.FooterRow.FindControl("txtPH");
                    TextBox txtSport = (TextBox)gvDetails.FooterRow.FindControl("txtSport");
                    TextBox txtother = (TextBox)gvDetails.FooterRow.FindControl("txtother");
                    int total = Convert.ToInt32(txtgen.Text) + Convert.ToInt32(txtSC.Text) + Convert.ToInt32(txtST.Text) + Convert.ToInt32(txtOBC.Text) +
                        Convert.ToInt32(txtPH.Text) + Convert.ToInt32(txtSport.Text) + Convert.ToInt32(txtother.Text);
                    ds = cmm.RunSpReturnDSParam("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@dpcid", Convert.ToInt64(ViewState["DPCidforvacancy"]))
                                                                                                 , new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim()))
                                                                                                 , new SqlParameter("@flag", 7));


                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        int i = cmm.RunSP("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim())),
                                                                                       new SqlParameter("@dpcid", Convert.ToInt64(ViewState["DPCidforvacancy"])),
                                                                                       new SqlParameter("@total", total),
                                                                                       new SqlParameter("@gen", Convert.ToInt32(txtgen.Text.Trim())),
                                                                                       new SqlParameter("@sc", Convert.ToInt32(txtSC.Text.Trim())),
                                                                                       new SqlParameter("@st", Convert.ToInt32(txtST.Text.Trim())),
                                                                                       new SqlParameter("@obc", Convert.ToInt32(txtOBC.Text.Trim())),
                                                                                       new SqlParameter("@ph", Convert.ToInt32(txtPH.Text.Trim())),
                                                                                       new SqlParameter("@sport", Convert.ToInt32(txtSport.Text.Trim())),
                                                                                       new SqlParameter("@other", Convert.ToInt32(txtother.Text.Trim())),
                                                                                       new SqlParameter("@createdby", Convert.ToString(Session["username"])),
                                                                                       new SqlParameter("@flag", 2));


                        if (i > 0)
                        {
                            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
                            lblresult.ForeColor = System.Drawing.Color.Green;
                            lblresult.Text = "Added Successfully..";
                        }
                        else
                        {
                            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
                            lblresult.ForeColor = System.Drawing.Color.Red;
                            lblresult.Text = "Oops...Unable to Add!!";

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Entries for the mentioned year is already exists!!');", true);
                        //txtPlan.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

                }

            }
        }

        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetails.EditIndex = e.NewEditIndex;
            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
            totalvacancies = 0;
        }
        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());
                string dpcid = gvDetails.DataKeys[e.RowIndex].Values["DPCid"].ToString();

                TextBox txtyear = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtyearedit");
                TextBox txtgen = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtgenedit");
                TextBox txtSC = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtscedit");
                TextBox txtST = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtstedit");
                TextBox txtOBC = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtobcedit");
                TextBox txtPH = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtPHedit");
                TextBox txtSport = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtSportedit");
                TextBox txtother = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtotheredit");
                int total = Convert.ToInt32(txtgen.Text) + Convert.ToInt32(txtSC.Text) + Convert.ToInt32(txtST.Text) + Convert.ToInt32(txtOBC.Text) +
                        Convert.ToInt32(txtPH.Text) + Convert.ToInt32(txtSport.Text) + Convert.ToInt32(txtother.Text);
                //ds = cmm.RunSpReturnDSParam("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim()))
                //                                                 , new SqlParameter("@flag", 1));


                //if (ds.Tables[0].Rows.Count == 0)
                //{
                int i = cmm.RunSP("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@year", Convert.ToString(txtyear.Text.Trim())),
                                                                                   new SqlParameter("@total", total),
                                                                                   new SqlParameter("@gen", Convert.ToInt32(txtgen.Text.Trim())),
                                                                                   new SqlParameter("@sc", Convert.ToInt32(txtSC.Text.Trim())),
                                                                                   new SqlParameter("@st", Convert.ToInt32(txtST.Text.Trim())),
                                                                                   new SqlParameter("@obc", Convert.ToInt32(txtOBC.Text.Trim())),
                                                                                   new SqlParameter("@ph", Convert.ToInt32(txtPH.Text.Trim())),
                                                                                   new SqlParameter("@sport", Convert.ToInt32(txtSport.Text.Trim())),
                                                                                   new SqlParameter("@other", Convert.ToInt32(txtother.Text.Trim())),
                                                                                   new SqlParameter("@dpcid", Convert.ToInt32(dpcid)),
                                                                                   new SqlParameter("@createdby", Convert.ToString(Session["username"])),
                                                                                   new SqlParameter("@id", Id),
                                                                                   new SqlParameter("@flag", 3));


                if (i > 0)
                {
                    // bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
                    lblresult.ForeColor = System.Drawing.Color.Green;
                    lblresult.Text = "Updated successfully..";
                    gvDetails.EditIndex = -1;
                    bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
                }
                else
                {

                    lblresult.ForeColor = System.Drawing.Color.Red;
                    lblresult.Text = "Unable to Update..";
                    bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
                }
                //}
                //else
                //{
                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Entries for the mentioned year is already exists!!');", true);
                //        //txtPlan.Text = "";

                //}
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }

        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());

                string dpcid = gvDetails.DataKeys[e.RowIndex].Values["DPCid"].ToString();
                int i = cmm.RunSP("PN18_DPCvacancy_SP", "PRASARNETConnectionString", new SqlParameter("@createdby", Convert.ToString(Session["username"])),
                                                                                   new SqlParameter("@id", Id),
                                                                                   new SqlParameter("@dpcid", Convert.ToInt32(dpcid)),
                                                                                   new SqlParameter("@flag", 5));
                if (i > 0)
                {
                    lblresult.ForeColor = System.Drawing.Color.Green;
                    lblresult.Text = "Information Deleted Successfully..";
                }
                else
                {
                    lblresult.ForeColor = System.Drawing.Color.Red;
                    lblresult.Text = "Try Again..";

                }
                gvDetails.EditIndex = -1;
                bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);
            }
        }

        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetails.EditIndex = -1;
            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));

            lblresult.Text = "";
        }

        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDetails.PageIndex = e.NewPageIndex;
            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
        }

        protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
                {
                    Label total = (Label)e.Row.FindControl("lbltotal");
                    if (total.Text != "")
                    {
                        totalvacancies += Convert.ToInt32(total.Text);
                    }
                    else
                    {
                        totalvacancies += 0;

                    }
                }
                else
                {
                    Label totaledit = (Label)e.Row.FindControl("lbltotaledit");
                    if (totaledit.Text != "")
                    {
                        totalvacancies += Convert.ToInt32(totaledit.Text);
                    }
                    else
                    {
                        totalvacancies += 0;
                    }
                }
                ViewState["totalvacancies"] = totalvacancies;
                //Label zeqpment = (Label)e.Row.FindControl("lblZEqptExp");
                //Label site = (Label)e.Row.FindControl("lblSiteExpB");
                //Label dte = (Label)e.Row.FindControl("lbldteExpB");
                //Label civil = (Label)e.Row.FindControl("lblcivilExpB");
                //Label elec = (Label)e.Row.FindControl("lblelecExpB");
                //Label totalprj = (Label)e.Row.FindControl("lblindivproject");
                //dworksum += Convert.ToInt64(dwork.Text);
                //ViewState["dworksum"] = dworksum;
                //zeqptsum += Convert.ToInt64(zeqpment.Text);
                //ViewState["zeqptsum"] = zeqptsum;
                //sitesum += Convert.ToInt64(site.Text);
                //ViewState["sitesum"] = sitesum;
                //dtesum += Convert.ToInt64(dte.Text);
                //ViewState["dtesum"] = dtesum;
                //civilsum += Convert.ToInt64(civil.Text);
                //ViewState["civilsum"] = civilsum;
                //elecsum += Convert.ToInt64(elec.Text);
                //ViewState["elecsum"] = elecsum;
                //totalprjsum += Convert.ToDouble(totalprj.Text);
                //ViewState["totalprjsum"] = totalprjsum;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbltotaloverall = (Label)e.Row.FindControl("lbltotaloverall");
                lbltotaloverall.Text = ViewState["totalvacancies"].ToString();

            }
        }

        protected void grddoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int createdbyid = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31
                    || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
                {
                    createdbyid = Convert.ToInt32(Session["Uidmanagement"]);
                }
                else
                {
                    createdbyid = Convert.ToInt32(Session["Station_SectionID"]);
                }
                int DPCid = Convert.ToInt32(grddoc.DataKeys[e.RowIndex].Value.ToString());

                Label lblstatusfinalhidden = (Label)grddoc.Rows[e.RowIndex].FindControl("lblstatusfinal");
                DropDownList ddlstatus = (DropDownList)grddoc.Rows[e.RowIndex].FindControl("ddlstatus");
                Label lblstatusfinal = (Label)grddoc.Rows[e.RowIndex].FindControl("Label26");
                ImageButton imgedit = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgeditfinalstatus");
                ImageButton imgbtnUpdate = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgbtnUpdate");
                ImageButton imgbtnCancel = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgbtnCancel");



                int i = cmm.RunSP("PN18_SP_DPCStatus", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", "9"),
                                                       new SqlParameter("@dpcid", DPCid),
                                                        new SqlParameter("@Createdby", Convert.ToString(Session["UserName"])),
                                                        new SqlParameter("@createdbyid", createdbyid),
                                                       new SqlParameter("@statusfinal", Convert.ToInt16(ddlstatus.SelectedValue)));
                if (i > 0)
                {

                    grddoc.EditIndex = -1;
                    gridbind2();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Suceessfully!!');", true);
                }
                else
                {
                    gridbind2();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                grddoc.Focus();
                imgedit.Focus();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }

        protected void grddoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ImageButton imgedit = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgeditfinalstatus");
            ImageButton imgbtnUpdate = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgbtnUpdate");
            ImageButton imgbtnCancel = (ImageButton)grddoc.Rows[e.RowIndex].FindControl("imgbtnCancel");
            grddoc.EditIndex = -1;
            gridbind2();
            imgbtnCancel.Focus();
        }

        protected void grddoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
                {
                    Label Label71 = (Label)e.Row.FindControl("Label71");
                    Label Label72 = (Label)e.Row.FindControl("Label72");
                    Label Label73 = (Label)e.Row.FindControl("Label73");
                    Label lblgridDOC = (Label)e.Row.FindControl("lblgridDOC");

                    Label lblstatusfinal = (Label)e.Row.FindControl("lblstatusfinalforusers");
                    Label lblstatusfinalon = (Label)e.Row.FindControl("lblstatusfinalonforusers");
                    Label lblstatusfinalby = (Label)e.Row.FindControl("lblstatusfinalbyforusers");

                    Label lblstatushidden = (Label)e.Row.FindControl("lblstatushidden");
                    LinkButton imgedit = (LinkButton)e.Row.FindControl("imgedit");
                    LinkButton Imgdelete = (LinkButton)e.Row.FindControl("Imgdelete");
                    int status = Convert.ToInt16(lblstatushidden.Text);
                    LinkButton lnkconfirmedbyLO = (LinkButton)e.Row.FindControl("lnkconfirmedbyLO");

                    DateTime todaydate = DateTime.Now.Date;
                    DateTime DOC = Convert.ToDateTime(lblgridDOC.Text.Trim()).Date;
                    if (DOC < todaydate)
                    {
                        lblgridDOC.ForeColor = System.Drawing.Color.Red;
                        lblgridDOC.CssClass = "fontingrid";
                    }
                    else
                    {
                        if (status == 0)
                        {
                            lblgridDOC.ForeColor = System.Drawing.Color.Red;
                            lblgridDOC.CssClass = "fontingrid";
                        }
                        else
                        {
                            lblgridDOC.ForeColor = System.Drawing.Color.Green;
                            lblgridDOC.CssClass = "blink_me fontingrid";
                        }
                    }
                    if (lnkconfirmedbyLO.Text == "Yes")
                    {
                        lnkconfirmedbyLO.ForeColor = System.Drawing.Color.Blue;
                    }
                    else
                    {
                        lnkconfirmedbyLO.ForeColor = System.Drawing.Color.Red;
                        // lnkconfirmedbyLO.u
                    }

                    if (status == 0)
                    {
                        Label71.Visible = true;
                        Label72.Visible = true;
                        Label73.Visible = true;
                        lblstatusfinal.Visible = true;
                        lblstatusfinalby.Visible = true;
                        lblstatusfinalon.Visible = true;
                        Imgdelete.Visible = false;
                        imgedit.Visible = false;
                        e.Row.BackColor = System.Drawing.Color.LightGray;

                    }
                    else
                    {
                        Label71.Visible = false;
                        Label72.Visible = false;
                        Label73.Visible = false;
                        lblstatusfinal.Visible = false;
                        lblstatusfinalby.Visible = false;
                        lblstatusfinalon.Visible = false;
                        Imgdelete.Visible = true;
                        imgedit.Visible = true;
                        //e.Row.BackColor = System.Drawing.Color.LightGreen;
                    }
                }
            }
        }

        protected void gvDetails2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvdetails2.PageIndex = e.NewPageIndex;
            bindgridvacancy(Convert.ToInt32(ViewState["DPCidforvacancy"]));
        }

        protected void ddlmasterofficeofsection_SelectedIndexChanged(object sender, EventArgs e)
        {
            int flag = 0;
            if (ddlmasterofficeofsection.SelectedValue == "1")//pbs
            { flag = 2; }
            else if (ddlmasterofficeofsection.SelectedValue == "2")//DGAIR
            { flag = 3; }
            else if (ddlmasterofficeofsection.SelectedValue == "3")//DGDD
            { flag = 4; }
            else if (ddlmasterofficeofsection.SelectedValue == "4")//Zonal
            { flag = 5; }

            cmm.bindDDLWidParam(ddlsection, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--Select Section--",
                                                                                                    new SqlParameter("@flag", flag));
            ddlsection.Focus();
        }

        protected void btnreport_Click(object sender, EventArgs e)
        {
            diventryform.Visible = false;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = false;// div conataing the Search form   
            divgrd.Visible = true;
            LinkButton1.Visible = true;//add new DPC
            divallentry.Visible = true;// div carrying search and alldetails link
            lnkdownloadmanualforPBRB.Visible = true;
            divclose.Visible = true;

            lnkbtnsearch.Visible = false;//Search button attach a gridview template
            lnknewentry.Visible = false;
            btnreport.Visible = false;//alluserdetails button
            btnsearchallpbrb.Visible = true;//Search all button
            btnbackall.Visible = false;
            btnclosepbrb.Visible = true;
            //btnprint1.Visible = false;

            grddoc.Columns[12].Visible = false;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = true;//Info given by
            gridbind2();

            ViewState["allreportspbrb"] = 1;

        }

        protected void btnclosepbrb_Click(object sender, EventArgs e)
        {
            diventryform.Visible = false;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = false;// div conataing the Search form 
            divgrd.Visible = true;
            LinkButton1.Visible = true;//add new DPC
            divallentry.Visible = true;// div carrying search and alldetails link
            lnkdownloadmanualforPBRB.Visible = true;
            divclose.Visible = false;// div carrying close and back buttons          

            lnkbtnsearch.Visible = true;//Search button attach a gridview template
            btnreport.Visible = true;
            btnsearchallpbrb.Visible = false;

            btnprint1.Visible = true;
            grddoc.Columns[12].Visible = true;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = false;//Info given by
            gridbind();
            ViewState["allreportspbrb"] = 0;
            lnknewentry.Visible = false;

        }

        protected void ddlmasteroOSecSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlmasteroOSecSearch.SelectedIndex != 0)
            {
                int flag = 0;
                if (ddlmasteroOSecSearch.SelectedValue == "1")//pbs
                { flag = 2; }
                else if (ddlmasteroOSecSearch.SelectedValue == "2")//DGAIR
                { flag = 3; }
                else if (ddlmasteroOSecSearch.SelectedValue == "3")//DGDD
                { flag = 4; }
                else if (ddlmasteroOSecSearch.SelectedValue == "4")//Zonal
                { flag = 5; }

                cmm.bindDDLWidParam(ddlsectionsearch, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--All--",
                                                                                                        new SqlParameter("@flag", flag));
                ddlsectionsearch.Focus();
            }
            else
            {
                ddlsectionsearch.Items.Clear();
            }
        }

        protected void btnsearchallpbrb_Click(object sender, EventArgs e)
        {

            ViewState["searchall"] = 1;
            diventryform.Visible = true;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = true;// div conataing the Search form   
            divgrd.Visible = false;
            LinkButton1.Visible = true;//add new DPC
            divallentry.Visible = true;// div carrying search and alldetails link
            lnkdownloadmanualforPBRB.Visible = true;
            divclose.Visible = true;

            lnkbtnsearch.Visible = false;
            lnknewentry.Visible = false;
            btnreport.Visible = false;
            btnprint1.Visible = false;
            btnclosepbrb.Visible = false;
            btnbackall.Visible = true;

            cmm.bindDDLWidParam(ddlwingseacrh, "PN18_SPwing", "Wing", "WingID", "PRASARNETConnectionString", "--All--",
                                                                                                            new SqlParameter("@flag", 1));
            //cmm.bindDDLWidParam(ddlsectionsearch, "PN18_getsection", "secname", "userID", "PRASARNETConnectionString", "--All--",
            //                                                                                                new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
            //                                                                                                new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlmasteroOSecSearch, "PN18_DPC_MasterSectionOffice_SP", "Mastersection", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                   new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlconauthsearch, "Pn18_DPC_CoveningAuth", "ConveningAuthority", "id", "PRASARNETConnectionString", "--All--",
                                                                                                                new SqlParameter("@flag", 1));
            ddlwingseacrh.Focus();
            btnsearchclose.Visible = false;
        }

        protected void btnbackall_Click(object sender, EventArgs e)
        {
            ViewState["searchall"] = 0;
            diventryform.Visible = false;//div containg the dpc entry and search form
            divdpcentry.Visible = false;// div contain DPC entry form
            divsearch.Visible = false;// div conataing the Search form   
            divgrd.Visible = true;
            LinkButton1.Visible = true;//add new DPC
            divallentry.Visible = true;// div carrying search and alldetails link
            lnkdownloadmanualforPBRB.Visible = true;
            divclose.Visible = true;

            btnsearchallpbrb.Visible = true;
            lnkbtnsearch.Visible = false;
            lnknewentry.Visible = false;
            btnreport.Visible = false;
            btnprint1.Visible = true;
            btnclosepbrb.Visible = true;
            btnbackall.Visible = false;

            grddoc.Columns[12].Visible = false;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = true;//Info given by
            gridbind2();

            txtdpcfromsearch.Text = "";
            txtDPCtosearch.Text = "";

            ddlwingseacrh.SelectedIndex = 0;
            ddlmasteroOSecSearch.SelectedIndex = 0;

            ddldesgntosearch.Items.Clear();

            ddldesgntosearch.SelectedIndex = -1;
            ddldesgntosearch.SelectedValue = null;
            ddlsectionsearch.Items.Clear();
            ddlsectionsearch.SelectedIndex = -1;
            ddlsectionsearch.SelectedValue = null;
            ddlconauthsearch.SelectedIndex = 0;
            ddlsensearch.SelectedIndex = 0;
            ddlvigsearch.SelectedIndex = 0;
            ddlRRsSearch.SelectedIndex = 0;
            ddlaparsearch.SelectedIndex = 0;
            ddlstatussearch.SelectedIndex = 0;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            divallentry.Visible = true;
            divclose.Visible = false;
            divsearch.Visible = false;
            diventryform.Visible = true;
            divdpcentry.Visible = true;
            btnreport.Visible = true;
            btnbackall.Visible = false;
            btnclosepbrb.Visible = true;
            divgrd.Visible = false;
            btnsearchallpbrb.Visible = false;
            lnknewentry.Visible = false;
            ddlwing.Focus();
            clear();
            ViewState["allreportspbrb"] = 0;
            ViewState["searchall"] = 0;
            grddoc.Columns[12].Visible = true;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = false;//Info given by
        }

        protected void btncloseDPCEntry_Click(object sender, EventArgs e)
        {
            if (btncncl.Text == "Cancel")
            {
                btnsubmit.Text = "Submit";
                btncncl.Text = "Clear";
                grddoc.Columns[12].Visible = true;
                divprisearch.Visible = true;
                ddlwing.Enabled = true;
                ddlwing.CssClass = "select widthofboxes1";
                ddlwing.BackColor = System.Drawing.Color.WhiteSmoke;
                //ddlwing.Enabled = true;
                //ddldesgnfrom.Enabled = true;
                //ddldesgnto.Enabled = true;
            }

            gridbind();

            diventryform.Visible = false;
            divdpcentry.Visible = false;
            divsearch.Visible = false;
            divallentry.Visible = true;
            divclose.Visible = false;
            divgrd.Visible = true;

            btnreport.Visible = true;
            btnsearchallpbrb.Visible = false;
            LinkButton1.Visible = true;
            lnkdownloadmanualforPBRB.Visible = true;

            lnknewentry.Visible = false;
            btnprint1.Visible = true;
            lnkbtnsearch.Visible = true;
            grddoc.Focus();
            clear();
            ViewState["allreportspbrb"] = 0;
            ViewState["searchall"] = 0;
            grddoc.Columns[12].Visible = true;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = false;//Info given by
        }

        protected void lnkdownloadmanualforPBRB_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/Mannual/PrasarNet_DPC_UserManual.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "PrasarNet_DPC_Portal_Manual.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }

        protected void lnkaddnew_genuser_Click(object sender, EventArgs e)
        {
            diventryform.Visible = true;
            divsearch.Visible = false;
            divdpcentry.Visible = true;
            divgrd.Visible = false;
            lnknewentry.Visible = false;
            ddlwing.Focus();
            clear();
            ViewState["allreportspbrb"] = 0;
            ViewState["searchall"] = 0;
            grddoc.Columns[12].Visible = true;//edit or delete
            grddoc.Columns[14].Visible = false;//Edit Final Status
            grddoc.Columns[11].Visible = true;//final status
            grddoc.Columns[13].Visible = false;//Info given by
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/Mannual/PrasarNet_DPC_UserManual.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "PrasarNet_DPC_Portal_Manual.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }
    }
}