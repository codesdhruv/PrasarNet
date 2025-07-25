using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrasarNet.PNET_Reports
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["MRCONS"].ConnectionString;
        string query;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.ServerVariables["HTTP_REFERER"]))
                {

                    //try
                    //{
                        if (Session["stnid"].ToString() != null && Session["isLogin"].ToString() != null)
                        {
                            fillyear();
                            fillmonth();
                            fillLoginstation();
                            fillzones();
                            BindZSS();
                            bindallstate();
                            ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                            //fillstationtype();
                            fillservices();

                            fillstationLogin();
                            fillWorkingStatusWS();
                            fillWorkingStatusPDS();
                            lblloginstation.InnerText = Session["UserName"].ToString();
                            fillhpt();
                            Btnsubmit.Visible = true;
                            Btnupdate.Visible = false;
                            Btncancel.Visible = false;
                            txtairconditioning.Visible = false;
                            txtpowerdistribution.Visible = false;
                            txtpowerdistribution.Visible = false;

                        }
                        else
                        {
                            Response.Redirect("../Login.aspx");
                        }
                    //}
                    //catch (Exception ex)
                    //{
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                    //  "alert('Session out Please Login again..'); window.location='" +
                    //  Request.ApplicationPath + "../Login.aspx';", true);

                    //}
                       
                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }

            }

            FileUploadMR.Attributes.Add("onchange", "return checkFileExtension(this);");

        }

        private void bindallstate()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StatesZS", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "AllStates");
                    
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
                            ddlstate.SelectedValue = ds.Tables[0].Rows[0]["StateID"].ToString();
                            ddlstate.Enabled = false;
                            ddlstation.SelectedValue = ds.Tables[0].Rows[0]["StationID"].ToString();
                            ddlstation.Enabled = false;
                           
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
        private void fillstationLogin()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_AllStations_LoginStations", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "t");
                    cmd.Parameters.AddWithValue("@StationID", Session["stnid"].ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlstationname.DataSource = ds;
                            ddlstationname.DataValueField = "StationID";
                            ddlstationname.DataTextField = "StationName";
                            ddlstationname.DataBind();                          
                        }

                    }
                }
            }
        }

      private  void fillhpt()
        {           
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pACTION", "HPTSHOWREPORT");                       
                        cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                        
                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridhptrpt.DataSource = ds;
                                Gridhptrpt.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridhptrpt.DataSource = ds;
                                Gridhptrpt.DataBind();
                                int columnsCount = Gridhptrpt.Columns.Count - 1;
                                Gridhptrpt.Rows[0].Cells.Clear();
                                Gridhptrpt.Rows[0].Cells.Add(new TableCell());
                                Gridhptrpt.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridhptrpt.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridhptrpt.Rows[0].Cells[0].Font.Bold = true;
                                Gridhptrpt.Rows[0].Cells[0].Font.Size = 10;
                                Gridhptrpt.Rows[0].Cells[0].Text = "Currently there is no HPT Entries........";
                                Gridhptrpt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }

            }
        

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            if  (ddlyear.SelectedIndex>0 && ddlmonth.SelectedIndex>0 && ddlzone.SelectedIndex > 0  && txtscheduled.Text != "" && txtactual.Text != "" && txttransmitter.Text != "" && txtradiated.Text!="" && FileUploadMR.FileName!="")
            {              
                    using (SqlConnection conn = new SqlConnection(con))
                    {
                        using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                        {
                            
                            FileUploadMR.SaveAs(Server.MapPath("UploadedFiles\\") + FileUploadMR.FileName);

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@pACTION", "HPTINSERT");
                            cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pStation", ddlstationname.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());                     
                            cmd.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);
                            cmd.Parameters.AddWithValue("@pActualProghrs", txtactual.Text);
                            cmd.Parameters.AddWithValue("@pProgressiveSchdProghrs", Txtprogschdproghrs.Text);
                            cmd.Parameters.AddWithValue("@pRatedpwrtransmt", txttransmitter.Text);
                            cmd.Parameters.AddWithValue("@pRadiatedpwrpeak", txtradiated.Text);

                            cmd.Parameters.AddWithValue("@pBDhrsPS_Current", Txtpshrscurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDminPS_Current", Txtpsmincurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsPS_Progressive", Txtpshrsprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDminPS_Progressive", Txtpsminprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperPS_Progressive", Txtpsprogressive.Text);

                            cmd.Parameters.AddWithValue("@pBDhrsGEAR_Current", Txtgearhrscurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDminGEAR_Current", Txtgearmincurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperGEAR_Current", Txtgearcurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsGEAR_Progressive", Txtgearhrsprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDminGEAR_Progressive", Txtgearminprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperGEAR_Progressive", Txtgearprogressive.Text);

                            cmd.Parameters.AddWithValue("@pBDhrsOC_Current", Txtochrscurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDminOC_Current", Txtocmincurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperOC_Current", Txtoccurrent.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsOC_Progressive", Txtochrsprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDminOC_Progressive", Txtocminprogressive.Text);
                            cmd.Parameters.AddWithValue("@pBDhrsperOC_Progressive", Txtocprogressive.Text);
                          
                            cmd.Parameters.AddWithValue("@pWorkingstatusAC_ID", ddlworkingstatusACU.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pWorkingstatusAirCond", txtairconditioning.Text);
                            cmd.Parameters.AddWithValue("@pWorkingstatusPDS_ID", ddlworkingstatusPDS.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@pWorkingstatusPowrDistSys", txtpowerdistribution.Text);
                            cmd.Parameters.AddWithValue("@pReasonlowpwrlistfaulty", txtreason.Text);
                            cmd.Parameters.AddWithValue("@pActiontakenStation", txtrepair.Text);
                            cmd.Parameters.AddWithValue("@pActiontakenZonalOffc", txtactionzonal.Text);

                            cmd.Parameters.AddWithValue("@pAntennaSVSWR_LB", Txtantenna_lb.Text);
                            cmd.Parameters.AddWithValue("@pAntennaSVSWR_UB", Txtantenna_ub.Text);
                            cmd.Parameters.AddWithValue("@pAntennaSVSWR_COMB", Txtantenna_comb.Text);
                            cmd.Parameters.AddWithValue("@pDieselG_TWHrs", Txtdieselg_twh.Text);
                            cmd.Parameters.AddWithValue("@pDieselG_ProgUti", Txtdieselg_progutil.Text);
                            cmd.Parameters.AddWithValue("@pDieselG_QDConsumed", Txtdieselg_qdc.Text);
                            cmd.Parameters.AddWithValue("@pDieselG_TotalConsumed", TxttotalD.Text);
                            cmd.Parameters.AddWithValue("@pPowerU_Current", Txtpoweru_current.Text);
                            cmd.Parameters.AddWithValue("@pPowerU_Prog", Txtpoweru_prog.Text);
                            cmd.Parameters.AddWithValue("@pDetailsnewequiprec", Txtdetailsnewequipr.Text);

                            cmd.Parameters.AddWithValue("@pRemarks", Txtdetailsimpworkr.Text);
                            cmd.Parameters.AddWithValue("@pUploadedMRFile", FileUploadMR.FileName);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                                "alert('HPT Details Added Successfully.'); window.location='" +
                                Request.ApplicationPath + "PNET_Reports/HPTEntry.aspx';", true);
                            fillhpt();
                            insertupdateratedpower();
                            conn.Close();
                            


                        }
                    }
                }
             
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                   "alert('Enter Data or Select Year and Month and Services...'); window.location='" +
                 Request.ApplicationPath + "PNET_Reports/HPTEntry.aspx';", true);
                ddlyear.Focus();
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

        protected void Gridhptrpt_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {

                //==== Show Update button and hide Save button.
                Btnsubmit.Visible = false;
                Btnupdate.Visible = true;
                Btncancel.Visible = true;

                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string Slno = commandArgs[0];
                string StateId = commandArgs[1];
                string StationID = commandArgs[2];


                //--- Set id in viewstate so that we can use in update process.
                ViewState["Slno"] = Slno.ToString();
                ViewState["StateId"] = StateId.ToString();
                ViewState["StationID"] = StationID.ToString();
                

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "SelectedSlno");
                        cmd.Parameters.AddWithValue("@pSlno", ViewState["Slno"]);
                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                ddlyear.SelectedValue = ds.Tables[0].Rows[0]["Year_ID"].ToString();
                                ddlmonth.SelectedValue = ds.Tables[0].Rows[0]["Month_ID"].ToString();
                                ddlzone.SelectedValue = ds.Tables[0].Rows[0]["IT_ZONEID"].ToString();
                                Bindstateonclickedit();
                                BindStationonclickEdit();
                                ddlservices.SelectedValue = ds.Tables[0].Rows[0]["Services_ID"].ToString();
                                txtscheduled.Text = ds.Tables[0].Rows[0]["MonthlySchdProghrs"].ToString();
                                txtactual.Text = ds.Tables[0].Rows[0]["ActualProghrs"].ToString();
                                Txtprogschdproghrs.Text = ds.Tables[0].Rows[0]["ProgressiveSchdProghrs"].ToString();
                                txttransmitter.Text = ds.Tables[0].Rows[0]["Ratedpwrtransmt"].ToString();
                                txtradiated.Text = ds.Tables[0].Rows[0]["Radiatedpwrpeak"].ToString();

                                Txtpshrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsPS_Current"].ToString();
                                Txtpsmincurrent.Text = ds.Tables[0].Rows[0]["BDminPS_Current"].ToString();
                                Txtpscurrent.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Current"].ToString();

                                Txtpshrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsPS_Progressive"].ToString();
                                Txtpsminprogressive.Text = ds.Tables[0].Rows[0]["BDminPS_Progressive"].ToString();
                                Txtpsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Progressive"].ToString();
                                
                                Txtgearhrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsGEAR_Current"].ToString();
                                Txtgearmincurrent.Text = ds.Tables[0].Rows[0]["BDminGEAR_Current"].ToString();
                                Txtgearcurrent.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Current"].ToString();
                                Txtgearhrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsGEAR_Progressive"].ToString();
                                Txtgearminprogressive.Text = ds.Tables[0].Rows[0]["BDminGEAR_Progressive"].ToString();
                                Txtgearprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Progressive"].ToString();

                                Txtochrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsOC_Current"].ToString();
                                Txtocmincurrent.Text = ds.Tables[0].Rows[0]["BDminOC_Current"].ToString();
                                Txtoccurrent.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Current"].ToString();
                                Txtochrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsOC_Progressive"].ToString();
                                Txtocminprogressive.Text = ds.Tables[0].Rows[0]["BDminOC_Progressive"].ToString();
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
                                ViewState["Slno"] = ds.Tables[0].Rows[0]["Slno"].ToString();
                                div_fileText.Visible = false;
                                div_fileUpload.Visible = false;
                            }

                        }
                    }
                }

            }
            
        }
        protected void Gridhptrpt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridhptrpt.EditIndex = e.NewEditIndex;
            fillhpt();
            div_fileText.Visible = false;
            div_fileUpload.Visible = false;
        }
        protected void Gridhptrpt_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridhptrpt.PageIndex = e.NewPageIndex;
            fillhpt();
        }
        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            //--- Get primary key value of the selected record from viewstate.

            if (ddlzone.SelectedIndex > 0 && ddlservices.SelectedIndex > 0 && txtscheduled.Text != "" && txtactual.Text != "" && txttransmitter.Text != "" && txtradiated.Text != "")
            {

                int Slno = Convert.ToInt32(ViewState["Slno"]);

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "HPTUPDATE");
                        cmd.Parameters.AddWithValue("@pSlno", Slno);
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStation", ddlstationname.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());  
                        cmd.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);
                        cmd.Parameters.AddWithValue("@pActualProghrs", txtactual.Text);
                        cmd.Parameters.AddWithValue("@pProgressiveSchdProghrs", Txtprogschdproghrs.Text);
                        cmd.Parameters.AddWithValue("@pRatedpwrtransmt", txttransmitter.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedpwrpeak", txtradiated.Text);

                        cmd.Parameters.AddWithValue("@pBDhrsPS_Current", Txtpshrscurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDminPS_Current", Txtpsmincurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsPS_Progressive", Txtpshrsprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDminPS_Progressive", Txtpsminprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperPS_Progressive", Txtpsprogressive.Text);

                        cmd.Parameters.AddWithValue("@pBDhrsGEAR_Current", Txtgearhrscurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDminGEAR_Current", Txtgearmincurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperGEAR_Current", Txtgearcurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsGEAR_Progressive", Txtgearhrsprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDminGEAR_Progressive", Txtgearminprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperGEAR_Progressive", Txtgearprogressive.Text);

                        cmd.Parameters.AddWithValue("@pBDhrsOC_Current", Txtochrscurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDminOC_Current", Txtocmincurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperOC_Current", Txtoccurrent.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsOC_Progressive", Txtochrsprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDminOC_Progressive", Txtocminprogressive.Text);
                        cmd.Parameters.AddWithValue("@pBDhrsperOC_Progressive", Txtocprogressive.Text);

                        cmd.Parameters.AddWithValue("@pWorkingstatusAC_ID", ddlworkingstatusACU.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pWorkingstatusAirCond", txtairconditioning.Text);
                        cmd.Parameters.AddWithValue("@pWorkingstatusPDS_ID", ddlworkingstatusPDS.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pWorkingstatusPowrDistSys", txtpowerdistribution.Text);
                        cmd.Parameters.AddWithValue("@pReasonlowpwrlistfaulty", txtreason.Text);
                        cmd.Parameters.AddWithValue("@pActiontakenStation", txtrepair.Text);
                        cmd.Parameters.AddWithValue("@pActiontakenZonalOffc", txtactionzonal.Text);

                        cmd.Parameters.AddWithValue("@pAntennaSVSWR_LB", Txtantenna_lb.Text);
                        cmd.Parameters.AddWithValue("@pAntennaSVSWR_UB", Txtantenna_ub.Text);
                        cmd.Parameters.AddWithValue("@pAntennaSVSWR_COMB", Txtantenna_comb.Text);
                        cmd.Parameters.AddWithValue("@pDieselG_TWHrs", Txtdieselg_twh.Text);
                        cmd.Parameters.AddWithValue("@pDieselG_ProgUti", Txtdieselg_progutil.Text);
                        cmd.Parameters.AddWithValue("@pDieselG_QDConsumed", Txtdieselg_qdc.Text);
                        cmd.Parameters.AddWithValue("@pDieselG_TotalConsumed", TxttotalD.Text);
                        cmd.Parameters.AddWithValue("@pPowerU_Current", Txtpoweru_current.Text);
                        cmd.Parameters.AddWithValue("@pPowerU_Prog", Txtpoweru_prog.Text);
                        cmd.Parameters.AddWithValue("@pDetailsnewequiprec", Txtdetailsnewequipr.Text);

                        cmd.Parameters.AddWithValue("@pRemarks", Txtdetailsimpworkr.Text);
                        conn.Open();
                        //int t = cmd.ExecuteNonQuery();
                        //if(t>0)
                        //{
                        cmd.ExecuteNonQuery();
                        insertupdateratedpower();
                        //FileUploadMR.SaveAs(Server.MapPath("UploadedFiles\\") + FileUploadMR.FileName);
                        Gridhptrpt.EditIndex = -1;
                        fillhpt();
                        
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('HPT Details Updated Succsessfully...'); window.location='" +
                      Request.ApplicationPath + "PNET_Reports/HPTEntry.aspx';", true);
                    }

                    conn.Close();
                    Btnsubmit.Visible = true;
                    Btnupdate.Visible = false;
                    Btncancel.Visible = false;

                }
            }
        }

        protected void Gridhptrpt_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();


                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderCell2.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell2.Font.Bold = true;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderCell2.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell2.Font.Bold = true;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderCell2.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell2.Font.Bold = true;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "BD Hours in %";
                HeaderCell2.ColumnSpan = 3;
                HeaderCell2.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell2.Font.Bold = true;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "";
                HeaderCell2.ColumnSpan = 1;
                HeaderCell2.HorizontalAlign = HorizontalAlign.Center;
                HeaderCell2.Font.Bold = true;
                HeaderRow.Cells.Add(HeaderCell2);

                Gridhptrpt.Controls[0].Controls.AddAt(0, HeaderRow);
            }
        }

        protected void Gridhptrpt_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSno = Gridhptrpt.Rows[e.RowIndex].FindControl("LblSno") as Label;
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "HPTDELETE");
                    cmd.Parameters.AddWithValue("@pSlno", LblSno.Text);
                    conn.Open();
                    //int t = cmd.ExecuteNonQuery();
                    //if (t > 0)
                    //{
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                        "alert('HPT Details Deleted Successfully.'); window.location='" +
                        Request.ApplicationPath + "PNET_Reports/HPTEntry.aspx';", true);

                    fillhpt();
                    conn.Close();

                }

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
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                          
                        }

                    }
                }
            }
        }

        protected void ddlservices_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillratedpower();
            BindLastFilledHPT();

        }
        private void BindLastFilledHPT()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pACTION", "rptlasthpt");
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
                           
                            txtscheduled.Text = ds.Tables[0].Rows[0]["MonthlySchdProghrs"].ToString();
                            txtactual.Text = ds.Tables[0].Rows[0]["ActualProghrs"].ToString();
                            Txtprogschdproghrs.Text = ds.Tables[0].Rows[0]["ProgressiveSchdProghrs"].ToString();
                            txttransmitter.Text = ds.Tables[0].Rows[0]["Ratedpwrtransmt"].ToString();
                            txtradiated.Text = ds.Tables[0].Rows[0]["Radiatedpwrpeak"].ToString();

                            Txtpshrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsPS_Current"].ToString();
                            Txtpsmincurrent.Text = ds.Tables[0].Rows[0]["BDminPS_Current"].ToString();
                            Txtpscurrent.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Current"].ToString();

                            Txtpshrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsPS_Progressive"].ToString();
                            Txtpsminprogressive.Text = ds.Tables[0].Rows[0]["BDminPS_Progressive"].ToString();
                            Txtpsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Progressive"].ToString();

                            Txtpshrsprogressive.Enabled = false;
                            Txtpsminprogressive.Enabled = false;

                            Txtgearhrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsGEAR_Current"].ToString();
                            Txtgearmincurrent.Text = ds.Tables[0].Rows[0]["BDminGEAR_Current"].ToString();
                            Txtgearcurrent.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Current"].ToString();

                            Txtgearhrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsGEAR_Progressive"].ToString();
                            Txtgearminprogressive.Text = ds.Tables[0].Rows[0]["BDminGEAR_Progressive"].ToString();
                            Txtgearprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Progressive"].ToString();

                            Txtgearhrsprogressive.Enabled = false;
                            Txtgearminprogressive.Enabled = false;

                            Txtochrscurrent.Text = ds.Tables[0].Rows[0]["BDhrsOC_Current"].ToString();
                            Txtocmincurrent.Text = ds.Tables[0].Rows[0]["BDminOC_Current"].ToString();
                            Txtoccurrent.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Current"].ToString();

                            Txtochrsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsOC_Progressive"].ToString();
                            Txtocminprogressive.Text = ds.Tables[0].Rows[0]["BDminOC_Progressive"].ToString();
                            Txtocprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Progressive"].ToString();

                            Txtochrsprogressive.Enabled = false;
                            Txtocminprogressive.Enabled = false;




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
        protected void Txtpscurrent_TextChanged(object sender, EventArgs e)
        {
            BindPS();
        }
        private void BindPS()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "chkpsprog");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtpsprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "progps");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtpsprogressive.Enabled = false;
                                        Txtpsprogressive.Text = ds1.Tables[0].Rows[0]["TotalProgressivePS"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtgearcurrent_TextChanged(object sender, EventArgs e)
        {
            BindGear();
        }
        private void BindGear()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "kprogge");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtgearprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "gearprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsperGEAR_Current", Txtgearcurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtgearprogressive.Enabled = false;
                                        Txtgearprogressive.Text = ds1.Tables[0].Rows[0]["TotalProgressiveGear"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtoccurrent_TextChanged(object sender, EventArgs e)
        {
            BindOC();
        }
        private void BindOC()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hprogoc");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtocprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "ocprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsperOC_Current", Txtoccurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtocprogressive.Enabled = false;
                                        Txtocprogressive.Text = ds1.Tables[0].Rows[0]["TotalProgressiveOC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtpoweru_current_TextChanged(object sender, EventArgs e)
        {
            BindPowerunit();
        }
        private void BindPowerunit()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "puchk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                   
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtpoweru_prog.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "upprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pPowerU_Current", Txtpoweru_current.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtpoweru_prog.Enabled = false;
                                        Txtpoweru_prog.Text = ds1.Tables[0].Rows[0]["TotalProgressivePowerUnit"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtdieselg_twh_TextChanged(object sender, EventArgs e)
        {
            BindDieselWorkingHrs();
        }
        private void BindDieselWorkingHrs()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrsdiechk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());                  
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtdieselg_progutil.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "genproghrs");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pDieselG_TWHrs", Txtdieselg_twh.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtdieselg_progutil.Enabled = false;
                                        Txtdieselg_progutil.Text = ds1.Tables[0].Rows[0]["TotalProgressiveUtilization"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtdieselg_qdc_TextChanged(object sender, EventArgs e)
        {
            BindDieselTotal();
        }
        private void BindDieselTotal()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "qtychk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());                  
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxttotalD.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "tqtycon");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pDieselG_QDConsumed", Txtdieselg_qdc.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxttotalD.Enabled = false;
                                        TxttotalD.Text = ds1.Tables[0].Rows[0]["TotalDiesel"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        //protected void Txtantenna_lb_TextChanged(object sender, EventArgs e)
        //{
        //    BindLBUBCombined();
        //}

        protected void Txtantenna_ub_TextChanged(object sender, EventArgs e)
        {
            BindLBUBCombined();
        }
        private void BindLBUBCombined()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                            
                 using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_HPT", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@pAction", "lbubcomb");                                
                                cmd.Parameters.AddWithValue("@pAntennaSVSWR_LB", Txtantenna_lb.Text);
                                cmd.Parameters.AddWithValue("@pAntennaSVSWR_UB", Txtantenna_ub.Text);
                                
                                using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                                {
                                    DataSet ds = new DataSet();
                                    adap.Fill(ds);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        Txtantenna_comb.Enabled = false;
                                        Txtantenna_comb.Text = ds.Tables[0].Rows[0]["Combined"].ToString();

                                    }

                                }
                            }

                        }

                    }

       

        protected void Txtpshrscurrent_TextChanged(object sender, EventArgs e)
        {
            if(Txtpshrscurrent.Text!="" && Txtpsmincurrent.Text!="")
            {
            BindPSHrsMinCPer();
            }
            if (Txtpshrsprogressive.Text == "" && Txtpsminprogressive.Text == "")
            {
            }
            else
            {
                HrsPSProgressive();
                MinPSProgressive();
                BindPSHrsMinProgressivePer();
            }
        }

        protected void Txtpsmincurrent_TextChanged(object sender, EventArgs e)
        {
            BindPSHrsMinCPer();
            if(Txtpshrsprogressive.Text=="" && Txtpsminprogressive.Text=="")
            {
            }
            else
            {
                HrsPSProgressive();
                MinPSProgressive();
                BindPSHrsMinProgressivePer();
            }
            
            
        }

        private void BindPSHrsMinCPer()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "hrsminpsc");
                    cmd.Parameters.AddWithValue("@pBDhrsPS_Current", Txtpshrscurrent.Text);
                    cmd.Parameters.AddWithValue("@pBDminPS_Current", Txtpsmincurrent.Text);
                    cmd.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtpscurrent.Enabled = false;
                            Txtpscurrent.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Current"].ToString();

                        }

                    }
                }

            }

        }

        private void HrsPSProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrpschkpro");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtpshrsprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "propshr");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsPS_Current", Txtpshrscurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtpshrsprogressive.Enabled = false;
                                        Txtpshrsprogressive.Text = ds1.Tables[0].Rows[0]["Totalhrspsprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }
        private void MinPSProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "psmnchkpro");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtpsminprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "propsmin");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDminPS_Current", Txtpsmincurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtpsminprogressive.Enabled = false;
                                        Txtpsminprogressive.Text = ds1.Tables[0].Rows[0]["Totalminpsprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }
        private void BindPSHrsMinProgressivePer()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "perprogps");
                    cmd.Parameters.AddWithValue("@pBDhrsPS_Progressive", Txtpshrsprogressive.Text);
                    cmd.Parameters.AddWithValue("@pBDminPS_Progressive", Txtpsminprogressive.Text);
                    cmd.Parameters.AddWithValue("@pProgressiveSchdProghrs", Txtprogschdproghrs.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtpsprogressive.Enabled = false;
                            Txtpsprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperPS_Progressive"].ToString();

                        }

                    }
                }

            }

        }

        protected void txtscheduled_TextChanged(object sender, EventArgs e)
        {
            BindProgressiveSceduleProg();

            // on click Monthly Scheduled Programme Hours - Bind PS(Current) Hrs Min Percentage
            if (Txtpshrscurrent.Text != "" && Txtpsmincurrent.Text != "")
            {
                BindPSHrsMinCPer(); 
            }
            // on click Monthly Scheduled Programme Hours - Bind Gear(Current) Hrs Min Percentage
            if (Txtgearhrscurrent.Text != "" && Txtgearmincurrent.Text != "")
            {
                BindGearCurrentpercentage();
            }
            // on click Monthly Scheduled Programme Hours - Bind OC(Current) Hrs Min Percentage
            if (Txtochrscurrent.Text != "" && Txtocmincurrent.Text != "")
            {
                BindOCCurrentpercentage();
            }

        }
        private void BindProgressiveSceduleProg()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "chksphr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtprogschdproghrs.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "shwprogsch");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtprogschdproghrs.Enabled = false;
                                        Txtprogschdproghrs.Text = ds1.Tables[0].Rows[0]["ProgressiveSchedule"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtpsminprogressive_TextChanged(object sender, EventArgs e)
        {
            BindPSHrsMinProgressivePer();
        }

        protected void Txtgearmincurrent_TextChanged(object sender, EventArgs e)
        {
            BindGearCurrentpercentage();
            if (Txtgearhrsprogressive.Text == "" && Txtgearminprogressive.Text == "")
            {
            }
            else
            {
                HrsGearProgressive();
                MinGearProgressive();
                BindGearHrsMinProgressivePer();
            }
        }
        private void BindGearCurrentpercentage()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "cpergear");
                    cmd.Parameters.AddWithValue("@pBDhrsGEAR_Current", Txtgearhrscurrent.Text);
                    cmd.Parameters.AddWithValue("@pBDminGEAR_Current", Txtgearmincurrent.Text);
                    cmd.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtgearcurrent.Enabled = false;
                            Txtgearcurrent.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Current"].ToString();

                        }

                    }
                }

            }
        }

        private void HrsGearProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrprogc");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtgearhrsprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "ghrprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsGEAR_Current", Txtgearhrscurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtgearhrsprogressive.Enabled = false;
                                        Txtgearhrsprogressive.Text = ds1.Tables[0].Rows[0]["TotalHrsProgressiveGear"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void MinGearProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "mgpchk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtgearminprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "gmprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDminGEAR_Current", Txtgearmincurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtgearminprogressive.Enabled = false;
                                        Txtgearminprogressive.Text = ds1.Tables[0].Rows[0]["Totalminproggear"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }
        private void BindGearHrsMinProgressivePer()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "gprogper");
                    cmd.Parameters.AddWithValue("@pBDhrsGEAR_Progressive", Txtgearhrsprogressive.Text);
                    cmd.Parameters.AddWithValue("@pBDminGEAR_Progressive", Txtgearminprogressive.Text);
                    cmd.Parameters.AddWithValue("@pProgressiveSchdProghrs", Txtprogschdproghrs.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtgearprogressive.Enabled = false;
                            Txtgearprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperGEAR_Progressive"].ToString();

                        }

                    }
                }

            }

        }

        protected void Txtgearminprogressive_TextChanged(object sender, EventArgs e)
        {
            BindGearHrsMinProgressivePer();
        }

        protected void Txtocmincurrent_TextChanged(object sender, EventArgs e)
        {
            BindOCCurrentpercentage();
            if (Txtochrsprogressive.Text == "" && Txtocminprogressive.Text == "")
            {
            }
            else
            {
                HrsOCProgressive();
                MinOCProgressive();
                BindOCHrsMinProgressivePer();
            }
        }
        private void BindOCCurrentpercentage()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "ocpercur");
                    cmd.Parameters.AddWithValue("@pBDhrsOC_Current", Txtochrscurrent.Text);
                    cmd.Parameters.AddWithValue("@pBDminOC_Current", Txtocmincurrent.Text);
                    cmd.Parameters.AddWithValue("@pMonthlySchdProghrs", txtscheduled.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtoccurrent.Enabled = false;
                            Txtoccurrent.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Current"].ToString();

                        }

                    }
                }

            }
        }

        private void HrsOCProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "ckocproghr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtochrsprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "ocproghr");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDhrsOC_Current", Txtochrscurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtochrsprogressive.Enabled = false;
                                        Txtochrsprogressive.Text = ds1.Tables[0].Rows[0]["TotalHrsProgressiveOC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void MinOCProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "cmocprog");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                    //  cmd.Parameters.AddWithValue("@pBDhrsperPS_Current", Txtpscurrent.Text);
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            Txtocminprogressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "minocpro");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pServices_ID", ddlservices.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pBDminOC_Current", Txtocmincurrent.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        Txtocminprogressive.Enabled = false;
                                        Txtocminprogressive.Text = ds1.Tables[0].Rows[0]["TotalminprogOC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void Txtocminprogressive_TextChanged(object sender, EventArgs e)
        {
            BindOCHrsMinProgressivePer();
        }
        private void BindOCHrsMinProgressivePer()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_CurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "pocpro");
                    cmd.Parameters.AddWithValue("@pBDhrsOC_Progressive", Txtochrsprogressive.Text);
                    cmd.Parameters.AddWithValue("@pBDminOC_Progressive", Txtocminprogressive.Text);
                    cmd.Parameters.AddWithValue("@pProgressiveSchdProghrs", Txtprogschdproghrs.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Txtocprogressive.Enabled = false;
                            Txtocprogressive.Text = ds.Tables[0].Rows[0]["BDhrsperOC_Progressive"].ToString();

                        }

                    }
                }

            }

        }

        protected void Txtprogschdproghrs_TextChanged(object sender, EventArgs e)
        {
            if (Txtpshrsprogressive.Text != "" && Txtpsminprogressive.Text != "")
            {
                BindPSHrsMinProgressivePer();
            }
            if (Txtgearhrsprogressive.Text != "" && Txtgearminprogressive.Text != "")
            {
                BindGearHrsMinProgressivePer();
            }
            if (Txtochrsprogressive.Text != "" && Txtocminprogressive.Text != "")
            {
                BindOCHrsMinProgressivePer();
            }

        }

        protected void Txtpshrsprogressive_TextChanged(object sender, EventArgs e)
        {
            if (Txtpshrsprogressive.Text != "" && Txtpsminprogressive.Text != "")
            {
                BindPSHrsMinProgressivePer();
            }
        }

        protected void Txtgearhrscurrent_TextChanged(object sender, EventArgs e)
        {
            if (Txtgearhrscurrent.Text != "" && Txtgearmincurrent.Text != "")
            {
                BindGearCurrentpercentage();
            }
            if (Txtgearhrsprogressive.Text == "" && Txtgearminprogressive.Text == "")
            {
            }
            else
            {
                HrsGearProgressive();
                MinGearProgressive();
                BindGearHrsMinProgressivePer();
            }
        }

        protected void Txtgearhrsprogressive_TextChanged(object sender, EventArgs e)
        {
            if (Txtgearhrsprogressive.Text != "" && Txtgearminprogressive.Text != "")
            {
                BindGearHrsMinProgressivePer();
            }
        }

        protected void Txtochrscurrent_TextChanged(object sender, EventArgs e)
        {
            if (Txtochrscurrent.Text != "" && Txtocmincurrent.Text != "")
            {
                BindOCCurrentpercentage();
            }
            if (Txtochrsprogressive.Text == "" && Txtocminprogressive.Text == "")
            {
            }
            else
            {
                HrsOCProgressive();
                MinOCProgressive();
                BindOCHrsMinProgressivePer();
            }
        }

        protected void Txtochrsprogressive_TextChanged(object sender, EventArgs e)
        {
            if (Txtochrsprogressive.Text != "" && Txtocminprogressive.Text != "")
            {
                BindOCHrsMinProgressivePer();
            }
        }
    }
}