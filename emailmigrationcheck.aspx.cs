using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;



namespace PrasarNet
{


    public partial class emailverification : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        string con = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3)
            {
                if (!IsPostBack)
                {
                    lblName.Text = Convert.ToString(Session["UserName"]);
                    ViewState["search"] = 0;
                    if (Convert.ToInt16(Session["Usertype"]) == 10)
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station section
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
                    else// Management
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
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else//14,15,16,18,19
                        {
                            DataSet dspbb = new DataSet();

                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                    //cmm.bindDDLWidParam(ddloffctype, "PN21_Sec_station", "UserName", "uid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void Btnsavefeedback_Click(object sender, EventArgs e)
        {
            if (ViewState["emailsearch"].ToString() != "")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN_eMailMigration", conn))
                    {


                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@flag", "2");
                        cmd.Parameters.AddWithValue("@email", ViewState["emailsearch"].ToString());
                        cmd.Parameters.AddWithValue("@Reasonfornotloggin", txtReason.Text);
                        cmd.Parameters.AddWithValue("@Reasonforretention", txtReasonRetention.Text);
                        cmd.Parameters.AddWithValue("@whethertoContinue", rbContinue.SelectedValue);
                        cmd.Parameters.AddWithValue("@createdby", Convert.ToString(Session["UserName"]));
                        //cmd.Parameters.AddWithValue("@pemail", TxtEmail.Text);
                        //cmd.Parameters.AddWithValue("@pfeedback", Txtfeedback.Text);
                        //cmd.Parameters.AddWithValue("@pmobile", TxtMobile.Text);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('Request Raised successfully...'); ", true);

                        conn.Close();
                        pnlnew.Visible = false;
                        lbresmigcheck.Text = "A request/justification has already been submitted for migration/non-use. Click here to see the request";
                        lbresmigcheck.Enabled = true;
                    }
                }
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('* mark fields are mandatory.'); ", true);

            }

        }

        protected void imghome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/HomePage.aspx", true);
        }

        protected void btnMigcheck_Click(object sender, EventArgs e)
        {
            if (Txtemailsearch.Text != "")
                ViewState["emailsearch"] = Txtemailsearch.Text.Trim();
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN_eMailMigration", conn))
                    {


                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@flag", 1);
                        // cmd.Parameters.AddWithValue("@ptopic", ddlfeedback.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@email", ViewState["emailsearch"].ToString());
                        cmd.Parameters.AddWithValue("@createdby", Convert.ToString(Session["UserName"]));

                        int authorised = 1;
                        conn.Open();
                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (Convert.ToString(ds.Tables[0].Rows[0][4]) == "unauthorised")
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                                              "alert('A user can submit request for upto 3 email ids...'); ", true);
                                    lbresmigcheck.Text = "A user can submit request for upto 3 email ids.";
                                    lbresmigcheck.Enabled = false;
                                    pnlnew.Visible = false;
                                    authorised = 0;
                                }

                                if (Convert.ToString(ds.Tables[0].Rows[0][0]) == "Yes")

                                {

                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                                               "alert('Your email is included in Migration List...'); ", true);
                                    lbresmigcheck.Text = ViewState["emailsearch"].ToString() + " is included in Migration List  ";
                                    lbresmigcheck.Enabled = false;
                                    pnlnew.Visible = false;
                                    if (authorised == 0)
                                    {
                                        pnlnew.Visible = false;
                                        lbresmigcheck.Enabled = false;
                                    }
                                }
                                else
                                {
                                    if (Convert.ToString(ds.Tables[0].Rows[0][1]) == "Yes")
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                                 "alert('*The email has not been Migrated. A request/justification has already been submitted for migration/non-use'); ", true);
                                        lbresmigcheck.Text = ViewState["emailsearch"].ToString() + " email has not been Migrated. A request/justification has been submitted for migration/non-use, Click to see the request";
                                        lbresmigcheck.Enabled = true;
                                        lblemail.Text = ViewState["emailsearch"].ToString();
                                        pnlnew.Visible = false;
                                        txtReason.Enabled = false;
                                        txtReason.Text = Convert.ToString(ds.Tables[0].Rows[0][2]);
                                        trcontinue.Visible = true;
                                        txtReasonRetention.Text = Convert.ToString(ds.Tables[0].Rows[0][3]);
                                        txtReasonRetention.Enabled = false;
                                        rbContinue.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0][1]);
                                        rbContinue.Enabled = false;
                                        btnSaveDetails.Visible = false;
                                        btnEditDetails.Visible = true;
                                        if (authorised == 0)
                                        {
                                            pnlnew.Visible = false; lbresmigcheck.Enabled = false;
                                        }
                                    }
                                    else
                                    {

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                              "alert('The email has not been Migrated. Raise a request for migration'); ", true);
                                        lbresmigcheck.Text = ViewState["emailsearch"].ToString() + " Email has not been migrated. Click Here to raise a request for migration";
                                        lbresmigcheck.Enabled = true;
                                        lblemail.Text = ViewState["emailsearch"].ToString();
                                        if (authorised == 0)
                                        {
                                            pnlnew.Visible = false; lbresmigcheck.Enabled = false;
                                        }
                                    }
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                                  "alert('* The Email does not exist in our console i.e. prasarbharati.gov.in domain'); ", true);
                                pnlnew.Visible = false;
                                lbresmigcheck.Enabled = false;

                                lbresmigcheck.Text = "The Email doesn't exist in our console i.e. prasarbharati.gov.in domain";
                                if (authorised == 0)
                                {
                                    pnlnew.Visible = false; lbresmigcheck.Enabled = false;
                                }
                            }


                        }
                        conn.Close();
                    }
                }
            }



            pnlnew.Visible = false;
        }

        protected void lbresmigcheck_Click(object sender, EventArgs e)
        {
            pnlnew.Visible = true;
        }

        protected void rbContinue_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbContinue.SelectedValue == "Yes")
            {
                trcontinue.Visible = true;
                txtReasonRetention.Focus();
            }
            else
            {
                trcontinue.Visible = false;
                btnSaveDetails.Focus();
            }
        }

        protected void BtnEditDetails_Click(object sender, EventArgs e)
        {
            txtReason.Enabled = true;
            txtReasonRetention.Enabled = true;
            rbContinue.Enabled = true;
            btnSaveDetails.Visible = true;
            btnEditDetails.Visible = false;
            txtReason.Focus();
        }
    }
}
