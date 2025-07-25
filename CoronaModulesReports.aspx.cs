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
    public partial class CoronaModulesReports : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
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
                    cmm.bindDDLWidParam(ddlzone, "PN18_Zone", "ShortCode", "IT_ZONEID", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1));
                    ds = cmm.RunSpReturnDSParam("Corona_PN18_Report", "PRASARNETConnectionString", new SqlParameter("@flag", "2"));
                    lblfirst.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][0]).ToString("dd-MM-yyyy");
                    lbllast.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][1]).ToString("dd-MM-yyyy");
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        guestmenu.Visible = false;
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
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
                        guestmenu.Visible = false;
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// management
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
                            guestmenu.Visible = false;
                            empmenu.Visible = false;
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
                            guestmenu.Visible = false;
                            empmenu.Visible = false;
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

        private void BindChart_Schemewise()
        {

            StringBuilder str = new StringBuilder();


            try
            {
                DateTime? from = null;
                DateTime? to = null;
                int zoneid = 0;
                int stateid = 0;
                string status = null;
                int flag = 3;

                if (ddlstatus.SelectedIndex != 0)
                {
                    if (ddlstatus.SelectedValue == "1")// Active
                    {
                        flag = 3;
                        status = " Not-Yet ";
                    }
                    else if (ddlstatus.SelectedValue == "2")// cured
                    {
                        flag = 4;
                    }
                    else if (ddlstatus.SelectedValue == "3")// Deceased
                    {
                        flag = 3;
                        status = " Deceased ";
                    }
                }
                if (txtdatefrom.Text != "")
                {
                    from = DateTime.ParseExact(txtdatefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }
                if (txtdateto.Text != "")
                {
                    to = DateTime.ParseExact(txtdateto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                }
                if (ddlzone.SelectedIndex != 0)
                {
                    zoneid = Convert.ToInt16(ddlzone.SelectedValue);
                    if (ddlstate.SelectedIndex != 0)
                    {
                        stateid = Convert.ToInt16(ddlstate.SelectedValue);
                    }
                }
                
                ds = cmm.RunSpReturnDSParam("Corona_PN18_Report", "PRASARNETConnectionString", new SqlParameter("@flag", flag)
                                                                                                      , new SqlParameter("@zoneid", zoneid)
                                                                                                      , new SqlParameter("@stateid", stateid)
                                                                                                      , new SqlParameter("@coronapositiveonfrom", from)
                                                                                                      , new SqlParameter("@coronapositiveonTo", to)
                                                                                                      , new SqlParameter("@discharged_deceased_completionhomequran", status));

                str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});

                       google.setOnLoadCallback(drawChart);

                       function drawChart() {

        var data = new google.visualization.DataTable();

        data.addColumn('string', 'weeknyear');

        data.addColumn('number', 'No_of_Cases'); 

        data.addRows(" + ds.Tables[0].Rows.Count + ");");

                for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + ds.Tables[0].Rows[i]["weeknyear"].ToString() + "');");

                    str.Append("data.setValue(" + i + "," + 1 + "," + ds.Tables[0].Rows[i]["No_of_Cases"].ToString() + ") ;");

                    //str.Append("data.setValue(" + i + "," + 2 + "," + dt_scheme.Rows[i]["TotalExp"].ToString() + ") ;");
                }

                if (ddlcharttype.SelectedValue.ToString() == "1")  // If you want chart type in column Chart
                {
                    str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));");

                    str.Append(" chart.draw(data, {width: 800, height: 380, title: 'Weekwise Corona Cases inside the Prasar Bharati, as per Filter Option(s) selected-Column Chart',");

                    str.Append("hAxis: {title: 'Week and Year', titleTextStyle: {color: 'Black'}}");

                    str.Append("}); }");

                    str.Append("</script>");

                    lt.Text = str.ToString().Replace('*', '"');
                }
                else if (ddlcharttype.SelectedValue.ToString() == "2")  // If you want chart type in Line Chart
                {
                    str.Append(" var chart = new google.visualization.LineChart(document.getElementById('chart_div'));");

                    str.Append(" chart.draw(data, {width: 900, height: 400, title: 'Weekwise Corona Cases inside the Prasar Bharati, as per Filter Option(s) selected-Line Chart',");

                    str.Append("hAxis: {title: 'Week and Year', titleTextStyle: {color: 'Black'}}");

                    str.Append("}); }");

                    str.Append("</script>");

                    lt.Text = str.ToString().Replace('*', '"');
                }
                else if (ddlcharttype.SelectedValue.ToString() == "3")  // If you want chart type in Line Chart
                {
                    str.Append(" var chart = new google.visualization.PieChart(document.getElementById('chart_div'));");

                    str.Append(" chart.draw(data, {width: 900, height: 400, title: 'Weekwise Corona Cases inside the Prasar Bharati, as per Filter Option(s) selected-Pie Chart',");

                    str.Append("hAxis: {title: 'Week and Year', titleTextStyle: {color: 'Black'}}");

                    str.Append("}); }");

                    str.Append("</script>");

                    lt.Text = str.ToString().Replace('*', '"');
                }
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Please,Try Again!!');", true);
            }



        }

        protected void ddlcharttype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcharttype.SelectedItem.Text != "--Select--")
            {
                divchartmain.Focus();
                Label5.Focus();
                divdate.Visible = true;
                divchartmain.Visible = true;
                BindChart_Schemewise();
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("PB_CoronaWarriors.aspx", true);
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (ddlcharttype.SelectedItem.Text != "--Select--")
            {
                divchartmain.Focus();
                Label5.Focus();
                divdate.Visible = true;
                divchartmain.Visible = true;
                BindChart_Schemewise();
            }
        }

        protected void ddlzone_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlzone.SelectedIndex != 0)
                cmm.bindDDLWidParam(ddlstate, "PN18_State", "StateName", "StateId", "PRASARNETConnectionString", "--All--", new SqlParameter("@flag", 1)
                                                                                                                          , new SqlParameter("@zoneid", Convert.ToInt16(ddlzone.SelectedValue)));

        }
        //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ToString()))
        //{
        //    SqlCommand cmd = new SqlCommand("Corona_PN18_Report", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@flag", 1);
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataTable dt = new DataTable();
        //    dt.Clear();
        //    da.Fill(dt);
        //    List<object> chartData = new List<object>();
        //    chartData.Add(new object[]
        //{
        //"No_of_Cases", "weeknyear"
        //});
        //    foreach (DataRow dtrow in dt.Rows)
        //    {
        //        chartData.Add(new object[]
        //      {
        //                dtrow["No_of_Cases"], dtrow["weeknyear"]
        //      });

        //    }
        //    return chartData;

        //}


    }

}
