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
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Cast(DATEPART(MONTH,coronapositiveon) as varchar)="+dt+"
        }
        [WebMethod]
        public static List<object> GetChartData(string dt,string year)
        {

            try
            {

                string query = "SELECT COUNT(*) as  Y,'Month'+'-'+Cast(DATEPART(MONTH,coronapositiveon) as varchar)+' & '+'Year-'+cast(DATEPART(YEAR,coronapositiveon) as varchar) as X";
                query += " from PN18_CoronaWarriors where   Cast(DATEPART(MONTH,coronapositiveon) as varchar)=" + dt + " and cast(DATEPART(YEAR,coronapositiveon) as varchar)=" + year.ToString() + " and isactive=1 group by DATEPART(MONTH,coronapositiveon),DATEPART(YEAR,coronapositiveon) order by datepart(MONTH,coronapositiveon) asc";
                //string query = "Select count(*) as y,StationName as x from HRIS.dbo.TRN_EmployeePersonalDetails as emp left join HRIS.dbo.MST_station as stn on stn.stationid = emp.stationid";
                //query += "where stn.StateID =7 and stationname not like '%ccw%' group by stn.StationName";
                string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                List<object> chartData = new List<object>();


                chartData.Add(new object[]
                {
        "x", "y"
                });
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                chartData.Add(new object[]
                                {
                        sdr["x"], sdr["y"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            catch(Exception ex)
            {
               
             //   ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex + "');", true);
                return null;
                
            }
        }
        private void BindChart()
        {

            StringBuilder str = new StringBuilder();


            try
            {
                string con = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection cn;
                cn = new SqlConnection(con);
                cn.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter();
                DataSet ds = new DataSet();
                SqlCommand cmd = new SqlCommand("test", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                //            cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = txtName.Text;
                //cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmailAddress.Text;
                //cmd.Parameters.Add("@Password ", SqlDbType.NVarChar, 50).Value = txtPassword.Text;

                sqlDa.SelectCommand = cmd;
                sqlDa.Fill(ds);
                cmd.CommandTimeout = cn.ConnectionTimeout;
                sqlDa.Dispose();
                cn.Close();

                str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});

                       google.setOnLoadCallback(drawChart);

                       function drawChart() {

        var data = new google.visualization.DataTable();

        data.addColumn('string', 'X-Axis');

        data.addColumn('number', 'Y-Axis'); 

        data.addRows(" + ds.Tables[0].Rows.Count + ");");

                for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    str.Append("data.setValue( " + i + "," + 0 + "," + "'" + ds.Tables[0].Rows[i]["X"].ToString() + "');");

                    str.Append("data.setValue(" + i + "," + 1 + "," + ds.Tables[0].Rows[i]["Y"].ToString() + ") ;");

                    //str.Append("data.setValue(" + i + "," + 2 + "," + dt_scheme.Rows[i]["TotalExp"].ToString() + ") ;");
                }

                //if (ddlcharttype.SelectedValue.ToString() == "1")  // If you want chart type in column Chart
                //{
                    str.Append(" var chart = new google.visualization.LineChart(document.getElementById('chart_div'));");

                    str.Append(" chart.draw(data, {width: 800, height: 380, title: 'Test',");

                    str.Append("hAxis: {title: 'X', titleTextStyle: {color: 'Black'}}");

                    str.Append("}); }");

                    str.Append("</script>");

                    lt.Text = str.ToString().Replace('*', '"');
                //}
                //else if (ddlcharttype.SelectedValue.ToString() == "2")  // If you want chart type in Line Chart
                //{
                //    str.Append(" var chart = new google.visualization.LineChart(document.getElementById('chart_div'));");

                //    str.Append(" chart.draw(data, {width: 900, height: 400, title: 'Weekwise Corona Cases inside the Prasar Bharati, as per Filter Option(s) selected-Line Chart',");

                //    str.Append("hAxis: {title: 'Week and Year', titleTextStyle: {color: 'Black'}}");

                //    str.Append("}); }");

                //    str.Append("</script>");

                //    lt.Text = str.ToString().Replace('*', '"');
                //}
                //else if (ddlcharttype.SelectedValue.ToString() == "3")  // If you want chart type in Line Chart
                //{
                //    str.Append(" var chart = new google.visualization.PieChart(document.getElementById('chart_div'));");

                //    str.Append(" chart.draw(data, {width: 900, height: 400, title: 'Weekwise Corona Cases inside the Prasar Bharati, as per Filter Option(s) selected-Pie Chart',");

                //    str.Append("hAxis: {title: 'Week and Year', titleTextStyle: {color: 'Black'}}");

                //    str.Append("}); }");

                //    str.Append("</script>");

                //    lt.Text = str.ToString().Replace('*', '"');
                //}
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Please,Try Again!!');", true);
            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddl1.SelectedIndex != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "drawChart()", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "alert('Select a Valid input')", true);
            }
        }
    }
}