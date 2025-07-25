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
using System.Collections.Generic;
using System.Text;
using PrasarNet.BLL;
using System.Drawing;

namespace PrasarNet.Transfer_M
{
    public partial class ApplyT : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        string cont = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                if (!IsPostBack)
                {
                    if (Session["New_old"] != null)
                    {
                        if ((Session["New_old"].ToString() == "NApp") || (Session["New_old"].ToString() == "OApp"))
                        {
                            Label1.Text = Convert.ToString(Session["UserName"]);
                            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                            {
                                empmenu.Visible = true;
                                StationSectionMenu.Visible = false;
                                AdminMenu.Visible = false;
                            }
                            else
                            {
                                empmenu.Visible = false;
                                StationSectionMenu.Visible = false;
                                AdminMenu.Visible = false;
                            }
                            if (Session["New_old"].ToString() == "NApp")
                            {
                                int nomenuitem = Menu_sub.Items.Count;
                                int index = nomenuitem - 1;
                                for (int i = 0; i < nomenuitem - 1; i++)
                                {
                                    Menu_sub.Items.RemoveAt(index);
                                    index = index - 1;
                                }
                                divlblMsg.Visible = true;
                                bindbasicinfo();
                                cmm.bindDDLWidParam(ddloption1State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddloption2_State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddloption3State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddltenstate1, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddltenstate2, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddltenstate3, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                cmm.bindDDLWidParam(ddlground, "PN21_Trans_ReasonforTrans", "conditions_transfer", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                                btnstp3.Visible = false;
                                MultiView1.ActiveViewIndex = 0;
                            }
                            else if (Session["New_old"].ToString() == "OApp")
                            {
                                divlblMsg.Visible = false;
                                bindbasicinfo();
                                basicdetbind(Convert.ToInt32(Session["id_Dash_T"]));
                                btnstp3.Visible = true;
                                btnsavebasic.Visible = false;
                                btneditbasic.Visible = true;
                                MultiView1.ActiveViewIndex = 0;
                            }
                            else
                            {
                                Response.Redirect("../Logout.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("DashBoard_T.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("DashBoard_T.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchbyName_empcode(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();

            ds = cmm.RunSpReturnDSParam("PN21_Trans_SearchByName_EmpCode", "PRASARNETConnectionString", new SqlParameter("@prefixtext", prefixText),
                                                                                                        new SqlParameter("@EmployeeId", Convert.ToInt32(HttpContext.Current.Session["empid"])),
                                                                                                        new SqlParameter("@flag", 4));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string str = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString());
                Output.Add(str);
            }
            return Output;

        }
        private void bindbasicinfo()
        {
            ds = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                            new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
            lblname_bas.Text = ds.Tables[0].Rows[0][2].ToString() + "/" + ds.Tables[0].Rows[0][1].ToString() + "/" + ds.Tables[0].Rows[0][16].ToString();
            lbldob_bas.Text = ds.Tables[0].Rows[0][3].ToString();
            lbldesgn_bas.Text = ds.Tables[0].Rows[0][4].ToString();
            lblcontact_bas.Text = ds.Tables[0].Rows[0][5].ToString();
            lblemail_bas.Text = ds.Tables[0].Rows[0][6].ToString();

            lblposting_bas.Text = ds.Tables[0].Rows[0][7].ToString();
            lblDOJ_bas.Text = ds.Tables[0].Rows[0][8].ToString();
            lblyears_served_bas.Text = ds.Tables[0].Rows[0][9].ToString();
            lbldate_superannu_bas.Text = ds.Tables[0].Rows[0][10].ToString();
            lbltenure_bas.Text = ds.Tables[0].Rows[0][11].ToString();
            lbltenureyears_bas.Text = ds.Tables[0].Rows[0][12].ToString() + "year(s)";
            lbldayscom_tenure_bas.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldaysexceed_bas.Text = ds.Tables[0].Rows[0][14].ToString();
            lblappforwarded.Text = ds.Tables[0].Rows[0][17].ToString();
            ViewState["HoonameID"] = ds.Tables[0].Rows[0][18].ToString();
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Session["New_old"] = null;
            // Session.Remove("New_old");
            Response.Redirect("~/Transfer_M/DashBoard_T.aspx");
        }

        protected void btnQualPrev_Click(object sender, EventArgs e)
        {
            btnstp3.Visible = true;
            btnsavebasic.Visible = false;
            btneditbasic.Visible = true;
            MultiView1.ActiveViewIndex = 0;
            bindbasicinfo();
            int id = 0;
            if (Session["New_old"].ToString() == "NApp")
            {
                id = Convert.ToInt32(Session["basic_Det_id"]);
            }
            else if (Session["New_old"].ToString() == "OApp")
            {
                id = Convert.ToInt32(Session["id_Dash_T"]);
            }
            basicdetbind(id);
            Menu_sub.FindItem("0").Selected = true;
        }

        protected void btnQualNext_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            Bind_Transfergrid();
            Bind_Wing();
            Bind_Organization();
            Menu_sub.FindItem("2").Selected = true;
        }
        private void Bind_Wing()
        {

            DropDownList ddlwingfooter = gvtransfer.FooterRow.FindControl("ddlwingfooter") as DropDownList;

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "1");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlwingfooter.DataSource = ds;
                            ddlwingfooter.DataValueField = "wingid";
                            ddlwingfooter.DataTextField = "wing";
                            ddlwingfooter.DataBind();
                            ddlwingfooter.Items.Insert(0, new ListItem("Select Wing", "0"));
                        }

                    }
                }
            }
        }

        private void Bind_Organization()
        {

            DropDownList ddlOrganizationfooter = gvtransfer.FooterRow.FindControl("ddlOrganizationfooter") as DropDownList;

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "3");
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlOrganizationfooter.DataSource = ds;
                            ddlOrganizationfooter.DataValueField = "OrganizationId";
                            ddlOrganizationfooter.DataTextField = "orgname";
                            ddlOrganizationfooter.DataBind();
                            ddlOrganizationfooter.Items.Insert(0, new ListItem("Select Organization", "0"));
                        }

                    }
                }
            }
        }
        private void Bind_Transfergrid()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "5");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gvtransfer.DataSource = ds;
                            gvtransfer.DataBind();
                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            gvtransfer.DataSource = ds;
                            gvtransfer.DataBind();
                            int columnsCount = gvtransfer.Columns.Count - 1;
                            gvtransfer.Rows[0].Cells.Clear();
                            gvtransfer.Rows[0].Cells.Add(new TableCell());
                            gvtransfer.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            gvtransfer.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            gvtransfer.Rows[0].Cells[0].Font.Bold = true;
                            gvtransfer.Rows[0].Cells[0].Font.Size = 10;
                            gvtransfer.Rows[0].Cells[0].Text = "No Record(s) Found..";
                            gvtransfer.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }
        protected void ddlwingfooter_SelectedIndexChanged1(object sender, EventArgs e)
        {

            DropDownList ddlwingfooter = gvtransfer.FooterRow.FindControl("ddlwingfooter") as DropDownList;
            DropDownList ddlDesigfooter = gvtransfer.FooterRow.FindControl("ddlDesigfooter") as DropDownList;

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "2");
                    cmd.Parameters.AddWithValue("@wingid", ddlwingfooter.SelectedValue.ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlDesigfooter.DataSource = ds;
                            ddlDesigfooter.DataValueField = "DesignationID";
                            ddlDesigfooter.DataTextField = "DesignationName";
                            ddlDesigfooter.DataBind();
                            ddlDesigfooter.Items.Insert(0, new ListItem("Select Designation", "0"));
                        }

                    }
                }
            }

        }
        //if (ddlorg.SelectedValue == "2" || ddlorg.SelectedValue == "3")
        //    {
        //        cmm.bindDDLWidParam(ddlstn, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", " -- Select Station -- ",
        //            new SqlParameter("@OrgId", ddlorg.SelectedValue));
        //    }
        //    else
        //    {
        //        cmm.bindDDLWidParam(ddlstn, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", " -- Select Office -- ",
        //           new SqlParameter("@OrgId", ddlorg.SelectedValue));
        //    }
        protected void ddlOrganizationfooter_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList ddlOrganizationfooter = gvtransfer.FooterRow.FindControl("ddlOrganizationfooter") as DropDownList;
            DropDownList ddlStationfooter = gvtransfer.FooterRow.FindControl("ddlStationfooter") as DropDownList;

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "11");
                    cmd.Parameters.AddWithValue("@OrganizationID", ddlOrganizationfooter.SelectedValue.ToString());
                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            ddlStationfooter.DataSource = ds;
                            ddlStationfooter.DataValueField = "StationID";
                            ddlStationfooter.DataTextField = "Expr1";
                            ddlStationfooter.DataBind();
                            if (ddlOrganizationfooter.SelectedValue == "2" || ddlOrganizationfooter.SelectedValue == "3")
                            {
                                ddlStationfooter.Items.Insert(0, new ListItem("Select Station", "0"));
                            }
                            else
                            {
                                ddlStationfooter.Items.Insert(0, new ListItem("Select Office", "0"));
                            }
                        }

                    }
                }
            }
        }

        protected void imgbtnAdd_Click(object sender, ImageClickEventArgs e)
        {
            DropDownList ddlwingfooter = gvtransfer.FooterRow.FindControl("ddlwingfooter") as DropDownList;
            DropDownList ddlDesigfooter = gvtransfer.FooterRow.FindControl("ddlDesigfooter") as DropDownList;
            TextBox txtfromFooter = gvtransfer.FooterRow.FindControl("txtfromFooter") as TextBox;
            TextBox txttoFooter = gvtransfer.FooterRow.FindControl("txttoFooter") as TextBox;
            DropDownList ddlD_O_footer = gvtransfer.FooterRow.FindControl("ddlD_O_footer") as DropDownList;
            DropDownList ddlOrganizationfooter = gvtransfer.FooterRow.FindControl("ddlOrganizationfooter") as DropDownList;
            DropDownList ddlStationfooter = gvtransfer.FooterRow.FindControl("ddlStationfooter") as DropDownList;
            TextBox txtaddinfofooter = gvtransfer.FooterRow.FindControl("txtaddinfofooter") as TextBox;
            DateTime? todate = null;
            if (txttoFooter.Text != "")
            {
                todate = DateTime.ParseExact(txttoFooter.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    try
                    {
                        string ip = cmm.GetIp_Priyank();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@flag", "6");
                        cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
                        cmd.Parameters.AddWithValue("@wingid", ddlwingfooter.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@designationid", ddlDesigfooter.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@FromDate", SqlDbType.Date).Value = DateTime.ParseExact(txtfromFooter.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        cmd.Parameters.AddWithValue("@ToDate", SqlDbType.Date).Value = todate;
                        cmd.Parameters.AddWithValue("@Transfer_byDep_Own", ddlD_O_footer.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@OrganizationId", ddlOrganizationfooter.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@Stationid", ddlStationfooter.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(Session["basic_Det_id"]));
                        cmd.Parameters.AddWithValue("@AddInfo", txtaddinfofooter.Text);
                        cmd.Parameters.AddWithValue("@createdby", Session["empid"].ToString());
                        cmd.Parameters.AddWithValue("@ip", ip);
                        conn.Open();

                        int t = cmd.ExecuteNonQuery();

                        if (t > 0)
                        {
                            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            //"alert('Transfer History details inserted successfully.......');", true);
                            lblresultHistory.Text = "Record added successfully.......";
                        }
                        else
                        {
                            //   ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            //"alert('Some Error occured while insert..pls check.....');", true);
                            lblresultHistory.Text = "Error Occured!!";
                        }

                        conn.Close();
                        Bind_Transfergrid();
                        Bind_Wing();
                        Bind_Organization();
                    }
                    catch (Exception ex)
                    {
                        lblresultHistory.Text = "Some Error Occured!!";
                        lblexpmsg.Text = "Some Error Occured!!";
                    }
                }
            }
        }
        protected void gvtransfer_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label lblidt = gvtransfer.Rows[e.RowIndex].FindControl("lblidt") as Label;

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    try
                    {

                        string ip = cmm.GetIp_Priyank();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@flag", "8");
                        cmd.Parameters.AddWithValue("@id", lblidt.Text);
                        cmd.Parameters.AddWithValue("@ip", ip);
                        cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(Session["basic_Det_id"]));
                        cmd.Parameters.AddWithValue("@createdby", Session["empid"].ToString());
                        conn.Open();
                        int t = cmd.ExecuteNonQuery();
                        if (t > 0)
                        {
                            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            //"alert('Record deleted successfully.......');", true);
                            lblresultHistory.Text = "Transfer Record deleted successfully";
                        }

                        else
                        {
                            //   ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            //"alert('Some Error occured while delete..pls check.....');", true);
                            lblresultHistory.Text = "Some Error Occured!!";
                        }
                        Bind_Transfergrid();
                        Bind_Wing();
                        Bind_Organization();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        lblresultHistory.Text = "Some Error Occured!!";
                        lblexpmsg.Text = "Some Error Occured!!";
                    }
                }

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Menu_sub.FindItem("1").Selected = true;
            bindgrid_Training();
        }


        protected void btnprev_cer_Click(object sender, EventArgs e)
        {
            //MultiView1.ActiveViewIndex = 3;
            //bindgrid_Records();
            MultiView1.ActiveViewIndex = 2;
            Menu_sub.FindItem("2").Selected = true;
            Bind_Transfergrid();
            Bind_Wing();
            Bind_Organization();
        }


        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        protected void ddlwingfooter_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void ddloption1cityload()
        {
            if (ddloption1State.SelectedIndex != 0)
            {
                cmm.bindDDLWidParam(ddloption1city, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                               new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                               new SqlParameter("@cityid3", ddloption3City.SelectedValue),
                                                                                                                                             new SqlParameter("@stateid", Convert.ToInt16(ddloption1State.SelectedValue)));//@stateid

            }
        }
        protected void ddloption2cityload()
        {

            if (ddloption2_State.SelectedIndex != 0)
            {
                cmm.bindDDLWidParam(ddloption2_City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                               new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                               new SqlParameter("@cityid3", ddloption3City.SelectedValue),
                                                                                                                                             new SqlParameter("@stateid", Convert.ToInt16(ddloption2_State.SelectedValue)));//@stateid

            }
        }
        protected void ddloption3cityload()
        {
            if (ddloption3State.SelectedIndex != 0)
            {

                cmm.bindDDLWidParam(ddloption3City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                                   new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                                   new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                                 new SqlParameter("@stateid", Convert.ToInt16(ddloption3State.SelectedValue)));//@stateid

            }
        }
        protected void ddloption1State_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddloption1State.SelectedIndex != 100000)
            if (ddloption1State.SelectedIndex != 100000)
            {
                cmm.bindDDLWidParam(ddloption1city, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                            new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                            new SqlParameter("@cityid3", ddloption3City.SelectedValue),


                                                                                                                                          new SqlParameter("@stateid", Convert.ToInt16(ddloption1State.SelectedValue)));//@stateid
                ddloption1city.Focus();

                ddloption2_State.Enabled = true;

            }
            else
            {
                ddloption1city.ClearSelection();
                ddloption1city.Items.Clear();
            }
        }

        protected void ddloption2_State_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddloption2_State.SelectedIndex != 100000)
            if (ddloption2_State.SelectedIndex != 100000)
            {
                ddloption2_City.Enabled = true;

                divrfvcity2.Visible = true;
                rfvcity2.Enabled = true;
                cmm.bindDDLWidParam(ddloption2_City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                            new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                            new SqlParameter("@cityid3", ddloption3City.SelectedValue),
                                                                                                                                      new SqlParameter("@stateid", Convert.ToInt16(ddloption2_State.SelectedValue)));//@stateid

                ddloption2_City.Focus();
            }
            else
            {
                ddloption2_City.ClearSelection();
                ddloption2_City.Items.Clear();
                divrfvcity2.Visible = false;
                rfvcity2.Enabled = false;
            }
        }
        protected void ddloption3State_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddloption3State.SelectedIndex != 0)
            {
                ddloption3City.Enabled = true;
                divrfvcity3.Visible = true;
                rfvcity3.Enabled = true;
                cmm.bindDDLWidParam(ddloption3City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),

                                                                                                                                            new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                            new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                      new SqlParameter("@stateid", Convert.ToInt16(ddloption3State.SelectedValue)));//@stateid
                ddloption3City.Focus();
            }
            else
            {
                ddloption3City.ClearSelection();
                ddloption3City.Items.Clear();
                divrfvcity3.Visible = false;
                rfvcity3.Enabled = false;
            }
        }

        protected void ddltenstate1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddltenstate1.SelectedIndex != 0)
            {
                divrfvtencity1.Visible = true;
                rfvtencity1.Enabled = true;
                cmm.bindDDLWidParam(ddltenCity1, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1)
                                                                                                                                     , new SqlParameter("@stateid", Convert.ToInt16(ddltenstate1.SelectedValue)));//@stateid
                ddltenCity1.Focus();
            }
            else
            {
                ddltenCity1.ClearSelection();
                ddltenCity1.Items.Clear();
                divrfvtencity1.Visible = false;
                rfvtencity1.Enabled = false;
            }
        }

        protected void ddltenstate2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddltenCity2.SelectedIndex != 0)
            {
                divrfvtencity2.Visible = true;
                rfvtemcity2.Enabled = true;
                cmm.bindDDLWidParam(ddltenCity2, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1)
                                                                                                                                , new SqlParameter("@stateid", Convert.ToInt16(ddltenstate2.SelectedValue)));//@stateid
                ddltenCity2.Focus();
            }
            else
            {
                ddltenCity2.ClearSelection();
                ddltenCity2.Items.Clear();
                divrfvtencity2.Visible = false;
                rfvtemcity2.Enabled = false;
            }
        }

        protected void ddltenstate3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddltencity3.SelectedIndex != 0)
            {
                divrfvtencity3.Visible = true;
                rfvtencity3.Enabled = true;
                cmm.bindDDLWidParam(ddltencity3, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1)
                                                                                                                                 , new SqlParameter("@stateid", Convert.ToInt16(ddltenstate3.SelectedValue)));//@stateid
                ddltencity3.Focus();
            }
            else
            {
                ddltencity3.ClearSelection();
                ddltencity3.Items.Clear();
                divrfvtencity3.Visible = false;
                rfvtencity3.Enabled = false;
            }
        }

        protected void btnsavebasic_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();

                //int forwaredtoID = Convert.ToInt32(hdnValue.Value);
                int forwaredtoID = Convert.ToInt32(ViewState["HoonameID"]); ;

                int forwardusertypeid = 10;

                int empid = Convert.ToInt32(Session["empid"]);
                string language = txtlanguage.Text.Trim();
                string hometown = txthometown.Text.Trim();

                int seekingop1 = Convert.ToInt32(ddloption1city.SelectedValue);
                int seekingop2 = 0, seekingop3 = 0;
                if (ddloption2_City.SelectedValue != "")
                {
                    if (seekingop2 == seekingop1)
                    {
                        seekingop2 = 0;
                    }
                    else
                    {
                        seekingop2 = Convert.ToInt32(ddloption2_City.SelectedValue);
                    }
                }
                if (ddloption3City.SelectedValue != "")
                {
                    if (seekingop3 == seekingop2 || seekingop3 == seekingop1)
                    {
                        seekingop3 = 0;
                    }
                    else
                    {
                        seekingop3 = Convert.ToInt32(ddloption3City.SelectedValue);
                    }

                }
                string reason = txtreasonnone.Text.Trim();
                int tenop1 = 0, tenop2 = 0, tenop3 = 0;
                if (ddltenCity1.SelectedValue != "")
                {
                    tenop1 = Convert.ToInt32(ddltenCity1.SelectedValue);
                }
                if (ddltenCity2.SelectedValue != "")
                {
                    tenop2 = Convert.ToInt32(ddltenCity2.SelectedValue);
                }
                if (ddltencity3.SelectedValue != "")
                {
                    tenop3 = Convert.ToInt32(ddltencity3.SelectedValue);
                }
                int groundofTransfer = Convert.ToInt32(ddlground.SelectedValue);
                string sub_grnd = txtsub.Text.Trim();
                string details = txtdetails.Text.Trim();

                string medicalFacAvailable = Convert.ToString(ddlmedicalfa.SelectedItem.Text);
                string want_trans_ben = Convert.ToString(ddltrans_bene.SelectedItem.Text);
                string createdby = Convert.ToString(Session["empid"]);

                string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(conf);
                conn.Open();
                SqlCommand cmd = new SqlCommand("PN21_Trans_basic_sp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Employeeid", empid);
                cmd.Parameters.AddWithValue("@LanguageKnown", language);
                cmd.Parameters.AddWithValue("@HomeTown", hometown);
                cmd.Parameters.AddWithValue("@FwdtoUsertypeid", forwardusertypeid);
                cmd.Parameters.AddWithValue("@ForwardedtoID", ViewState["HoonameID"]);
                cmd.Parameters.AddWithValue("@seekingOp1", seekingop1);
                cmd.Parameters.AddWithValue("@seekingOp2", seekingop2);
                cmd.Parameters.AddWithValue("@seekingOp3", seekingop3);
                cmd.Parameters.AddWithValue("@Reason_If_SelectedNone", reason);
                cmd.Parameters.AddWithValue("@Ten_seekingOP1", tenop1);
                cmd.Parameters.AddWithValue("@Ten_seekingOP2", tenop2);
                cmd.Parameters.AddWithValue("@Ten_seekingOP3", tenop3);
                cmd.Parameters.AddWithValue("@Grnd_TransReqd", groundofTransfer);
                cmd.Parameters.AddWithValue("@Subject_Grnd", sub_grnd);
                cmd.Parameters.AddWithValue("@Details_Grnd", details);
                cmd.Parameters.AddWithValue("@medicalfacilitiesAvailbale", medicalFacAvailable);
                cmd.Parameters.AddWithValue("@WantTrans_Benefit", want_trans_ben);
                cmd.Parameters.AddWithValue("@ip", ip);
                cmd.Parameters.AddWithValue("@createdby", createdby);
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.Parameters.Add("@idout", SqlDbType.Int);// to get a out value from sql query
                cmd.Parameters["@idout"].Direction = ParameterDirection.Output;// to get a out value from sql query
                int i = cmd.ExecuteNonQuery();
                string basic_Det_id = cmd.Parameters["@idout"].Value.ToString();
                conn.Close();

                if (i > 0)
                {
                    Session["basic_Det_id"] = basic_Det_id;
                    int index = 1;

                    MenuItem myItem1 = new MenuItem("Training Acquired", "1");
                    Menu_sub.Items.AddAt(index, myItem1);
                    index += 1;

                    MenuItem myItem2 = new MenuItem("Transfer History", "2");
                    Menu_sub.Items.AddAt(index, myItem2);
                    index += 1;

                    MenuItem myItemcer = new MenuItem("Other Records", "3");
                    Menu_sub.Items.AddAt(index, myItemcer);
                    index += 1;

                    MenuItem myItem3 = new MenuItem("PwD Details", "4");
                    Menu_sub.Items.AddAt(index, myItem3);
                    index += 1;

                    MenuItem myItem4 = new MenuItem("Uploads", "5");
                    Menu_sub.Items.AddAt(index, myItem4);
                    index += 1;

                    MenuItem myItem = new MenuItem("Preview & Submit", "6");
                    Menu_sub.Items.AddAt(index, myItem);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Saved Successfully!!');", true);
                    basicdetbind(Convert.ToInt32(Session["basic_Det_id"]));
                    btnstp3.Visible = true;
                    Session["New_old"] = "NApp";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        private void basicdetbind(int id_f)
        {
            divlanguage.Visible = false;
            divlbllanguage.Visible = true;
            divappFwd.Visible = false;
            divlblAppFwd.Visible = true;
            divop1.Visible = false;
            divlblop1.Visible = true;

            divoption2.Visible = false;
            divlblOption2.Visible = true;

            divOption3.Visible = false;
            divlblOption3.Visible = true;

            divreason.Visible = false;
            divlblreason.Visible = true;

            divhometown.Visible = false;
            divlblhometown.Visible = true;

            divground.Visible = false;
            divlblGround.Visible = true;

            divsubject.Visible = false;
            divlblsubject.Visible = true;

            divdetails.Visible = false;
            divlbldetails.Visible = true;

            div3.Visible = false;
            div4.Visible = true;

            divtransbenefits.Visible = false;
            divlbltransbenefits.Visible = true;

            divTenure1.Visible = false;
            divlblTenure1.Visible = true;

            divtenure2.Visible = false;
            divlbltenure2.Visible = true;

            divtenure3.Visible = false;
            divlbltenure3.Visible = true;

            btnsavebasic.Visible = false;
            btneditbasic.Visible = true;
            btnstp3.Visible = true;

            ds = cmm.RunSpReturnDSParam("PN21_Tran_EmpAppliaction", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                       new SqlParameter("@id", id_f));

            lbllanguage_bas.Text = ds.Tables[0].Rows[0][3].ToString();
            lblapplforwared_bas.Text = ds.Tables[0].Rows[0][18].ToString();

            lblop1state.Text = ds.Tables[0].Rows[0][20].ToString();
            lblop1city.Text = ds.Tables[0].Rows[0][19].ToString();

            lblop2state.Text = ds.Tables[0].Rows[0][22].ToString();
            lblop2city.Text = ds.Tables[0].Rows[0][21].ToString();

            lblop3state.Text = ds.Tables[0].Rows[0][24].ToString();
            lblop3city.Text = ds.Tables[0].Rows[0][23].ToString();

            lbltenstate1.Text = ds.Tables[0].Rows[0][26].ToString();
            lbltenCity1.Text = ds.Tables[0].Rows[0][25].ToString();

            lbltenstate2.Text = ds.Tables[0].Rows[0][28].ToString();
            lbltencity2.Text = ds.Tables[0].Rows[0][27].ToString();

            lbltenstate3.Text = ds.Tables[0].Rows[0][30].ToString();
            lbltencity3.Text = ds.Tables[0].Rows[0][29].ToString();

            lblreasonNone_b.Text = ds.Tables[0].Rows[0][8].ToString();

            lblhometown.Text = ds.Tables[0].Rows[0][4].ToString();
            lblground.Text = ds.Tables[0].Rows[0][31].ToString();
            lblsubject.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldetails.Text = ds.Tables[0].Rows[0][14].ToString();
            lblmedicalfac.Text = ds.Tables[0].Rows[0][15].ToString();
            Label20.Text = ds.Tables[0].Rows[0][16].ToString();
        }

        protected void btnstp3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Menu_sub.FindItem("1").Selected = true;
            bindgrid_Training();
        }
        private void bindgrid_Training()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 2));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                gvtraining.DataSource = dsedu;
                gvtraining.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                gvtraining.DataSource = dsedu;
                gvtraining.DataBind();
                int columncount = gvtraining.Rows[0].Cells.Count;
                gvtraining.Rows[0].Cells.Clear();
                gvtraining.Rows[0].Cells.Add(new TableCell());
                gvtraining.Rows[0].Cells[0].ColumnSpan = columncount;
                gvtraining.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void gvtraining_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    TextBox txt_ins_footer = (TextBox)gvtraining.FooterRow.FindControl("txt_ins_footer");
                    TextBox txt_Sub_footer = (TextBox)gvtraining.FooterRow.FindControl("txt_Sub_footer");
                    TextBox txtfromFooter = (TextBox)gvtraining.FooterRow.FindControl("txtfromFooter");
                    TextBox txt_To_footer = (TextBox)gvtraining.FooterRow.FindControl("txt_To_footer");
                    TextBox txtaddinfofooter = (TextBox)gvtraining.FooterRow.FindControl("txtaddinfofooter");

                    int count = cmm.RunSPReturnCountParam("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@flag", 4)
                                                                                                               , new SqlParameter("@CourseName", txt_Sub_footer.Text.Trim())
                                                                                                               , new SqlParameter("@Host_Institute", txt_ins_footer.Text.Trim())
                                                                                                               , new SqlParameter("@fromdate", DateTime.ParseExact(txtfromFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                                               , new SqlParameter("@todate", DateTime.ParseExact(txt_To_footer.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)));

                    if (count == 0)
                    {
                        //@employeeid,@fromdate,@todate,@CourseName,@Host_Institute,@AnyRelevantInfo,@createdby,GETDATE(),@ip,1
                        int i = cmm.RunSP("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                               , new SqlParameter("@fromdate", DateTime.ParseExact(txtfromFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                               , new SqlParameter("@todate", DateTime.ParseExact(txt_To_footer.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                               , new SqlParameter("@CourseName", txt_Sub_footer.Text.Trim())
                                                                                               , new SqlParameter("@Host_Institute", txt_ins_footer.Text.Trim())
                                                                                               , new SqlParameter("@AnyRelevantInfo", txtaddinfofooter.Text.Trim())
                                                                                               , new SqlParameter("@ip", ip)
                                                                                               , new SqlParameter("@createdby", Convert.ToInt32(Session["empid"]))
                                                                                               , new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"]))
                                                                                               , new SqlParameter("@flag", 1));

                        if (i > 0)
                        {
                            bindgrid_Training();
                            lblresultTraining.ForeColor = System.Drawing.Color.Green;
                            lblresultTraining.Text = "Training Details Added Successfully..";
                        }
                        else
                        {
                            bindgrid_Training();
                            lblresultTraining.ForeColor = System.Drawing.Color.Red;
                            lblresultTraining.Text = "Error Occured.Try Again!!";
                        }
                    }
                    else
                    {
                        lblresultTraining.Text = "Duplicate Entry Not Allowed..";
                        bindgrid_Training();
                    }
                }
                catch (Exception ex)
                {
                    lblresultTraining.Text = "Error Occured.Try Again!!";
                    bindgrid_Training();
                }
            }
        }

        protected void gvtraining_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(gvtraining.DataKeys[e.RowIndex].Value.ToString());
                string ip = cmm.GetIp_Priyank();
                //@Ip where id=@id
                int i = cmm.RunSP("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@id", Id),
                                                                                         new SqlParameter("@ip", ip),
                                                                                         new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"])),
                                                                                         new SqlParameter("@flag", 3));


                if (i > 0)
                {
                    lblresultTraining.ForeColor = System.Drawing.Color.Green;
                    lblresultTraining.Text = "Training Information Deleted Successfully..";
                    bindgrid_Training();
                }
                else
                {

                    lblresultTraining.ForeColor = System.Drawing.Color.Red;
                    lblresultTraining.Text = "Unable to Delete..";
                    bindgrid_Training();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }

        protected void gvtraining_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvtraining.PageIndex = e.NewPageIndex;
            bindgrid_Training();
        }

        protected void gvtraining_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvtraining.EditIndex = -1;
            bindgrid_Training();
            lblresultTraining.Text = "";
        }

        protected void gvtraining_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvtraining.EditIndex = e.NewEditIndex;
            bindgrid_Training();
        }

        protected void gvtraining_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            Menu_sub.FindItem("3").Selected = true;
            bindgrid_Records();
        }
        private void bindgrid_Records()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                , new SqlParameter("@flag", 2));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdrecord.DataSource = dsedu;
                grdrecord.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdrecord.DataSource = dsedu;
                grdrecord.DataBind();
                int columncount = grdrecord.Rows[0].Cells.Count;
                grdrecord.Rows[0].Cells.Clear();
                grdrecord.Rows[0].Cells.Add(new TableCell());
                grdrecord.Rows[0].Cells[0].ColumnSpan = columncount;
                grdrecord.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void grdrecord_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddltype_footer = (DropDownList)e.Row.FindControl("ddltype_footer");
                cmm.bindDDLWidParam(ddltype_footer, "PN21_Trans_RecordsType_SP", "type", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));

            }
        }

        protected void grdrecord_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    DropDownList ddltype_footer = (DropDownList)grdrecord.FooterRow.FindControl("ddltype_footer");
                    TextBox txtfromFooter = (TextBox)grdrecord.FooterRow.FindControl("txtfromFooter");
                    TextBox txttoFooter = (TextBox)grdrecord.FooterRow.FindControl("txttoFooter");
                    TextBox txtplacefooter = (TextBox)grdrecord.FooterRow.FindControl("txtplacefooter");
                    TextBox txtSancAuthfooter = (TextBox)grdrecord.FooterRow.FindControl("txtSancAuthfooter");
                    TextBox txtaddinfofooter = (TextBox)grdrecord.FooterRow.FindControl("txtaddinfofooter");

                    int count = cmm.RunSPReturnCountParam("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@flag", 4)
                                                                                                               , new SqlParameter("@typeid", Convert.ToInt32(ddltype_footer.SelectedValue))
                                                                                                               , new SqlParameter("@PlaceDuringAbsence", txtplacefooter.Text.Trim())
                                                                                                               , new SqlParameter("@SanctioningAuthority", txtSancAuthfooter.Text.Trim())
                                                                                                               , new SqlParameter("@fromdate", DateTime.ParseExact(txtfromFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                                               , new SqlParameter("@todate", DateTime.ParseExact(txttoFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture)));

                    if (count == 0)
                    {
                        int i = cmm.RunSP("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@typeid", Convert.ToInt32(ddltype_footer.SelectedValue))
                                                                                                               , new SqlParameter("@PlaceDuringAbsence", txtplacefooter.Text.Trim())
                                                                                                               , new SqlParameter("@SanctioningAuthority", txtSancAuthfooter.Text.Trim())
                                                                                                               , new SqlParameter("@fromdate", DateTime.ParseExact(txtfromFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                                               , new SqlParameter("@todate", DateTime.ParseExact(txttoFooter.Text.Trim(), "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture))
                                                                                                               , new SqlParameter("@ip", ip)
                                                                                                               , new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"]))
                                                                                                               , new SqlParameter("@createdby", Convert.ToInt32(Session["empid"]))
                                                                                                               , new SqlParameter("@flag", 1));

                        if (i > 0)
                        {
                            bindgrid_Records();
                            lblresultRecords.ForeColor = System.Drawing.Color.Green;
                            lblresultRecords.Text = "Added Successfully..";
                        }
                        else
                        {
                            bindgrid_Records();
                            lblresultRecords.ForeColor = System.Drawing.Color.Red;
                            lblresultRecords.Text = "Error Occured.Try Again!!";
                        }
                    }
                    else
                    {
                        lblresultRecords.Text = "Duplicate Entry Not Allowed..";
                        bindgrid_Records();
                    }
                }
                catch (Exception ex)
                {
                    lblresultRecords.Text = "Error Occured.Try Again!!";
                    bindgrid_Records();
                }
            }
        }

        protected void grdrecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdrecord.PageIndex = e.NewPageIndex;
            bindgrid_Records();
        }

        protected void grdrecord_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdrecord.EditIndex = -1;
            bindgrid_Records();
            lblresultRecords.Text = "";
        }

        protected void grdrecord_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(grdrecord.DataKeys[e.RowIndex].Value.ToString());
                string ip = cmm.GetIp_Priyank();

                int i = cmm.RunSP("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@id", Id),
                                                                                        new SqlParameter("@createdby", Convert.ToInt32(Session["empid"])),
                                                                                        new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"])),
                                                                                        new SqlParameter("@ip", ip),
                                                                                        new SqlParameter("@flag", 3));


                if (i > 0)
                {
                    lblresultRecords.ForeColor = System.Drawing.Color.Green;
                    lblresultRecords.Text = "Information Deleted Successfully..";
                    bindgrid_Records();
                }
                else
                {

                    lblresultRecords.ForeColor = System.Drawing.Color.Red;
                    lblresultRecords.Text = "Unable to Delete..";
                    bindgrid_Records();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }
        #region Health CATEGORY(PWD Self Dependent)
        private void Bind_Healthcategorygrid()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_THealthcategoryPWDSD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "1");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            grdhealth.DataSource = ds;
                            grdhealth.DataBind();



                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            grdhealth.DataSource = ds;
                            grdhealth.DataBind();
                            int columnsCount = grdhealth.Columns.Count - 1;
                            grdhealth.Rows[0].Cells.Clear();
                            grdhealth.Rows[0].Cells.Add(new TableCell());
                            grdhealth.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            grdhealth.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            grdhealth.Rows[0].Cells[0].Font.Bold = true;
                            grdhealth.Rows[0].Cells[0].Font.Size = 10;
                            grdhealth.Rows[0].Cells[0].Text = "No Record(s) Found...";
                            grdhealth.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }

        protected void imgbtnAddhc_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                FileUpload fileUpload1 = grdhealth.FooterRow.FindControl("fileUpload2") as FileUpload;
                DropDownList ddltypefooter = grdhealth.FooterRow.FindControl("ddltypefooter") as DropDownList;
                TextBox txthcNamefooter = grdhealth.FooterRow.FindControl("txthcNamefooter") as TextBox;
                TextBox txthcRelationfooter = grdhealth.FooterRow.FindControl("txthcRelationfooter") as TextBox;
                TextBox txthcageFooter = grdhealth.FooterRow.FindControl("txthcageFooter") as TextBox;
                TextBox txthcaddinfofooter = grdhealth.FooterRow.FindControl("txthcaddinfofooter") as TextBox;
                if (fileUpload1.HasFile)
                {
                    int ret = uploaddoc(fileUpload1, "Documents");
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Only, pdf upto 2MB are allowed!!');", true);
                    }
                    else
                    {
                        using (SqlConnection conn = new SqlConnection(cont))
                        {
                            using (SqlCommand cmd = new SqlCommand("PN21_Trans_THealthcategoryPWDSD", conn))
                            {
                                string ip = cmm.GetIp_Priyank();
                                //@filename
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@flag", "2");
                                cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());
                                cmd.Parameters.AddWithValue("@Typeof_disability", Convert.ToInt32(ddltypefooter.SelectedValue));
                                cmd.Parameters.AddWithValue("@Self_Family", "");
                                cmd.Parameters.AddWithValue("@Name", txthcNamefooter.Text);
                                cmd.Parameters.AddWithValue("@relation", txthcRelationfooter.Text);
                                cmd.Parameters.AddWithValue("@age", txthcageFooter.Text);
                                cmd.Parameters.AddWithValue("@Ip", ip);
                                cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(Session["basic_Det_id"]));
                                cmd.Parameters.AddWithValue("@filename", ViewState["filename"].ToString());
                                cmd.Parameters.AddWithValue("@Additional_IfAny", txthcaddinfofooter.Text);
                                cmd.Parameters.AddWithValue("@createdby", Session["empid"].ToString());
                                conn.Open();
                                int t = cmd.ExecuteNonQuery();
                                if (t > 0)
                                {
                                    lblresulthealth.Text = "Details Added successfully!!";
                                    //  ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Record Added successfully!!');", true);
                                }
                                else
                                {
                                    lblresulthealth.Text = "Error Occured!!";
                                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Error occured!!');", true);
                                }
                                conn.Close();
                                Bind_Healthcategorygrid();

                            }
                        }
                    }
                }

                else
                {
                    Bind_Healthcategorygrid();
                    lblresulthealth.Text = "Upload File can't be left Blank!!";
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
            }
            catch (Exception ex)
            {
                Bind_Healthcategorygrid();
                lblresulthealth.Text = "Some Issue occured. Try Again!!";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
            }
            grdhealth.Focus();
        }

        protected void grdhealth_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            string ip = cmm.GetIp_Priyank();
            Label lblhcid = grdhealth.Rows[e.RowIndex].FindControl("lblhcid") as Label;
            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_THealthcategoryPWDSD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "3");
                    cmd.Parameters.AddWithValue("@id", lblhcid.Text);
                    cmd.Parameters.AddWithValue("@ip", ip);
                    cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(Session["basic_Det_id"]));
                    cmd.Parameters.AddWithValue("@createdby", Session["empid"].ToString());

                    conn.Open();
                    int t = cmd.ExecuteNonQuery();
                    if (t > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                      "alert('Record deleted successfully.......');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                     "alert('Some Error occured while deleting..pls check.....');", true);
                    }
                    Bind_Healthcategorygrid();
                    conn.Close();
                }
            }
        }
        #endregion
        #region Upload
        private int uploaddoc(FileUpload FileUpload1, string foldername)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".pdf")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        //if ((lastline.IndexOf("%PDF") > -1))
                        //{
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 2097152)//2MB
                        {
                            lblResultUpload.Text = "Maximum file size(2MB) exceeded..";
                            bindgridupload();
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/Transfer_M/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "Transfer_M\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "Doc_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["filename"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                        bindgridupload();
                        return 0;
                    }

                }
                else
                {
                    lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                    bindgridupload();
                    return 0;
                }
            }
            catch (Exception ex)
            {
                lblResultUpload.Text = "Error Occured while Uploading a Document!!";
                bindgridupload();
                return 0;

            }
        }
        private void bindgridupload()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 2));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdUpload.DataSource = dsedu;
                grdUpload.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdUpload.DataSource = dsedu;
                grdUpload.DataBind();
                int columncount = grdUpload.Rows[0].Cells.Count;
                grdUpload.Rows[0].Cells.Clear();
                grdUpload.Rows[0].Cells.Add(new TableCell());
                grdUpload.Rows[0].Cells[0].ColumnSpan = columncount;
                grdUpload.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void grdUpload_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddltype_footer = (DropDownList)e.Row.FindControl("ddltype_footer");
                cmm.bindDDLWidParam(ddltype_footer, "PN21_Trans_DocType_SP", "doctype", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            }
        }
        protected void grdUpload_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdUpload.PageIndex = e.NewPageIndex;
            bindgridupload();
        }
        protected void grdUpload_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdUpload.EditIndex = -1;
            bindgridupload();
            lblResultUpload.Text = "";
        }
        protected void grdUpload_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdUpload.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString",
                                                                                                       new SqlParameter("@flag", "5"),
                                                                                                       new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][5]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][5].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][5].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][5].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgridupload();
                                lblResultUpload.Text = "There is no document to download!!";
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgridupload();
                        lblResultUpload.Text = "There is no document to download!!";
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgridupload();
                    lblResultUpload.Text = "Some Issue occured while downloading a document.Try Again!!";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdUpload.Focus();
            }
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    string ip = cmm.GetIp_Priyank();
                    DropDownList ddltype_footer = (DropDownList)grdUpload.FooterRow.FindControl("ddltype_footer");
                    TextBox txt_sub_footer = (TextBox)grdUpload.FooterRow.FindControl("txt_sub_footer");
                    FileUpload fileUploadfooter = (FileUpload)grdUpload.FooterRow.FindControl("fileUploadfooter");

                    if (fileUploadfooter.HasFile)
                    {
                        int ret = uploaddoc(fileUploadfooter, "Documents");
                        if (ret == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Only, pdf upto 2MB are allowed!!');", true);
                        }
                        else
                        {
                            int count = cmm.RunSPReturnCountParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                                                                           , new SqlParameter("@flag", 4)
                                                                                                                                           , new SqlParameter("@Subject", txt_sub_footer.Text.Trim())
                                                                                                                                           , new SqlParameter("@DocTypeid", ddltype_footer.SelectedValue));


                            if (count == 0)
                            {

                                int i = cmm.RunSP("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                                                                                           , new SqlParameter("@flag", 1)
                                                                                                                                           , new SqlParameter("@createdby", Session["empid"].ToString())
                                                                                                                                           , new SqlParameter("@Filename", ViewState["filename"].ToString())
                                                                                                                                           , new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"]))
                                                                                                                                           , new SqlParameter("@Subject", txt_sub_footer.Text.Trim())
                                                                                                                                           , new SqlParameter("@DocTypeid", ddltype_footer.SelectedValue));

                                if (i > 0)
                                {
                                    bindgridupload();
                                    lblResultUpload.ForeColor = System.Drawing.Color.Green;
                                    lblResultUpload.Text = "Uploaded Successfully..";
                                }
                                else
                                {
                                    bindgridupload();
                                    lblResultUpload.ForeColor = System.Drawing.Color.Red;
                                    lblResultUpload.Text = "Error Occured.Try Again!!";
                                }
                            }
                            else
                            {
                                bindgridupload();
                                lblResultUpload.Text = "Duplicate entries are not allowed!!";

                                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Duplicate entries are not allowed!!');", true);
                                //txtPlan.Text = "";
                            }
                        }

                    }
                    else
                    {
                        bindgridupload();
                        lblResultUpload.Text = "Upload File can't be left blank!!";
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Upload File can't be left blank!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgridupload();
                    lblResultUpload.Text = "Error Occured.Try Again!!";
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured.Try Again!!');", true);
                }
            }
        }
        protected void grdUpload_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(grdUpload.DataKeys[e.RowIndex].Value.ToString());
                string ip = cmm.GetIp_Priyank();

                int i = cmm.RunSP("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@id", Id),
                                                                                        new SqlParameter("@createdby", Convert.ToInt32(Session["empid"])),
                                                                                        new SqlParameter("@bid", Convert.ToInt32(Session["basic_Det_id"])),
                                                                                        new SqlParameter("@ip", ip),
                                                                                        new SqlParameter("@flag", 3));


                if (i > 0)
                {
                    lblResultUpload.ForeColor = System.Drawing.Color.Green;
                    lblResultUpload.Text = "Information Deleted Successfully..";
                    bindgridupload();
                }
                else
                {

                    lblResultUpload.ForeColor = System.Drawing.Color.Red;
                    lblResultUpload.Text = "Unable to Delete..";
                    bindgridupload();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some issues occured.Try Again!!');", true);

            }
        }
        #endregion

        protected void btnnext_cer_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
            Menu_sub.FindItem("4").Selected = true;
            Bind_Healthcategorygrid();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
            Menu_sub.FindItem("3").Selected = true;
            bindgrid_Records();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
            Menu_sub.FindItem("5").Selected = true;
            bindgridupload();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
            Menu_sub.FindItem("4").Selected = true;
            Bind_Healthcategorygrid();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                MultiView1.ActiveViewIndex = 6;
                Menu_sub.FindItem("6").Selected = true;
                bind_prev_Info();
                bindgrid_Training_prev();
                Bind_Transfergrid_prev();
                bindgrid_Records_prev();
                Bind_Healthcategorygrid_prev();
                bindgridupload_prev();
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnprev_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
            Menu_sub.FindItem("5").Selected = true;
            bindgridupload();
        }
        private void bind_prev_Info()
        {
            int id = 0;
            if (Session["New_old"].ToString() == "NApp")
            {
                id = Convert.ToInt32(Session["basic_Det_id"]);
            }
            else if (Session["New_old"].ToString() == "OApp")
            {
                id = Convert.ToInt32(Session["id_Dash_T"]);
            }
            ds = cmm.RunSpReturnDSParam("PN21_Tran_EmpAppliaction", "PRASARNETConnectionString", new SqlParameter("@flag", 3),
                                                                                  new SqlParameter("@id", id));
            // lblappno.Text = ds.Tables[0].Rows[0][2].ToString();
            lblappno.Text = "Alloted After the Final Submission,Only";
            lblname_pre.Text = ds.Tables[0].Rows[0][32].ToString();
            lblDOB_pre.Text = ds.Tables[0].Rows[0][33].ToString();
            lblDesgn_Pre.Text = ds.Tables[0].Rows[0][34].ToString();
            lblcontact_pre.Text = ds.Tables[0].Rows[0][35].ToString();
            lblemail_pre.Text = ds.Tables[0].Rows[0][36].ToString();
            lblpresent_pre.Text = ds.Tables[0].Rows[0][37].ToString();
            lblDOJ_Pre.Text = ds.Tables[0].Rows[0][38].ToString();
            lblnoofYears_pre.Text = ds.Tables[0].Rows[0][39].ToString();
            lblDOS_Pre.Text = ds.Tables[0].Rows[0][40].ToString();
            lblpresent_Place_Ten_Pre.Text = ds.Tables[0].Rows[0][41].ToString();
            lblten_Years_Pre.Text = ds.Tables[0].Rows[0][42].ToString() + "year(s)";
            lbldays_remain_Pre.Text = ds.Tables[0].Rows[0][43].ToString();
            lbldaysexceed_pre.Text = ds.Tables[0].Rows[0][44].ToString();

            lbllanguage_pre.Text = ds.Tables[0].Rows[0][3].ToString();
            lblapplicationfwd_pre.Text = ds.Tables[0].Rows[0][18].ToString();

            lblstate1_pre.Text = ds.Tables[0].Rows[0][20].ToString();
            lblCity1_Pre.Text = ds.Tables[0].Rows[0][19].ToString();

            lblstate2_pre.Text = ds.Tables[0].Rows[0][22].ToString();
            lblcity2_pre.Text = ds.Tables[0].Rows[0][21].ToString();

            lblstate3_Pre.Text = ds.Tables[0].Rows[0][24].ToString();
            lblCity3_Pre.Text = ds.Tables[0].Rows[0][23].ToString();

            lblstateop1_pre.Text = ds.Tables[0].Rows[0][26].ToString();
            lblcityop1_pre.Text = ds.Tables[0].Rows[0][25].ToString();

            lblstateop2_pre.Text = ds.Tables[0].Rows[0][28].ToString();
            lblcityop2_pre.Text = ds.Tables[0].Rows[0][27].ToString();

            lblstateop3_pre.Text = ds.Tables[0].Rows[0][30].ToString();
            lblcityop3_pre.Text = ds.Tables[0].Rows[0][29].ToString();

            //lblreason_selc_None_Pre.Text = ds.Tables[0].Rows[0][8].ToString();

            lblhometown_pre.Text = ds.Tables[0].Rows[0][4].ToString();
            lblgrnd_pre.Text = ds.Tables[0].Rows[0][31].ToString();
            lblsub_pre.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldetails_pre.Text = ds.Tables[0].Rows[0][14].ToString();
            lblmedicalgrnd_pre.Text = ds.Tables[0].Rows[0][15].ToString();
            lblreadyTrans_ben_Pre.Text = ds.Tables[0].Rows[0][16].ToString();
            lblappempid.Text = ds.Tables[0].Rows[0][45].ToString();

        }
        private void bindgrid_Training_prev()
        {
            DataSet dstraining = new DataSet();
            dstraining = cmm.RunSpReturnDSParam("PN21_Trans_Training_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 2));
            if (dstraining.Tables[0].Rows.Count > 0)
            {
                gvtraining_pre.DataSource = dstraining;
                gvtraining_pre.DataBind();
            }
            else
            {
                dstraining.Tables[0].Rows.Add(dstraining.Tables[0].NewRow());
                gvtraining_pre.DataSource = dstraining;
                gvtraining_pre.DataBind();
                int columncount = gvtraining_pre.Rows[0].Cells.Count;
                gvtraining_pre.Rows[0].Cells.Clear();
                gvtraining_pre.Rows[0].Cells.Add(new TableCell());
                gvtraining_pre.Rows[0].Cells[0].ColumnSpan = columncount;
                gvtraining_pre.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void Bind_Transfergrid_prev()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "5");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gvtransfer_pre.DataSource = ds;
                            gvtransfer_pre.DataBind();



                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            gvtransfer_pre.DataSource = ds;
                            gvtransfer_pre.DataBind();
                            int columnsCount = gvtransfer_pre.Columns.Count - 1;
                            gvtransfer_pre.Rows[0].Cells.Clear();
                            gvtransfer_pre.Rows[0].Cells.Add(new TableCell());
                            gvtransfer_pre.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            gvtransfer_pre.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            gvtransfer_pre.Rows[0].Cells[0].Font.Bold = true;
                            gvtransfer_pre.Rows[0].Cells[0].Font.Size = 10;
                            gvtransfer_pre.Rows[0].Cells[0].Text = "No Record(s) Found";
                            gvtransfer_pre.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }
        private void bindgrid_Records_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Records_SP", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                , new SqlParameter("@flag", 2));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdrecord_per.DataSource = dsedu;
                grdrecord_per.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdrecord_per.DataSource = dsedu;
                grdrecord_per.DataBind();
                int columncount = grdrecord_per.Rows[0].Cells.Count;
                grdrecord_per.Rows[0].Cells.Clear();
                grdrecord_per.Rows[0].Cells.Add(new TableCell());
                grdrecord_per.Rows[0].Cells[0].ColumnSpan = columncount;
                grdrecord_per.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void Bind_Healthcategorygrid_prev()
        {

            using (SqlConnection conn = new SqlConnection(cont))
            {
                using (SqlCommand cmd = new SqlCommand("PN21_Trans_THealthcategoryPWDSD", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@flag", "1");
                    cmd.Parameters.AddWithValue("@employeeid", Session["empid"].ToString());

                    using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            grdhealth_pre.DataSource = ds;
                            grdhealth_pre.DataBind();



                        }
                        else
                        {
                            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                            grdhealth_pre.DataSource = ds;
                            grdhealth_pre.DataBind();
                            int columnsCount = grdhealth_pre.Columns.Count - 1;
                            grdhealth_pre.Rows[0].Cells.Clear();
                            grdhealth_pre.Rows[0].Cells.Add(new TableCell());
                            grdhealth_pre.Rows[0].Cells[0].ColumnSpan = columnsCount;
                            grdhealth_pre.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                            grdhealth_pre.Rows[0].Cells[0].Font.Bold = true;
                            grdhealth_pre.Rows[0].Cells[0].Font.Size = 10;
                            grdhealth_pre.Rows[0].Cells[0].Text = "No Record(s) Found...";
                            grdhealth_pre.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        }
                    }
                }
            }
        }
        private void bindgridupload_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                 , new SqlParameter("@flag", 2));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdUpload_pre.DataSource = dsedu;
                grdUpload_pre.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdUpload_pre.DataSource = dsedu;
                grdUpload_pre.DataBind();
                int columncount = grdUpload_pre.Rows[0].Cells.Count;
                grdUpload_pre.Rows[0].Cells.Clear();
                grdUpload_pre.Rows[0].Cells.Add(new TableCell());
                grdUpload_pre.Rows[0].Cells[0].ColumnSpan = columncount;
                grdUpload_pre.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void sendEmailNotification(string empName, string empEmail, string applicantname, string applicantmob, string appNumber, string applicantSTN)
        {
            string appSubject, appBody;
            appSubject = "New Transfer Request Application Received";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> A new transfer application has been received. The details are as follows: <br />";
            appBody += "<br /> Application Number: " + appNumber;
            appBody += "<br /> Applicant Name: " + applicantname;
            appBody += "<br /> Applicant Mobile Number: " + applicantmob;
            appBody += "<br /> Applicant Station/Office: " + applicantSTN;

            appBody += "<br /><br /> Kindly Login on PrasarNet, as an employee, for necessary actions.";
            appBody += "<br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            int i = cmm.sendemail(appBody, empEmail, appSubject, "smtp_hrispb");
        }
        private void sendEmailNotification_old(string empName, string empEmail, string applicantname, string applicantmob, string appNumber, string applicantSTN)
        {
            string appSubject, appBody;
            string wfrom = "no-reply.hris@akashvani.in";
            //string wfrom = "priyankglb2012@gmail.com";
            appSubject = "Urgent:New Transfer Request Application Received";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> A new transfer application has been received. The details are as follows: ";
            appBody += "<br /> Application Number: " + appNumber;
            appBody += "<br /> Applicant Name: " + applicantname;
            appBody += "<br /> Applicant Mobile Number: " + applicantmob;
            appBody += "<br /> Applicant Station/Office: " + applicantSTN;

            appBody += ". Kindly Login on PrasarNet, as an employee, for necessary actions.";
            appBody += "<br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            SmtpClient client = new SmtpClient();
            client.Host = "203.122.51.200";
            client.Port = 25;
            //client.EnableSsl = true;
            ////'client.Host = "mail.akashvani.in"
            //client.Host = "smtp.gmail.com";
            //client.Port = 587;
            System.Net.NetworkCredential wCred = new NetworkCredential("no-reply.hris", "HRIS@2018");
            //client.UseDefaultCredentials = false;
            client.Credentials = wCred;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            //MailMessage message = new MailMessage(wfrom, empEmail, appSubject, appBody);
            MailMessage message = new MailMessage();
            message.From = new MailAddress(wfrom);
            message.To.Add(empEmail);
            message.Subject = appSubject;
            message.Body = appBody;
            message.IsBodyHtml = true;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                //+ ex.ToString() 
            }
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string[] arr = { };
                List<string> city = new List<string>();
                List<string> tencity = new List<string>();

                // Add items using Add method   

                if (lblstate1_pre.Text != "None")
                {
                    if (lblCity1_Pre.Text != "None")
                    {
                        // arr[0]= lblCity1_Pre.Text;
                        city.Add(lblCity1_Pre.Text);
                    }
                }
                if (lblstate2_pre.Text != "None")
                {
                    if (lblcity2_pre.Text != "None")
                    {
                        //arr[1] = lblcity2_pre.Text;
                        city.Add(lblcity2_pre.Text);
                    }
                }
                if (lblstate3_Pre.Text != "None")
                {
                    if (lblCity3_Pre.Text != "None")
                    {
                        // arr[2] = lblCity3_Pre.Text;
                        city.Add(lblCity3_Pre.Text);
                    }
                }

                // Add tencity 

                if (lblstateop1_pre.Text != "None")
                {
                    if (lblcityop1_pre.Text != "None")
                    {
                        // arr[0]= lblCity1_Pre.Text;
                        tencity.Add(lblcityop1_pre.Text);
                    }
                }
                if (lblstateop2_pre.Text != "None")
                {
                    if (lblcityop2_pre.Text != "None")
                    {
                        //arr[1] = lblcity2_pre.Text;
                        tencity.Add(lblcityop2_pre.Text);
                    }
                }
                if (lblstateop3_pre.Text != "None")
                {
                    if (lblop3city.Text != "None")
                    {
                        // arr[2] = lblCity3_Pre.Text;
                        tencity.Add(lblop3city.Text);
                    }
                }
                //int duplicateval = duplicate(arr);
                var hasDuplicatescity = city.GroupBy(x => x).Any(g => g.Count() > 1);// if any element is duplicate then return true
                var hasDuplicatescity_ten = tencity.GroupBy(x => x).Any(g => g.Count() > 1);
                if (hasDuplicatescity)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Duplicate entries in transfer options, in point 14, are not allowed');", true);
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                }
                else if (hasDuplicatescity_ten)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Duplicate entries in options after the completion of Tenure, in point 18, are not allowed');", true);
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                }

                else if (!hasDuplicatescity && !hasDuplicatescity_ten)
                {

                    int id = 0;
                    string ip = cmm.GetIp_Priyank();
                    if (Session["New_old"].ToString() == "NApp")
                    {
                        id = Convert.ToInt32(Session["basic_Det_id"]);
                    }
                    else if (Session["New_old"].ToString() == "OApp")
                    {
                        id = Convert.ToInt32(Session["id_Dash_T"]);
                    }
                    ds = cmm.RunSpReturnDSParam("PN21_Trans_EmployeeDetails", "PRASARNETConnectionString", new SqlParameter("@employeeid", Convert.ToInt32(lblappempid.Text))
                                                                                               , new SqlParameter("@flag", 2)); //Convert.ToInt32(lblappempid.Text)

                    string email = ds.Tables[0].Rows[0][3].ToString();
                    string mobile = ds.Tables[0].Rows[0][2].ToString();
                    string name = ds.Tables[0].Rows[0][5].ToString();

                    string applicantname = lblname_pre.Text;
                    string appmobno = lblcontact_pre.Text;
                    string applicantAppNumber = lblappno.Text;
                    string applicantstn = lblpresent_pre.Text;
                    int Dealing_StnSec_empId;
                    Dealing_StnSec_empId = Convert.ToInt32(ViewState["HoonameID"]);
                    if (CheckBox1.Checked)
                    {
                        int i = cmm.RunSP("PN21_Trans_FinalSubmit", "PRASARNETConnectionString", new SqlParameter("@id", id)
                                                                                               , new SqlParameter("@createdby", Session["UserName"].ToString())
                                                                                               , new SqlParameter("@ip", ip)
                                                                                               , new SqlParameter("@appId", id)
                                                                                               , new SqlParameter("@DealingUsertypeId", 10)
                                                                                               //, new SqlParameter("@Dealing_StnSec_empId", Convert.ToInt32(Dealing_StnSec_empId))
                                                                                               , new SqlParameter("@Dealing_StnSec_empId", Convert.ToInt32(lblappempid.Text))

                                                                                               , new SqlParameter("@createdbyid", Convert.ToInt32(Session["empid"]))
                                                                                               , new SqlParameter("@createdbyUTID", Convert.ToInt32(Session["Usertype"]))

                                                                                               , new SqlParameter("@Name_emp", lblname_pre.Text)
                                                                                               , new SqlParameter("@Emp_dob", lblDOB_pre.Text)
                                                                                               , new SqlParameter("@Emp_Designation", lblDesgn_Pre.Text)
                                                                                               , new SqlParameter("@emp_contactno", lblcontact_pre.Text)
                                                                                               , new SqlParameter("@emp_Email", lblemail_pre.Text)
                                                                                               , new SqlParameter("@emp_present_place", lblpresent_pre.Text)
                                                                                               , new SqlParameter("@emp_DOJ_present", lblDOJ_Pre.Text)
                                                                                               , new SqlParameter("@emp_noyears_served", lblnoofYears_pre.Text)
                                                                                               , new SqlParameter("@emp_date_retire", lblDOS_Pre.Text)
                                                                                               , new SqlParameter("@presntplace_tenure", lblpresent_Place_Ten_Pre.Text)
                                                                                               , new SqlParameter("@tenure", lblten_Years_Pre.Text)
                                                                                               , new SqlParameter("@DAYSremaining_com_ten", lbldays_remain_Pre.Text)
                                                                                               , new SqlParameter("@Days_exceeded_after_comten", lbldaysexceed_pre.Text)
                                                                                               , new SqlParameter("@flag", 1));
                        if (i > 0)
                        {
                            // sendEmailNotification(name, email, applicantname, appmobno, applicantAppNumber, applicantstn);
                            if (email != "")
                            {
                                sendEmailNotification(name, email, applicantname, appmobno, applicantAppNumber, applicantstn);
                            }
                            //A new {#var#} {#var#} has been received, with Application RefID {#var#}.Kindly login into {#var#} for necessary actions.Prasar Bharati
                            string msgsend = "A new transfer request has been received, with Application RefID " + lblappno.Text + ".Kindly login into PrasarNet for necessary actions.Prasar Bharati";
                            Boolean ret = cmm.sendMobileOTP1(mobile, "", msgsend);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Application Submitted Successfully!!');", true);
                            Response.Redirect("~/Transfer_M/DashBoard_T.aspx", false);
                            // Session["status_dash"] = "";
                            Session["New_old"] = null;
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
                            bindgrid_Training_prev();
                            Bind_Transfergrid_prev();
                            bindgrid_Records_prev();
                            Bind_Healthcategorygrid_prev();
                            bindgridupload_prev();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Read and Tick the Declaration!!');", true);
                        CheckBox1.Focus();
                        bindgrid_Training_prev();
                        Bind_Transfergrid_prev();
                        bindgrid_Records_prev();
                        Bind_Healthcategorygrid_prev();
                        bindgridupload_prev();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Duplicate entries in transfer options, in point 14 & 18, are not allowed');", true);
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
                bindgrid_Training_prev();
                Bind_Transfergrid_prev();
                bindgrid_Records_prev();
                Bind_Healthcategorygrid_prev();
                bindgridupload_prev();
            }
        }
        private int duplicate(string[] arr)
        {
            int count = 1;
            for (int i = 0; i < arr.Length; i++)
            {
                for (int j = i + 1; j < arr.Length; j++)
                {
                    // If duplicate element found then increment count by 1
                    if (arr[i] == arr[j])
                    {
                        count += 1;

                        break;
                    }
                    Console.WriteLine("{0}", count);
                }
            }
            return count;
        }
        protected void grdUpload_pre_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdUpload_pre.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_Documents_Sp", "PRASARNETConnectionString",
                                                                                                       new SqlParameter("@flag", "5"),
                                                                                                       new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][5]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][5].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][5].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][5].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgridupload();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgridupload();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgridupload();
                    //lblResultUpload.Text = "Some Issue occured while downloading a document.Try Again!!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdUpload_pre.Focus();
            }
        }

        protected void Menu_sub_MenuItemClick(object sender, MenuEventArgs e)
        {
            int menuvalue = Convert.ToInt16(Menu_sub.SelectedItem.Value);
            if (menuvalue == 0)//BasicInformation
            {
                MultiView1.ActiveViewIndex = 0;
                if (Session["New_old"].ToString() == "NApp")
                {
                    divlblMsg.Visible = true;
                    bindbasicinfo();
                    cmm.bindDDLWidParam(ddloption1State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddloption2_State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddloption3State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddltenstate1, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddltenstate2, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddltenstate3, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
                    cmm.bindDDLWidParam(ddlground, "PN21_Trans_ReasonforTrans", "conditions_transfer", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));

                    if (Session["basic_Det_id"] != null)
                    {
                        btnstp3.Visible = true;
                    }
                    else
                    {
                        btnstp3.Visible = false;
                    }
                }
                else if (Session["New_old"].ToString() == "OApp")
                {
                    int id = 0;
                    if (Session["New_old"].ToString() == "NApp")
                    {
                        id = Convert.ToInt32(Session["basic_Det_id"]);
                    }
                    else if (Session["New_old"].ToString() == "OApp")
                    {
                        id = Convert.ToInt32(Session["id_Dash_T"]);
                    }
                    divlblMsg.Visible = false;

                    bindbasicinfo();
                    basicdetbind(id);
                    btnstp3.Visible = true;
                    btnsavebasic.Visible = false;
                    btneditbasic.Visible = true;

                }

            }
            else if (menuvalue == 1)//Training Acquired
            {
                MultiView1.ActiveViewIndex = 1;
                bindgrid_Training();
            }
            else if (menuvalue == 2)//Trasfer History
            {
                MultiView1.ActiveViewIndex = 2;
                Bind_Transfergrid();
                Bind_Wing();
                Bind_Organization();
            }
            else if (menuvalue == 3)//Other Records
            {
                MultiView1.ActiveViewIndex = 3;
                bindgrid_Records();
            }
            else if (menuvalue == 4)//PwD Details
            {
                MultiView1.ActiveViewIndex = 4;
                Bind_Healthcategorygrid();
            }
            else if (menuvalue == 5)//Documents Upload
            {
                MultiView1.ActiveViewIndex = 5;
                bindgridupload();
            }
            else if (menuvalue == 6)//Preview & Submit
            {
                try
                {
                    MultiView1.ActiveViewIndex = 6;
                    bind_prev_Info();
                    bindgrid_Training_prev();
                    Bind_Transfergrid_prev();
                    bindgrid_Records_prev();
                    Bind_Healthcategorygrid_prev();
                    bindgridupload_prev();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void btneditbasic_Click(object sender, EventArgs e)
        {
            ViewState["edit"] = 1;
            btnUpdateBasic.Visible = true;
            btnsavebasic.Visible = false;
            btneditbasic.Visible = false;
            btnstp3.Visible = false;
            btncncl.Visible = true;
            int nomenuitem = Menu_sub.Items.Count;
            Menu_sub.Visible = false;

            divlanguage.Visible = true;
            divlbllanguage.Visible = false;
            divappFwd.Visible = true;
            divlblAppFwd.Visible = false;
            divop1.Visible = true;
            divlblop1.Visible = false;

            divoption2.Visible = true;
            divlblOption2.Visible = false;

            divOption3.Visible = true;
            divlblOption3.Visible = false;

            divreason.Visible = true;
            divlblreason.Visible = false;

            divhometown.Visible = true;
            divlblhometown.Visible = false;

            divground.Visible = true;
            divlblGround.Visible = false;

            divsubject.Visible = true;
            divlblsubject.Visible = false;

            divdetails.Visible = true;
            divlbldetails.Visible = false;

            div3.Visible = true;
            div4.Visible = false;

            divtransbenefits.Visible = true;
            divlbltransbenefits.Visible = false;

            divTenure1.Visible = true;
            divlblTenure1.Visible = false;

            divtenure2.Visible = true;
            divlbltenure2.Visible = false;

            divtenure3.Visible = true;
            divlbltenure3.Visible = false;

            int id = 0;
            if (Session["New_old"].ToString() == "NApp")
            {
                id = Convert.ToInt32(Session["basic_Det_id"]);
            }
            else if (Session["New_old"].ToString() == "OApp")
            {
                id = Convert.ToInt32(Session["id_Dash_T"]);
            }

            cmm.bindDDLWidParam(ddloption1State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddloption2_State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddloption3State, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddltenstate1, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddltenstate2, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddltenstate3, "PN21_Trans_State_Sp", "StateName", "stateid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlground, "PN21_Trans_ReasonforTrans", "conditions_transfer", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));

            ds = cmm.RunSpReturnDSParam("PN21_Tran_EmpAppliaction", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                       new SqlParameter("@id", id));

            txtlanguage.Text = ds.Tables[0].Rows[0][3].ToString();
            //txtappforwarded.Text = ds.Tables[0].Rows[0][18].ToString();
            lblappforwarded.Text = ds.Tables[0].Rows[0][18].ToString();
            ddloption1State.ClearSelection();

            if (ds.Tables[0].Rows[0][20].ToString() != "None")
            {
                ddloption1State.Items.FindByText(ds.Tables[0].Rows[0][20].ToString()).Selected = true;
                cmm.bindDDLWidParam(ddloption1city, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                           new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                            new SqlParameter("@cityid3", ddloption3City.SelectedValue),
                                                                                                                                         new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][33].ToString())));//@stateid
                ddloption1city.ClearSelection();
                ddloption1city.Items.FindByText(ds.Tables[0].Rows[0][19].ToString()).Selected = true;
            }

            ddloption2_State.ClearSelection();

            if (ds.Tables[0].Rows[0][22].ToString() != "None")
            {
                ddloption2_State.Items.FindByText(ds.Tables[0].Rows[0][22].ToString()).Selected = true;
                cmm.bindDDLWidParam(ddloption2_City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                 new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                            new SqlParameter("@cityid3", ddloption3City.SelectedValue),


                                                                                                                                   new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][34].ToString())));//@stateid


                ddloption2_City.ClearSelection();
                ddloption2_City.Items.FindByText(ds.Tables[0].Rows[0][21].ToString()).Selected = true;
            }

            ddloption3State.ClearSelection();

            if (ds.Tables[0].Rows[0][24].ToString() != "None")
            {
                ddloption3State.Items.FindByText(ds.Tables[0].Rows[0][24].ToString()).Selected = true;
                cmm.bindDDLWidParam(ddloption3City, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),

                                                                                                                                         new SqlParameter("@cityid1", ddloption1city.SelectedValue),
                                                                                                                                        new SqlParameter("@cityid2", ddloption2_City.SelectedValue),
                                                                                                                                        new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][35].ToString())));//@stateid

                ddloption3City.ClearSelection();
                ddloption3City.Items.FindByText(ds.Tables[0].Rows[0][23].ToString()).Selected = true;
            }


            ddltenstate1.ClearSelection();

            if (ds.Tables[0].Rows[0][26].ToString() != "None")
            {
                ddltenstate1.Items.FindByText(ds.Tables[0].Rows[0][26].ToString()).Selected = true;

                cmm.bindDDLWidParam(ddltenCity1, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                        new SqlParameter("@cityid2", ddltenCity2.SelectedValue),
                                                                                                                                        new SqlParameter("@cityid3", ddltencity3.SelectedValue),
                                                                                                                                        new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][36].ToString())));//@stateid
                ddltenCity1.ClearSelection();
                ddltenCity1.Items.FindByText(ds.Tables[0].Rows[0][25].ToString()).Selected = true;
            }


            ddltenstate2.ClearSelection();
            if (ds.Tables[0].Rows[0][28].ToString() != "None")
            {
                ddltenstate2.Items.FindByText(ds.Tables[0].Rows[0][28].ToString()).Selected = true;

                cmm.bindDDLWidParam(ddltenCity2, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                        new SqlParameter("@cityid1", ddltenCity1.SelectedValue),
                                                                                                                                        new SqlParameter("@cityid3", ddltencity3.SelectedValue),
                                                                                                                                        new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][37].ToString())));//@stateid
                ddltenCity2.ClearSelection();
                ddltenCity2.Items.FindByText(ds.Tables[0].Rows[0][27].ToString()).Selected = true;
            }


            ddltenstate3.ClearSelection();
            if (ds.Tables[0].Rows[0][30].ToString() != "None")
            {
                ddltenstate3.Items.FindByText(ds.Tables[0].Rows[0][30].ToString()).Selected = true;

                cmm.bindDDLWidParam(ddltencity3, "PN21_Trans_City_Sp", "cityname", "cityid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1),
                                                                                                                                        new SqlParameter("@cityid1", ddltenCity1.SelectedValue),
                                                                                                                                        new SqlParameter("@cityid2", ddltenCity2.SelectedValue),
                                                                                                                                        new SqlParameter("@stateid", Convert.ToInt16(ds.Tables[0].Rows[0][38].ToString())));//@stateid

                ddltencity3.ClearSelection();
                ddltencity3.Items.FindByText(ds.Tables[0].Rows[0][29].ToString()).Selected = true;
            }
            txtreasonnone.Text = ds.Tables[0].Rows[0][8].ToString();

            txthometown.Text = ds.Tables[0].Rows[0][4].ToString();

            ddlground.ClearSelection();
            ddlground.Items.FindByText(ds.Tables[0].Rows[0][31].ToString()).Selected = true;

            txtsub.Text = ds.Tables[0].Rows[0][13].ToString();
            txtdetails.Text = ds.Tables[0].Rows[0][14].ToString();

            ddlmedicalfa.ClearSelection();
            ddlmedicalfa.Items.FindByText(ds.Tables[0].Rows[0][15].ToString()).Selected = true;

            ddltrans_bene.ClearSelection();
            ddltrans_bene.Items.FindByText(ds.Tables[0].Rows[0][16].ToString()).Selected = true;
            hdnValue.Value = ds.Tables[0].Rows[0]["ForwardedtoID"].ToString();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            int basid;

            if (Session["New_old"].ToString() == "OApp")
            {
                basid = Convert.ToInt32(Session["id_Dash_T"]);
            }
            else
            {
                basid = Convert.ToInt32(Session["id_Dash_T"]);
            }

            ViewState["edit"] = 0;
            Menu_sub.Visible = true;
            divlblMsg.Visible = false;

            bindbasicinfo();
            basicdetbind(basid);

            btnUpdateBasic.Visible = false;
            btnsavebasic.Visible = false;
            btneditbasic.Visible = true;
            btnstp3.Visible = true;
            btncncl.Visible = false;
        }



        protected void grdhealth_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_THealthcategoryPWDSD", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                                new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                Bind_Healthcategorygrid();
                                lblResultUpload.Text = "There is no document to download!!";
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        Bind_Healthcategorygrid();
                        lblResultUpload.Text = "There is no document to download!!";
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    Bind_Healthcategorygrid();
                    lblResultUpload.Text = "Some Issue occured while downloading a document.Try Again!!";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdhealth.Focus();
            }
        }

        protected void grdhealth_pre_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("download"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/Transfer_M/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth_pre.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN21_Trans_THealthcategoryPWDSD", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                                new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                Bind_Healthcategorygrid_prev();
                                lblResultUpload.Text = "There is no document to download!!";
                            }
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        Bind_Healthcategorygrid_prev();
                        lblResultUpload.Text = "There is no document to download!!";
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    Bind_Healthcategorygrid_prev();
                    lblResultUpload.Text = "Some Issue occured while downloading a document.Try Again!!";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdhealth_pre.Focus();
            }
        }


        protected void grdhealth_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddltypefooter = (DropDownList)e.Row.FindControl("ddltypefooter");
                cmm.bindDDLWidParam(ddltypefooter, "PN21_SP_TypeofDisabilities", "TypeofDisability", "id", "PRASARNETConnectionString", "--Select--", new SqlParameter("@flag", 1));

            }
        }

        protected void btnUpdateBasic_Click(object sender, EventArgs e)
        {
            try
            {
                int basid;

                if (Session["New_old"].ToString() == "OApp")
                {
                    basid = Convert.ToInt32(Session["id_Dash_T"]);
                }
                else
                {
                    // Session["basic_Det_id"]
                    basid = Convert.ToInt32(Session["basic_Det_id"]);
                }
                string ip = cmm.GetIp_Priyank();

                //int forwaredtoID = Convert.ToInt32(hdnValue.Value); //updated on 27-11-2024
                int forwaredtoID = Convert.ToInt32(ViewState["HoonameID"]); ;
                int forwardusertypeid = 10;

                int empid = Convert.ToInt32(Session["empid"]);
                string language = txtlanguage.Text.Trim();
                string hometown = txthometown.Text.Trim();

                int seekingop1 = Convert.ToInt32(ddloption1city.SelectedValue);
                int seekingop2 = 0, seekingop3 = 0;
                if (ddloption2_City.SelectedValue != "")
                {
                    if (seekingop2 == seekingop1)
                    {
                        seekingop2 = 0;
                    }
                    else
                    {
                        seekingop2 = Convert.ToInt32(ddloption2_City.SelectedValue);
                    }
                }
                if (ddloption3City.SelectedValue != "")
                {
                    if (seekingop3 == seekingop2 || seekingop3 == seekingop1)
                    {
                        seekingop3 = 0;
                    }
                    else
                    {
                        seekingop3 = Convert.ToInt32(ddloption3City.SelectedValue);
                    }

                }
                string reason = txtreasonnone.Text.Trim();
                int tenop1 = 0, tenop2 = 0, tenop3 = 0;
                if (ddltenCity1.SelectedValue != "")
                {
                    tenop1 = Convert.ToInt32(ddltenCity1.SelectedValue);
                }
                if (ddltenCity2.SelectedValue != "")
                {
                    tenop2 = Convert.ToInt32(ddltenCity2.SelectedValue);
                }
                if (ddltencity3.SelectedValue != "")
                {
                    tenop3 = Convert.ToInt32(ddltencity3.SelectedValue);
                }
                int groundofTransfer = Convert.ToInt32(ddlground.SelectedValue);
                string sub_grnd = txtsub.Text.Trim();
                string details = txtdetails.Text.Trim();

                string medicalFacAvailable = Convert.ToString(ddlmedicalfa.SelectedItem.Text);
                string want_trans_ben = Convert.ToString(ddltrans_bene.SelectedItem.Text);
                string createdby = Convert.ToString(Session["empid"]);

                string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(conf);
                conn.Open();

                forwaredtoID = Convert.ToInt32(ViewState["HoonameID"]);
                SqlCommand cmd = new SqlCommand("PN21_Trans_basic_sp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", basid);
                cmd.Parameters.AddWithValue("@Employeeid", empid);
                cmd.Parameters.AddWithValue("@LanguageKnown", language);
                cmd.Parameters.AddWithValue("@HomeTown", hometown);
                cmd.Parameters.AddWithValue("@FwdtoUsertypeid", forwardusertypeid);
                cmd.Parameters.AddWithValue("@ForwardedtoID", forwaredtoID);
                cmd.Parameters.AddWithValue("@seekingOp1", seekingop1);
                cmd.Parameters.AddWithValue("@seekingOp2", seekingop2);
                cmd.Parameters.AddWithValue("@seekingOp3", seekingop3);
                cmd.Parameters.AddWithValue("@Reason_If_SelectedNone", reason);
                cmd.Parameters.AddWithValue("@Ten_seekingOP1", tenop1);
                cmd.Parameters.AddWithValue("@Ten_seekingOP2", tenop2);
                cmd.Parameters.AddWithValue("@Ten_seekingOP3", tenop3);
                cmd.Parameters.AddWithValue("@Grnd_TransReqd", groundofTransfer);
                cmd.Parameters.AddWithValue("@Subject_Grnd", sub_grnd);
                cmd.Parameters.AddWithValue("@Details_Grnd", details);
                cmd.Parameters.AddWithValue("@medicalfacilitiesAvailbale", medicalFacAvailable);
                cmd.Parameters.AddWithValue("@WantTrans_Benefit", want_trans_ben);
                cmd.Parameters.AddWithValue("@ip", ip);
                cmd.Parameters.AddWithValue("@createdby", createdby);
                cmd.Parameters.AddWithValue("@flag", 2);
                int i = cmd.ExecuteNonQuery();
                conn.Close();

                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Information Updated Successfully!!');", true);
                    basicdetbind(basid);
                    btnUpdateBasic.Visible = false;
                    btnsavebasic.Visible = false;
                    btneditbasic.Visible = true;
                    btnstp3.Visible = true;
                    btncncl.Visible = false;
                    Menu_sub.Visible = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void ddloption1city_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddloption1city.SelectedIndex != 0)
            {
                ddloption2_State.Enabled = true;
                ddloption2_City.Enabled = true;
                //ddloption2cityload();
               
                //
            }
            if (ddloption1city.SelectedValue == ddloption2_City.SelectedValue)
            {
                ddloption2_City.ClearSelection();

            }
            if (ddloption1city.SelectedValue == ddloption3City.SelectedValue)
            {
                ddloption3City.ClearSelection();

            }
            //else
            //{
            //    ddloption2_State.Enabled = false;
            //}
        }

        protected void ddloption2_City_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddloption2_City.SelectedIndex != 0)
            {
                ddloption3State.Enabled = true;
                //ddloption3cityload();



                if (ddloption1city.SelectedValue == ddloption2_City.SelectedValue)
                {
                    ddloption1city.ClearSelection();
                }
                if (ddloption2_City.SelectedValue == ddloption3City.SelectedValue)
                {
                    ddloption3City.ClearSelection();

                }
            }
            //else
            //{
            //    ddloption3State.Enabled = false;
            //}
        }

        protected void ddloption3City_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddloption3City.SelectedIndex != 0)
            {
                //ddloption3State.Enabled = true;
                //ddloption3cityload();



                if (ddloption3City.SelectedValue == ddloption1city.SelectedValue)
                {
                    ddloption1city.ClearSelection();
                }
                if (ddloption2_City.SelectedValue == ddloption3City.SelectedValue)
                {
                    ddloption2_City.ClearSelection();

                }
            }
        }
    }
}