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
    public partial class StudiosetupEntry : System.Web.UI.Page
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
                        fillyear();
                        fillmonth();


                        fillLoginstation();
                        fillzones();
                        BindZSS();
                        bindallstate();
                        ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                        ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));


                        fillnewequipmentreceived();
                        fillACplant();
                        fillUPS();
                        fillDefectiveEquipment();
                        bindacplantstatus();

                        ddlstate.Items.Insert(0, new ListItem("---Select State---", "0"));
                        ddlstation.Items.Insert(0, new ListItem("---Select Station---", "0"));


                        lblloginstation.InnerText = Session["UserName"].ToString();

                        Btnsubmit.Visible = true;
                        Btnupdate.Visible = false;
                        Btncancel.Visible = false;


                        fillstudiosetup();

                    }
                    else
                    {
                        

                        Response.Redirect("../Login.aspx");
                    }
                    }
                    catch (Exception ex)
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
        private void fullgridview()
        {
            fillnewequipmentreceived();
            fillACplant();
            fillUPS();
            fillDefectiveEquipment();
            bindacplantstatus();
        }
        private void fillnewequipmentreceived()
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
                        cmd.Parameters.AddWithValue("@pReport_Id", "1001");



                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridnewequiprec.DataSource = ds;
                                Gridnewequiprec.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridnewequiprec.DataSource = ds;
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
                        cmd.Parameters.AddWithValue("@pReport_Id", "1001");


                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Gridnewequiprec.DataSource = ds;
                                Gridnewequiprec.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                Gridnewequiprec.DataSource = ds;
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
           fullgridview();
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
           fullgridview();
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
        protected void SaveRecord(object sender, EventArgs e)
        {
            RadioButtonList Radioequiptypeins = Gridnewequiprec.FooterRow.FindControl("Radioequiptypeins") as RadioButtonList;
            TextBox TxtEquipment_NMins = Gridnewequiprec.FooterRow.FindControl("TxtEquipment_NMins") as TextBox;
            TextBox TxtEquipment_Performanceins = Gridnewequiprec.FooterRow.FindControl("TxtEquipment_Performanceins") as TextBox;
            TextBox TxtDt_Installtionins = Gridnewequiprec.FooterRow.FindControl("TxtDt_Installtionins") as TextBox;
            TextBox TxtEquip_Ratingins = Gridnewequiprec.FooterRow.FindControl("TxtEquip_Ratingins") as TextBox;
            TextBox TxtEquip_Makeins = Gridnewequiprec.FooterRow.FindControl("TxtEquip_Makeins") as TextBox;
            TextBox TxtEquip_Modelins = Gridnewequiprec.FooterRow.FindControl("TxtEquip_Modelins") as TextBox;
            TextBox TxtEquip_Serialnoins = Gridnewequiprec.FooterRow.FindControl("TxtEquip_Serialnoins") as TextBox;
            TextBox TxtEquip_Statusins = Gridnewequiprec.FooterRow.FindControl("TxtEquip_Statusins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {
                    //DateTime dtinstallins = Convert.ToDateTime(TxtDt_Installtionins.Text);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "neins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pEquip_Type", Radioequiptypeins.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_NM", TxtEquipment_NMins.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_Performance", TxtEquipment_Performanceins.Text);
                    cmd.Parameters.Add("@pDt_Installtion", SqlDbType.Date).Value = DateTime.ParseExact(TxtDt_Installtionins.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    //cmd.Parameters.AddWithValue("@pDt_Installtion", dtinstallins.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@pEquip_Rating", TxtEquip_Ratingins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Make", TxtEquip_Makeins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Model", TxtEquip_Modelins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Serialno", TxtEquip_Serialnoins.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Status", TxtEquip_Statusins.Text);
                    cmd.Parameters.AddWithValue("@pReport_Id", "1001");


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillnewequipmentreceived();
                    conn.Close();
                }
            }
            fullgridview();


        }
        protected void Gridnewequiprec_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            Gridnewequiprec.EditIndex = e.NewEditIndex;
            fillnewequipmentreceived();
            fullgridview();
        }

        protected void Gridnewequiprec_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && Gridnewequiprec.EditIndex == e.Row.RowIndex)
            {
                RadioButtonList Radioequiptypeupdt = (RadioButtonList)e.Row.FindControl("Radioequiptypeupdt");
                HiddenField hdnequiptypeupdt = (HiddenField)e.Row.FindControl("hdnequiptypeupdt");
                Radioequiptypeupdt.Items.FindByText(hdnequiptypeupdt.Value).Selected = true;



            }
        }

        protected void Gridnewequiprec_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblEquipmentID = Gridnewequiprec.Rows[e.RowIndex].FindControl("LblEquipmentID") as Label;
            RadioButtonList Radioequiptypeupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("Radioequiptypeupdt") as RadioButtonList;
            TextBox TxtEquipment_NMupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquipment_NMupdt") as TextBox;
            TextBox TxtEquipment_Performanceupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquipment_Performanceupdt") as TextBox;
            TextBox TxtDt_Installtionupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtDt_Installtionupdt") as TextBox;
            TextBox TxtEquip_Ratingupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquip_Ratingupdt") as TextBox;
            TextBox TxtEquip_Makeupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquip_Makeupdt") as TextBox;
            TextBox TxtEquip_Modelupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquip_Modelupdt") as TextBox;
            TextBox TxtEquip_Serialnoupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquip_Serialnoupdt") as TextBox;
            TextBox TxtEquip_Statusupdt = Gridnewequiprec.Rows[e.RowIndex].FindControl("TxtEquip_Statusupdt") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {

                    //DateTime dtinstall = Convert.ToDateTime(TxtDt_Installtionupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtnerec");
                    cmd.Parameters.AddWithValue("@pEquipmentID", LblEquipmentID.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Type", Radioequiptypeupdt.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_NM", TxtEquipment_NMupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquipment_Performance", TxtEquipment_Performanceupdt.Text);
                    //cmd.Parameters.AddWithValue("@pDt_Installtion", dtinstall.ToString("yyyy-MM-dd"));
                    cmd.Parameters.Add("@pDt_Installtion", SqlDbType.Date).Value = DateTime.ParseExact(TxtDt_Installtionupdt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@pEquip_Rating", TxtEquip_Ratingupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Make", TxtEquip_Makeupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Model", TxtEquip_Modelupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Serialno", TxtEquip_Serialnoupdt.Text);
                    cmd.Parameters.AddWithValue("@pEquip_Status", TxtEquip_Statusupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Gridnewequiprec.EditIndex = -1;
                    fillnewequipmentreceived();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void Gridnewequiprec_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridnewequiprec.EditIndex = -1;
            fillnewequipmentreceived();
            fullgridview();
        }
        protected void Gridnewequiprec_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblEquipmentID = Gridnewequiprec.Rows[e.RowIndex].FindControl("LblEquipmentID") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_NewEquipReceived", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "eqpdt");
                    cmd.Parameters.AddWithValue("@pEquipmentID", LblEquipmentID.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillnewequipmentreceived();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void SaveRecordacplant(object sender, EventArgs e)
        {

            TextBox TxtACPlantNMins = GridViewacplant.FooterRow.FindControl("TxtACPlantNMins") as TextBox;
            TextBox TxtACPlantCapacityins = GridViewacplant.FooterRow.FindControl("TxtACPlantCapacityins") as TextBox;
            TextBox TxtACPlantInstall_DTins = GridViewacplant.FooterRow.FindControl("TxtACPlantInstall_DTins") as TextBox;
            TextBox TxtACPlantCurrentHRins = GridViewacplant.FooterRow.FindControl("TxtACPlantCurrentHRins") as TextBox;
            TextBox TxtACPlantCurrentMinins = GridViewacplant.FooterRow.FindControl("TxtACPlantCurrentMinins") as TextBox;
            TextBox TxtACPlantProgHRins = GridViewacplant.FooterRow.FindControl("TxtACPlantProgHRins") as TextBox;
            TextBox TxtACPlantProgMinins = GridViewacplant.FooterRow.FindControl("TxtACPlantProgMinins") as TextBox;
            DropDownList ddlworkingACPlantStatus = GridViewacplant.FooterRow.FindControl("ddlworkingACPlantStatus") as DropDownList;
            TextBox TxtACPlantNotWorkReasonins = GridViewacplant.FooterRow.FindControl("TxtACPlantNotWorkReasonins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ACPLANT", conn))
                {
                    //DateTime dtinstallac = Convert.ToDateTime(TxtACPlantInstall_DTins.Text);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "acins");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@pACPlantNM", TxtACPlantNMins.Text);
                    cmd.Parameters.AddWithValue("@pACPlantCapacity", TxtACPlantCapacityins.Text);
                    //cmd.Parameters.AddWithValue("@pACPlantInstall_DT", dtinstallac.ToString("yyyy-MM-dd"));
                    cmd.Parameters.Add("@pACPlantInstall_DT", SqlDbType.Date).Value = DateTime.ParseExact(TxtACPlantInstall_DTins.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@pACPlantCurrentHR", TxtACPlantCurrentHRins.Text);

                    cmd.Parameters.AddWithValue("@pACPlantCurrentMin", TxtACPlantCurrentMinins.Text);
                    cmd.Parameters.AddWithValue("@pACPlantProgHR", TxtACPlantProgHRins.Text);
                    cmd.Parameters.AddWithValue("@pACPlantProgMin", TxtACPlantProgMinins.Text);
                    cmd.Parameters.AddWithValue("@pACPlantStatus", ddlworkingACPlantStatus.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pACPlantNotWorkReason", TxtACPlantNotWorkReasonins.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillACplant();
                    bindacplantstatus();
                    conn.Close();
                }
            }
            fullgridview();
        }

        private void fillACplant()
        {
            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ACPLANT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "acselect");
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
                                GridViewacplant.DataSource = ds;
                                GridViewacplant.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewacplant.DataSource = ds;
                                GridViewacplant.DataBind();
                                int columnsCount = GridViewacplant.Columns.Count - 1;
                                GridViewacplant.Rows[0].Cells.Clear();
                                GridViewacplant.Rows[0].Cells.Add(new TableCell());
                                GridViewacplant.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewacplant.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewacplant.Rows[0].Cells[0].Font.Bold = true;
                                GridViewacplant.Rows[0].Cells[0].Font.Size = 10;
                                GridViewacplant.Rows[0].Cells[0].Text = "Currently there is no AC Plant Inserted.......";
                                GridViewacplant.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ACPLANT", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymnac");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());


                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                GridViewacplant.DataSource = ds;
                                GridViewacplant.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewacplant.DataSource = ds;
                                GridViewacplant.DataBind();
                                int columnsCount = GridViewacplant.Columns.Count - 1;
                                GridViewacplant.Rows[0].Cells.Clear();
                                GridViewacplant.Rows[0].Cells.Add(new TableCell());
                                GridViewacplant.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewacplant.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewacplant.Rows[0].Cells[0].Font.Bold = true;
                                GridViewacplant.Rows[0].Cells[0].Font.Size = 10;
                                GridViewacplant.Rows[0].Cells[0].Text = "Currently there is no AC Plant Inserted.......";
                                GridViewacplant.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            bindacplantstatus();

        }

        protected void GridViewacplant_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridViewacplant.EditIndex = e.NewEditIndex;
            fillACplant();
            fullgridview();
        }

        protected void GridViewacplant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridViewacplant.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlworkingACPlantStatusupdt = (DropDownList)e.Row.FindControl("ddlworkingACPlantStatusupdt");
                HiddenField hdnacplantupdt = (HiddenField)e.Row.FindControl("hdnacplantupdt");

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

                                ddlworkingACPlantStatusupdt.DataSource = ds;
                                ddlworkingACPlantStatusupdt.DataValueField = "WorkingStatus_ID";
                                ddlworkingACPlantStatusupdt.DataTextField = "WorkingStatus_NM";
                                ddlworkingACPlantStatusupdt.DataBind();
                                ddlworkingACPlantStatusupdt.Items.Insert(0, new ListItem("---Select Working Status---", "0"));
                                ddlworkingACPlantStatusupdt.Items.FindByText(hdnacplantupdt.Value).Selected = true;
                            }

                        }
                    }
                }




            }


        }
        private void bindacplantstatus()
        {

            DropDownList ddlworkingACPlantStatus = GridViewacplant.FooterRow.FindControl("ddlworkingACPlantStatus") as DropDownList;

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

                            ddlworkingACPlantStatus.DataSource = ds;
                            ddlworkingACPlantStatus.DataValueField = "WorkingStatus_ID";
                            ddlworkingACPlantStatus.DataTextField = "WorkingStatus_NM";
                            ddlworkingACPlantStatus.DataBind();
                            ddlworkingACPlantStatus.Items.Insert(0, new ListItem("---Select Working Status---", "0"));
                        }

                    }
                }
            }
        }

        protected void GridViewacplant_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            bindacplantstatus();
            Label LblACPlantID = GridViewacplant.Rows[e.RowIndex].FindControl("LblACPlantID") as Label;
            TextBox TxtACPlantNMupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantNMupdt") as TextBox;
            TextBox TxtACPlantCapacityupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantCapacityupdt") as TextBox;
            TextBox TxtACPlantInstall_DTupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantInstall_DTupdt") as TextBox;
            TextBox TxtACPlantCurrentHRupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantCurrentHRupdt") as TextBox;
            TextBox TxtACPlantCurrentMinupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantCurrentMinupdt") as TextBox;
            TextBox TxtACPlantProgHRupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantProgHRupdt") as TextBox;
            TextBox TxtACPlantProgMinupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantProgMinupdt") as TextBox;
            DropDownList ddlworkingACPlantStatusupdt = GridViewacplant.Rows[e.RowIndex].FindControl("ddlworkingACPlantStatusupdt") as DropDownList;
            TextBox TxtACPlantNotWorkReasonupdt = GridViewacplant.Rows[e.RowIndex].FindControl("TxtACPlantNotWorkReasonupdt") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ACPLANT", conn))
                {

                    //DateTime dtinstallacplsntupdt = Convert.ToDateTime(TxtACPlantInstall_DTupdt.Text);


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "upacp");
                    cmd.Parameters.AddWithValue("@pACPlantID", LblACPlantID.Text);
                    cmd.Parameters.AddWithValue("@pACPlantNM", TxtACPlantNMupdt.Text);
                    cmd.Parameters.AddWithValue("@pACPlantCapacity", TxtACPlantCapacityupdt.Text);
                    //cmd.Parameters.AddWithValue("@pACPlantInstall_DT", dtinstallacplsntupdt.ToString("yyyy-MM-dd"));
                    cmd.Parameters.Add("@pACPlantInstall_DT", SqlDbType.Date).Value = DateTime.ParseExact(TxtACPlantInstall_DTupdt.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    cmd.Parameters.AddWithValue("@pACPlantCurrentHR", TxtACPlantCurrentHRupdt.Text);

                    cmd.Parameters.AddWithValue("@pACPlantCurrentMin", TxtACPlantCurrentMinupdt.Text);
                    cmd.Parameters.AddWithValue("@pACPlantProgHR", TxtACPlantProgHRupdt.Text);
                    cmd.Parameters.AddWithValue("@pACPlantProgMin", TxtACPlantProgMinupdt.Text);
                    cmd.Parameters.AddWithValue("@pACPlantStatus", ddlworkingACPlantStatusupdt.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pACPlantNotWorkReason", TxtACPlantNotWorkReasonupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    GridViewacplant.EditIndex = -1;
                    fillACplant();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void GridViewacplant_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewacplant.EditIndex = -1;
            fillACplant();
            fullgridview();
        }
        protected void GridViewacplant_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblACPlantID = GridViewacplant.Rows[e.RowIndex].FindControl("LblACPlantID") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_ACPLANT", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "dacp");
                    cmd.Parameters.AddWithValue("@pACPlantID", LblACPlantID.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillACplant();
                    bindacplantstatus();
                    conn.Close();
                }

            }
            fullgridview();
        }

        protected void ddlworkingACPlantStatusupdt_SelectedIndexChanged(object sender, EventArgs e)
        {            
            DropDownList ddlworkstatusACP = (DropDownList)sender;
            GridViewRow gvRow = (GridViewRow)ddlworkstatusACP.Parent.Parent;

            DropDownList ddlworkingACPlantStatusupdt = (DropDownList)gvRow.FindControl("ddlworkingACPlantStatusupdt");
            TextBox TxtACPlantNotWorkReasonupdt = (TextBox)gvRow.FindControl("TxtACPlantNotWorkReasonupdt");

            if (ddlworkingACPlantStatusupdt.SelectedValue.ToString() == "02")
            {
                TxtACPlantNotWorkReasonupdt.Visible = true;
            }
            else
            {
                TxtACPlantNotWorkReasonupdt.Visible = false;
            }

        }

        protected void SaveRecordups(object sender, EventArgs e)
        {

            TextBox TxtUPS_NMins = GridViewUPS.FooterRow.FindControl("TxtUPS_NMins") as TextBox;
            TextBox TxtUPS_Capacityins = GridViewUPS.FooterRow.FindControl("TxtUPS_Capacityins") as TextBox;
            TextBox TxtUPS_Statusins = GridViewUPS.FooterRow.FindControl("TxtUPS_Statusins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_UPS", conn))
                {


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "upsinsert");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@pUPS_NM", TxtUPS_NMins.Text);
                    cmd.Parameters.AddWithValue("@pUPS_Capacity", TxtUPS_Capacityins.Text);
                    cmd.Parameters.AddWithValue("@pUPS_Status", TxtUPS_Statusins.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillUPS();
                    conn.Close();
                }
            }
           fullgridview();
        }
        private void fillUPS()
        {
            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_UPS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "upsselect");
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
                                GridViewUPS.DataSource = ds;
                                GridViewUPS.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewUPS.DataSource = ds;
                                GridViewUPS.DataBind();
                                int columnsCount = GridViewUPS.Columns.Count - 1;
                                GridViewUPS.Rows[0].Cells.Clear();
                                GridViewUPS.Rows[0].Cells.Add(new TableCell());
                                GridViewUPS.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewUPS.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewUPS.Rows[0].Cells[0].Font.Bold = true;
                                GridViewUPS.Rows[0].Cells[0].Font.Size = 10;
                                GridViewUPS.Rows[0].Cells[0].Text = "Currently there is no UPS Inserted.......";
                                GridViewUPS.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_UPS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymnullups");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                GridViewUPS.DataSource = ds;
                                GridViewUPS.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewUPS.DataSource = ds;
                                GridViewUPS.DataBind();
                                int columnsCount = GridViewUPS.Columns.Count - 1;
                                GridViewUPS.Rows[0].Cells.Clear();
                                GridViewUPS.Rows[0].Cells.Add(new TableCell());
                                GridViewUPS.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewUPS.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewUPS.Rows[0].Cells[0].Font.Bold = true;
                                GridViewUPS.Rows[0].Cells[0].Font.Size = 10;
                                GridViewUPS.Rows[0].Cells[0].Text = "Currently there is no UPS Inserted.......";
                                GridViewUPS.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void GridViewUPS_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridViewUPS.EditIndex = e.NewEditIndex;
            fillUPS();
           fullgridview();

        }

        protected void GridViewUPS_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblUPSID = GridViewUPS.Rows[e.RowIndex].FindControl("LblUPSID") as Label;
            TextBox TxtUPS_NMupdt = GridViewUPS.Rows[e.RowIndex].FindControl("TxtUPS_NMupdt") as TextBox;
            TextBox TxtUPS_Capacityupdt = GridViewUPS.Rows[e.RowIndex].FindControl("TxtUPS_Capacityupdt") as TextBox;
            TextBox TxtUPS_Statusupdt = GridViewUPS.Rows[e.RowIndex].FindControl("TxtUPS_Statusupdt") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_UPS", conn))
                {


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "updtups");
                    cmd.Parameters.AddWithValue("@pUPSID", LblUPSID.Text);
                    cmd.Parameters.AddWithValue("@pUPS_NM", TxtUPS_NMupdt.Text);
                    cmd.Parameters.AddWithValue("@pUPS_Capacity", TxtUPS_Capacityupdt.Text);
                    cmd.Parameters.AddWithValue("@pUPS_Status", TxtUPS_Statusupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    GridViewUPS.EditIndex = -1;
                    fillUPS();
                    conn.Close();
                }
            }
           fullgridview();

        }
        protected void GridViewUPS_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUPS.EditIndex = -1;
            fillUPS();
           fullgridview();

        }

        protected void GridViewUPS_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblUPSID = GridViewUPS.Rows[e.RowIndex].FindControl("LblUPSID") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_UPS", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "dups");
                    cmd.Parameters.AddWithValue("@pUPSID", LblUPSID.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillUPS();
                    conn.Close();
                }
            }
           fullgridview();

        }

        protected void TxtStudioutilizn_Recordinghrs_TextChanged(object sender, EventArgs e)
        {
            Bindhrrecording();
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                 TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
            if (TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "" && TxtStudioutilizn_Transmissionhrs.Text != "" && TxtStudioutilizn_Transmissionmin.Text != ""
              && TxtStudioutilizn_Shifthrs.Text != "" && TxtStudioutilizn_Shiftmin.Text != "")
            {
                Bindperstudiotransreccurrent();
            }

           fullgridview();
        }
        private void Bindhrrecording()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "rechrcheck");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_RecordingProghrs.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "hrprorec");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Recordinghrs", TxtStudioutilizn_Recordinghrs.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_RecordingProghrs.Enabled = false;
                                        TxtStudioutilizn_RecordingProghrs.Text = ds1.Tables[0].Rows[0]["TotalHrsProgressiveRecording"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtStudioutilizn_Recordingmin_TextChanged(object sender, EventArgs e)
        {
            Bindminrecording();
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
           fullgridview();
        }

        private void Bindminrecording()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "ckmrec");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_RecordingProgmin.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "recminprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Recordingmin", TxtStudioutilizn_Recordingmin.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_RecordingProgmin.Enabled = false;
                                        TxtStudioutilizn_RecordingProgmin.Text = ds1.Tables[0].Rows[0]["TotalMinProgressiveRecording"].ToString();

                                    }
                                   


                                }

                                int strStudioutilizn_RecordingProgmin = Convert.ToInt32(TxtStudioutilizn_RecordingProgmin.Text);
                                int strStudioutilizn_RecordingProghrs = Convert.ToInt32(TxtStudioutilizn_RecordingProghrs.Text);
                                if (strStudioutilizn_RecordingProgmin >= 60)
                                {
                                    strStudioutilizn_RecordingProghrs = strStudioutilizn_RecordingProghrs + 1;
                                    strStudioutilizn_RecordingProgmin = strStudioutilizn_RecordingProgmin - 60;

                                    TxtStudioutilizn_RecordingProgmin.Text = strStudioutilizn_RecordingProgmin.ToString();
                                    TxtStudioutilizn_RecordingProghrs.Text = strStudioutilizn_RecordingProghrs.ToString();

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtStudioutilizn_Transmissionhrs_TextChanged(object sender, EventArgs e)
        {
            Bindhrtrans();
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
            if (TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "" && TxtStudioutilizn_Transmissionhrs.Text != "" && TxtStudioutilizn_Transmissionmin.Text != ""
              && TxtStudioutilizn_Shifthrs.Text != "" && TxtStudioutilizn_Shiftmin.Text != "")
            {
                Bindperstudiotransreccurrent();
            }
           fullgridview();
        }

        private void Bindhrtrans()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hchtrans");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_TransmissionProghrs.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "hrprotrans");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Transmissionhrs", TxtStudioutilizn_Transmissionhrs.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_TransmissionProghrs.Enabled = false;
                                        TxtStudioutilizn_TransmissionProghrs.Text = ds1.Tables[0].Rows[0]["TotalProgressivehrsTransmission"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void Bindhrstudiotransprog()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "hrschkstu");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_ShiftProghrs.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "progstuhr");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Shifthrs", TxtStudioutilizn_Shifthrs.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_ShiftProghrs.Enabled = false;
                                        TxtStudioutilizn_ShiftProghrs.Text = ds1.Tables[0].Rows[0]["proghrstudio"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtStudioutilizn_Transmissionmin_TextChanged(object sender, EventArgs e)
        {
            Bindmintrans();

            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
           fullgridview();
        }

        private void Bindmintrans()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "cktrmin");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_TransmissionProgmin.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "trnminpro");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Transmissionmin", TxtStudioutilizn_Transmissionmin.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_TransmissionProgmin.Enabled = false;
                                        TxtStudioutilizn_TransmissionProgmin.Text = ds1.Tables[0].Rows[0]["TotalProgressiveMinTransmission"].ToString();

                                    }

                                    int Studioutilizn_TransmissionProgmin = Convert.ToInt32(TxtStudioutilizn_TransmissionProgmin.Text);
                                    int Studioutilizn_TransmissionProghrs = Convert.ToInt32(TxtStudioutilizn_TransmissionProghrs.Text);
                                    if (Studioutilizn_TransmissionProgmin >= 60)
                                    {
                                        Studioutilizn_TransmissionProghrs = Studioutilizn_TransmissionProghrs + 1;
                                        Studioutilizn_TransmissionProgmin = Studioutilizn_TransmissionProgmin - 60;

                                        TxtStudioutilizn_TransmissionProgmin.Text = Studioutilizn_TransmissionProgmin.ToString();
                                        TxtStudioutilizn_TransmissionProghrs.Text = Studioutilizn_TransmissionProghrs.ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void Bindminstudiotransprog()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "minchkstud");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtStudioutilizn_ShiftProgmin.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "minstuprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pStudioutilizn_Shiftmin", TxtStudioutilizn_Shiftmin.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtStudioutilizn_ShiftProgmin.Enabled = false;
                                        TxtStudioutilizn_ShiftProgmin.Text = ds1.Tables[0].Rows[0]["progminstudio"].ToString();

                                    }

                                    int Studioutilizn_ShiftProgmin = Convert.ToInt32(TxtStudioutilizn_ShiftProgmin.Text);
                                    int Studioutilizn_ShiftProghrs = Convert.ToInt32(TxtStudioutilizn_ShiftProghrs.Text);
                                    if (Studioutilizn_ShiftProgmin >= 60)
                                    {
                                        Studioutilizn_ShiftProghrs = Studioutilizn_ShiftProghrs + 1;
                                        Studioutilizn_ShiftProgmin = Studioutilizn_ShiftProgmin - 60;

                                        TxtStudioutilizn_ShiftProgmin.Text = Studioutilizn_ShiftProgmin.ToString();
                                        TxtStudioutilizn_ShiftProghrs.Text = Studioutilizn_ShiftProghrs.ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        //private void Bindhrsstudiotransrecprog()
        //{
        //    using (SqlConnection conn = new SqlConnection(con))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@pAction", "prhrstu");
        //            cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
        //            cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
        //            cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProghrs", TxtStudioutilizn_RecordingProghrs.Text);
        //            cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProghrs", TxtStudioutilizn_TransmissionProghrs.Text);

        //            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
        //            {
        //                DataSet ds = new DataSet();
        //                adap.Fill(ds);
        //                if (ds.Tables[0].Rows.Count > 0)
        //                {
        //                    TxtStudioutilizn_ShiftProghrs.Enabled = false;
        //                    TxtStudioutilizn_ShiftProghrs.Text = ds.Tables[0].Rows[0]["Totalproghrsshift"].ToString();

        //                }

        //            }
        //        }

        //    }
        //}

        //private void Bindminstudiotransrecprog()
        //{
        //    using (SqlConnection conn = new SqlConnection(con))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@pAction", "minprstu");
        //            cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
        //            cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
        //            cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProgmin", TxtStudioutilizn_RecordingProgmin.Text);
        //            cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProgmin", TxtStudioutilizn_TransmissionProgmin.Text);

        //            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
        //            {
        //                DataSet ds = new DataSet();
        //                adap.Fill(ds);
        //                if (ds.Tables[0].Rows.Count > 0)
        //                {
        //                    TxtStudioutilizn_ShiftProgmin.Enabled = false;
        //                    TxtStudioutilizn_ShiftProgmin.Text = ds.Tables[0].Rows[0]["Totalprogminshift"].ToString();

        //                }

        //            }
        //        }

        //    }
        //}

        //protected void TxtStudioutilizn_TransmissionProghrs_TextChanged(object sender, EventArgs e)
        //{


        //}

        protected void TxtStudioutilizn_TransmissionProgmin_TextChanged(object sender, EventArgs e)
        {

            // Bindminstudiotransrecprog();


        }
        private void Bindperstudiotransreccurrent()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "bpercur");

                    cmd.Parameters.AddWithValue("@pStudioutilizn_Recordinghrs", TxtStudioutilizn_Recordinghrs.Text);
                    cmd.Parameters.AddWithValue("@pStudioutilizn_Recordingmin", TxtStudioutilizn_Recordingmin.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            labbreccur.Text = ds.Tables[0].Rows[0]["breccurrent"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@pAction", "ccurper");

                    cmd1.Parameters.AddWithValue("@pStudioutilizn_Transmissionhrs", TxtStudioutilizn_Transmissionhrs.Text);
                    cmd1.Parameters.AddWithValue("@pStudioutilizn_Transmissionmin", TxtStudioutilizn_Transmissionmin.Text);

                    using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                    {
                        DataSet ds1 = new DataSet();
                        adap1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {

                            labctranscur.Text = ds1.Tables[0].Rows[0]["ctrancurrent"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd2 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@pAction", "acurper");

                    cmd2.Parameters.AddWithValue("@pStudioutilizn_Shifthrs", TxtStudioutilizn_Shifthrs.Text);
                    cmd2.Parameters.AddWithValue("@pStudioutilizn_Shiftmin", TxtStudioutilizn_Shiftmin.Text);

                    using (SqlDataAdapter adap2 = new SqlDataAdapter(cmd2))
                    {
                        DataSet ds2 = new DataSet();
                        adap2.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {

                            labashitcur.Text = ds2.Tables[0].Rows[0]["aperrectrancurrent"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd3 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Parameters.AddWithValue("@pAction", "perabc");

                    cmd3.Parameters.AddWithValue("@pbreccurrent", labbreccur.Text);
                    cmd3.Parameters.AddWithValue("@pctrancurrent", labctranscur.Text);
                    cmd3.Parameters.AddWithValue("@paperrectrancurrent", labashitcur.Text);
                    decimal labAcur = Convert.ToDecimal(labashitcur.Text);
                   
                    if (labAcur>=1)
                    {


                        using (SqlDataAdapter adap3 = new SqlDataAdapter(cmd3))
                        {
                            DataSet ds3 = new DataSet();
                            adap3.Fill(ds3);
                            if (ds3.Tables[0].Rows.Count > 0)
                            {
                                labbreccur.Visible = false;
                                labctranscur.Visible = false;
                                labashitcur.Visible = false;
                                lblstudioutilcurrent.Text = ds3.Tables[0].Rows[0]["Studioutilizn_Record_Trans_current"].ToString();

                            }

                        }
                    }
                    else
                    {
                        labbreccur.Visible = false;
                        labctranscur.Visible = false;
                        labashitcur.Visible = false;
                        //Response.Write("<script>alert('Studio Shift Cannot be 0 or less from Recording and Transmission')</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('Studio Shift Cannot be 0 or less from Recording and Transmission');", true);
                        TxtStudioutilizn_Shifthrs.Text = "";
                        TxtStudioutilizn_Shiftmin.Text = "";
                        labashitcur.Text = "";
                    }

                }
            }
        }

        private void Bindperstudiotransrecprog()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "progbrec");

                    cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProghrs", TxtStudioutilizn_RecordingProghrs.Text);
                    cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProgmin", TxtStudioutilizn_RecordingProgmin.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            labbrecprog.Text = ds.Tables[0].Rows[0]["brecprog"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@pAction", "trancprog");

                    cmd1.Parameters.AddWithValue("@pStudioutilizn_TransmissionProghrs", TxtStudioutilizn_TransmissionProghrs.Text);
                    cmd1.Parameters.AddWithValue("@pStudioutilizn_TransmissionProgmin", TxtStudioutilizn_TransmissionProgmin.Text);

                    using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                    {
                        DataSet ds1 = new DataSet();
                        adap1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {

                            labctransprog.Text = ds1.Tables[0].Rows[0]["ctranprog"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd2 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@pAction", "shitaprog");

                    cmd2.Parameters.AddWithValue("@pStudioutilizn_ShiftProghrs", TxtStudioutilizn_ShiftProghrs.Text);
                    cmd2.Parameters.AddWithValue("@pStudioutilizn_ShiftProgmin", TxtStudioutilizn_ShiftProgmin.Text);

                    using (SqlDataAdapter adap2 = new SqlDataAdapter(cmd2))
                    {
                        DataSet ds2 = new DataSet();
                        adap2.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {

                            labashitprog.Text = ds2.Tables[0].Rows[0]["aperrectranprog"].ToString();

                        }

                    }
                }
                using (SqlCommand cmd3 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Parameters.AddWithValue("@pAction", "progperabc");

                    cmd3.Parameters.AddWithValue("@pbrecprog", labbrecprog.Text);
                    cmd3.Parameters.AddWithValue("@pctranprog", labctransprog.Text);
                    cmd3.Parameters.AddWithValue("@paperrectranprog", labashitprog.Text);

                     decimal labAprog = Convert.ToDecimal(labashitprog.Text);

                     if (labAprog >= 1)
                     {


                         using (SqlDataAdapter adap3 = new SqlDataAdapter(cmd3))
                         {
                             DataSet ds3 = new DataSet();
                             adap3.Fill(ds3);
                             if (ds3.Tables[0].Rows.Count > 0)
                             {
                                 labbrecprog.Visible = false;
                                 labctransprog.Visible = false;
                                 labashitprog.Visible = false;
                                 lblstudioutilprogressive.Text = ds3.Tables[0].Rows[0]["Studioutilizn_Record_Trans_prog"].ToString();

                             }

                         }
                     }
                     else
                     {
                         labbrecprog.Visible = false;
                         labctransprog.Visible = false;
                         labashitprog.Visible = false;
                         ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                           "alert('Studio Shift Progressive Cannot be 0 or less from Recording and Transmission Propgressive');", true);
                          TxtStudioutilizn_ShiftProghrs.Text= "";
                          TxtStudioutilizn_ShiftProgmin.Text = "";
                         labashitprog.Text = "";
                     }
                }
            }
        }

        protected void TxtDeputiNoofcov_LiveCurrent_TextChanged(object sender, EventArgs e)
        {
            Bindliveprogcoverages();
            if (TxtDeputiNoofcov_LiveCurrent.Text != "" && TxtDeputiNoofcov_RECCurrent.Text != "")
            {
                Bindtotalcoveragescurrent();
            }
           fullgridview();
        }
        private void Bindliveprogcoverages()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "chklivecov");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtDeputiNoofcov_ProgLive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "lcovprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                if (TxtDeputiNoofcov_LiveCurrent.Text == "")
                                {
                                    TxtDeputiNoofcov_LiveCurrent.Text = "0.00";
                                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
                                }
                                else
                                {
                                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
                                }
                                

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtDeputiNoofcov_ProgLive.Enabled = false;
                                        TxtDeputiNoofcov_ProgLive.Text = ds1.Tables[0].Rows[0]["noofcoveragesliveprog"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        private void Bindrecprogcoverages()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "covchkrec");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtDeputiNoofcov_ProgREC.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "reccovprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                if (TxtDeputiNoofcov_RECCurrent.Text == "")
                                {
                                    TxtDeputiNoofcov_RECCurrent.Text = "0.00";
                                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);
                                }
                                else
                                {
                                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);
                                }
                                


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtDeputiNoofcov_ProgREC.Enabled = false;
                                        TxtDeputiNoofcov_ProgREC.Text = ds1.Tables[0].Rows[0]["noofcoveragesrecprog"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtDeputiNoofcov_RECCurrent_TextChanged(object sender, EventArgs e)
        {
            Bindrecprogcoverages();
            if (TxtDeputiNoofcov_LiveCurrent.Text != "" && TxtDeputiNoofcov_RECCurrent.Text != "")
            {
                Bindtotalcoveragescurrent();
            }
           fullgridview();
        }


        private void Bindtotalcoveragescurrent()
        {

            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "tocurcov");

                    cmd.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
                    cmd.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtDeputiNoofcov_TotalCurrent.Enabled = false;
                            TxtDeputiNoofcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["Totalcurrentcoverages"].ToString();

                        }
                    }

                }
            }
        }
        private void Bindtotalcoveragesprog()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@pAction", "prtocov");

                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_ProgLive", TxtDeputiNoofcov_ProgLive.Text);
                    cmd1.Parameters.AddWithValue("@pDeputiNoofcov_ProgREC", TxtDeputiNoofcov_ProgREC.Text);

                    using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                    {
                        DataSet ds1 = new DataSet();
                        adap1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            TxtDeputiNoofcov_ProgTotal.Enabled = false;
                            TxtDeputiNoofcov_ProgTotal.Text = ds1.Tables[0].Rows[0]["Totalprogcoverages"].ToString();

                        }

                    }
                }

            }

        }

        protected void TxtDeputiNoofcov_ProgREC_TextChanged(object sender, EventArgs e)
        {
            if (TxtDeputiNoofcov_ProgLive.Text != "" && TxtDeputiNoofcov_ProgREC.Text != "")
            {
                Bindtotalcoveragesprog();
            }
           fullgridview();
        }



        protected void TxtDeputiActualcov_LiveCurrent_TextChanged(object sender, EventArgs e)
        {
            Bindliveprogactualcoverages();
            if (TxtDeputiActualcov_LiveCurrent.Text != "" && TxtDeputiActualcov_RECCurrent.Text != "")
            {
                Bindtotalactualcoveragescurrent();
            }
           fullgridview();
        }


        private void Bindliveprogactualcoverages()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "actchklive");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtDeputiActualcov_ProgLive.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "laccovp");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                if (TxtDeputiActualcov_LiveCurrent.Text == "")
                                {
                                    TxtDeputiActualcov_LiveCurrent.Text = "0.00";
                                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
                                }
                                else
                                {
                                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
                                }
                                


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtDeputiActualcov_ProgLive.Enabled = false;
                                        TxtDeputiActualcov_ProgLive.Text = ds1.Tables[0].Rows[0]["actualcoveragesliveprog"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }


        private void Bindrecprogactualcoverages()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "recactchek");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {

                            TxtDeputiActualcov_ProgREC.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "cactprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                if (TxtDeputiActualcov_RECCurrent.Text == "")
                                {
                                    TxtDeputiActualcov_RECCurrent.Text = "0.00";
                                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);
                                }
                                else
                                {
                                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);
                                }
                                


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtDeputiActualcov_ProgREC.Enabled = false;
                                        TxtDeputiActualcov_ProgREC.Text = ds1.Tables[0].Rows[0]["actualcoveragesrecprog"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtDeputiActualcov_RECCurrent_TextChanged(object sender, EventArgs e)
        {
            Bindrecprogactualcoverages();
            if (TxtDeputiActualcov_LiveCurrent.Text != "" && TxtDeputiActualcov_RECCurrent.Text != "")
            {
                Bindtotalactualcoveragescurrent();
            }
           fullgridview();
        }

        private void Bindtotalactualcoveragescurrent()
        {

            using (SqlConnection conn = new SqlConnection(con))
            {

                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "covtotcur");

                    cmd.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
                    cmd.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            TxtDeputiActualcov_TotalCurrent.Enabled = false;
                            TxtDeputiActualcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["Totalcurrentactualcoverages"].ToString();

                        }
                    }

                }
            }
        }
        private void Bindtotalactualcoveragesprog()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioDeploymentUtilization", conn))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@pAction", "progtotcov");

                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_ProgLive", TxtDeputiActualcov_ProgLive.Text);
                    cmd1.Parameters.AddWithValue("@pDeputiActualcov_ProgREC", TxtDeputiActualcov_ProgREC.Text);

                    using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                    {
                        DataSet ds1 = new DataSet();
                        adap1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            TxtDeputiActualcov_ProgTotal.Enabled = false;
                            TxtDeputiActualcov_ProgTotal.Text = ds1.Tables[0].Rows[0]["Totalprogactualcoverages"].ToString();

                        }

                    }
                }

            }
           

        }

        protected void TxtDeputiActualcov_ProgREC_TextChanged(object sender, EventArgs e)
        {
            if (TxtDeputiActualcov_ProgLive.Text != "" && TxtDeputiActualcov_ProgREC.Text != "")
            {
                Bindtotalactualcoveragesprog();
            }
           fullgridview();
        }

        protected void TxtStudioutilizn_Shifthrs_TextChanged(object sender, EventArgs e)
        {
            Bindhrstudiotransprog();
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text!="" &&
                 TxtStudioutilizn_TransmissionProgmin.Text!= "" && TxtStudioutilizn_ShiftProghrs.Text!="" && TxtStudioutilizn_ShiftProgmin.Text!="")
            {
                Bindperstudiotransrecprog();
            }
            if (TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "" && TxtStudioutilizn_Transmissionhrs.Text != "" && TxtStudioutilizn_Transmissionmin.Text != ""
              && TxtStudioutilizn_Shifthrs.Text != "" && TxtStudioutilizn_Shiftmin.Text != "")
            {
                Bindperstudiotransreccurrent();
            }
           fullgridview();
        }

        protected void TxtStudioutilizn_Shiftmin_TextChanged(object sender, EventArgs e)
        {
            Bindminstudiotransprog();
            if (TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "" && TxtStudioutilizn_Transmissionhrs.Text != "" && TxtStudioutilizn_Transmissionmin.Text!=""
                && TxtStudioutilizn_Shifthrs.Text != "" && TxtStudioutilizn_Shiftmin.Text!="")
            {
                Bindperstudiotransreccurrent();
            }
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                 TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
           fullgridview();
           
        }

        protected void TxtStudioutilizn_ShiftProgmin_TextChanged(object sender, EventArgs e)
        {
            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
           fullgridview();
        }

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0 && ddlzone.SelectedIndex > 0 && TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
                    {

                        //FileUploadMR.SaveAs(Server.MapPath("UploadedFiles\\") + FileUploadMR.FileName);

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pACTION", "STUDIOSETUPINSERT");
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());
                        //cmd.Parameters.AddWithValue("@pStation", ddlstationname.SelectedItem.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_Recordinghrs", TxtStudioutilizn_Recordinghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Recordingmin", TxtStudioutilizn_Recordingmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProghrs", TxtStudioutilizn_RecordingProghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProgmin", TxtStudioutilizn_RecordingProgmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionhrs", TxtStudioutilizn_Transmissionhrs.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionmin", TxtStudioutilizn_Transmissionmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProghrs", TxtStudioutilizn_TransmissionProghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProgmin", TxtStudioutilizn_TransmissionProgmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Shifthrs", TxtStudioutilizn_Shifthrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Shiftmin", TxtStudioutilizn_Shiftmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProghrs", TxtStudioutilizn_ShiftProghrs.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProgmin", TxtStudioutilizn_ShiftProgmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_current", lblstudioutilcurrent.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_prog", lblstudioutilprogressive.Text);

                        cmd.Parameters.AddWithValue("@pNoofOB_EFVVans", Txtnoofovefvvans.Text);

                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgLive", TxtDeputiNoofcov_ProgLive.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);

                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgREC", TxtDeputiNoofcov_ProgREC.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_TotalCurrent", TxtDeputiNoofcov_TotalCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgTotal", TxtDeputiNoofcov_ProgTotal.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgLive", TxtDeputiActualcov_ProgLive.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);

                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgREC", TxtDeputiActualcov_ProgREC.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_TotalCurrent", TxtDeputiActualcov_TotalCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgTotal", TxtDeputiActualcov_ProgTotal.Text);
                        cmd.Parameters.AddWithValue("@pAchvimpactivitiesmonth", TxtAchvimpactivitiesmonth.Text);

                        //Label LblEquipmentID = Gridnewequiprec.FooterRow.FindControl("LblEquipmentID") as Label;
                        //cmd.Parameters.AddWithValue("@pNewequiprecmonth", LblEquipmentID.Text);
                        //Label LblACPlantID = GridViewacplant.FooterRow.FindControl("LblACPlantID") as Label;
                        //cmd.Parameters.AddWithValue("@pACPlant", LblACPlantID.Text);
                        //Label LblUPSID = GridViewUPS.FooterRow.FindControl("LblUPSID") as Label;
                        //cmd.Parameters.AddWithValue("@pUPS", LblUPSID.Text);
                        //Label LblDefectEquipID = GridViewDefectiveEquipment.FooterRow.FindControl("LblDefectEquipID") as Label;
                        //cmd.Parameters.AddWithValue("@pDefectiveEquipment", LblDefectEquipID.Text);

                        cmd.Parameters.AddWithValue("@pRemarks", Txtremarks.Text);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('Studio Setup Details Added Successfully.'); window.location='" +
                            Request.ApplicationPath + "PNET_Reports/StudiosetupEntry.aspx';", true);
                        //fillhpt();
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

        //protected void Btnupdate_Click(object sender, EventArgs e)
        //{
        //    if (ddlyear.SelectedIndex > 0 && ddlmonth.SelectedIndex > 0 && ddlzone.SelectedIndex > 0 && TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "")
        //    {

        //        int Slno = Convert.ToInt32(ViewState["Slno"]);

        //        using (SqlConnection conn = new SqlConnection(con))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@pAction", "STUDIOSETUPUPDATE");
        //                cmd.Parameters.AddWithValue("@pSlno", Slno);
        //                cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
        //                cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
        //                cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
        //                cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
        //                cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());                        
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Recordinghrs", TxtStudioutilizn_Recordinghrs.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Recordingmin", TxtStudioutilizn_Recordingmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProghrs", TxtStudioutilizn_RecordingProghrs.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProgmin", TxtStudioutilizn_RecordingProgmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionhrs", TxtStudioutilizn_Transmissionhrs.Text);

        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionmin", TxtStudioutilizn_Transmissionmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProghrs", TxtStudioutilizn_TransmissionProghrs.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProgmin", TxtStudioutilizn_TransmissionProgmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Shifthrs", TxtStudioutilizn_Shifthrs.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Shiftmin", TxtStudioutilizn_Shiftmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProghrs", TxtStudioutilizn_ShiftProghrs.Text);

        //                cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProgmin", TxtStudioutilizn_ShiftProgmin.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_current", lblstudioutilcurrent.Text);
        //                cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_prog", lblstudioutilprogressive.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgLive", TxtDeputiNoofcov_ProgLive.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);

        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgREC", TxtDeputiNoofcov_ProgREC.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_TotalCurrent", TxtDeputiNoofcov_TotalCurrent.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgTotal", TxtDeputiNoofcov_ProgTotal.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgLive", TxtDeputiActualcov_ProgLive.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);

        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgREC", TxtDeputiActualcov_ProgREC.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_TotalCurrent", TxtDeputiActualcov_TotalCurrent.Text);
        //                cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgTotal", TxtDeputiActualcov_ProgTotal.Text);
        //                cmd.Parameters.AddWithValue("@pAchvimpactivitiesmonth", TxtAchvimpactivitiesmonth.Text);

        //                Label LblEquipmentID = Gridnewequiprec.FooterRow.FindControl("LblEquipmentID") as Label;
        //                cmd.Parameters.AddWithValue("@pNewequiprecmonth", LblEquipmentID.Text);
        //                Label LblACPlantID = GridViewacplant.FooterRow.FindControl("LblACPlantID") as Label;
        //                cmd.Parameters.AddWithValue("@pACPlant", LblACPlantID.Text);
        //                Label LblUPSID = GridViewUPS.FooterRow.FindControl("LblUPSID") as Label;
        //                cmd.Parameters.AddWithValue("@pUPS", LblUPSID.Text);
        //                Label LblDefectEquipID = GridViewDefectiveEquipment.FooterRow.FindControl("LblDefectEquipID") as Label;
        //                cmd.Parameters.AddWithValue("@pDefectiveEquipment", LblDefectEquipID.Text);
        //                cmd.Parameters.AddWithValue("@pRemarks", Txtremarks.Text);

        //                conn.Open();
                       
        //                cmd.ExecuteNonQuery();

        //                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
        //              "alert('Studio Setup Details Updated Succsessfully...'); window.location='" +
        //              Request.ApplicationPath + "PNET_Reports/StudiosetupEntry.aspx';", true);
        //            }

        //            conn.Close();
        //            Btnsubmit.Visible = true;
        //            Btnupdate.Visible = false;
        //            Btncancel.Visible = false;

        //        }
        //    }
        //}


        //Defective Equipment

        protected void SaveRecordDefectiveEquipment(object sender, EventArgs e)
        {

            TextBox TxtDefectEquipNMins = GridViewDefectiveEquipment.FooterRow.FindControl("TxtDefectEquipNMins") as TextBox;
            TextBox TxtDefectEquipProblemins = GridViewDefectiveEquipment.FooterRow.FindControl("TxtDefectEquipProblemins") as TextBox;
            TextBox TxtDefectEquipActionins = GridViewDefectiveEquipment.FooterRow.FindControl("TxtDefectEquipActionins") as TextBox;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn))
                {


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "insDE");
                    cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@pDefectEquipNM", TxtDefectEquipNMins.Text);
                    cmd.Parameters.AddWithValue("@pDefectEquipProblem", TxtDefectEquipProblemins.Text);
                    cmd.Parameters.AddWithValue("@pDefectEquipAction", TxtDefectEquipActionins.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillDefectiveEquipment();
                    conn.Close();
                }
            }
            fullgridview();
        }
        private void fillDefectiveEquipment()
        {
            if (ddlyear.SelectedValue.ToString() != "0" && ddlmonth.SelectedValue.ToString() != "0")
            {

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "selectDE");
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
                                GridViewDefectiveEquipment.DataSource = ds;
                                GridViewDefectiveEquipment.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewDefectiveEquipment.DataSource = ds;
                                GridViewDefectiveEquipment.DataBind();
                                int columnsCount = GridViewUPS.Columns.Count - 1;
                                GridViewDefectiveEquipment.Rows[0].Cells.Clear();
                                GridViewDefectiveEquipment.Rows[0].Cells.Add(new TableCell());
                                GridViewDefectiveEquipment.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Font.Bold = true;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Font.Size = 10;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Text = "Currently there is no Defective Equipment Inserted.......";
                                GridViewDefectiveEquipment.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "ymnulldef");
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                GridViewDefectiveEquipment.DataSource = ds;
                                GridViewDefectiveEquipment.DataBind();
                            }
                            else
                            {
                                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                                GridViewDefectiveEquipment.DataSource = ds;
                                GridViewDefectiveEquipment.DataBind();
                                int columnsCount = GridViewUPS.Columns.Count - 1;
                                GridViewDefectiveEquipment.Rows[0].Cells.Clear();
                                GridViewDefectiveEquipment.Rows[0].Cells.Add(new TableCell());
                                GridViewDefectiveEquipment.Rows[0].Cells[0].ColumnSpan = columnsCount;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Font.Bold = true;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Font.Size = 10;
                                GridViewDefectiveEquipment.Rows[0].Cells[0].Text = "Currently there is no Defective Equipment Inserted.......";
                                GridViewDefectiveEquipment.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                            }
                        }
                    }
                }
            }

        }

        protected void GridViewDefectiveEquipment_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridViewDefectiveEquipment.EditIndex = e.NewEditIndex;
            fillDefectiveEquipment();
            fullgridview();
        }

        protected void GridViewDefectiveEquipment_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label LblDefectEquipID = GridViewDefectiveEquipment.Rows[e.RowIndex].FindControl("LblDefectEquipID") as Label;
            TextBox TxtDefectEquipNMupdt = GridViewDefectiveEquipment.Rows[e.RowIndex].FindControl("TxtDefectEquipNMupdt") as TextBox;
            TextBox TxtDefectEquipProblemupdt = GridViewDefectiveEquipment.Rows[e.RowIndex].FindControl("TxtDefectEquipProblemupdt") as TextBox;
            TextBox TxtDefectEquipActionupdt = GridViewDefectiveEquipment.Rows[e.RowIndex].FindControl("TxtDefectEquipActionupdt") as TextBox;


            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn))
                {


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "upDE");
                    cmd.Parameters.AddWithValue("@pDefectEquipID", LblDefectEquipID.Text);
                    cmd.Parameters.AddWithValue("@pDefectEquipNM", TxtDefectEquipNMupdt.Text);
                    cmd.Parameters.AddWithValue("@pDefectEquipProblem", TxtDefectEquipProblemupdt.Text);
                    cmd.Parameters.AddWithValue("@pDefectEquipAction", TxtDefectEquipActionupdt.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    GridViewDefectiveEquipment.EditIndex = -1;
                    fillDefectiveEquipment();
                    conn.Close();
                }
            }
            fullgridview();
        }
        protected void GridViewDefectiveEquipment_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewDefectiveEquipment.EditIndex = -1;
            fillDefectiveEquipment();
            fullgridview();
        }

        protected void GridViewDefectiveEquipment_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblDefectEquipID = GridViewDefectiveEquipment.Rows[e.RowIndex].FindControl("LblDefectEquipID") as Label;

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_DefectiveEquipment", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "DEdel");
                    cmd.Parameters.AddWithValue("@pDefectEquipID", LblDefectEquipID.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    fillDefectiveEquipment();
                    conn.Close();
                }
            }
            fullgridview();
        }

        protected void ddlworkingACPlantStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlworkingACPlantStatus = GridViewacplant.FooterRow.FindControl("ddlworkingACPlantStatus") as DropDownList;
            TextBox TxtACPlantNotWorkReasonins = GridViewacplant.FooterRow.FindControl("TxtACPlantNotWorkReasonins") as TextBox;

            if (ddlworkingACPlantStatus.SelectedValue.ToString() == "02")
            {
                TxtACPlantNotWorkReasonins.Visible = true;
            }
            else
            {
                TxtACPlantNotWorkReasonins.Visible = false;
            }
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillnewequipmentreceived();
            fillACplant();
            fillUPS();
            fillDefectiveEquipment();
        }

        protected void ddlmonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillnewequipmentreceived();
            fillACplant();
            fillUPS();
            fillDefectiveEquipment();

            // Bind all Hr Min 

            Bindhrrecording();
            Bindminrecording();
            Bindhrtrans();
            Bindmintrans();
            Bindhrstudiotransprog();
            Bindminstudiotransprog();
            if (TxtStudioutilizn_Recordinghrs.Text != "" && TxtStudioutilizn_Recordingmin.Text != "" && TxtStudioutilizn_Transmissionhrs.Text != "" && TxtStudioutilizn_Transmissionmin.Text != ""
                && TxtStudioutilizn_Shifthrs.Text != "" && TxtStudioutilizn_Shiftmin.Text != "")
            {
                Bindperstudiotransreccurrent();
            }

            if (TxtStudioutilizn_RecordingProghrs.Text != "" && TxtStudioutilizn_RecordingProgmin.Text != "" && TxtStudioutilizn_TransmissionProghrs.Text != "" &&
                 TxtStudioutilizn_TransmissionProgmin.Text != "" && TxtStudioutilizn_ShiftProghrs.Text != "" && TxtStudioutilizn_ShiftProgmin.Text != "")
            {
                Bindperstudiotransrecprog();
            }
           

            // Bind all Deployment Utilization No of Coverage and Actual Coverage

            Bindliveprogcoverages();
            Bindrecprogcoverages();
            if (TxtDeputiNoofcov_ProgLive.Text != "" && TxtDeputiNoofcov_ProgREC.Text != "")
            {
                Bindtotalcoveragesprog();
            }
            if (TxtDeputiNoofcov_LiveCurrent.Text != "" && TxtDeputiNoofcov_RECCurrent.Text != "")
            {
                Bindtotalcoveragescurrent();
            }
           
          
            Bindliveprogactualcoverages();
            Bindrecprogactualcoverages();
            if (TxtDeputiActualcov_LiveCurrent.Text != "" && TxtDeputiActualcov_RECCurrent.Text != "")
            {
                Bindtotalactualcoveragescurrent();
            }

            if (TxtDeputiActualcov_ProgLive.Text != "" && TxtDeputiActualcov_ProgREC.Text != "")
            {
                Bindtotalactualcoveragesprog();
            }
         
            BindLastFilledStudio();
            //Bindhracplant();
            //Bindminacplant();
        }

        

        private void fillstudiosetup()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pACTION", "STUDIOSETUPSHOW");
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Gridstudiosetuprpt.DataSource = ds;
                            Gridstudiosetuprpt.DataBind();
                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            Gridstudiosetuprpt.DataSource = ds;
                            Gridstudiosetuprpt.DataBind();
                            int columnsCount = Gridstudiosetuprpt.Columns.Count - 1;
                            Gridstudiosetuprpt.Rows[0].Cells.Clear();
                            Gridstudiosetuprpt.Rows[0].Cells.Add(new TableCell());
                            Gridstudiosetuprpt.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            Gridstudiosetuprpt.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            Gridstudiosetuprpt.Rows[0].Cells[0].Font.Bold = true;
                            Gridstudiosetuprpt.Rows[0].Cells[0].Font.Size = 10;
                            Gridstudiosetuprpt.Rows[0].Cells[0].Text = "Currently there is no Studio Setup Entries........";
                            Gridstudiosetuprpt.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }



        }

        protected void Gridstudiosetuprpt_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
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

                                TxtStudioutilizn_Recordinghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Recordinghrs"].ToString();
                                TxtStudioutilizn_Recordingmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Recordingmin"].ToString();
                                TxtStudioutilizn_RecordingProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_RecordingProghrs"].ToString();
                                TxtStudioutilizn_RecordingProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_RecordingProgmin"].ToString();

                                TxtStudioutilizn_Transmissionhrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Transmissionhrs"].ToString();
                                TxtStudioutilizn_Transmissionmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Transmissionmin"].ToString();
                                TxtStudioutilizn_TransmissionProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_TransmissionProghrs"].ToString();
                                TxtStudioutilizn_TransmissionProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_TransmissionProgmin"].ToString();

                                TxtStudioutilizn_Shifthrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Shifthrs"].ToString();
                                TxtStudioutilizn_Shiftmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Shiftmin"].ToString();
                                TxtStudioutilizn_ShiftProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_ShiftProghrs"].ToString();
                                TxtStudioutilizn_ShiftProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_ShiftProgmin"].ToString();

                                lblstudioutilcurrent.Text = ds.Tables[0].Rows[0]["Studioutilizn_Record_Trans_current"].ToString();
                                lblstudioutilprogressive.Text = ds.Tables[0].Rows[0]["Studioutilizn_Record_Trans_prog"].ToString();

                                Txtnoofovefvvans.Text = ds.Tables[0].Rows[0]["NoofOB_EFVVans"].ToString();   
                                TxtDeputiNoofcov_LiveCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_LiveCurrent"].ToString();
                                TxtDeputiNoofcov_RECCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_RECCurrent"].ToString();
                                TxtDeputiNoofcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_TotalCurrent"].ToString();

                                TxtDeputiNoofcov_ProgLive.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgLive"].ToString();
                                TxtDeputiNoofcov_ProgREC.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgREC"].ToString();
                                TxtDeputiNoofcov_ProgTotal.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgTotal"].ToString();


                                TxtDeputiActualcov_LiveCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_LiveCurrent"].ToString();
                                TxtDeputiActualcov_RECCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_RECCurrent"].ToString();
                                TxtDeputiActualcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_TotalCurrent"].ToString();

                                TxtDeputiActualcov_ProgLive.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgLive"].ToString();
                                TxtDeputiActualcov_ProgREC.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgREC"].ToString();
                                TxtDeputiActualcov_ProgTotal.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgTotal"].ToString();

                                TxtAchvimpactivitiesmonth.Text = ds.Tables[0].Rows[0]["Achvimpactivitiesmonth"].ToString();

                                Txtremarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                                ViewState["Slno"] = ds.Tables[0].Rows[0]["Slno"].ToString();
                                
                            }

                        }
                    }
                }

            }

        }
        protected void Gridstudiosetuprpt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridstudiosetuprpt.EditIndex = e.NewEditIndex;
            fillstudiosetup();
            fullgridview();
        }
        protected void Gridstudiosetuprpt_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridstudiosetuprpt.PageIndex = e.NewPageIndex;
            fillstudiosetup();
            fullgridview();
        }
        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            //--- Get primary key value of the selected record from viewstate.

            if (ddlyear.SelectedIndex>0 && ddlmonth.SelectedIndex>0)
            {

                int Slno = Convert.ToInt32(ViewState["Slno"]);

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "STUDIOSETUPUPDATE");
                        cmd.Parameters.AddWithValue("@pSlno", Slno);
                        cmd.Parameters.AddWithValue("@pYear_ID", ddlyear.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pMonth_ID", ddlmonth.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@pStationID", ddlstation.SelectedValue.ToString());


                        cmd.Parameters.AddWithValue("@pStudioutilizn_Recordinghrs", TxtStudioutilizn_Recordinghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Recordingmin", TxtStudioutilizn_Recordingmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProghrs", TxtStudioutilizn_RecordingProghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_RecordingProgmin", TxtStudioutilizn_RecordingProgmin.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionhrs", TxtStudioutilizn_Transmissionhrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Transmissionmin", TxtStudioutilizn_Transmissionmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProghrs", TxtStudioutilizn_TransmissionProghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_TransmissionProgmin", TxtStudioutilizn_TransmissionProgmin.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_Shifthrs", TxtStudioutilizn_Shifthrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Shiftmin", TxtStudioutilizn_Shiftmin.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProghrs", TxtStudioutilizn_ShiftProghrs.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_ShiftProgmin", TxtStudioutilizn_ShiftProgmin.Text);

                        cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_current", lblstudioutilcurrent.Text);
                        cmd.Parameters.AddWithValue("@pStudioutilizn_Record_Trans_prog", lblstudioutilprogressive.Text);

                        cmd.Parameters.AddWithValue("@pNoofOB_EFVVans", Txtnoofovefvvans.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_LiveCurrent", TxtDeputiNoofcov_LiveCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_RECCurrent", TxtDeputiNoofcov_RECCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_TotalCurrent", TxtDeputiNoofcov_TotalCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgLive", TxtDeputiNoofcov_ProgLive.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgREC", TxtDeputiNoofcov_ProgREC.Text);
                        cmd.Parameters.AddWithValue("@pDeputiNoofcov_ProgTotal", TxtDeputiNoofcov_ProgTotal.Text);


                        cmd.Parameters.AddWithValue("@pDeputiActualcov_LiveCurrent", TxtDeputiActualcov_LiveCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_RECCurrent", TxtDeputiActualcov_RECCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_TotalCurrent", TxtDeputiActualcov_TotalCurrent.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgLive", TxtDeputiActualcov_ProgLive.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgREC", TxtDeputiActualcov_ProgREC.Text);
                        cmd.Parameters.AddWithValue("@pDeputiActualcov_ProgTotal", TxtDeputiActualcov_ProgTotal.Text);

                        cmd.Parameters.AddWithValue("@pAchvimpactivitiesmonth", TxtAchvimpactivitiesmonth.Text);

                        cmd.Parameters.AddWithValue("@pRemarks", Txtremarks.Text);
                        conn.Open();
                        //int t = cmd.ExecuteNonQuery();
                        //if(t>0)
                        //{
                        cmd.ExecuteNonQuery();

                        Gridstudiosetuprpt.EditIndex = -1;
                        fillstudiosetup();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('Studio Setup Details Updated Succsessfully...'); window.location='" +
                      Request.ApplicationPath + "PNET_Reports/StudiosetupEntry.aspx';", true);
                    }

                    conn.Close();
                    Btnsubmit.Visible = true;
                    Btnupdate.Visible = false;
                    Btncancel.Visible = false;

                }
            }
            fullgridview();
        }



        protected void Gridstudiosetuprpt_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label LblSno = Gridstudiosetuprpt.Rows[e.RowIndex].FindControl("LblSno") as Label;
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pAction", "StudiosetupDELETE");
                    cmd.Parameters.AddWithValue("@pSlno", LblSno.Text);
                    conn.Open();
                    //int t = cmd.ExecuteNonQuery();
                    //if (t > 0)
                    //{
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                        "alert('Studio Setup Details Deleted Successfully.'); window.location='" +
                        Request.ApplicationPath + "PNET_Reports/StudiosetupEntry.aspx';", true);

                    fillstudiosetup();
                    conn.Close();

                }

            }
            fullgridview();
        }


        //protected void Btncancel_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("StudiosetupEntry.aspx");
        //    fullgridview();

        //}

        protected void TxtACPlantCurrentHRupdt_TextChanged(object sender, EventArgs e)
        {
            Bindhracplant();
            //fullgridview();
        }
        private void Bindhracplant()
        {

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "achrck");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    //DropDownList ddlworkstatusACP = (DropDownList)sender;


                    //GridViewRow gvRow = (GridViewRow)ddlworkstatusACP.Parent.Parent;



                    GridViewRow row = GridViewacplant.Rows[GridViewacplant.EditIndex];
                    TextBox TxtACPlantProgHRupdt = (TextBox)row.FindControl("TxtACPlantProgHRupdt");
                    TextBox TxtACPlantCurrentHRupdt = (TextBox)row.FindControl("TxtACPlantCurrentHRupdt");
                   

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {                           
                                TxtACPlantProgHRupdt.Enabled = true;
                          
                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "progachr");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pACPlantCurrentHR", TxtACPlantCurrentHRupdt.Text);
                            
                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtACPlantProgHRupdt.Enabled = false;                                     
                                        TxtACPlantProgHRupdt.Text = ds1.Tables[0].Rows[0]["TotalHRProgressiveAC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtACPlantCurrentMinupdt_TextChanged(object sender, EventArgs e)
        {
            Bindminacplant();
            //fullgridview();
        }

        private void Bindminacplant()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {


                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "minacchk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                   // TextBox TxtACPlantNotWorkReasonupdt = (TextBox)gvRow.FindControl("TxtACPlantNotWorkReasonupdt");

                    GridViewRow row = GridViewacplant.Rows[GridViewacplant.EditIndex];
                    TextBox TxtACPlantProgMinupdt = (TextBox)row.FindControl("TxtACPlantProgMinupdt");
                    TextBox TxtACPlantCurrentMinupdt = (TextBox)row.FindControl("TxtACPlantCurrentMinupdt");

                    //TextBox TxtACPlantProgMinupdt = (TextBox)GridViewacplant.FindControl("TxtACPlantProgMinupdt");
                    //TextBox TxtACPlantCurrentMinupdt = (TextBox)GridViewacplant.FindControl("TxtACPlantCurrentMinupdt");

                   

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {
                              TxtACPlantProgMinupdt.Enabled = true;
                           

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "minacprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pACPlantCurrentMin", TxtACPlantCurrentMinupdt.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtACPlantProgMinupdt.Enabled = false;                                       
                                        TxtACPlantProgMinupdt.Text = ds1.Tables[0].Rows[0]["TotalMinProgressiveAC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
        }

        protected void TxtACPlantCurrentHRins_TextChanged(object sender, EventArgs e)
        {
           
            Bindhracplant_Insert();

        }

        private void Bindhracplant_Insert()
        {

            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "achrck");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());



                    TextBox TxtACPlantProgHRins = GridViewacplant.FooterRow.FindControl("TxtACPlantProgHRins") as TextBox;
                    TextBox TxtACPlantCurrentHRins = GridViewacplant.FooterRow.FindControl("TxtACPlantCurrentHRins") as TextBox;
                   


                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {
                            TxtACPlantProgHRins.Enabled = true;

                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "progachr");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                                cmd1.Parameters.AddWithValue("@pACPlantCurrentHR", TxtACPlantCurrentHRins.Text);

                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtACPlantProgHRins.Enabled = false;
                                        TxtACPlantProgHRins.Text = ds1.Tables[0].Rows[0]["TotalHRProgressiveAC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
           
        }

        protected void TxtACPlantCurrentMinins_TextChanged(object sender, EventArgs e)
        {
            Bindminacplant_insert();
           
        }

        private void Bindminacplant_insert()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {


                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@pAction", "minacchk");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                    TextBox TxtACPlantProgMinins = GridViewacplant.FooterRow.FindControl("TxtACPlantProgMinins") as TextBox;
                    TextBox TxtACPlantCurrentMinins = GridViewacplant.FooterRow.FindControl("TxtACPlantCurrentMinins") as TextBox;
                   


                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count < 1)
                        {
                            TxtACPlantProgMinins.Enabled = true;


                        }

                        else
                        {
                            using (SqlCommand cmd1 = new SqlCommand("PN18_MR_sp_studioCurrentProgressive", conn))
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "minacprog");
                                cmd1.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                                cmd1.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());

                                cmd1.Parameters.AddWithValue("@pACPlantCurrentMin", TxtACPlantCurrentMinins.Text);


                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {
                                        TxtACPlantProgMinins.Enabled = false;
                                        TxtACPlantProgMinins.Text = ds1.Tables[0].Rows[0]["TotalMinProgressiveAC"].ToString();

                                    }

                                }
                            }

                        }

                    }


                }
            }
           
        }


        private void BindLastFilledStudio()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand("PN18_MR_sp_StudioSetup", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pACTION", "rptlaststudio");
                    cmd.Parameters.AddWithValue("@pIT_ZONEID", ddlzone.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStateId", ddlstate.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pStationID", Session["stnid"].ToString());
                  

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            TxtStudioutilizn_Recordinghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Recordinghrs"].ToString();
                            TxtStudioutilizn_Recordingmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Recordingmin"].ToString();
                            TxtStudioutilizn_RecordingProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_RecordingProghrs"].ToString();
                            TxtStudioutilizn_RecordingProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_RecordingProgmin"].ToString();

                            TxtStudioutilizn_Transmissionhrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Transmissionhrs"].ToString();
                            TxtStudioutilizn_Transmissionmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Transmissionmin"].ToString();
                            TxtStudioutilizn_TransmissionProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_TransmissionProghrs"].ToString();
                            TxtStudioutilizn_TransmissionProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_TransmissionProgmin"].ToString();

                            TxtStudioutilizn_Shifthrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_Shifthrs"].ToString();
                            TxtStudioutilizn_Shiftmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_Shiftmin"].ToString();
                            TxtStudioutilizn_ShiftProghrs.Text = ds.Tables[0].Rows[0]["Studioutilizn_ShiftProghrs"].ToString();
                            TxtStudioutilizn_ShiftProgmin.Text = ds.Tables[0].Rows[0]["Studioutilizn_ShiftProgmin"].ToString();

                            lblstudioutilcurrent.Text = ds.Tables[0].Rows[0]["Studioutilizn_Record_Trans_current"].ToString();
                            lblstudioutilprogressive.Text = ds.Tables[0].Rows[0]["Studioutilizn_Record_Trans_prog"].ToString();


                            Txtnoofovefvvans.Text = ds.Tables[0].Rows[0]["NoofOB_EFVVans"].ToString();   
                            TxtDeputiNoofcov_LiveCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_LiveCurrent"].ToString();
                            TxtDeputiNoofcov_RECCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_RECCurrent"].ToString();
                            TxtDeputiNoofcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_TotalCurrent"].ToString();

                            TxtDeputiNoofcov_ProgLive.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgLive"].ToString();
                            TxtDeputiNoofcov_ProgREC.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgREC"].ToString();
                            TxtDeputiNoofcov_ProgTotal.Text = ds.Tables[0].Rows[0]["DeputiNoofcov_ProgTotal"].ToString();


                            TxtDeputiActualcov_LiveCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_LiveCurrent"].ToString();
                            TxtDeputiActualcov_RECCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_RECCurrent"].ToString();
                            TxtDeputiActualcov_TotalCurrent.Text = ds.Tables[0].Rows[0]["DeputiActualcov_TotalCurrent"].ToString();

                            TxtDeputiActualcov_ProgLive.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgLive"].ToString();
                            TxtDeputiActualcov_ProgREC.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgREC"].ToString();
                            TxtDeputiActualcov_ProgTotal.Text = ds.Tables[0].Rows[0]["DeputiActualcov_ProgTotal"].ToString();

                            TxtAchvimpactivitiesmonth.Text = ds.Tables[0].Rows[0]["Achvimpactivitiesmonth"].ToString();

                            Txtremarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                            ViewState["Slno"] = ds.Tables[0].Rows[0]["Slno"].ToString();
                        }

                    }
                }
            }
        }

        protected void Btncancel_Click1(object sender, EventArgs e)
        {
            Response.Redirect("StudiosetupEntry.aspx");
        }

        
      

        
    }
}