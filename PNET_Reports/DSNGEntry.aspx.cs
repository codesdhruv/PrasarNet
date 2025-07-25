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
    public partial class WebForm3 : System.Web.UI.Page
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

                           
                            fillsatelliteparameters();
                            fillserviceinformation();
                            fillspecialfeedagency();
                            fillbreakdowndetails();
                            fillequipmentdetails();
                            fillhighlightCov();

                            ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                            ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));


                            lblloginstation.InnerText = Session["UserName"].ToString();

                            Btnsubmit.Visible = true;
                            Btnupdate.Visible = false;
                            Btncancel.Visible = false;


                            filldsng();

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

        }
        private void fullgridview()
        {
            fillsatelliteparameters();
            fillserviceinformation();
            fillspecialfeedagency();
            fillbreakdowndetails();
            fillequipmentdetails();
            fillhighlightCov();
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
           // fullgridview();
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
           // fullgridview();
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

        private void fillsatelliteparameters()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "sattparam");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridsatpara.DataSource = ds;
                                Gridsatpara.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridsatpara.DataSource = ds;
                                Gridsatpara.DataBind();
                                int columnsCount = Gridsatpara.Columns.Count - 1;
                                Gridsatpara.Rows[0].Cells.Clear();
                                Gridsatpara.Rows[0].Cells.Add(new TableCell());
                                Gridsatpara.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridsatpara.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridsatpara.Rows[0].Cells[0].Font.Bold = true;
                                Gridsatpara.Rows[0].Cells[0].Font.Size = 10;
                                Gridsatpara.Rows[0].Cells[0].Text = "Currently there is no New Satellite Parameters........";
                                Gridsatpara.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "nulym");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridsatpara.DataSource = ds;
                                Gridsatpara.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridsatpara.DataSource = ds;
                                Gridsatpara.DataBind();
                                int columnsCount = Gridsatpara.Columns.Count - 1;
                                Gridsatpara.Rows[0].Cells.Clear();
                                Gridsatpara.Rows[0].Cells.Add(new TableCell());
                                Gridsatpara.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridsatpara.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridsatpara.Rows[0].Cells[0].Font.Bold = true;
                                Gridsatpara.Rows[0].Cells[0].Font.Size = 10;
                                Gridsatpara.Rows[0].Cells[0].Text = "Currently there is no New Satellite Parameters........";
                                Gridsatpara.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveRecordsat(object sender, EventArgs e)
        {
            TextBox TxtDSNGtypeins = Gridsatpara.FooterRow.FindControl("TxtDSNGtypeins") as TextBox;
            DropDownList ddlmcpcscpcins = Gridsatpara.FooterRow.FindControl("ddlmcpcscpcins") as DropDownList;
            TextBox TxtSattellite_Transponderins = Gridsatpara.FooterRow.FindControl("TxtSattellite_Transponderins") as TextBox;
            TextBox TxtUplink_Freqins = Gridsatpara.FooterRow.FindControl("TxtUplink_Freqins") as TextBox;
            TextBox TxtUplink_Polins = Gridsatpara.FooterRow.FindControl("TxtUplink_Polins") as TextBox;
            TextBox TxtDownlink_Freqins = Gridsatpara.FooterRow.FindControl("TxtDownlink_Freqins") as TextBox;
            TextBox TxtDownlink_KPolins = Gridsatpara.FooterRow.FindControl("TxtDownlink_KPolins") as TextBox;
            TextBox TxtFECins = Gridsatpara.FooterRow.FindControl("TxtFECins") as TextBox;
            TextBox TxtSR_Mbpsins = Gridsatpara.FooterRow.FindControl("TxtSR_Mbpsins") as TextBox;
            TextBox TxtBW_MHZins = Gridsatpara.FooterRow.FindControl("TxtBW_MHZins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn))
                {
                    //DateTime dtinstallins = Convert.ToDateTime(TxtDt_Installtionins.Text);
                   
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "spins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pDSNG_Type", TxtDSNGtypeins.Text);
                    cmd.Parameters.AddWithValue("@pMCPC_SCPC", ddlmcpcscpcins.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pSattellite_Transponder", TxtSattellite_Transponderins.Text);
                    cmd.Parameters.AddWithValue("@pUplink_Freq", TxtUplink_Freqins.Text);
                    cmd.Parameters.AddWithValue("@pUplink_Pol", TxtUplink_Polins.Text);
                    cmd.Parameters.AddWithValue("@pDownlink_Freq", TxtDownlink_Freqins.Text);
                    cmd.Parameters.AddWithValue("@pDownlink_KPol", TxtDownlink_KPolins.Text);
                    cmd.Parameters.AddWithValue("@pFEC", TxtFECins.Text);
                    cmd.Parameters.AddWithValue("@pSR_Mbps", TxtSR_Mbpsins.Text);
                    cmd.Parameters.AddWithValue("@pBW_MHZ", TxtBW_MHZins.Text);


                    conn.Open();
                    cmd.ExecuteNonQuery();

                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                    //            "alert('Satellite Parameters Added Successfully.'); window.location='" +
                    //            Request.ApplicationPath + "PNET_Reports/DSNGEntry.aspx';", true);

                    fillsatelliteparameters();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridsatpara_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridsatpara.EditIndex = e.NewEditIndex;
            fillsatelliteparameters();
            fullgridview();
        }

        protected void Gridsatpara_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && Gridsatpara.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlmcpcscpcupdt = (DropDownList)e.Row.FindControl("ddlmcpcscpcupdt");
                HiddenField hdnmcpcscpcupdt = (HiddenField)e.Row.FindControl("hdnmcpcscpcupdt");
                ddlmcpcscpcupdt.Items.FindByText(hdnmcpcscpcupdt.Value).Selected = true;

                DropDownList ddlEquip_Typeupdt = (DropDownList)e.Row.FindControl("ddlEquip_Typeupdt");
                HiddenField hdnEquip_Typeupdt = (HiddenField)e.Row.FindControl("hdnEquip_Typeupdt");
                ddlEquip_Typeupdt.Items.FindByText(hdnEquip_Typeupdt.Value).Selected = true;



            }
        }

        protected void Gridsatpara_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_sat = Gridsatpara.Rows[e.RowIndex].FindControl("LblSlno_sat") as Label;
            TextBox TxtDSNGtypeupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtDSNGtypeupdt") as TextBox;
            DropDownList ddlmcpcscpcupdt = Gridsatpara.Rows[e.RowIndex].FindControl("ddlmcpcscpcupdt") as DropDownList;
            TextBox TxtSattellite_Transponderupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtSattellite_Transponderupdt") as TextBox;
            TextBox TxtUplink_Frequpdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtUplink_Frequpdt") as TextBox;
            TextBox TxtUplink_Polupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtUplink_Polupdt") as TextBox;
            TextBox TxtDownlink_Frequpdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtDownlink_Frequpdt") as TextBox;
            TextBox TxtDownlink_KPolupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtDownlink_KPolupdt") as TextBox;
            TextBox TxtFECupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtFECupdt") as TextBox;
            TextBox TxtSR_Mbpsupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtSR_Mbpsupdt") as TextBox;
            TextBox TxtBW_MHZupdt = Gridsatpara.Rows[e.RowIndex].FindControl("TxtBW_MHZupdt") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtnerec");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_sat.Text);
                    cmd.Parameters.AddWithValue("@pDSNG_Type", TxtDSNGtypeupdt.Text);
                    cmd.Parameters.AddWithValue("@pMCPC_SCPC", ddlmcpcscpcupdt.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pSattellite_Transponder", TxtSattellite_Transponderupdt.Text);
                    cmd.Parameters.AddWithValue("@pUplink_Freq", TxtUplink_Frequpdt.Text);
                    cmd.Parameters.AddWithValue("@pUplink_Pol", TxtUplink_Polupdt.Text);
                    cmd.Parameters.AddWithValue("@pDownlink_Freq", TxtDownlink_Frequpdt.Text);
                    cmd.Parameters.AddWithValue("@pDownlink_KPol", TxtDownlink_KPolupdt.Text);
                    cmd.Parameters.AddWithValue("@pFEC", TxtFECupdt.Text);
                    cmd.Parameters.AddWithValue("@pSR_Mbps", TxtSR_Mbpsupdt.Text);
                    cmd.Parameters.AddWithValue("@pBW_MHZ", TxtBW_MHZupdt.Text);
                
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridsatpara.EditIndex = -1;
                    fillsatelliteparameters();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridsatpara_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridsatpara.EditIndex = -1;
            fillsatelliteparameters();
            fullgridview();
        }
        protected void Gridsatpara_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_sat = Gridsatpara.Rows[e.RowIndex].FindControl("LblSlno_sat") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SatelliteParam", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "spdelete");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_sat.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillsatelliteparameters();
                    conn.Close();
                }
            }
            fullgridview();
        }

        private void fillserviceinformation()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "infoserv");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridservinfo.DataSource = ds;
                                Gridservinfo.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridservinfo.DataSource = ds;
                                Gridservinfo.DataBind();
                                int columnsCount = Gridservinfo.Columns.Count - 1;
                                Gridservinfo.Rows[0].Cells.Clear();
                                Gridservinfo.Rows[0].Cells.Add(new TableCell());
                                Gridservinfo.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridservinfo.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridservinfo.Rows[0].Cells[0].Font.Bold = true;
                                Gridservinfo.Rows[0].Cells[0].Font.Size = 10;
                                Gridservinfo.Rows[0].Cells[0].Text = "Currently there is no New Service Information........";
                                Gridservinfo.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "nulymserv");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridservinfo.DataSource = ds;
                                Gridservinfo.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridservinfo.DataSource = ds;
                                Gridservinfo.DataBind();
                                int columnsCount = Gridservinfo.Columns.Count - 1;
                                Gridservinfo.Rows[0].Cells.Clear();
                                Gridservinfo.Rows[0].Cells.Add(new TableCell());
                                Gridservinfo.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridservinfo.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridservinfo.Rows[0].Cells[0].Font.Bold = true;
                                Gridservinfo.Rows[0].Cells[0].Font.Size = 10;
                                Gridservinfo.Rows[0].Cells[0].Text = "Currently there is no New Service Information........";
                                Gridservinfo.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveRecordinfo(object sender, EventArgs e)
        {
            TextBox TxtNm_Serviceins = Gridservinfo.FooterRow.FindControl("TxtNm_Serviceins") as TextBox;
            TextBox TxtService_IDins = Gridservinfo.FooterRow.FindControl("TxtService_IDins") as TextBox;
            TextBox TxtVideo_Brateins = Gridservinfo.FooterRow.FindControl("TxtVideo_Brateins") as TextBox;
            TextBox TxtAudio_1Brateins = Gridservinfo.FooterRow.FindControl("TxtAudio_1Brateins") as TextBox;
            TextBox TxtAudio_2Brateins = Gridservinfo.FooterRow.FindControl("TxtAudio_2Brateins") as TextBox;
            TextBox TxtChroma_Formatins = Gridservinfo.FooterRow.FindControl("TxtChroma_Formatins") as TextBox;
            TextBox TxtVideo_PIDins = Gridservinfo.FooterRow.FindControl("TxtVideo_PIDins") as TextBox;
            TextBox TxtAudio_1PIDins = Gridservinfo.FooterRow.FindControl("TxtAudio_1PIDins") as TextBox;
            TextBox TxtAudio_2PIDins = Gridservinfo.FooterRow.FindControl("TxtAudio_2PIDins") as TextBox;
            TextBox TxtPCR_PIDins = Gridservinfo.FooterRow.FindControl("TxtPCR_PIDins") as TextBox;
            TextBox TxtScrambling_Typeins = Gridservinfo.FooterRow.FindControl("TxtScrambling_Typeins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn))
                {
                   
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "sinfoins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pNm_Service", TxtNm_Serviceins.Text);
                    cmd.Parameters.AddWithValue("@pService_ID", TxtService_IDins.Text);
                    cmd.Parameters.AddWithValue("@pVideo_Brate", TxtVideo_Brateins.Text);
                    cmd.Parameters.AddWithValue("@pAudio_1Brate", TxtAudio_1Brateins.Text);
                    cmd.Parameters.AddWithValue("@pAudio_2Brate", TxtAudio_2Brateins.Text);
                    cmd.Parameters.AddWithValue("@pChroma_Format", TxtChroma_Formatins.Text);
                    cmd.Parameters.AddWithValue("@pVideo_PID", TxtVideo_PIDins.Text);
                    cmd.Parameters.AddWithValue("@pAudio_1PID", TxtAudio_1PIDins.Text);
                    cmd.Parameters.AddWithValue("@pAudio_2PID", TxtAudio_2PIDins.Text);
                    cmd.Parameters.AddWithValue("@pPCR_PID", TxtPCR_PIDins.Text);
                    cmd.Parameters.AddWithValue("@pScrambling_Type", TxtScrambling_Typeins.Text);


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillserviceinformation();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridservinfo_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridservinfo.EditIndex = e.NewEditIndex;
            fillserviceinformation();
            fullgridview();
        }

      

        protected void Gridservinfo_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_serv = Gridservinfo.Rows[e.RowIndex].FindControl("LblSlno_serv") as Label;
            TextBox TxtNm_Serviceupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtNm_Serviceupdt") as TextBox;
            TextBox TxtService_IDupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtService_IDupdt") as TextBox;
            TextBox TxtVideo_Brateupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtVideo_Brateupdt") as TextBox;
            TextBox TxtAudio_1Brateupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtAudio_1Brateupdt") as TextBox;
            TextBox TxtAudio_2Brateupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtAudio_2Brateupdt") as TextBox;
            TextBox TxtChroma_Formatupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtChroma_Formatupdt") as TextBox;
            TextBox TxtVideo_PIDupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtVideo_PIDupdt") as TextBox;
            TextBox TxtAudio_1PIDupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtAudio_1PIDupdt") as TextBox;
            TextBox TxtAudio_2PIDupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtAudio_2PIDupdt") as TextBox;
            TextBox TxtPCR_PIDupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtPCR_PIDupdt") as TextBox;
            TextBox TxtScrambling_Typeupdt = Gridservinfo.Rows[e.RowIndex].FindControl("TxtScrambling_Typeupdt") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn))
                {

                    //DateTime dtinstall = Convert.ToDateTime(TxtDt_Installtionupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtserinfo");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_serv.Text);


                    cmd.Parameters.AddWithValue("@pNm_Service", TxtNm_Serviceupdt.Text);
                    cmd.Parameters.AddWithValue("@pService_ID", TxtService_IDupdt.Text);
                    cmd.Parameters.AddWithValue("@pVideo_Brate", TxtVideo_Brateupdt.Text);
                    cmd.Parameters.AddWithValue("@pAudio_1Brate", TxtAudio_1Brateupdt.Text);
                    cmd.Parameters.AddWithValue("@pAudio_2Brate", TxtAudio_2Brateupdt.Text);
                    cmd.Parameters.AddWithValue("@pChroma_Format", TxtChroma_Formatupdt.Text);
                    cmd.Parameters.AddWithValue("@pVideo_PID", TxtVideo_PIDupdt.Text);
                    cmd.Parameters.AddWithValue("@pAudio_1PID", TxtAudio_1PIDupdt.Text);
                    cmd.Parameters.AddWithValue("@pAudio_2PID", TxtAudio_2PIDupdt.Text);
                    cmd.Parameters.AddWithValue("@pPCR_PID", TxtPCR_PIDupdt.Text);
                    cmd.Parameters.AddWithValue("@pScrambling_Type", TxtScrambling_Typeupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridservinfo.EditIndex = -1;
                    fillserviceinformation();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridservinfo_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridservinfo.EditIndex = -1;
            fillserviceinformation();
            fullgridview();
        }
        protected void Gridservinfo_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_serv = Gridservinfo.Rows[e.RowIndex].FindControl("LblSlno_serv") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_ServiceInfo", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "serinfodelete");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_serv.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillserviceinformation();
                    conn.Close();
                }
            }
            fullgridview();
        }


        private void fillspecialfeedagency()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "spfed");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridspecfeedsgency.DataSource = ds;
                                Gridspecfeedsgency.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridspecfeedsgency.DataSource = ds;
                                Gridspecfeedsgency.DataBind();
                                int columnsCount = Gridspecfeedsgency.Columns.Count - 1;
                                Gridspecfeedsgency.Rows[0].Cells.Clear();
                                Gridspecfeedsgency.Rows[0].Cells.Add(new TableCell());
                                Gridspecfeedsgency.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridspecfeedsgency.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridspecfeedsgency.Rows[0].Cells[0].Font.Bold = true;
                                Gridspecfeedsgency.Rows[0].Cells[0].Font.Size = 10;
                                Gridspecfeedsgency.Rows[0].Cells[0].Text = "Currently there is no Special Feed Agency........";
                                Gridspecfeedsgency.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymspfeed");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridspecfeedsgency.DataSource = ds;
                                Gridspecfeedsgency.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridspecfeedsgency.DataSource = ds;
                                Gridspecfeedsgency.DataBind();
                                int columnsCount = Gridspecfeedsgency.Columns.Count - 1;
                                Gridspecfeedsgency.Rows[0].Cells.Clear();
                                Gridspecfeedsgency.Rows[0].Cells.Add(new TableCell());
                                Gridspecfeedsgency.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridspecfeedsgency.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridspecfeedsgency.Rows[0].Cells[0].Font.Bold = true;
                                Gridspecfeedsgency.Rows[0].Cells[0].Font.Size = 10;
                                Gridspecfeedsgency.Rows[0].Cells[0].Text = "Currently there is no Special Feed Agency......";
                                Gridspecfeedsgency.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveRecordspefeed(object sender, EventArgs e)
        {
            TextBox TxtSpecialFeed_Dtins = Gridspecfeedsgency.FooterRow.FindControl("TxtSpecialFeed_Dtins") as TextBox;
            TextBox TxtNm_Agencyins = Gridspecfeedsgency.FooterRow.FindControl("TxtNm_Agencyins") as TextBox;
            TextBox TxtDuration_Hrins = Gridspecfeedsgency.FooterRow.FindControl("TxtDuration_Hrins") as TextBox;
            TextBox TxtDuration_Minins = Gridspecfeedsgency.FooterRow.FindControl("TxtDuration_Minins") as TextBox;
            TextBox TxtRemarksins = Gridspecfeedsgency.FooterRow.FindControl("TxtRemarksins") as TextBox;
           
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn))
                {
                    //DateTime dtinstallins = Convert.ToDateTime(TxtDt_Installtionins.Text);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "spfeedins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.Add("@pSpecialFeed_Dt", SqlDbType.Date).Value = DateTime.ParseExact(TxtSpecialFeed_Dtins.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@pNm_Agency", TxtNm_Agencyins.Text);
                    cmd.Parameters.AddWithValue("@pDuration_Hr", TxtDuration_Hrins.Text);
                    cmd.Parameters.AddWithValue("@pDuration_Min", TxtDuration_Minins.Text);
                    cmd.Parameters.AddWithValue("@pRemarks", TxtRemarksins.Text);

                   

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillspecialfeedagency();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridspecfeedsgency_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridspecfeedsgency.EditIndex = e.NewEditIndex;
            fillspecialfeedagency();
            fullgridview();
        }

        protected void Gridspecfeedsgency_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_sfea = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("LblSlno_sfea") as Label;
            TextBox TxtSpecialFeed_Dtupdt = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("TxtSpecialFeed_Dtupdt") as TextBox;
            TextBox TxtNm_Agencyupdt = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("TxtNm_Agencyupdt") as TextBox;
            TextBox TxtDuration_Hrupdt = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("TxtDuration_Hrupdt") as TextBox;
            TextBox TxtDuration_Min = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("TxtDuration_Min") as TextBox;
            TextBox TxtRemarksupdt = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("TxtRemarksupdt") as TextBox;
            

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtspfeed");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_sfea.Text);
                    cmd.Parameters.Add("@pSpecialFeed_Dt", SqlDbType.Date).Value = DateTime.ParseExact(TxtSpecialFeed_Dtupdt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@pNm_Agency", TxtNm_Agencyupdt.Text);
                    cmd.Parameters.AddWithValue("@pDuration_Hr", TxtDuration_Hrupdt.Text);
                    cmd.Parameters.AddWithValue("@pDuration_Min", TxtDuration_Min.Text);
                    cmd.Parameters.AddWithValue("@pRemarks", TxtRemarksupdt.Text);
                  
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridspecfeedsgency.EditIndex = -1;
                    fillspecialfeedagency();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridspecfeedsgency_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridspecfeedsgency.EditIndex = -1;
            fillspecialfeedagency();
            fullgridview();
        }
        protected void Gridspecfeedsgency_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_sfea = Gridspecfeedsgency.Rows[e.RowIndex].FindControl("LblSlno_sfea") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_SpecialFeed", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "feeddelete");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_sfea.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillspecialfeedagency();
                    conn.Close();
                }
            }
            fullgridview();
        }


        private void fillbreakdowndetails()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "selectbd");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridbreakdown.DataSource = ds;
                                Gridbreakdown.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridbreakdown.DataSource = ds;
                                Gridbreakdown.DataBind();
                                int columnsCount = Gridbreakdown.Columns.Count - 1;
                                Gridbreakdown.Rows[0].Cells.Clear();
                                Gridbreakdown.Rows[0].Cells.Add(new TableCell());
                                Gridbreakdown.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridbreakdown.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridbreakdown.Rows[0].Cells[0].Font.Bold = true;
                                Gridbreakdown.Rows[0].Cells[0].Font.Size = 10;
                                Gridbreakdown.Rows[0].Cells[0].Text = "Currently there is no Break Down........";
                                Gridbreakdown.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymnbddgng");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridbreakdown.DataSource = ds;
                                Gridbreakdown.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridbreakdown.DataSource = ds;
                                Gridbreakdown.DataBind();
                                int columnsCount = Gridbreakdown.Columns.Count - 1;
                                Gridbreakdown.Rows[0].Cells.Clear();
                                Gridbreakdown.Rows[0].Cells.Add(new TableCell());
                                Gridbreakdown.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridbreakdown.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridbreakdown.Rows[0].Cells[0].Font.Bold = true;
                                Gridbreakdown.Rows[0].Cells[0].Font.Size = 10;
                                Gridbreakdown.Rows[0].Cells[0].Text = "Currently there is no Break Down........";
                                Gridbreakdown.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveRecordbd(object sender, EventArgs e)
        {
            TextBox TxtBD_Dateins = Gridbreakdown.FooterRow.FindControl("TxtBD_Dateins") as TextBox;
            TextBox TxtBD_HR_Fromins = Gridbreakdown.FooterRow.FindControl("TxtBD_HR_Fromins") as TextBox;
            TextBox TxtBD_Min_Fromins = Gridbreakdown.FooterRow.FindControl("TxtBD_Min_Fromins") as TextBox;
            TextBox TxtBD_HR_Toins = Gridbreakdown.FooterRow.FindControl("TxtBD_HR_Toins") as TextBox;
            TextBox TxtBD_Min_Toins = Gridbreakdown.FooterRow.FindControl("TxtBD_Min_Toins") as TextBox;
            TextBox TxtBD_HR_Durationins = Gridbreakdown.FooterRow.FindControl("TxtBD_HR_Durationins") as TextBox;
            TextBox TxtBD_Min_Durationins = Gridbreakdown.FooterRow.FindControl("TxtBD_Min_Durationins") as TextBox;
            TextBox TxtBD_Causeins = Gridbreakdown.FooterRow.FindControl("TxtBD_Causeins") as TextBox;
            
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "ninsbddsng");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.Add("@pBD_Date", SqlDbType.Date).Value = DateTime.ParseExact(TxtBD_Dateins.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);                  
                    cmd.Parameters.AddWithValue("@pBD_HR_From", TxtBD_HR_Fromins.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_From", TxtBD_Min_Fromins.Text);
                    cmd.Parameters.AddWithValue("@pBD_HR_To", TxtBD_HR_Toins.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_To", TxtBD_Min_Toins.Text);
                    cmd.Parameters.AddWithValue("@pBD_HR_Duration", TxtBD_HR_Durationins.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_Duration", TxtBD_Min_Durationins.Text);
                    cmd.Parameters.AddWithValue("@pBD_Cause", TxtBD_Causeins.Text);
                   


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillbreakdowndetails();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridbreakdown_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridbreakdown.EditIndex = e.NewEditIndex;
            fillbreakdowndetails();
            fullgridview();
        }



        protected void Gridbreakdown_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_bd = Gridservinfo.Rows[e.RowIndex].FindControl("LblSlno_bd") as Label;
            TextBox TxtBD_Dateupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_Dateupdt") as TextBox;
            TextBox TxtBD_HR_Fromupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_HR_Fromupdt") as TextBox;
            TextBox TxtBD_Min_Fromupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_Min_Fromupdt") as TextBox;
            TextBox TxtBD_HR_Toupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_HR_Toupdt") as TextBox;
            TextBox TxtBD_Min_Toupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_Min_Toupdt") as TextBox;
            TextBox TxtBD_HR_Durationupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_HR_Durationupdt") as TextBox;
            TextBox TxtBD_Min_Durationupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_Min_Durationupdt") as TextBox;
            TextBox TxtBD_Causeupdt = Gridbreakdown.Rows[e.RowIndex].FindControl("TxtBD_Causeupdt") as TextBox;
            
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn))
                {

                    //DateTime dtinstall = Convert.ToDateTime(TxtDt_Installtionupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtsupbddsngerinfo");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_bd.Text);

                    cmd.Parameters.Add("@pBD_Date", SqlDbType.Date).Value = DateTime.ParseExact(TxtBD_Dateupdt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);                                     
                    cmd.Parameters.AddWithValue("@pBD_HR_From", TxtBD_HR_Fromupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_From", TxtBD_Min_Fromupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_HR_To", TxtBD_HR_Toupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_To", TxtBD_Min_Toupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_HR_Duration", TxtBD_HR_Durationupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_Min_Duration", TxtBD_Min_Durationupdt.Text);
                    cmd.Parameters.AddWithValue("@pBD_Cause", TxtBD_Causeupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridservinfo.EditIndex = -1;
                    fillbreakdowndetails();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridbreakdown_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridservinfo.EditIndex = -1;
            fillbreakdowndetails();
            fullgridview();
        }
        protected void Gridbreakdown_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_bd = Gridservinfo.Rows[e.RowIndex].FindControl("LblSlno_bd") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_BreakdownDetails", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "brdeltedsng");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_bd.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillbreakdowndetails();
                    conn.Close();
                }
            }
            fullgridview();
        }



        private void fillequipmentdetails()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "nequiprec");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pReport_Id", "1002");


                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridequipdetails.DataSource = ds;
                                Gridequipdetails.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridequipdetails.DataSource = ds;
                                Gridequipdetails.DataBind();
                                int columnsCount = Gridequipdetails.Columns.Count - 1;
                                Gridequipdetails.Rows[0].Cells.Clear();
                                Gridequipdetails.Rows[0].Cells.Add(new TableCell());
                                Gridequipdetails.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridequipdetails.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridequipdetails.Rows[0].Cells[0].Font.Bold = true;
                                Gridequipdetails.Rows[0].Cells[0].Font.Size = 10;
                                Gridequipdetails.Rows[0].Cells[0].Text = "Currently there is no Equipment Details.......";
                                Gridequipdetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymnneweqp");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pReport_Id", "1002");


                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridequipdetails.DataSource = ds;
                                Gridequipdetails.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridequipdetails.DataSource = ds;
                                Gridequipdetails.DataBind();
                                int columnsCount = Gridequipdetails.Columns.Count - 1;
                                Gridequipdetails.Rows[0].Cells.Clear();
                                Gridequipdetails.Rows[0].Cells.Add(new TableCell());
                                Gridequipdetails.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridequipdetails.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridequipdetails.Rows[0].Cells[0].Font.Bold = true;
                                Gridequipdetails.Rows[0].Cells[0].Font.Size = 10;
                                Gridequipdetails.Rows[0].Cells[0].Text = "Currently there is no Equipment Details.......";
                                Gridequipdetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveEquip(object sender, EventArgs e)
        {
            DropDownList ddlEquip_Typeins = Gridequipdetails.FooterRow.FindControl("ddlEquip_Typeins") as DropDownList;
            TextBox TxtEquipment_NMins = Gridequipdetails.FooterRow.FindControl("TxtEquipment_NMins") as TextBox;
            TextBox TxtEquip_Ratingins = Gridequipdetails.FooterRow.FindControl("TxtEquip_Ratingins") as TextBox;
            TextBox TxtEquip_Makeins = Gridequipdetails.FooterRow.FindControl("TxtEquip_Makeins") as TextBox;
            TextBox TxtEquip_Modelins = Gridequipdetails.FooterRow.FindControl("TxtEquip_Modelins") as TextBox;
            TextBox TxtEquip_Serialnoins = Gridequipdetails.FooterRow.FindControl("TxtEquip_Serialnoins") as TextBox;
            TextBox TxtEquip_Statusins = Gridequipdetails.FooterRow.FindControl("TxtEquip_Statusins") as TextBox;
          

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "neins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@pEquip_Type", ddlEquip_Typeins.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_NM", TxtEquipment_NMins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Rating", TxtEquip_Ratingins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Make", TxtEquip_Makeins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Model", TxtEquip_Modelins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Serialno", TxtEquip_Serialnoins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Status", TxtEquip_Statusins.Text);
                    cmd.Parameters.AddWithValue("@pReport_Id", "1002");



                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillequipmentdetails();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridequipdetails_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridequipdetails.EditIndex = e.NewEditIndex;
            fillequipmentdetails();
            fullgridview();
        }



        protected void Gridequipdetails_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_eqp = Gridequipdetails.Rows[e.RowIndex].FindControl("LblSlno_eqp") as Label;
            DropDownList ddlEquip_Typeupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("ddlEquip_Typeupdt") as DropDownList;
            TextBox TxtEquipment_NMupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquipment_NMupdt") as TextBox;
            TextBox TxtEquip_Ratingupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquip_Ratingupdt") as TextBox;
            TextBox TxtEquip_Makeupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquip_Makeupdt") as TextBox;
            TextBox TxtEquip_Modelupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquip_Modelupdt") as TextBox;
            TextBox TxtEquip_Serialnoupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquip_Serialnoupdt") as TextBox;
            TextBox TxtEquip_Statusupdt = Gridequipdetails.Rows[e.RowIndex].FindControl("TxtEquip_Statusupdt") as TextBox;
           

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {

                    //DateTime dtinstall = Convert.ToDateTime(TxtDt_Installtionupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtnerec");
                    cmd.Parameters.AddWithValue("@pEquipmentID", LblSlno_eqp.Text);


                    cmd.Parameters.AddWithValue("@pEquip_Type", ddlEquip_Typeupdt.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_NM", TxtEquipment_NMupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Rating", TxtEquip_Ratingupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Make", TxtEquip_Makeupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Model", TxtEquip_Modelupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Serialno", TxtEquip_Serialnoupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Status", TxtEquip_Statusupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridequipdetails.EditIndex = -1;
                    fillequipmentdetails();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridequipdetails_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridequipdetails.EditIndex = -1;
            fillequipmentdetails();
            fullgridview();
        }
        protected void Gridequipdetails_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_eqp = Gridequipdetails.Rows[e.RowIndex].FindControl("LblSlno_eqp") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "eqpdt");
                    cmd.Parameters.AddWithValue("@pEquipmentID", LblSlno_eqp.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillequipmentdetails();
                    conn.Close();
                }
            }
            fullgridview();
        }

        //Highlights Of Coverage

        private void fillhighlightCov()
        {

            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "highcov");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridhighlights.DataSource = ds;
                                Gridhighlights.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridhighlights.DataSource = ds;
                                Gridhighlights.DataBind();
                                int columnsCount = Gridhighlights.Columns.Count - 1;
                                Gridhighlights.Rows[0].Cells.Clear();
                                Gridhighlights.Rows[0].Cells.Add(new TableCell());
                                Gridhighlights.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridhighlights.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridhighlights.Rows[0].Cells[0].Font.Bold = true;
                                Gridhighlights.Rows[0].Cells[0].Font.Size = 10;
                                Gridhighlights.Rows[0].Cells[0].Text = "Currently there is no Highlight Coverage.......";
                                Gridhighlights.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymhighcov");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridhighlights.DataSource = ds;
                                Gridhighlights.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridhighlights.DataSource = ds;
                                Gridhighlights.DataBind();
                                int columnsCount = Gridhighlights.Columns.Count - 1;
                                Gridhighlights.Rows[0].Cells.Clear();
                                Gridhighlights.Rows[0].Cells.Add(new TableCell());
                                Gridhighlights.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                Gridhighlights.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                Gridhighlights.Rows[0].Cells[0].Font.Bold = true;
                                Gridhighlights.Rows[0].Cells[0].Font.Size = 10;
                                Gridhighlights.Rows[0].Cells[0].Text = "Currently there is no Highlight Coverage.......";
                                Gridhighlights.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void SaveHighlightCov(object sender, EventArgs e)
        {
            TextBox TxtDate_Coverageins = Gridhighlights.FooterRow.FindControl("TxtDate_Coverageins") as TextBox;
            TextBox TxtCoverage_Eventins = Gridhighlights.FooterRow.FindControl("TxtCoverage_Eventins") as TextBox;
            TextBox TxtLive_FeedHrsins = Gridhighlights.FooterRow.FindControl("TxtLive_FeedHrsins") as TextBox;
            TextBox TxtRecorded_FeedHrsins = Gridhighlights.FooterRow.FindControl("TxtRecorded_FeedHrsins") as TextBox;
            TextBox TxtHot_SwitchingHrsins = Gridhighlights.FooterRow.FindControl("TxtHot_SwitchingHrsins") as TextBox;
            TextBox TxtRemarksins = Gridhighlights.FooterRow.FindControl("TxtRemarksins") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "hcins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.Add("@pDate_Coverage", SqlDbType.Date).Value = DateTime.ParseExact(TxtDate_Coverageins.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);                                                     
                    cmd.Parameters.AddWithValue("@pCoverage_Event", TxtCoverage_Eventins.Text);
                    cmd.Parameters.AddWithValue("@pLive_FeedHrs", TxtLive_FeedHrsins.Text);
                    cmd.Parameters.AddWithValue("@pRecorded_FeedHrs", TxtRecorded_FeedHrsins.Text);
                    cmd.Parameters.AddWithValue("@pHot_SwitchingHrs", TxtHot_SwitchingHrsins.Text);
                    cmd.Parameters.AddWithValue("@pRemarks", TxtRemarksins.Text);



                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillhighlightCov();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridhighlights_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridhighlights.EditIndex = e.NewEditIndex;
            fillhighlightCov();
            fullgridview();
        }



        protected void Gridhighlights_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblSlno_highcov = Gridhighlights.Rows[e.RowIndex].FindControl("LblSlno_highcov") as Label;
            TextBox TxtDate_Coverageupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtDate_Coverageupdt") as TextBox;
            TextBox TxtCoverage_Eventupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtCoverage_Eventupdt") as TextBox;
            TextBox TxtLive_FeedHrsupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtLive_FeedHrsupdt") as TextBox;
            TextBox TxtRecorded_FeedHrsupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtRecorded_FeedHrsupdt") as TextBox;
            TextBox TxtHot_SwitchingHrsupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtHot_SwitchingHrsupdt") as TextBox;
            TextBox TxtRemarksupdt = Gridhighlights.Rows[e.RowIndex].FindControl("TxtRemarksupdt") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn))
                {

                    //DateTime dtinstall = Convert.ToDateTime(TxtDt_Installtionupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtnerec");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_highcov.Text);
                    cmd.Parameters.Add("@pDate_Coverage", SqlDbType.Date).Value = DateTime.ParseExact(TxtDate_Coverageupdt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);                                                     
                    cmd.Parameters.AddWithValue("@pCoverage_Event", TxtCoverage_Eventupdt.Text);
                    cmd.Parameters.AddWithValue("@pLive_FeedHrs", TxtLive_FeedHrsupdt.Text);
                    cmd.Parameters.AddWithValue("@pRecorded_FeedHrs", TxtRecorded_FeedHrsupdt.Text);
                    cmd.Parameters.AddWithValue("@pHot_SwitchingHrs", TxtHot_SwitchingHrsupdt.Text);
                    cmd.Parameters.AddWithValue("@pRemarks", TxtRemarksupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridhighlights.EditIndex = -1;
                    fillhighlightCov();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridhighlights_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridhighlights.EditIndex = -1;
            fillhighlightCov();
            fullgridview();
        }
        protected void Gridhighlights_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSlno_highcov = Gridhighlights.Rows[e.RowIndex].FindControl("LblSlno_highcov") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG_HighlightsCoverage", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "hcdel");
                    cmd.Parameters.AddWithValue("@pSlno", LblSlno_highcov.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillhighlightCov();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void ddlmonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Fill all Gridview

            fillsatelliteparameters();
            fillserviceinformation();
            fillspecialfeedagency();
            fillbreakdowndetails();
            fillequipmentdetails();
            fillhighlightCov();

            

            // Bind all Hr Min 
            if (TxtTest_Hr_Current.Text != "")
            {
                Bindtesthrprogressive();
            }
            if (TxtTest_Min_Current.Text != "")
            {
                Bindtestminprogressive();
            }
            if (TxtRadiatedProg_Hr_Current.Text != "")
            {
                Bindraditatedhrprogressive();
            }
            if (TxtRadiatedProg_Min_Current.Text != "")
            {
                Bindradiatedminprogressive();
            }
           
            if (TxtTest_Hr_Current.Text != "" && TxtRadiatedProg_Hr_Current.Text != "")
            {
                Bindhrstotalcurrent();
            }
         
            if (TxtTest_Min_Current.Text != "" && TxtRadiatedProg_Min_Current.Text!="")
            {
                BindMintotalcurrent();
            }

            if (TxtTest_Hr_Progressive.Text != "" && TxtRadiatedProg_Hr_Progressive.Text!="")
            {
            Bindhrtotalprogessive();
            }
            if (TxtTest_Min_Progressive.Text != "" && TxtRadiatedProg_Min_Progressive.Text != "")
            {
            BindMintotalprogessive();
            }
            if (TxtSincetest_Hr_Progressive.Text != "" && TxtSinceRadiatedProg_Hr_Progressive.Text != "")
            {
                BindSinceTotalHRProgressive();
            }

            if (TxtSincetest_Min_Progressive.Text != "" && TxtSinceRadiatedProg_Min_Progressive.Text != "")
            {
                BindSinceTotalminProgressive();
            }

            #region Bind test hr min and Radiated hr min

            // bind since test hr min and Radiated hr min 

            if(TxtTest_Hr_Current.Text!="" && TxtSincetest_Hr_Progressive.Text!="")
            {
                BindSincetesthr();

            }
            if (TxtTest_Min_Current.Text != "" && TxtSincetest_Min_Progressive.Text != "")
            {
                BindSincetestmin();

            }
            if(TxtRadiatedProg_Hr_Current.Text!="" && TxtSinceRadiatedProg_Hr_Progressive.Text!="")
            {
                BindSinceradiatedhr();

            }
            if (TxtRadiatedProg_Min_Current.Text != "" && TxtSinceRadiatedProg_Min_Progressive.Text != "")
            {
                BindSinceradiatedmin();

            }

            #endregion Bind test hr min and Radiated hr min

            #region Breakdown Bind Hr and Min

            if (TxtBDPwr_Hr_Current.Text != "")
            {
                BindBDPowerHrsprogressive();
            }
            if (TxtBDPwr_Min_Current.Text != "")
            {
                BindBDPowerMinprogressive();
            }
             if (TxtBDGear_Hr_Current.Text != "")
            {
                BindBDGearHrsprogressive();
             }
             if (TxtBDGear_Min_Current.Text != "")
             {
                 BindBDGearMinprogressive();
             }
             if (TxtBDOtherCause_Hr_Current.Text != "")
             {
                 BindBDOtherCauseHrsprogressive();
             }
             if (TxtBDOtherCause_Min_Current.Text != "")
             {
                 BindBDOtherCauseMinprogressive();
             }
             if (TxtBDPwr_Hr_Current.Text != "" && TxtBDGear_Hr_Current.Text != "" && TxtBDOtherCause_Hr_Current.Text != "")
             {
                 BindtotalBDhrCurrent();
             }
             if (TxtBDPwr_Min_Current.Text != "" && TxtBDGear_Min_Current.Text != "" && TxtBDOtherCause_Min_Current.Text != "")
             {
                 BindtotalBDMinCurrent();
             }
             if (TxtBDPwr_Hr_Progressive.Text != "" && TxtBDGear_Hr_Progressive.Text != "" && TxtBDOtherCause_Hr_Progressive.Text != "")
             {
                 BindtotalBDHrProgressive();
             }
             if (TxtBDPwr_Min_Progressive.Text != "" && TxtBDGear_Min_Progressive.Text != "" && TxtBDOtherCause_Min_Progressive.Text != "")
             {
                 BindtotalBDMinProgressive();
             }

            #endregion Breakdown Bind Hr and Min

            BindLastFilledDSNG();

            

          
        }


        // End of Highlight of coverage


        private void BindLastFilledDSNG()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pACTION", "rptlastDSNG");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());


                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            Txthparatedpwr.Text = ds.Tables[0].Rows[0]["HPARatedPwr"].ToString();
                            Txtnormaluplinkpwr.Text = ds.Tables[0].Rows[0]["NormaluplinkPwr"].ToString();

                            TxtTest_Hr_Current.Text = ds.Tables[0].Rows[0]["Test_Hr_Current"].ToString();
                            TxtTest_Min_Current.Text = ds.Tables[0].Rows[0]["Test_Min_Current"].ToString();
                            TxtTest_Hr_Progressive.Text = ds.Tables[0].Rows[0]["Test_Hr_Progressive"].ToString();
                            TxtTest_Min_Progressive.Text = ds.Tables[0].Rows[0]["Test_Min_Progressive"].ToString();

                            TxtRadiatedProg_Hr_Current.Text = ds.Tables[0].Rows[0]["RadiatedProg_Hr_Current"].ToString();
                            TxtRadiatedProg_Min_Current.Text = ds.Tables[0].Rows[0]["RadiatedProg_Min_Current"].ToString();
                            TxtRadiatedProg_Hr_Progressive.Text = ds.Tables[0].Rows[0]["RadiatedProg_Hr_Progressive"].ToString();
                            TxtRadiatedProg_Min_Progressive.Text = ds.Tables[0].Rows[0]["RadiatedProg_Min_Progressive"].ToString();

                            TxtTotal_Hr_Current.Text = ds.Tables[0].Rows[0]["Total_Hr_Current"].ToString();
                            TxtTotal_Min_Current.Text = ds.Tables[0].Rows[0]["Total_Min_Current"].ToString();
                            TxtTotal_Hr_Progrresive.Text = ds.Tables[0].Rows[0]["Total_Hr_Progrresive"].ToString();
                            TxtTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["Total_Min_Progressive"].ToString();


                            TxtSincetest_Hr_Progressive.Text = ds.Tables[0].Rows[0]["Sincetest_Hr_Progressive"].ToString();
                            TxtSincetest_Min_Progressive.Text = ds.Tables[0].Rows[0]["Sincetest_Min_Progressive"].ToString();
                            TxtSinceRadiatedProg_Hr_Progressive.Text = ds.Tables[0].Rows[0]["SinceRadiatedProg_Hr_Progressive"].ToString();
                            TxtSinceRadiatedProg_Min_Progressive.Text = ds.Tables[0].Rows[0]["SinceRadiatedProg_Min_Progressive"].ToString();
                            TxtSinceTotal_Hr_Progressive.Text = ds.Tables[0].Rows[0]["SinceTotal_Hr_Progressive"].ToString();
                            TxtSinceTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["SinceTotal_Min_Progressive"].ToString();



                            TxtBDPwr_Hr_Current.Text = ds.Tables[0].Rows[0]["BDPwr_Hr_Current"].ToString();
                            TxtBDPwr_Min_Current.Text = ds.Tables[0].Rows[0]["BDPwr_Min_Current"].ToString();
                            TxtBDPwr_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDPwr_Hr_Progressive"].ToString();
                            TxtBDPwr_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDPwr_Min_Progressive"].ToString();


                            TxtBDGear_Hr_Current.Text = ds.Tables[0].Rows[0]["BDGear_Hr_Current"].ToString();
                            TxtBDGear_Min_Current.Text = ds.Tables[0].Rows[0]["BDGear_Min_Current"].ToString();
                            TxtBDGear_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDGear_Hr_Progressive"].ToString();
                            TxtBDGear_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDGear_Min_Progressive"].ToString();

                            TxtBDOtherCause_Hr_Current.Text = ds.Tables[0].Rows[0]["BDOtherCause_Hr_Current"].ToString();
                            TxtBDOtherCause_Min_Current.Text = ds.Tables[0].Rows[0]["BDOtherCause_Min_Current"].ToString();
                            TxtBDOtherCause_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDOtherCause_Hr_Progressive"].ToString();
                            TxtBDOtherCause_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDOtherCause_Min_Progressive"].ToString();

                            TxtBD_Total_Hr_Current.Text = ds.Tables[0].Rows[0]["BD_Total_Hr_Current"].ToString();
                            TxtBD_Total_Min_Current.Text = ds.Tables[0].Rows[0]["BD_Total_Min_Current"].ToString();
                            TxtBD_Total_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BD_Total_Hr_Progressive"].ToString();
                            TxtBD_Total_Min_Progressive.Text = ds.Tables[0].Rows[0]["BD_Total_Min_Progressive"].ToString();




                            TxtAdditional_Information.Text = ds.Tables[0].Rows[0]["Additional_Information"].ToString();
                            TxtActiontakenStation.Text = ds.Tables[0].Rows[0]["ActiontakenStation"].ToString();
                            TxtActiontakenZonalOffc.Text = ds.Tables[0].Rows[0]["ActiontakenZonalOffc"].ToString();

                            TxtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                            ViewState["Slno"] = ds.Tables[0].Rows[0]["Slno"].ToString();
                        }

                    }
                }
            }
        }




        protected void TxtTest_Hr_Current_TextChanged(object sender, EventArgs e)
        {
            Bindtesthrprogressive();
            if (TxtTest_Hr_Current.Text != "" && TxtSincetest_Hr_Progressive.Text != "")
            {
                BindSincetesthr();

            }
            fullgridview();
        }

        // Bind Test Hr. Progressive

        private void Bindtesthrprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "testcheck");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtTest_Hr_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "hrtest");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtTest_Hr_Progressive.Enabled = false;
                                        TxtTest_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["totaltesthr"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtTest_Min_Current_TextChanged(object sender, EventArgs e)
        {
            Bindtestminprogressive();
            if (TxtTest_Min_Current.Text != "" && TxtSincetest_Min_Progressive.Text != "")
            {
                BindSincetestmin();

            }
            fullgridview();
        }

        // Bind Test Min. Progressive

        private void Bindtestminprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "chemintest");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtTest_Min_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "recminprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtTest_Min_Progressive.Enabled = false;
                                        TxtTest_Min_Progressive.Text = ds1.Tables[0].Rows[0]["TotalMintest"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtRadiatedProg_Hr_Current_TextChanged(object sender, EventArgs e)
        {
            Bindraditatedhrprogressive();

            if (TxtTest_Hr_Current.Text != "" && TxtRadiatedProg_Hr_Current.Text != "")
            {
                Bindhrstotalcurrent();
            }
            if (TxtTest_Hr_Progressive.Text != "" && TxtRadiatedProg_Hr_Progressive.Text != "")
            {
                Bindhrtotalprogessive();
            }
            if (TxtRadiatedProg_Hr_Current.Text != "" && TxtSinceRadiatedProg_Hr_Progressive.Text != "")
            {
                BindSinceradiatedhr();

            }

            if (TxtSincetest_Hr_Progressive.Text != "" && TxtSinceRadiatedProg_Hr_Progressive.Text != "")
            {
                BindSinceTotalHRProgressive();
            }
           
            fullgridview();

        }
        private void Bindraditatedhrprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "ckradhr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtRadiatedProg_Hr_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "hrradpro");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtRadiatedProg_Hr_Progressive.Enabled = false;
                                        TxtRadiatedProg_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["radiatedhrprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }
        protected void TxtRadiatedProg_Min_Current_TextChanged(object sender, EventArgs e)
        {
            Bindradiatedminprogressive();

            if (TxtTest_Min_Current.Text != "" && TxtRadiatedProg_Min_Current.Text != "")
            {
                BindMintotalcurrent();
            }
            if (TxtRadiatedProg_Min_Current.Text != "" && TxtSinceRadiatedProg_Min_Progressive.Text != "")
            {
                BindSinceradiatedmin();

            }

            if (TxtSincetest_Min_Progressive.Text != "" && TxtSinceRadiatedProg_Min_Progressive.Text != "")
            {
                BindSinceTotalminProgressive();
            }
            if (TxtTest_Min_Progressive.Text != "" && TxtRadiatedProg_Min_Progressive.Text != "")
            {
                BindMintotalprogessive();
            }

            fullgridview();
        

        }
        private void Bindradiatedminprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "radminck");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtRadiatedProg_Min_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "progminrad");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtRadiatedProg_Min_Progressive.Enabled = false;
                                        TxtRadiatedProg_Min_Progressive.Text = ds1.Tables[0].Rows[0]["radiatedMinprogessive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void Bindhrstotalcurrent()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "ttlhrcurr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtTotal_Hr_Current.Enabled = false;
                            TxtTotal_Hr_Current.Text = ds.Tables[0].Rows[0]["totalHrcurrent"].ToString();

                        }

                    }
                }

            }
        }
        private void BindMintotalcurrent()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "minttlcur");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtTotal_Min_Current.Enabled = false;
                            TxtTotal_Min_Current.Text = ds.Tables[0].Rows[0]["totalMincurrent"].ToString();

                        }

                    }
                }

            }
        }

        private void Bindhrtotalprogessive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "prttlhr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pTest_Hr_Progressive", TxtTest_Hr_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Progressive", TxtRadiatedProg_Hr_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtTotal_Hr_Progrresive.Enabled = false;
                            TxtTotal_Hr_Progrresive.Text = ds.Tables[0].Rows[0]["totalHrprogessive"].ToString();

                        }

                    }
                }

            }
        }

        private void BindMintotalprogessive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "minprottl");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pTest_Min_Progressive", TxtTest_Min_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Progressive", TxtRadiatedProg_Min_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtTotal_Min_Progressive.Enabled = false;
                            TxtTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["totalMinprogessive"].ToString();

                        }

                    }
                }

            }
        }

        protected void TxtRadiatedProg_Hr_Progressive_TextChanged(object sender, EventArgs e)
        {
            Bindhrtotalprogessive();
            fullgridview();
        }

        protected void TxtRadiatedProg_Min_Progressive_TextChanged(object sender, EventArgs e)
        {
            BindMintotalprogessive();
            fullgridview();
        }

        protected void TxtBDPwr_Hr_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDPowerHrsprogressive();
            
            if (TxtBDPwr_Hr_Current.Text != "" && TxtBDGear_Hr_Current.Text != "" && TxtBDOtherCause_Hr_Current.Text != "")
            {
                BindtotalBDhrCurrent();
            }
            if (TxtBDPwr_Hr_Progressive.Text != "" && TxtBDGear_Hr_Progressive.Text != "" && TxtBDOtherCause_Hr_Progressive.Text != "")
            {
                BindtotalBDHrProgressive();
            }
            fullgridview();
        }

        private void BindBDPowerHrsprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "PWRhrsCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDPwr_Hr_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "PWRhrsBind");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDPwr_Hr_Current", TxtBDPwr_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDPwr_Hr_Progressive.Enabled = false;
                                        TxtBDPwr_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["powerhrcurrentmonth"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }
        protected void TxtBDPwr_Min_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDPowerMinprogressive();
            if (TxtBDPwr_Min_Current.Text != "" && TxtBDGear_Min_Current.Text != "" && TxtBDOtherCause_Min_Current.Text != "")
            {
                BindtotalBDMinCurrent();
            }
            if (TxtBDPwr_Min_Progressive.Text != "" && TxtBDGear_Min_Progressive.Text != "" && TxtBDOtherCause_Min_Progressive.Text != "")
            {
                BindtotalBDMinProgressive();
            }

            fullgridview();


        }
        private void BindBDPowerMinprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "PWRminCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDPwr_Min_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "PWRminBind");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDPwr_Min_Current", TxtBDPwr_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDPwr_Min_Progressive.Enabled = false;
                                        TxtBDPwr_Min_Progressive.Text = ds1.Tables[0].Rows[0]["powermincurrentmonth"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtBDGear_Hr_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDGearHrsprogressive();
            if (TxtBDPwr_Hr_Current.Text != "" && TxtBDGear_Hr_Current.Text != "" && TxtBDOtherCause_Hr_Current.Text != "")
            {
                BindtotalBDhrCurrent();
            }
            if (TxtBDPwr_Hr_Progressive.Text != "" && TxtBDGear_Hr_Progressive.Text != "" && TxtBDOtherCause_Hr_Progressive.Text != "")
            {
                BindtotalBDHrProgressive();
            }
            fullgridview();
        }

        private void BindBDGearHrsprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "GEARhrsCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDGear_Hr_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "HRgearBind");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDGear_Hr_Current", TxtBDGear_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDGear_Hr_Progressive.Enabled = false;
                                        TxtBDGear_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["Gearhrprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtBDGear_Min_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDGearMinprogressive();
            if (TxtBDPwr_Min_Current.Text != "" && TxtBDGear_Min_Current.Text != "" && TxtBDOtherCause_Min_Current.Text != "")
            {
                BindtotalBDMinCurrent();
            }
            if (TxtBDPwr_Min_Progressive.Text != "" && TxtBDGear_Min_Progressive.Text != "" && TxtBDOtherCause_Min_Progressive.Text != "")
            {
                BindtotalBDMinProgressive();
            }
            fullgridview();

        }

        private void BindBDGearMinprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "GEARminCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDGear_Min_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "minGEAR");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDGear_Min_Current", TxtBDGear_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDGear_Min_Progressive.Enabled = false;
                                        TxtBDGear_Min_Progressive.Text = ds1.Tables[0].Rows[0]["GearMinprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtBDOtherCause_Hr_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDOtherCauseHrsprogressive();
            if (TxtBDPwr_Hr_Current.Text != "" && TxtBDGear_Hr_Current.Text != "" && TxtBDOtherCause_Hr_Current.Text != "")
            {
                BindtotalBDhrCurrent();
            }
            if (TxtBDPwr_Hr_Progressive.Text != "" && TxtBDGear_Hr_Progressive.Text != "" && TxtBDOtherCause_Hr_Progressive.Text != "")
            {
                BindtotalBDHrProgressive();
            }
            fullgridview();

        }

        private void BindBDOtherCauseHrsprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "OTRhrsCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDOtherCause_Hr_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "OTRhrBind");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDOtherCause_Hr_Current", TxtBDOtherCause_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDOtherCause_Hr_Progressive.Enabled = false;
                                        TxtBDOtherCause_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["otherhrprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtBDOtherCause_Min_Current_TextChanged(object sender, EventArgs e)
        {
            BindBDOtherCauseMinprogressive();

            if (TxtBDPwr_Min_Current.Text != "" && TxtBDGear_Min_Current.Text != "" && TxtBDOtherCause_Min_Current.Text != "")
            {
                BindtotalBDMinCurrent();
            }
            if (TxtBDPwr_Min_Progressive.Text != "" && TxtBDGear_Min_Progressive.Text != "" && TxtBDOtherCause_Min_Progressive.Text != "")
            {
                BindtotalBDMinProgressive();
            }
            fullgridview();

        }

        private void BindBDOtherCauseMinprogressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "OTRminCHK");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtBDOtherCause_Min_Progressive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "OTRminBind");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pBDOtherCause_Min_Current", TxtBDOtherCause_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtBDOtherCause_Min_Progressive.Enabled = false;
                                        TxtBDOtherCause_Min_Progressive.Text = ds1.Tables[0].Rows[0]["OtherMinprogressive"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void BindtotalBDhrCurrent()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "bdtHRcurr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pBDPwr_Hr_Current", TxtBDPwr_Hr_Current.Text);
                    cmd.Parameters.AddWithValue("@pBDGear_Hr_Current", TxtBDGear_Hr_Current.Text);
                    cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Current", TxtBDOtherCause_Hr_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtBD_Total_Hr_Current.Enabled = false;
                            TxtBD_Total_Hr_Current.Text = ds.Tables[0].Rows[0]["bdtotalHrcurrent"].ToString();

                        }

                    }
                }

            }
        }

        private void BindtotalBDMinCurrent()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "bdtMINcurr");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pBDPwr_Min_Current", TxtBDPwr_Min_Current.Text);
                    cmd.Parameters.AddWithValue("@pBDGear_Min_Current", TxtBDGear_Min_Current.Text);
                    cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Current", TxtBDOtherCause_Min_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtBD_Total_Min_Current.Enabled = false;
                            TxtBD_Total_Min_Current.Text = ds.Tables[0].Rows[0]["bdtotalMincurrent"].ToString();

                        }

                    }
                }

            }
        }

        private void BindtotalBDHrProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "bdtHRprog");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pBDPwr_Hr_Progressive", TxtBDPwr_Hr_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pBDGear_Hr_Progressive", TxtBDGear_Hr_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Progressive", TxtBDOtherCause_Hr_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtBD_Total_Hr_Progressive.Enabled = false;
                            TxtBD_Total_Hr_Progressive.Text = ds.Tables[0].Rows[0]["bdtotalHrprogessive"].ToString();

                        }

                    }
                }

            }
        }

        private void BindtotalBDMinProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "bdtMINprog");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pBDPwr_Min_Progressive", TxtBDPwr_Min_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pBDGear_Min_Progressive", TxtBDGear_Min_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Progressive", TxtBDOtherCause_Min_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtBD_Total_Min_Progressive.Enabled = false;
                            TxtBD_Total_Min_Progressive.Text = ds.Tables[0].Rows[0]["bdtotalMinprogessive"].ToString();

                        }

                    }
                }

            }
        }

        protected void TxtBDOtherCause_Hr_Progressive_TextChanged(object sender, EventArgs e)
        {
           
            if (TxtBDPwr_Hr_Progressive.Text != "" && TxtBDGear_Hr_Progressive.Text != "" && TxtBDOtherCause_Hr_Progressive.Text != "")
            {
                BindtotalBDHrProgressive();
            }
            fullgridview();
        }

        protected void TxtBDOtherCause_Min_Progressive_TextChanged(object sender, EventArgs e)
        {
           
            if (TxtBDPwr_Min_Progressive.Text != "" && TxtBDGear_Min_Progressive.Text != "" && TxtBDOtherCause_Min_Progressive.Text != "")
            {
                BindtotalBDMinProgressive();
            }
            fullgridview();
        }


        private void filldsng()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pACTION", "DSNGSHOW");
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Griddsng.DataSource = ds;
                            Griddsng.DataBind();
                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            Griddsng.DataSource = ds;
                            Griddsng.DataBind();
                            int columnsCount = Griddsng.Columns.Count - 1;
                            Griddsng.Rows[0].Cells.Clear();
                            Griddsng.Rows[0].Cells.Add(new TableCell());
                            Griddsng.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            Griddsng.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            Griddsng.Rows[0].Cells[0].Font.Bold = true;
                            Griddsng.Rows[0].Cells[0].Font.Size = 10;
                            Griddsng.Rows[0].Cells[0].Text = "Currently there is no DSNG Entries........";
                            Griddsng.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }



        }


        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0 && ddlzone.SelectedIndex > 0)
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pACTION", "DSNGINSERT");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@pHPARatedPwr", Txthparatedpwr.Text);
                        cmd.Parameters.AddWithValue("@pNormaluplinkPwr", Txtnormaluplinkpwr.Text);


                        cmd.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pTest_Hr_Progressive", TxtTest_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pTest_Min_Progressive", TxtTest_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Progressive", TxtRadiatedProg_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Progressive", TxtRadiatedProg_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pTotal_Hr_Current", TxtTotal_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Min_Current", TxtTotal_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Hr_Progrresive", TxtTotal_Hr_Progrresive.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Min_Progressive", TxtTotal_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pSincetest_Hr_Progressive", TxtSincetest_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSincetest_Min_Progressive", TxtSincetest_Min_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Hr_Progressive", TxtSinceRadiatedProg_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Min_Progressive", TxtSinceRadiatedProg_Min_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceTotal_Hr_Progressive", TxtSinceTotal_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceTotal_Min_Progressive", TxtSinceTotal_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDPwr_Hr_Current", TxtBDPwr_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Min_Current", TxtBDPwr_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Hr_Progressive", TxtBDPwr_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Min_Progressive", TxtBDPwr_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDGear_Hr_Current", TxtBDGear_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Min_Current", TxtBDGear_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Hr_Progressive", TxtBDGear_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Min_Progressive", TxtBDGear_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Current", TxtBDOtherCause_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Current", TxtBDOtherCause_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Progressive", TxtBDOtherCause_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Progressive", TxtBDOtherCause_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBD_Total_Hr_Current", TxtBD_Total_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Min_Current", TxtBD_Total_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Hr_Progressive", TxtBD_Total_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Min_Progressive", TxtBD_Total_Min_Progressive.Text);


                        cmd.Parameters.AddWithValue("@pAdditional_Information", TxtAdditional_Information.Text);
                        cmd.Parameters.AddWithValue("@pActiontakenStation", TxtActiontakenStation.Text);
                        cmd.Parameters.AddWithValue("@pActiontakenZonalOffc", TxtActiontakenZonalOffc.Text);
                        cmd.Parameters.AddWithValue("@pRemarks", TxtRemarks.Text);
                       

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('DSNG Details Added Successfully.'); window.location='" +
                            Request.ApplicationPath + "PNET_Reports/DSNGEntry.aspx';", true);
                        filldsng();
                        //insertupdateratedpower();
                        conn.Close();



                    }
                }
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                   "alert('Enter Data or Select Year and Month and Services...'); window.location='" +
                 Request.ApplicationPath + "PNET_Reports/StudiosetupEntry.aspx';", true);
                ddlyear.Focus();
            }
        }

        protected void TxtSinceRadiatedProg_Hr_Progressive_TextChanged(object sender, EventArgs e)
        {
            if (TxtSincetest_Hr_Progressive.Text != "" && TxtSinceRadiatedProg_Hr_Progressive.Text != "")
            {
                BindSinceTotalHRProgressive();
            }
            fullgridview();
        }
        private void BindSinceTotalHRProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "SThrProg");
                    cmd.Parameters.AddWithValue("@pSincetest_Hr_Progressive", TxtSincetest_Hr_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Hr_Progressive", TxtSinceRadiatedProg_Hr_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtSinceTotal_Hr_Progressive.Enabled = false;
                            TxtSinceTotal_Hr_Progressive.Text = ds.Tables[0].Rows[0]["Sincetotalhrprogressive"].ToString();

                        }

                    }
                }

            }
        }

        protected void TxtSinceRadiatedProg_Min_Progressive_TextChanged(object sender, EventArgs e)
        {
            if (TxtSincetest_Min_Progressive.Text != "" && TxtSinceRadiatedProg_Min_Progressive.Text != "")
            {
                BindSinceTotalminProgressive();
            }
            fullgridview();
        }
        private void BindSinceTotalminProgressive()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "STminProg");
                    cmd.Parameters.AddWithValue("@pSincetest_Min_Progressive", TxtSincetest_Min_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Min_Progressive", TxtSinceRadiatedProg_Min_Progressive.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtSinceTotal_Min_Progressive.Enabled = false;
                            TxtSinceTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["Sincetotalminprogressive"].ToString();

                        }

                    }
                }

            }
        }

        private void BindSincetesthr()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrchkst");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    //cmd.Parameters.AddWithValue("@pSincetest_Hr_Progressive", TxtSincetest_Hr_Progressive.Text);
                    cmd.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            TxtSincetest_Hr_Progressive.Enabled = true;
                            TxtSincetest_Hr_Progressive.Text = ds.Tables[0].Rows[0]["totalhrsincetestCHK"].ToString();

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "tstHRSince");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pSincetest_Hr_Progressive", TxtSincetest_Hr_Progressive.Text);
                                cmd1.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtSincetest_Hr_Progressive.Enabled = false;
                                        TxtSincetest_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["totalhrsincetest"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }


        }

        private void BindSincetestmin()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "minchkst");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            TxtSincetest_Min_Progressive.Enabled = false;
                            TxtSincetest_Min_Progressive.Text = ds.Tables[0].Rows[0]["totalminsincetestchk"].ToString();

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "mntstsince");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pSincetest_Min_Progressive", TxtSincetest_Min_Progressive.Text);
                                cmd1.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);
                             

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtSincetest_Min_Progressive.Enabled = false;
                                        TxtSincetest_Min_Progressive.Text = ds1.Tables[0].Rows[0]["totalminsincetest"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }

        }

        private void BindSinceradiatedhr()
        {

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrchksrad");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            TxtSinceRadiatedProg_Hr_Progressive.Enabled = false;
                            TxtSinceRadiatedProg_Hr_Progressive.Text = ds.Tables[0].Rows[0]["totalhrsinceRadiatedchk"].ToString();

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "RADhrSince");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pSinceRadiatedProg_Hr_Progressive", TxtSinceRadiatedProg_Hr_Progressive.Text);
                                cmd1.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtSinceRadiatedProg_Hr_Progressive.Enabled = false;
                                        TxtSinceRadiatedProg_Hr_Progressive.Text = ds1.Tables[0].Rows[0]["totalhrsinceRadiated"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }

            
        }

        private void BindSinceradiatedmin()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "minchksrad");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                    cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            TxtSinceRadiatedProg_Min_Progressive.Enabled = false;
                            TxtSinceRadiatedProg_Min_Progressive.Text = ds.Tables[0].Rows[0]["totalminsinceRadiatedchk"].ToString();

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_DSNGCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "radminS");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pSinceRadiatedProg_Min_Progressive", TxtSinceRadiatedProg_Min_Progressive.Text);
                                cmd1.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtSinceRadiatedProg_Min_Progressive.Enabled = false;
                                        TxtSinceRadiatedProg_Min_Progressive.Text = ds1.Tables[0].Rows[0]["totalminsinceRadiated"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }

        }

        protected void Griddsng_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
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

                                Txthparatedpwr.Text = ds.Tables[0].Rows[0]["HPARatedPwr"].ToString();
                                Txtnormaluplinkpwr.Text = ds.Tables[0].Rows[0]["NormaluplinkPwr"].ToString();

                                TxtTest_Hr_Current.Text = ds.Tables[0].Rows[0]["Test_Hr_Current"].ToString();
                                TxtTest_Min_Current.Text = ds.Tables[0].Rows[0]["Test_Min_Current"].ToString();
                                TxtTest_Hr_Progressive.Text = ds.Tables[0].Rows[0]["Test_Hr_Progressive"].ToString();
                                TxtTest_Min_Progressive.Text = ds.Tables[0].Rows[0]["Test_Min_Progressive"].ToString();

                                TxtRadiatedProg_Hr_Current.Text = ds.Tables[0].Rows[0]["RadiatedProg_Hr_Current"].ToString();
                                TxtRadiatedProg_Min_Current.Text = ds.Tables[0].Rows[0]["RadiatedProg_Min_Current"].ToString();
                                TxtRadiatedProg_Hr_Progressive.Text = ds.Tables[0].Rows[0]["RadiatedProg_Hr_Progressive"].ToString();
                                TxtRadiatedProg_Min_Progressive.Text = ds.Tables[0].Rows[0]["RadiatedProg_Min_Progressive"].ToString();

                                TxtTotal_Hr_Current.Text = ds.Tables[0].Rows[0]["Total_Hr_Current"].ToString();
                                TxtTotal_Min_Current.Text = ds.Tables[0].Rows[0]["Total_Min_Current"].ToString();
                                TxtTotal_Hr_Progrresive.Text = ds.Tables[0].Rows[0]["Total_Hr_Progrresive"].ToString();
                                TxtTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["Total_Min_Progressive"].ToString();

                                TxtSincetest_Hr_Progressive.Text = ds.Tables[0].Rows[0]["Sincetest_Hr_Progressive"].ToString();
                                TxtSincetest_Min_Progressive.Text = ds.Tables[0].Rows[0]["Sincetest_Min_Progressive"].ToString();
                                TxtSinceRadiatedProg_Hr_Progressive.Text = ds.Tables[0].Rows[0]["SinceRadiatedProg_Hr_Progressive"].ToString();
                                TxtSinceRadiatedProg_Min_Progressive.Text = ds.Tables[0].Rows[0]["SinceRadiatedProg_Min_Progressive"].ToString();
                                TxtSinceTotal_Hr_Progressive.Text = ds.Tables[0].Rows[0]["SinceTotal_Hr_Progressive"].ToString();
                                TxtSinceTotal_Min_Progressive.Text = ds.Tables[0].Rows[0]["SinceTotal_Min_Progressive"].ToString();

                                TxtBDPwr_Hr_Current.Text = ds.Tables[0].Rows[0]["BDPwr_Hr_Current"].ToString();
                                TxtBDPwr_Min_Current.Text = ds.Tables[0].Rows[0]["BDPwr_Min_Current"].ToString();
                                TxtBDPwr_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDPwr_Hr_Progressive"].ToString();
                                TxtBDPwr_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDPwr_Min_Progressive"].ToString();

                                TxtBDGear_Hr_Current.Text = ds.Tables[0].Rows[0]["BDGear_Hr_Current"].ToString();
                                TxtBDGear_Min_Current.Text = ds.Tables[0].Rows[0]["BDGear_Min_Current"].ToString();
                                TxtBDGear_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDGear_Hr_Progressive"].ToString();
                                TxtBDGear_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDGear_Min_Progressive"].ToString();

                                TxtBDOtherCause_Hr_Current.Text = ds.Tables[0].Rows[0]["BDOtherCause_Hr_Current"].ToString();
                                TxtBDOtherCause_Min_Current.Text = ds.Tables[0].Rows[0]["BDOtherCause_Min_Current"].ToString();
                                TxtBDOtherCause_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BDOtherCause_Hr_Progressive"].ToString();
                                TxtBDOtherCause_Min_Progressive.Text = ds.Tables[0].Rows[0]["BDOtherCause_Min_Progressive"].ToString();

                                TxtBD_Total_Hr_Current.Text = ds.Tables[0].Rows[0]["BD_Total_Hr_Current"].ToString();
                                TxtBD_Total_Min_Current.Text = ds.Tables[0].Rows[0]["BD_Total_Min_Current"].ToString();
                                TxtBD_Total_Hr_Progressive.Text = ds.Tables[0].Rows[0]["BD_Total_Hr_Progressive"].ToString();
                                TxtBD_Total_Min_Progressive.Text = ds.Tables[0].Rows[0]["BD_Total_Min_Progressive"].ToString();

                                TxtAdditional_Information.Text = ds.Tables[0].Rows[0]["Additional_Information"].ToString();
                                TxtActiontakenStation.Text = ds.Tables[0].Rows[0]["ActiontakenStation"].ToString();
                                TxtActiontakenZonalOffc.Text = ds.Tables[0].Rows[0]["ActiontakenZonalOffc"].ToString();
                                TxtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                                
                                ViewState["Slno"] = ds.Tables[0].Rows[0]["Slno"].ToString();

                            }

                        }
                    }
                }

            }

        }
        protected void Griddsng_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Griddsng.EditIndex = e.NewEditIndex;
            filldsng();
            fullgridview();
        }
        protected void Griddsng_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Griddsng.PageIndex = e.NewPageIndex;
            filldsng();
            fullgridview();
        }

        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            //--- Get primary key value of the selected record from viewstate.

            if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0)
            {

                int Slno = Convert.ToInt32(ViewState["Slno"]);

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "DSNGUPDATE");
                        cmd.Parameters.AddWithValue("@pSlno", Slno);
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@pHPARatedPwr", Txthparatedpwr.Text);
                        cmd.Parameters.AddWithValue("@pNormaluplinkPwr", Txtnormaluplinkpwr.Text);


                        cmd.Parameters.AddWithValue("@pTest_Hr_Current", TxtTest_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pTest_Min_Current", TxtTest_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pTest_Hr_Progressive", TxtTest_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pTest_Min_Progressive", TxtTest_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Current", TxtRadiatedProg_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Current", TxtRadiatedProg_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Hr_Progressive", TxtRadiatedProg_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pRadiatedProg_Min_Progressive", TxtRadiatedProg_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pTotal_Hr_Current", TxtTotal_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Min_Current", TxtTotal_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Hr_Progrresive", TxtTotal_Hr_Progrresive.Text);
                        cmd.Parameters.AddWithValue("@pTotal_Min_Progressive", TxtTotal_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pSincetest_Hr_Progressive", TxtSincetest_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSincetest_Min_Progressive", TxtSincetest_Min_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Hr_Progressive", TxtSinceRadiatedProg_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceRadiatedProg_Min_Progressive", TxtSinceRadiatedProg_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pSinceTotal_Hr_Progressive", TxtSinceTotal_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pSinceTotal_Min_Progressive", TxtSinceTotal_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDPwr_Hr_Current", TxtBDPwr_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Min_Current", TxtBDPwr_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Hr_Progressive", TxtBDPwr_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDPwr_Min_Progressive", TxtBDPwr_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDGear_Hr_Current", TxtBDGear_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Min_Current", TxtBDGear_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Hr_Progressive", TxtBDGear_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDGear_Min_Progressive", TxtBDGear_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Current", TxtBDOtherCause_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Current", TxtBDOtherCause_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Hr_Progressive", TxtBDOtherCause_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBDOtherCause_Min_Progressive", TxtBDOtherCause_Min_Progressive.Text);

                        cmd.Parameters.AddWithValue("@pBD_Total_Hr_Current", TxtBD_Total_Hr_Current.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Min_Current", TxtBD_Total_Min_Current.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Hr_Progressive", TxtBD_Total_Hr_Progressive.Text);
                        cmd.Parameters.AddWithValue("@pBD_Total_Min_Progressive", TxtBD_Total_Min_Progressive.Text);



                        cmd.Parameters.AddWithValue("@pActiontakenStation", TxtActiontakenStation.Text);
                        cmd.Parameters.AddWithValue("@pActiontakenZonalOffc", TxtActiontakenZonalOffc.Text);
                        cmd.Parameters.AddWithValue("@pAdditional_Information", TxtAdditional_Information.Text);
                        cmd.Parameters.AddWithValue("@pRemarks", TxtRemarks.Text);

                        conn.Open();
                        //int t = cmd.ExecuteNonQuery();
                        //if(t>0)
                        //{
                        cmd.ExecuteNonQuery();

                        Griddsng.EditIndex = -1;
                        filldsng();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('DSNG Details Updated Succsessfully...'); window.location='" +
                      Request.ApplicationPath + "PNET_Reports/DSNGEntry.aspx';", true);
                    }

                    conn.Close();
                    Btnsubmit.Visible = true;
                    Btnupdate.Visible = false;
                    Btncancel.Visible = false;

                }
            }
            fullgridview();
        }

        protected void Griddsng_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSno = Griddsng.Rows[e.RowIndex].FindControl("LblSno") as Label;
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DSNG", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "DSNGDELETE");
                    cmd.Parameters.AddWithValue("@pSlno", LblSno.Text);
                    conn.Open();
                    //int t = cmd.ExecuteNonQuery();
                    //if (t > 0)
                    //{
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                        "alert('DSNG Details Deleted Successfully.'); window.location='" +
                        Request.ApplicationPath + "PNET_Reports/DSNGEntry.aspx';", true);

                    filldsng();
                    conn.Close();

                }

            }
            fullgridview();
        }
      

    }

        

    }
