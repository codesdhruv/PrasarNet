using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PrasarNet.PNET_Reports
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["MRCONS"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.ServerVariables["HTTP_REFERER"]))
                {

                    try
                    {

                        if (Session["stnid"].ToString() != null && Session["isLogin"].ToString() != null)
                        {
                            fillReportType();
                            fillyear();
                            fillmonth();
                            //fillzones();
                            fillservices();
                            ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));
                            //fillLoginstation();
                            //fillReport();
                            lblloginstation.InnerText = Session["UserName"].ToString();
                            lblnotfound.Visible = false;

                        }
                        else
                        {
                            Response.Redirect("../Login.aspx");
                        }


                    }
                    catch(Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('Session out Please Login again..'); window.location='" +
                      Request.ApplicationPath + "../Login.aspx';", true);
                    }
                }

                else
                {
                    Response.Redirect("../Login.aspx");
                }

            }
        }
        private void fillReportType()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_Reporttype", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "RPTTYPE");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlreporttype.DataSource = ds;
                            ddlreporttype.DataValueField = "Report_Id";
                            ddlreporttype.DataTextField = "Report_Type";
                            ddlreporttype.DataBind();
                            ddlreporttype.Items.Insert(0, new ListItem("---Select Report Type---", "0"));
                        }

                    }
                }
            }
        }
        private void fillyear()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_YearMonth", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ALLYear");
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

        private void fillstate()
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

                            ViewState["zone"] = ds.Tables[0].Rows[0]["EnggZoneID"].ToString();

                            ViewState["state"] = ds.Tables[0].Rows[0]["StateID"].ToString();

                            ViewState["station"] = ds.Tables[0].Rows[0]["StationID"].ToString();
                            

                        }

                    }
                }
            }
        }

        private void fillnewequipmentreceived()
        {

            BindZSS();

            using (SqlConnection conn1 = new SqlConnection(con))
                {
                    using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn1))
                    {
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.AddWithValue("@ACTION", "ymnneweqp");                       
                        cmd1.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                        cmd1.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                        cmd1.Parameters.AddWithValue("@pStationID", ViewState["station"]);



                        using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                        {
                            DataSet ds1 = new DataSet();
                            adap1.Fill(ds1);
                            if (ds1.Tables[0].Rows.Count > 0)
                            {
                                Gridnewequiprec.DataSource = ds1;
                                Gridnewequiprec.DataBind();
                            }
                            else
                            {
                                ds1.Tables[0].Rows.Add(ds1.Tables[0].NewRow());
                                Gridnewequiprec.DataSource = ds1;
                                Gridnewequiprec.DataBind();
                                int columnsCount = Gridnewequiprec.Columns.Count - 1;
                                Gridnewequiprec.Rows[0].Cells.Clear();
                                Gridnewequiprec.Rows[0].Cells.Add(new TableCell());
                                Gridnewequiprec.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridnewequiprec.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridnewequiprec.Rows[0].Cells[0].Font.Bold = true;
                                Gridnewequiprec.Rows[0].Cells[0].Font.Size = 10;
                                Gridnewequiprec.Rows[0].Cells[0].Text = "Currently there is no New Received Equipment........";
                                Gridnewequiprec.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
        

        private void fillReport()
        {           
            if (ddlreporttype.SelectedValue.ToString() == "1000")
            {
                string Para_year = "";
                if (ddlyear.SelectedIndex > 0)
                    Para_year = " AND MR_HPT.Year_ID=" + ddlyear.SelectedValue.ToString() + "";
                else
                    Para_year = "";

                string Para_month = "";
                if (ddlmonth.SelectedIndex > 0)
                    Para_month = " AND MR_HPT.Month_ID=" + ddlmonth.SelectedValue.ToString() + "";

                else
                    Para_month = "";

                string Para_stnid = "";
                if (Session["stnid"].ToString() != null)
                    Para_stnid = " AND MR_HPT.StationID=" + Session["stnid"].ToString() + "";
                else
                    Para_stnid = "";

                string Para_Services = "";
                if (ddlservices.SelectedIndex > 0)
                    Para_Services = " AND MR_HPT.Services_ID=" + ddlservices.SelectedValue.ToString() + "";

                else
                    Para_Services = "";

                query = @"SELECT distinct  MR_Year.Year_NM as 'Year', MR_Month.Month_Nm as 'Month', MR_HPT.Station as 'Station', HRIS.dbo.IT_ZONE1.ZoneName as 'Zone',HRIS.dbo.LKP_State.StateName as 'State',HRIS.dbo.MST_Station.StationName 'Station Name', MR_Services.Services_Name as 'Services',  MR_HPT.MonthlySchdProghrs as 'Monthly Scheduled Prog(Hrs.)',  MR_HPT.ActualProghrs as 'Actual Prog(Hrs.)', 
                       MR_HPT.Ratedpwrtransmt as 'Rated Power of Transmitter', MR_HPT.Radiatedpwrpeak as 'Radiated Power of Peak',					   
			           MR_HPT.BDhrsperPS_Current as 'BD Hours in %(PS Current)',MR_HPT.BDhrsperPS_Progressive 'BD Hours in %(PS Progressive)',MR_HPT.BDhrsperGEAR_Current 'BD Hours in %(Gear Current)',MR_HPT.BDhrsperGEAR_Progressive 'BD Hours in %(Gear Progressive)',MR_HPT.BDhrsperOC_Current 'BD Hours in %(OC Current)',MR_HPT.BDhrsperOC_Progressive 'BD Hours in %(OC Progressive)',					   
					   MRWSAC.WorkingStatus_NM as 'Working Status',MR_HPT.WorkingstatusAirCond as 'Details for not Working AC Units',MRWSPDS.WorkingStatus_NM AS WorkingstatusPDS, MR_HPT.WorkingstatusPowrDistSys as 'Details for not Working Power Distribution System', 
                       MR_HPT.Reasonlowpwrlistfaulty as 'Reason for Low Power', MR_HPT.ActiontakenStation as 'Action Taken at Station', MR_HPT.ActiontakenZonalOffc 'Action Taken at Zonal Offc',					   
					   MR_HPT.AntennaSVSWR_LB as 'Antenna System VSWR(LB)',MR_HPT.AntennaSVSWR_UB as 'UB' ,MR_HPT.AntennaSVSWR_COMB as 'Combined',
					   MR_HPT.DieselG_TWHrs as 'Diesel Generated Total Working Hrs.)', MR_HPT.DieselG_ProgUti as 'Progressive Utilization',MR_HPT.DieselG_QDConsumed as 'Quantity of Diesel Consumed',
					   MR_HPT.PowerU_Current as 'Power Units(Current)',MR_HPT.PowerU_Prog as 'Progressive' ,MR_HPT.Detailsnewequiprec as 'Details of new Equipment Received',
					   MR_HPT.Remarks as 'Details of Important Workdone/Remarks', MR_HPT.Inserted_Dt
                       FROM MR_HPT INNER JOIN
                       MR_Year ON MR_HPT.Year_ID = MR_Year.Year_ID INNER JOIN
                       MR_Month ON MR_HPT.Month_ID = MR_Month.Month_ID INNER JOIN
                       HRIS.dbo.IT_ZONE1 ON MR_HPT.IT_ZONEID = HRIS.dbo.IT_ZONE1.IT_ZONEID INNER JOIN
					   HRIS.dbo.LKP_State ON MR_HPT.StateId = HRIS.dbo.LKP_State.StateId INNER JOIN
					   HRIS.dbo.MST_Station ON MR_HPT.StationID = HRIS.dbo.MST_Station.StationID INNER JOIN
                       MR_Services ON MR_HPT.Services_ID = MR_Services.Services_ID INNER JOIN                           
					   MR_WorkingStatus as MRWSAC ON MR_HPT.WorkingstatusAC_ID = MRWSAC.WorkingStatus_ID INNER JOIN
					   MR_WorkingStatus as MRWSPDS ON MR_HPT.WorkingstatusPDS_ID = MRWSPDS.WorkingStatus_ID

					    where HRIS.dbo.IT_ZONE1.WingID=1" +
                       " " + Para_year + " " + Para_month + " " + Para_stnid + " " + Para_Services + "  order by MR_HPT.Inserted_Dt desc";
            }
            else if (ddlreporttype.SelectedValue.ToString() == "1001")
            {
                string Para_year = "";
                if (ddlyear.SelectedIndex > 0)
                    Para_year = " AND MR_Studiosetup.Year_ID=" + ddlyear.SelectedValue.ToString() + "";
                else
                    Para_year = "";

                string Para_month = "";
                if (ddlmonth.SelectedIndex > 0)
                    Para_month = " AND MR_Studiosetup.Month_ID=" + ddlmonth.SelectedValue.ToString() + "";

                else
                    Para_month = "";

                string Para_stnid = "";
                if (Session["stnid"].ToString() != null)
                    Para_stnid = " AND MR_Studiosetup.StationID=" + Session["stnid"].ToString() + "";
                else
                    Para_stnid = "";

                query = @"SELECT distinct MR_Studiosetup.Slno,MR_Studiosetup.Year_ID,MR_Year.Year_NM as 'Year',MR_Studiosetup.Month_ID, MR_Month.Month_Nm as 'Month', HRIS.dbo.IT_ZONE1.ZoneName as 'Zone',HRIS.dbo.LKP_State.StateName as 'State',HRIS.dbo.MST_Station.StationName 'Station Name',	   
                          MR_Studiosetup.Studioutilizn_Shifthrs as 'Studio Shift Hrs(Current Month)',MR_Studiosetup.Studioutilizn_Shiftmin as 'Studio Shift Min(Current Month)',
                          MR_Studiosetup.Studioutilizn_ShiftProghrs as 'Studio Shift Hrs Progressive',MR_Studiosetup.Studioutilizn_ShiftProgmin as 'Studio Shift Min Progressive',
                          MR_Studiosetup.Studioutilizn_Recordinghrs as 'Recording Hrs(Current Month)',MR_Studiosetup.Studioutilizn_Recordingmin as 'Recording Min(Current Month)',
                          MR_Studiosetup.Studioutilizn_RecordingProghrs as 'Recording Hrs Progressive',MR_Studiosetup.Studioutilizn_RecordingProgmin as 'Recording Min Progressive',
                          MR_Studiosetup.Studioutilizn_Transmissionhrs as 'Transmission Hrs (Current Month)',MR_Studiosetup.Studioutilizn_Transmissionmin as 'Transmission Min (Current Month)',
                          MR_Studiosetup.Studioutilizn_TransmissionProghrs as 'Transmission Hrs Progressive',MR_Studiosetup.Studioutilizn_TransmissionProgmin as 'Transmission Min Progressive',
                          MR_Studiosetup.Studioutilizn_Record_Trans_current as 'Studio Utilization %(Current Month)',MR_Studiosetup.Studioutilizn_Record_Trans_prog as 'Studio Utilization % Progressive',
                          MR_Studiosetup.NoofOB_EFVVans as 'No of OV/EFV Vans Used',
                          MR_Studiosetup.DeputiNoofcov_LiveCurrent as 'No of Coverage Live(Current Month)',MR_Studiosetup.DeputiNoofcov_RECCurrent as 'No of Coverage Recording(Current Month)',MR_Studiosetup.DeputiNoofcov_TotalCurrent as 'No of Coverage Total(Current Month)',
                          MR_Studiosetup.DeputiNoofcov_ProgLive as 'No of Coverage Live Progressive',MR_Studiosetup.DeputiNoofcov_ProgREC as 'No of Coverage Recording Progressive',MR_Studiosetup.DeputiNoofcov_ProgTotal as 'No of Coverage Total Progressive',
                          MR_Studiosetup.DeputiActualcov_LiveCurrent as 'Actual Duration of Coverage Live(Current Month)',MR_Studiosetup.DeputiActualcov_RECCurrent as 'Actual Duration of Coverage Recording(Current Month)',MR_Studiosetup.DeputiActualcov_TotalCurrent as 'Actual Duration of Coverage Total(Current Month)',
                          MR_Studiosetup.DeputiActualcov_ProgLive as 'Actual Duration of Coverage Live Progressive',MR_Studiosetup.DeputiActualcov_ProgREC as 'Actual Duration of Coverage Recording Progressive',MR_Studiosetup.DeputiActualcov_ProgTotal as 'Actual Duration of Coverage Total Progressive',
                          MR_Studiosetup.Achvimpactivitiesmonth as 'Achievements/Activities(Current Month)',                                                             
                          MR_Studiosetup.Newequiprecmonth as 'New Equipment Received Equipment (Name|Performance|DateofInstallation|Rating|Make|Model|Serial No.)',  
                          MR_Studiosetup.ACPlant as 'ACPlant (Name|Capacity|CurrentHours|CurrentMins| ProgressiveHours|ProgressiveMins| Status|Reason|DateofInstallation)', 
                          MR_Studiosetup.UPS as 'UPS (Name|Capacity|Status)', 
                          MR_Studiosetup.DefectiveEquipment as 'DefectiveEquipment (Name|Problem|ActionTaken)',              

                          MR_Studiosetup.Remarks as 'Remarks',MR_Studiosetup.Inserted_Dt as 'Date of Entry'
                          FROM MR_Studiosetup INNER JOIN
                          MR_Year ON MR_Studiosetup.Year_ID = MR_Year.Year_ID INNER JOIN
                          MR_Month ON MR_Studiosetup.Month_ID = MR_Month.Month_ID INNER JOIN
                          HRIS.dbo.IT_ZONE1 ON MR_Studiosetup.IT_ZONEID = HRIS.dbo.IT_ZONE1.IT_ZONEID INNER JOIN
                          HRIS.dbo.LKP_State ON MR_Studiosetup.StateId = HRIS.dbo.LKP_State.StateId INNER JOIN
                          HRIS.dbo.MST_Station ON MR_Studiosetup.StationID = HRIS.dbo.MST_Station.StationID 

					    where HRIS.dbo.IT_ZONE1.WingID=1" +
                       " " + Para_year + " " + Para_month + " " + Para_stnid + "  order by MR_Studiosetup.Slno desc";

                
            }
            else if (ddlreporttype.SelectedValue.ToString() == "1002")
            {
                string Para_year = "";
                if (ddlyear.SelectedIndex > 0)
                    Para_year = " AND MR_DSNG.Year_ID=" + ddlyear.SelectedValue.ToString() + "";
                else
                    Para_year = "";

                string Para_month = "";
                if (ddlmonth.SelectedIndex > 0)
                    Para_month = " AND MR_DSNG.Month_ID=" + ddlmonth.SelectedValue.ToString() + "";

                else
                    Para_month = "";

                string Para_stnid = "";
                if (Session["stnid"].ToString() != null)
                    Para_stnid = " AND MR_DSNG.StationID=" + Session["stnid"].ToString() + "";
                else
                    Para_stnid = "";

                query = @"SELECT distinct MR_DSNG.Slno,MR_DSNG.Year_ID,MR_Year.Year_NM as 'Year',MR_DSNG.Month_ID, MR_Month.Month_Nm as 'Month', HRIS.dbo.IT_ZONE1.ZoneName as 'Zone',HRIS.dbo.LKP_State.StateName as 'State',HRIS.dbo.MST_Station.StationName 'Station Name',	   

                          MR_DSNG.HPARatedPwr as 'HPA Rated Power',MR_DSNG.NormaluplinkPwr as 'Normal Uplink Power',
                          MR_DSNG.Test_Hr_Current as 'Test Hr. Current',MR_DSNG.Test_Min_Current as 'Test Min Current',
                          MR_DSNG.Test_Hr_Progressive as 'Test Hr. Progressive',MR_DSNG.Test_Min_Progressive as 'Test Min Progressive',
                          MR_DSNG.RadiatedProg_Hr_Current as 'Radiated Prog.Hr. Current',MR_DSNG.RadiatedProg_Min_Current as 'Radiated Prog. Min Current',
                          MR_DSNG.RadiatedProg_Hr_Progressive as 'Radiated Hr. Progressive',MR_DSNG.RadiatedProg_Min_Progressive as 'Radiated Min. Progressive',
                          MR_DSNG.Total_Hr_Current as 'Total Hr. Current',MR_DSNG.Total_Min_Current as 'Total Min. Current',
                          MR_DSNG.Total_Hr_Progrresive as 'Total Hr. Progressive',MR_DSNG.Total_Min_Progressive as 'Total Min/ Progressive',
                          MR_DSNG.Sincetest_Hr_Progressive as 'Since Test Hr. Progressive',
                          MR_DSNG.Sincetest_Min_Progressive as 'Since Test Min. Progressive',MR_DSNG.SinceRadiatedProg_Hr_Progressive as 'Since Radiated Prog. Hr. Progressive',MR_DSNG.SinceRadiatedProg_Min_Progressive as 'Since Radiated Prog. Min. Progressive',
                          MR_DSNG.SinceTotal_Hr_Progressive as 'Since Total Hr. Progressive',MR_DSNG.SinceTotal_Min_Progressive as 'Since Total Min. Progressive',MR_DSNG.BDPwr_Hr_Current as 'BD Power Hr. Current',
                          MR_DSNG.BDPwr_Min_Current as 'BD Power Min. Current',MR_DSNG.BDPwr_Hr_Progressive as 'BD Power Hr. Progressive',MR_DSNG.BDPwr_Min_Progressive as 'BD Power Min.Progressive',
                          MR_DSNG.BDGear_Hr_Current as 'BD Gear Hr. Current',MR_DSNG.BDGear_Min_Current as 'BD Gear Min. Current',MR_DSNG.BDGear_Hr_Progressive as 'BD Gear Hr. Progressive',
                          MR_DSNG.BDGear_Min_Progressive as 'BD Gear Min. Progressive', 

                          MR_DSNG.BDOtherCause_Hr_Current as 'BD Other Cause Hr. Current',MR_DSNG.BDOtherCause_Min_Current as 'BD Other Cause Min. Current',MR_DSNG.BDOtherCause_Hr_Progressive as 'BD Other cause Hr. Progressive',
                          MR_DSNG.BDOtherCause_Min_Progressive as 'BD Other Cause Min. Progressive', 
                          MR_DSNG.BD_Total_Hr_Current as 'BD Total Hr. Current',MR_DSNG.BD_Total_Min_Current as 'BD Total Min Current',MR_DSNG.BD_Total_Hr_Progressive as 'BD Total Hr. Progressive',
                          MR_DSNG.BD_Total_Min_Progressive as 'BD Total Min Progressive', 
                                                            
                          MR_DSNG.Satte_Param as 'SatteliteParam (Type|MCPC_SCPC|Transponder|Uplink_Freq|Uplink_Pol|Downlink_Freq|Downlink_KPol|FEC|SR|BW)',  
                          MR_DSNG.Serv_Info as 'ServiceInfo (Name|ID|Video_Brate|Audio_1Brate|Audio_2Brate|Chroma|Video_PID|Audio_1PID|Audio_2PID|PCR|Scrambling)', 
                          MR_DSNG.Spec_Feed as 'SpecialFeedAgency (SpecialFeed_Dt|Nm_Agency|Duration_Hr|Duration_Min|Remarks)', 
                          MR_DSNG.BD_Details as 'BreakDownDetails (BD_Date|BD_HR_From|BD_Min_From|BD_HR_To|BD_Min_To|BD_HR_Duration|BD_Min_Duration|BD_Cause)', 
                          MR_DSNG.Equip_details as 'EquipmentDetails (Equip_Type|Equipment_NM|Equip_Rating|Equip_Make|Equip_Model|Equip_Serialno)', 
                          MR_DSNG.High_Cov as 'HighlightCoverage (Date_Coverage|Coverage_Event|Live_FeedHrs|Recorded_FeedHrs|Hot_SwitchingHrs|Remarks)', 
                          
            
                          MR_DSNG.Additional_Information as 'Additional Information',MR_DSNG.ActiontakenStation as 'Action Taken by Station',MR_DSNG.ActiontakenZonalOffc as 'Action Taken by Zonal Offc',
                          MR_DSNG.Remarks as 'Remarks',MR_DSNG.Inserted_Dt as 'Date of Entry'

                          FROM MR_DSNG INNER JOIN
                          MR_Year ON MR_DSNG.Year_ID = MR_Year.Year_ID INNER JOIN
                          MR_Month ON MR_DSNG.Month_ID = MR_Month.Month_ID INNER JOIN
                          HRIS.dbo.IT_ZONE1 ON MR_DSNG.IT_ZONEID = HRIS.dbo.IT_ZONE1.IT_ZONEID INNER JOIN
                          HRIS.dbo.LKP_State ON MR_DSNG.StateId = HRIS.dbo.LKP_State.StateId INNER JOIN
                          HRIS.dbo.MST_Station ON MR_DSNG.StationID = HRIS.dbo.MST_Station.StationID 

					    where HRIS.dbo.IT_ZONE1.WingID=1" +
                       " " + Para_year + " " + Para_month + " " + Para_stnid + "  order by MR_DSNG.Slno desc";

               
            }
            else
            {
            }


            SqlDataAdapter adap = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
               
                
                lblnotfound.Visible = false;
                Gridrpt.Visible = true;
                Gridrpt.DataSource = ds;


                if (ddlreporttype.SelectedValue.ToString() == "1001")
                {


                    BindZSS();

                    using (SqlConnection conn1 = new SqlConnection(con))
                    {

                        // Call New Equipment Received

                        using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn1))
                        {


                            cmd1.CommandType = CommandType.StoredProcedure;
                            cmd1.Parameters.AddWithValue("@ACTION", "nerall");
                            cmd1.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmd1.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmd1.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                             //ArrayList myArrayList = new ArrayList();

                            List<string> itemList = new List<string>();

                            using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                            {
                                DataSet ds1 = new DataSet();
                                adap1.Fill(ds1);
                                if (ds1.Tables[0].Rows.Count > 0)
                                {
                                    Gridnewequiprec.DataSource = ds1;
                                    Gridnewequiprec.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemList.Clear();

                                        for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                                        {
                                            lblneweqip.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == ds1.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == ds1.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemList.Add(ds1.Tables[0].Rows[j]["Equipment_NM"] + "|" + ds1.Tables[0].Rows[j]["Equipment_Performance"] + "|" + ds1.Tables[0].Rows[j]["Dt_Installtion"] + "|" + ds1.Tables[0].Rows[j]["Equip_Rating"] + "|" + ds1.Tables[0].Rows[j]["Equip_Make"] + "|" + ds1.Tables[0].Rows[j]["Equip_Model"] + "|" + ds1.Tables[0].Rows[j]["Equip_Serialno"]);

                                            }


                                            
                                            foreach (var item in itemList)
                                            {
                                                lblneweqip.Text = string.Join("\n", itemList.Cast<string>());
                                                ds.Tables[0].Rows[i]["New Equipment Received Equipment (Name|Performance|DateofInstallation|Rating|Make|Model|Serial No.)"] = lblneweqip.Text;

                                            }
                                            
                                            
                                           
                                        }
                                        
                                    }
                                }
                                else
                                {
                                    ds1.Tables[0].Rows.Add(ds1.Tables[0].NewRow());
                                    Gridnewequiprec.DataSource = ds1;
                                    Gridnewequiprec.DataBind();
                                    int columnsCount = Gridnewequiprec.Columns.Count - 1;
                                    Gridnewequiprec.Rows[0].Cells.Clear();
                                    Gridnewequiprec.Rows[0].Cells.Add(new TableCell());
                                    Gridnewequiprec.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridnewequiprec.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridnewequiprec.Rows[0].Cells[0].Font.Bold = true;
                                    Gridnewequiprec.Rows[0].Cells[0].Font.Size = 10;
                                    Gridnewequiprec.Rows[0].Cells[0].Text = "Currently there is no New Received Equipment........";
                                    Gridnewequiprec.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }



                        // Call AC Plant

                        using (SqlCommand cmdac = new SqlCommand("PN18_MR_sp_ACPLANT", conn1))
                        {

                            cmdac.CommandType = CommandType.StoredProcedure;
                            cmdac.Parameters.AddWithValue("@ACTION", "acall");
                            cmdac.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdac.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdac.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListac = new List<string>();

                            using (SqlDataAdapter adapac = new SqlDataAdapter(cmdac))
                            {
                                DataSet dsac = new DataSet();
                                adapac.Fill(dsac);
                                if (dsac.Tables[0].Rows.Count > 0)
                                {
                                    GridACPlant.DataSource = dsac;
                                    GridACPlant.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListac.Clear();

                                        for (int j = 0; j < dsac.Tables[0].Rows.Count; j++)
                                        {
                                            lblacplant.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dsac.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dsac.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListac.Add(dsac.Tables[0].Rows[j]["ACPlantNM"] + "|" + dsac.Tables[0].Rows[j]["ACPlantCapacity"] + "|" + dsac.Tables[0].Rows[j]["ACPlantCurrentHR"] + "|" + dsac.Tables[0].Rows[j]["ACPlantCurrentMin"] + "|" + dsac.Tables[0].Rows[j]["ACPlantProgHR"] + "|"
                                                    + dsac.Tables[0].Rows[j]["ACPlantProgMin"] + "|" + dsac.Tables[0].Rows[j]["WorkingStatus_NM"] + "|" + dsac.Tables[0].Rows[j]["ACPlantNotWorkReason"] + "|" + dsac.Tables[0].Rows[j]["ACPlantInstall_DT"]);

                                            }



                                            foreach (var itemac in itemListac)
                                            {
                                                lblacplant.Text = string.Join("\n", itemListac.Cast<string>());
                                                ds.Tables[0].Rows[i]["ACPlant (Name|Capacity|CurrentHours|CurrentMins| ProgressiveHours|ProgressiveMins| Status|Reason|DateofInstallation)"] = lblacplant.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dsac.Tables[0].Rows.Add(dsac.Tables[0].NewRow());
                                    GridACPlant.DataSource = dsac;
                                    GridACPlant.DataBind();
                                    int columnsCount = GridACPlant.Columns.Count - 1;
                                    GridACPlant.Rows[0].Cells.Clear();
                                    GridACPlant.Rows[0].Cells.Add(new TableCell());
                                    GridACPlant.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    GridACPlant.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    GridACPlant.Rows[0].Cells[0].Font.Bold = true;
                                    GridACPlant.Rows[0].Cells[0].Font.Size = 10;
                                    GridACPlant.Rows[0].Cells[0].Text = "Currently there is no AC Plant........";
                                    GridACPlant.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END AC Plant


                        // Call UPS

                        using (SqlCommand cmdups = new SqlCommand("PN18_MR_sp_UPS", conn1))
                        {

                            cmdups.CommandType = CommandType.StoredProcedure;
                            cmdups.Parameters.AddWithValue("@ACTION", "upsall");
                            cmdups.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdups.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdups.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListups = new List<string>();

                            using (SqlDataAdapter adapups = new SqlDataAdapter(cmdups))
                            {
                                DataSet dsups = new DataSet();
                                adapups.Fill(dsups);
                                if (dsups.Tables[0].Rows.Count > 0)
                                {
                                    GridUPS.DataSource = dsups;
                                    GridUPS.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListups.Clear();

                                        for (int j = 0; j < dsups.Tables[0].Rows.Count; j++)
                                        {
                                            Lblups.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dsups.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dsups.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListups.Add(dsups.Tables[0].Rows[j]["UPS_NM"] + "|" + dsups.Tables[0].Rows[j]["UPS_Capacity"] + "|" + dsups.Tables[0].Rows[j]["UPS_Status"]);

                                            }



                                            foreach (var itemups in itemListups)
                                            {
                                                Lblups.Text = string.Join("\n", itemListups.Cast<string>());
                                                ds.Tables[0].Rows[i]["UPS (Name|Capacity|Status)"] = Lblups.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dsups.Tables[0].Rows.Add(dsups.Tables[0].NewRow());
                                    GridUPS.DataSource = dsups;
                                    GridUPS.DataBind();
                                    int columnsCount = GridUPS.Columns.Count - 1;
                                    GridUPS.Rows[0].Cells.Clear();
                                    GridUPS.Rows[0].Cells.Add(new TableCell());
                                    GridUPS.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    GridUPS.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    GridUPS.Rows[0].Cells[0].Font.Bold = true;
                                    GridUPS.Rows[0].Cells[0].Font.Size = 10;
                                    GridUPS.Rows[0].Cells[0].Text = "Currently there is no UPS........";
                                    GridUPS.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END UPS

                        // Call Defective Equipment

                        using (SqlCommand cmdde = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn1))
                        {

                            cmdde.CommandType = CommandType.StoredProcedure;
                            cmdde.Parameters.AddWithValue("@ACTION", "deall");
                            cmdde.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdde.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdde.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListde = new List<string>();

                            using (SqlDataAdapter adapde = new SqlDataAdapter(cmdde))
                            {
                                DataSet dsde = new DataSet();
                                adapde.Fill(dsde);
                                if (dsde.Tables[0].Rows.Count > 0)
                                {
                                    GriddefectiveEquip.DataSource = dsde;
                                    GriddefectiveEquip.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListde.Clear();

                                        for (int j = 0; j < dsde.Tables[0].Rows.Count; j++)
                                        {
                                            LbldefectiveEquip.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dsde.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dsde.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListde.Add(dsde.Tables[0].Rows[j]["DefectEquipNM"] + "|" + dsde.Tables[0].Rows[j]["DefectEquipProblem"] + "|" + dsde.Tables[0].Rows[j]["DefectEquipAction"]);

                                            }



                                            foreach (var itemde in itemListde)
                                            {
                                                LbldefectiveEquip.Text = string.Join("\n", itemListde.Cast<string>());
                                                ds.Tables[0].Rows[i]["DefectiveEquipment (Name|Problem|ActionTaken)"] = LbldefectiveEquip.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dsde.Tables[0].Rows.Add(dsde.Tables[0].NewRow());
                                    GriddefectiveEquip.DataSource = dsde;
                                    GriddefectiveEquip.DataBind();
                                    int columnsCount = GriddefectiveEquip.Columns.Count - 1;
                                    GriddefectiveEquip.Rows[0].Cells.Clear();
                                    GriddefectiveEquip.Rows[0].Cells.Add(new TableCell());
                                    GriddefectiveEquip.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    GriddefectiveEquip.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    GriddefectiveEquip.Rows[0].Cells[0].Font.Bold = true;
                                    GriddefectiveEquip.Rows[0].Cells[0].Font.Size = 10;
                                    GriddefectiveEquip.Rows[0].Cells[0].Text = "Currently there is no Defective Equipment........";
                                    GriddefectiveEquip.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END Defective Equipment


                    }

                   
                }


    // Check DSNG Conditions and Bind DSNG Child Gridview



                if (ddlreporttype.SelectedValue.ToString() == "1002")
                {


                    BindZSS();



                    using (SqlConnection conn1 = new SqlConnection(con))
                    {


                        // Call Satellite Parameters

                        using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn1))
                        {


                            cmd1.CommandType = CommandType.StoredProcedure;
                            cmd1.Parameters.AddWithValue("@ACTION", "SATPARall");
                            cmd1.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmd1.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmd1.Parameters.AddWithValue("@pStationID", ViewState["station"]);
                          

                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemList_satpara = new List<string>();

                            using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                            {
                                DataSet ds1 = new DataSet();
                                adap1.Fill(ds1);
                                if (ds1.Tables[0].Rows.Count > 0)
                                {
                                    Gridsatpara.DataSource = ds1;
                                    Gridsatpara.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemList_satpara.Clear();

                                        for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                                        {
                                            Lblgridsatpara.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == ds1.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == ds1.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemList_satpara.Add(ds1.Tables[0].Rows[j]["DSNG_Type"] + "|" + ds1.Tables[0].Rows[j]["MCPC_SCPC"] 
                                                + "|" + ds1.Tables[0].Rows[j]["Sattellite_Transponder"] + "|" + ds1.Tables[0].Rows[j]["Uplink_Freq"] 
                                                + "|" + ds1.Tables[0].Rows[j]["Uplink_Pol"] + "|" + ds1.Tables[0].Rows[j]["Downlink_Freq"]
                                                + "|" + ds1.Tables[0].Rows[j]["Downlink_KPol"] + "|" + ds1.Tables[0].Rows[j]["FEC"] + "|" + ds1.Tables[0].Rows[j]["SR_Mbps"]
                                                + "|" + ds1.Tables[0].Rows[j]["BW_MHZ"]);

                                            }



                                            foreach (var item in itemList_satpara)
                                            {
                                                Lblgridsatpara.Text = string.Join("\n", itemList_satpara.Cast<string>());
                                                ds.Tables[0].Rows[i]["SatteliteParam (Type|MCPC_SCPC|Transponder|Uplink_Freq|Uplink_Pol|Downlink_Freq|Downlink_KPol|FEC|SR|BW)"] = Lblgridsatpara.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    ds1.Tables[0].Rows.Add(ds1.Tables[0].NewRow());
                                    Gridsatpara.DataSource = ds1;
                                    Gridsatpara.DataBind();
                                    int columnsCount = Gridsatpara.Columns.Count - 1;
                                    Gridsatpara.Rows[0].Cells.Clear();
                                    Gridsatpara.Rows[0].Cells.Add(new TableCell());
                                    Gridsatpara.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridsatpara.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridsatpara.Rows[0].Cells[0].Font.Bold = true;
                                    Gridsatpara.Rows[0].Cells[0].Font.Size = 10;
                                    Gridsatpara.Rows[0].Cells[0].Text = "Currently there is no  Satellite Parameters........";
                                    Gridsatpara.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }



                        // Call Service Information

                        using (SqlCommand cmdservinfo = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn1))
                        {

                            cmdservinfo.CommandType = CommandType.StoredProcedure;
                            cmdservinfo.Parameters.AddWithValue("@ACTION", "ALLserinfo");
                            cmdservinfo.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdservinfo.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdservinfo.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemList_servinfo = new List<string>();

                            using (SqlDataAdapter adapservinfo = new SqlDataAdapter(cmdservinfo))
                            {
                                DataSet dsservinfo = new DataSet();
                                adapservinfo.Fill(dsservinfo);
                                if (dsservinfo.Tables[0].Rows.Count > 0)
                                {
                                    Gridservinfo.DataSource = dsservinfo;
                                    Gridservinfo.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemList_servinfo.Clear();

                                        for (int j = 0; j < dsservinfo.Tables[0].Rows.Count; j++)
                                        {
                                            Lblservinfo.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dsservinfo.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dsservinfo.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemList_servinfo.Add(dsservinfo.Tables[0].Rows[j]["Nm_Service"] + "|" + dsservinfo.Tables[0].Rows[j]["Service_ID"] 
                                                    + "|" + dsservinfo.Tables[0].Rows[j]["Video_Brate"] + "|" + dsservinfo.Tables[0].Rows[j]["Audio_1Brate"] 
                                                    + "|" + dsservinfo.Tables[0].Rows[j]["Audio_2Brate"] + "|"+ dsservinfo.Tables[0].Rows[j]["Chroma_Format"] 
                                                    + "|" + dsservinfo.Tables[0].Rows[j]["Video_PID"] + "|" + dsservinfo.Tables[0].Rows[j]["Audio_1PID"] 
                                                    + "|" + dsservinfo.Tables[0].Rows[j]["Audio_2PID"] + "|" + dsservinfo.Tables[0].Rows[j]["PCR_PID"] 
                                                    + "|" + dsservinfo.Tables[0].Rows[j]["Scrambling_Type"]);

                                            }



                                            foreach (var itemac in itemList_servinfo)
                                            {
                                                Lblservinfo.Text = string.Join("\n", itemList_servinfo.Cast<string>());
                                                ds.Tables[0].Rows[i]["ServiceInfo (Name|ID|Video_Brate|Audio_1Brate|Audio_2Brate|Chroma|Video_PID|Audio_1PID|Audio_2PID|PCR|Scrambling)"] = Lblservinfo.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dsservinfo.Tables[0].Rows.Add(dsservinfo.Tables[0].NewRow());
                                    Gridservinfo.DataSource = dsservinfo;
                                    Gridservinfo.DataBind();
                                    int columnsCount = Gridservinfo.Columns.Count - 1;
                                    Gridservinfo.Rows[0].Cells.Clear();
                                    Gridservinfo.Rows[0].Cells.Add(new TableCell());
                                    Gridservinfo.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridservinfo.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridservinfo.Rows[0].Cells[0].Font.Bold = true;
                                    Gridservinfo.Rows[0].Cells[0].Font.Size = 10;
                                    Gridservinfo.Rows[0].Cells[0].Text = "Currently there is no Service Info........";
                                    Gridservinfo.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END Service Information


                        // Call Special Feed Other Agency

                        using (SqlCommand cmdsf = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn1))
                        {

                            cmdsf.CommandType = CommandType.StoredProcedure;
                            cmdsf.Parameters.AddWithValue("@ACTION", "allspeFEED");
                            cmdsf.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdsf.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdsf.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemList_sf = new List<string>();

                            using (SqlDataAdapter adapsf = new SqlDataAdapter(cmdsf))
                            {
                                DataSet dssf = new DataSet();
                                adapsf.Fill(dssf);
                                if (dssf.Tables[0].Rows.Count > 0)
                                {
                                    Gridspecfeed.DataSource = dssf;
                                    Gridspecfeed.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemList_sf.Clear();

                                        for (int j = 0; j < dssf.Tables[0].Rows.Count; j++)
                                        {
                                            Lblspecfeed.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dssf.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dssf.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemList_sf.Add(dssf.Tables[0].Rows[j]["SpecialFeed_Dt"] + "|" + dssf.Tables[0].Rows[j]["Nm_Agency"] + "|" + dssf.Tables[0].Rows[j]["Duration_Hr"]
                                                    + "|" + dssf.Tables[0].Rows[j]["Duration_Min"] + "|" + dssf.Tables[0].Rows[j]["Remarks"]);

                                            }



                                            foreach (var itemups in itemList_sf)
                                            {
                                                Lblspecfeed.Text = string.Join("\n", itemList_sf.Cast<string>());
                                                ds.Tables[0].Rows[i]["SpecialFeedAgency (SpecialFeed_Dt|Nm_Agency|Duration_Hr|Duration_Min|Remarks)"] = Lblspecfeed.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dssf.Tables[0].Rows.Add(dssf.Tables[0].NewRow());
                                    Gridspecfeed.DataSource = dssf;
                                    Gridspecfeed.DataBind();
                                    int columnsCount = Gridspecfeed.Columns.Count - 1;
                                    Gridspecfeed.Rows[0].Cells.Clear();
                                    Gridspecfeed.Rows[0].Cells.Add(new TableCell());
                                    Gridspecfeed.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridspecfeed.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridspecfeed.Rows[0].Cells[0].Font.Bold = true;
                                    Gridspecfeed.Rows[0].Cells[0].Font.Size = 10;
                                    Gridspecfeed.Rows[0].Cells[0].Text = "Currently there is no Special Feed........";
                                    Gridspecfeed.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END Special Feed Agency

                        // Call Break Down Details

                        using (SqlCommand cmdbdd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn1))
                        {

                            cmdbdd.CommandType = CommandType.StoredProcedure;
                            cmdbdd.Parameters.AddWithValue("@ACTION", "bddsngall");
                            cmdbdd.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdbdd.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdbdd.Parameters.AddWithValue("@pStationID", ViewState["station"]);


                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListbdd = new List<string>();

                            using (SqlDataAdapter adapbdd = new SqlDataAdapter(cmdbdd))
                            {
                                DataSet dsbdd = new DataSet();
                                adapbdd.Fill(dsbdd);
                                if (dsbdd.Tables[0].Rows.Count > 0)
                                {
                                    Gridbreakddetails.DataSource = dsbdd;
                                    Gridbreakddetails.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListbdd.Clear();

                                        for (int j = 0; j < dsbdd.Tables[0].Rows.Count; j++)
                                        {
                                            LblBDdetails.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dsbdd.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dsbdd.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListbdd.Add(dsbdd.Tables[0].Rows[j]["BD_Date"] + "|" + dsbdd.Tables[0].Rows[j]["BD_HR_From"] + "|" + dsbdd.Tables[0].Rows[j]["BD_Min_From"]
                                                    + "|" + dsbdd.Tables[0].Rows[j]["BD_HR_To"] + "|" + dsbdd.Tables[0].Rows[j]["BD_Min_To"] + "|" + dsbdd.Tables[0].Rows[j]["BD_HR_Duration"]
                                                    + "|" + dsbdd.Tables[0].Rows[j]["BD_Min_Duration"] + "|" + dsbdd.Tables[0].Rows[j]["BD_Cause"]);

                                            }



                                            foreach (var itemde in itemListbdd)
                                            {
                                                LblBDdetails.Text = string.Join("\n", itemListbdd.Cast<string>());
                                                ds.Tables[0].Rows[i]["BreakDownDetails (BD_Date|BD_HR_From|BD_Min_From|BD_HR_To|BD_Min_To|BD_HR_Duration|BD_Min_Duration|BD_Cause)"] = LblBDdetails.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dsbdd.Tables[0].Rows.Add(dsbdd.Tables[0].NewRow());
                                    Gridbreakddetails.DataSource = dsbdd;
                                    Gridbreakddetails.DataBind();
                                    int columnsCount = Gridbreakddetails.Columns.Count - 1;
                                    Gridbreakddetails.Rows[0].Cells.Clear();
                                    Gridbreakddetails.Rows[0].Cells.Add(new TableCell());
                                    Gridbreakddetails.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridbreakddetails.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridbreakddetails.Rows[0].Cells[0].Font.Bold = true;
                                    Gridbreakddetails.Rows[0].Cells[0].Font.Size = 10;
                                    Gridbreakddetails.Rows[0].Cells[0].Text = "Currently there is no BreakDown Details...";
                                    Gridbreakddetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }
                        // END Break Down Details






                        // Call Equipment Details

                        using (SqlCommand cmdeq = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn1))
                        {


                            cmdeq.CommandType = CommandType.StoredProcedure;
                            cmdeq.Parameters.AddWithValue("@ACTION", "nerall");
                            cmdeq.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdeq.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdeq.Parameters.AddWithValue("@pStationID", ViewState["station"]);
                            cmdeq.Parameters.AddWithValue("@pReport_Id", "1002");

                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListeq = new List<string>();

                            using (SqlDataAdapter adapeq = new SqlDataAdapter(cmdeq))
                            {
                                DataSet dseq = new DataSet();
                                adapeq.Fill(dseq);
                                if (dseq.Tables[0].Rows.Count > 0)
                                {
                                    Gridequipdet.DataSource = dseq;
                                    Gridequipdet.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListeq.Clear();

                                        for (int j = 0; j < dseq.Tables[0].Rows.Count; j++)
                                        {
                                            Lblequpdetails.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dseq.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dseq.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListeq.Add(dseq.Tables[0].Rows[j]["Equip_Type"] + "|" + dseq.Tables[0].Rows[j]["Equipment_NM"]
                                                    + "|" + dseq.Tables[0].Rows[j]["Equip_Rating"] + "|" + dseq.Tables[0].Rows[j]["Equip_Make"] 
                                                    + "|" + dseq.Tables[0].Rows[j]["Equip_Make"] + "|" + dseq.Tables[0].Rows[j]["Equip_Model"] 
                                                    + "|" + dseq.Tables[0].Rows[j]["Equip_Serialno"]);

                                            }



                                            foreach (var item in itemListeq)
                                            {
                                                Lblequpdetails.Text = string.Join("\n", itemListeq.Cast<string>());
                                                ds.Tables[0].Rows[i]["EquipmentDetails (Equip_Type|Equipment_NM|Equip_Rating|Equip_Make|Equip_Model|Equip_Serialno)"] = Lblequpdetails.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dseq.Tables[0].Rows.Add(dseq.Tables[0].NewRow());
                                    Gridequipdet.DataSource = dseq;
                                    Gridequipdet.DataBind();
                                    int columnsCount = Gridequipdet.Columns.Count - 1;
                                    Gridequipdet.Rows[0].Cells.Clear();
                                    Gridequipdet.Rows[0].Cells.Add(new TableCell());
                                    Gridequipdet.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridequipdet.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridequipdet.Rows[0].Cells[0].Font.Bold = true;
                                    Gridequipdet.Rows[0].Cells[0].Font.Size = 10;
                                    Gridequipdet.Rows[0].Cells[0].Text = "Currently there is no Equipment Details....";
                                    Gridequipdet.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }

                        // END Equipment Details





                        // Call Highlights Coverage

                        using (SqlCommand cmdhc = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn1))
                        {


                            cmdhc.CommandType = CommandType.StoredProcedure;
                            cmdhc.Parameters.AddWithValue("@ACTION", "highcovall");
                            cmdhc.Parameters.AddWithValue("@pIT_ZONEID", ViewState["zone"]);
                            cmdhc.Parameters.AddWithValue("@pStateId", ViewState["state"]);
                            cmdhc.Parameters.AddWithValue("@pStationID", ViewState["station"]);
                            

                            //ArrayList myArrayList = new ArrayList();

                            List<string> itemListhc = new List<string>();

                            using (SqlDataAdapter adaphc = new SqlDataAdapter(cmdhc))
                            {
                                DataSet dshc = new DataSet();
                                adaphc.Fill(dshc);
                                if (dshc.Tables[0].Rows.Count > 0)
                                {
                                    Gridhighcov.DataSource = dshc;
                                    Gridhighcov.DataBind();

                                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                    {
                                        itemListhc.Clear();

                                        for (int j = 0; j < dshc.Tables[0].Rows.Count; j++)
                                        {
                                            Lblhighcov.Text = "";

                                            if ((ds.Tables[0].Rows[i]["Year_ID"].ToString() == dshc.Tables[0].Rows[j]["Year_ID"].ToString()) && (ds.Tables[0].Rows[i]["Month_ID"].ToString() == dshc.Tables[0].Rows[j]["Month_ID"].ToString()))
                                            {

                                                itemListhc.Add(dshc.Tables[0].Rows[j]["Date_Coverage"] + "|" + dshc.Tables[0].Rows[j]["Coverage_Event"]
                                                    + "|" + dshc.Tables[0].Rows[j]["Live_FeedHrs"] + "|" + dshc.Tables[0].Rows[j]["Recorded_FeedHrs"]
                                                    + "|" + dshc.Tables[0].Rows[j]["Hot_SwitchingHrs"] + "|" + dshc.Tables[0].Rows[j]["Remarks"]);

                                            }



                                            foreach (var item in itemListhc)
                                            {
                                                Lblhighcov.Text = string.Join("\n", itemListhc.Cast<string>());
                                                ds.Tables[0].Rows[i]["HighlightCoverage (Date_Coverage|Coverage_Event|Live_FeedHrs|Recorded_FeedHrs|Hot_SwitchingHrs|Remarks)"] = Lblhighcov.Text;

                                            }



                                        }

                                    }
                                }
                                else
                                {
                                    dshc.Tables[0].Rows.Add(dshc.Tables[0].NewRow());
                                    Gridhighcov.DataSource = dshc;
                                    Gridhighcov.DataBind();
                                    int columnsCount = Gridhighcov.Columns.Count - 1;
                                    Gridhighcov.Rows[0].Cells.Clear();
                                    Gridhighcov.Rows[0].Cells.Add(new TableCell());
                                    Gridhighcov.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                    Gridhighcov.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                    Gridhighcov.Rows[0].Cells[0].Font.Bold = true;
                                    Gridhighcov.Rows[0].Cells[0].Font.Size = 10;
                                    Gridhighcov.Rows[0].Cells[0].Text = "Currently there is no Highlights Coverage...";
                                    Gridhighcov.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


                                }
                            }
                        }

                        // END Highlights Coverage




                    }


                }










                else
                {
                }


                Gridrpt.DataBind();

                

            }
            else
            {
                Gridrpt.Visible = false;
                lblnotfound.Visible = true;
                lblnotfound.InnerText = "Record Not Found as per your Search.........";
            }
        }

        protected void Btnviewrpt_Click(object sender, EventArgs e)
        {
            fillReport();
        }

        protected void ddlreporttype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlreporttype.SelectedValue.ToString() != "1000")
            {
                divservicetext.Visible = false;
                divserviceddl.Visible = false;
                fillReport();
            }

            else
            {
                divservicetext.Visible = true;
                divserviceddl.Visible = true;
                fillReport();
            }
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillReport();
        }

        protected void ddlmonth_SelectedIndexChanged(object sender, EventArgs e)
        {

            fillReport();
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillstate();
            fillReport();
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillLoginstation();
            fillReport();
        }

        protected void ddlstation_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillReport();
        }

        protected void ddlservices_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillReport();
        }
    }
}