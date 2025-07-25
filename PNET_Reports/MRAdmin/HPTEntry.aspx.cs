using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PrasarNet.PNET_Reports.MRAdmin
{
    public partial class HPTAction : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["MRCONS"].ConnectionString;
        string query;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.ServerVariables["HTTP_REFERER"]))
                {

                    if (Session["stnid"].ToString() != null && Session["isLogin"].ToString() != null)
                    {
                        fillyear();
                        fillmonth();
                        fillLoginstation();
                        fillzones();
                        BindZSS();
                        bindstateZW();
                        //ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                        //ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                        //fillstationtype();
                        fillservices();

                        div_fileUpload.Visible = false;
                        div_fileText.Visible = false;
                       
                        fillWorkingStatusWS();
                        fillWorkingStatusPDS();
                        lblloginstation.InnerText = Session["UserName"].ToString();
                       
                        txtairconditioning.Visible = false;
                        txtpowerdistribution.Visible = false;
                        txtpowerdistribution.Visible = false;

                    }
                    else
                    {
                        Response.Redirect("../../Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("../../Login.aspx");
                }

            }

            FileUploadMR.Attributes.Add("onchange", "return checkFileExtension(this);");

        }

        private void bindstateZW()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StatesZS", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ZWS");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstate.DataSource = ds;
                            ddlstate.DataValueField = "StateId";
                            ddlstate.DataTextField = "StateName";
                            ddlstate.DataBind();
                            ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                        }

                    }
                }
            }
        }

        private void BindZSS()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ZoneStateStation", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ZSS");
                    cmd.Parameters.AddWithValue("@StationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlzone.SelectedValue = ds.Tables[0].Rows[0]["EnggZoneID"].ToString();
                            ddlzone.Enabled = false;
                            
                            

                        }

                    }
                }
            }
        }

        private void fillratedpower()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_Ratedpower", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "rp");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            txttransmitter.Text = ds.Tables[0].Rows[0]["Ratedpwrtransmt"].ToString();

                        }

                    }
                }
            }
        }

        private void insertupdateratedpower()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_Ratedpower", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "rpinsupdt");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pRatedpwrtransmt", txttransmitter.Text);

                    conn.Open();
                    //int t = cmd.ExecuteNonQuery();
                    //if(t>0)
                    //{
                    cmd.ExecuteNonQuery();

                }

                conn.Close();


            }

        }

        private void fillyear()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_YearMonth", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Year");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlyear.DataSource = ds;
                            ddlyear.DataValueField = "Year_ID";
                            ddlyear.DataTextField = "Year_NM";
                            ddlyear.DataBind();
                            ddlyear.Items.Insert(0, new ListItem("---Select Year---", "0"));
                        }

                    }
                }
            }
        }
        private void fillmonth()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_YearMonth", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ALLMonth");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlmonth.DataSource = ds;
                            ddlmonth.DataValueField = "Month_ID";
                            ddlmonth.DataTextField = "Month_Nm";
                            ddlmonth.DataBind();
                            ddlmonth.Items.Insert(0, new ListItem("---Select Month---", "0"));
                        }

                    }
                }
            }
        }
        private void fillLoginstation()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_AllStations_LoginStations", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "lgnstation");
                    cmd.Parameters.AddWithValue("@OrganizationID", Session["Orgid"].ToString());
                    cmd.Parameters.AddWithValue("@StationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstation.DataSource = ds;
                            ddlstation.DataValueField = "StationID";
                            ddlstation.DataTextField = "StationName";
                            ddlstation.DataBind();
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                            //ddlmonth.Items.Insert(0, new ListItem("---Select Month---", "0"));
                        }

                    }
                }
            }
        }

        private void fillzones()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_Zones", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Zones");
                    //cmd.Parameters.AddWithValue("@pOrganizationID", Session["Orgid"].ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlzone.DataSource = ds;
                            ddlzone.DataValueField = "IT_ZONEID";
                            ddlzone.DataTextField = "ZoneName";
                            ddlzone.DataBind();
                            ddlzone.Items.Insert(0, new ListItem("---Select Zone---", "0"));
                        }

                    }
                }
            }
        }

        private void fillservices()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StationwiseServices", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "SWServices");
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlservices.DataSource = ds;
                            ddlservices.DataValueField = "Services_ID";
                            ddlservices.DataTextField = "Services_Name";
                            ddlservices.DataBind();
                            ddlservices.Items.Insert(0, new ListItem("---Select Services---", "0"));
                        }

                    }
                }
            }
        }

       

        private void fillWorkingStatusWS()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_WorkingStatus", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "WS");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlworkingstatusACU.DataSource = ds;
                            ddlworkingstatusACU.DataValueField = "WorkingStatus_ID";
                            ddlworkingstatusACU.DataTextField = "WorkingStatus_NM";
                            ddlworkingstatusACU.DataBind();
                            ddlworkingstatusACU.Items.Insert(0, new ListItem("---Select Working Status---", "0"));
                        }

                    }
                }
            }
        }

        private void fillWorkingStatusPDS()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_WorkingStatus", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "WS");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlworkingstatusPDS.DataSource = ds;
                            ddlworkingstatusPDS.DataValueField = "WorkingStatus_ID";
                            ddlworkingstatusPDS.DataTextField = "WorkingStatus_NM";
                            ddlworkingstatusPDS.DataBind();
                            ddlworkingstatusPDS.Items.Insert(0, new ListItem("---Select Working Status---", "0"));
                        }

                    }
                }
            }
        }
       
        private void Bindstateonclickedit()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StatesZS", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ZWS");
                    cmd.Parameters.AddWithValue("@pIT_ZoneID", ddlzone.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstate.DataSource = ds;
                            ddlstate.DataValueField = "StateId";
                            ddlstate.DataTextField = "StateName";
                            ddlstate.DataBind();
                            ddlstate.SelectedValue = ViewState["StateId"].ToString();

                        }

                    }
                }
            }
        }

        private void BindStationonclickEdit()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_AllStations_LoginStations", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "SWS");
                    cmd.Parameters.AddWithValue("@OrganizationID", Session["Orgid"].ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstation.DataSource = ds;
                            ddlstation.DataValueField = "StationID";
                            ddlstation.DataTextField = "StationName";
                            ddlstation.DataBind();
                            ddlstation.SelectedValue = ViewState["StationID"].ToString();

                        }

                    }
                }
            }
        }

        
        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            //--- Get primary key value of the selected record from viewstate.

            if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0 && ddlzone.SelectedIndex > 0 && ddlstate.SelectedIndex > 0 && ddlstation.SelectedIndex > 0 && ddlservices.SelectedIndex > 0)
            {

                int Slno = Convert.ToInt32(ViewState["Slno"]);

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "updthptadmn");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@pActiontakenZonalOffc", txtactionzonal.Text);

                        conn.Open();
                        //int t = cmd.ExecuteNonQuery();
                        //if(t>0)
                        //{
                        cmd.ExecuteNonQuery();


                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('Action Updated Succsessfully...'); window.location='" +
                      Request.ApplicationPath + "PNET_Reports/MRAdmin/HPTEntry.aspx';", true);
                    }

                    conn.Close();

                }
            }
            else
            {
                Response.Write("<script>alert('Please Select the Data or Enter Data')</script>");
            }
        }

        protected void Btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HPTEntry.aspx");

        }

        protected void ddlworkingstatusACU_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlworkingstatusACU.SelectedValue.ToString() == "02")
            {
                txtairconditioning.Visible = true;
            }
            else
            {
                txtairconditioning.Visible = false;
            }
        }

        protected void ddlworkingstatusPDS_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlworkingstatusPDS.SelectedValue.ToString() == "02")
            {
                txtpowerdistribution.Visible = true;
            }
            else
            {
                txtpowerdistribution.Visible = false;
            }
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StatesZS", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ZWS");
                    cmd.Parameters.AddWithValue("@pIT_ZoneID", ddlzone.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstate.DataSource = ds;
                            ddlstate.DataValueField = "StateId";
                            ddlstate.DataTextField = "StateName";
                            ddlstate.DataBind();
                            ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                        }

                    }
                }
            }
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_AllStations_LoginStations", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "BSS");
                    //cmd.Parameters.AddWithValue("@OrganizationID", Session["Orgid"].ToString());
                    //cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                   
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstation.DataSource = ds;
                            ddlstation.DataValueField = "StationID";
                            ddlstation.DataTextField = "StationName";
                            ddlstation.DataBind();
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                            //ddlmonth.Items.Insert(0, new ListItem("---Select Month---", "0"));
                        }

                    }
                }
            }
        }

        protected void ddlservices_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillratedpower();
            BindHPTYMZSSS();

        }
        private void BindHPTYMZSSS() // Bind Report Year Month Zone State Station Services Wise
        {
            if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0 && ddlzone.SelectedIndex > 0 && ddlstate.SelectedIndex > 0 && ddlstation.SelectedIndex > 0 && ddlservices.SelectedIndex > 0)
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pACTION", "rptadmthpt");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                txtscheduled.Text = ds.Tables[0].Rows[0]["MonthlySchdProghrs"].ToString();
                                txtactual.Text = ds.Tables[0].Rows[0]["ActualProghrs"].ToString();
                                txttransmitter.Text = ds.Tables[0].Rows[0]["Ratedpwrtransmt"].ToString();
                                txtradiated.Text = ds.Tables[0].Rows[0]["Radiatedpwrpeak"].ToString();

                                Txtpscurrent.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Current"].ToString();
                                Txtpsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Progressive"].ToString();
                                //Txtpsprogressive.Enabled = false;
                                Txtgearcurrent.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Current"].ToString();
                                Txtgearprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Progressive"].ToString();
                                Txtoccurrent.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Current"].ToString();
                                Txtocprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Progressive"].ToString();


                                ddlworkingstatusACU.SelectedValue = ds.Tables[0].Rows[0]["WorkingstatusAC_ID"].ToString();

                                if (ddlworkingstatusACU.SelectedValue.ToString() == "02")
                                {
                                    txtairconditioning.Visible = true;
                                    txtairconditioning.Text = ds.Tables[0].Rows[0]["WorkingstatusAirCond"].ToString();

                                }
                                else
                                {
                                    txtairconditioning.Visible = false;
                                    txtairconditioning.Text = "";
                                }

                                ddlworkingstatusPDS.SelectedValue = ds.Tables[0].Rows[0]["WorkingstatusPDS_ID"].ToString();


                                if (ddlworkingstatusPDS.SelectedValue.ToString() == "02")
                                {
                                    txtpowerdistribution.Visible = true;
                                    txtpowerdistribution.Text = ds.Tables[0].Rows[0]["WorkingstatusPowrDistSys"].ToString();
                                }
                                else
                                {
                                    txtpowerdistribution.Visible = false;
                                    txtpowerdistribution.Text = "";
                                }
                                txtreason.Text = ds.Tables[0].Rows[0]["Reasonlowpwrlistfaulty"].ToString();
                                txtrepair.Text = ds.Tables[0].Rows[0]["ActiontakenStation"].ToString();
                                txtactionzonal.Text = ds.Tables[0].Rows[0]["ActiontakenZonalOffc"].ToString();

                                Txtantenna_lb.Text = ds.Tables[0].Rows[0]["AntennaSVSWR_LB"].ToString();
                                Txtantenna_ub.Text = ds.Tables[0].Rows[0]["AntennaSVSWR_UB"].ToString();
                                Txtantenna_comb.Text = ds.Tables[0].Rows[0]["AntennaSVSWR_COMB"].ToString();
                                Txtdieselg_twh.Text = ds.Tables[0].Rows[0]["DieselG_TWHrs"].ToString();
                                Txtdieselg_progutil.Text = ds.Tables[0].Rows[0]["DieselG_ProgUti"].ToString();
                                Txtdieselg_qdc.Text = ds.Tables[0].Rows[0]["DieselG_QDConsumed"].ToString();
                                TxttotalD.Text = ds.Tables[0].Rows[0]["DieselG_TotalConsumed"].ToString();
                                Txtpoweru_current.Text = ds.Tables[0].Rows[0]["PowerU_Current"].ToString();
                                Txtpoweru_prog.Text = ds.Tables[0].Rows[0]["PowerU_Prog"].ToString();
                                Txtdetailsnewequipr.Text = ds.Tables[0].Rows[0]["Detailsnewequiprec"].ToString();

                                Txtdetailsimpworkr.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                            }

                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Please Select the Data')</script>");
            }
        }
       
        protected void ddlstation_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillservicesZSS();
        }
        private void fillservicesZSS()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StationwiseServices", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ZSSWS");
                    cmd.Parameters.AddWithValue("@pZoneId", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlservices.DataSource = ds;
                            ddlservices.DataValueField = "Services_ID";
                            ddlservices.DataTextField = "Services_Name";
                            ddlservices.DataBind();
                            ddlservices.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select Services---", "0"));
                        }

                    }
                }
            }
        }

    }
}