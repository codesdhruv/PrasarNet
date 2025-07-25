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

namespace PrasarNet.EGrievance
{
    public partial class G_Rpt_Deptt : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../Logout.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
            {
                if (!IsPostBack)
                {
                    ViewState["serach_Gr"] = 0;
                   // gridbind();
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
                    if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
                    {
                        AdminMenu.Visible = true;
                        StationSectionMenu.Visible = false;
                    }
                }
                Label1.Text = Convert.ToString(Session["UserName"]);
                 gridbind();

            }

            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        private void gridbind()
        {//@createdbyusertypeid and createdbystnsecID=@createdbystnsecID
            ds = cmm.RunSpReturnDSParam("PN21_Grievance_Departmentwise", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            grddeptwise.DataSource = ds;
            grddeptwise.DataBind();
        }
        [WebMethod]
        public static List<object> GetChartDatarvd()
        {

            try
            {
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
                   "Department", "Grievance Recieved","Grievance Resolved"
                });

                string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection cn = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("PN21_Grievance_Departmentwise", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", 1);
                cn.Open();
                SqlDataReader sdr;
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    chartData.Add(new object[]
                    {
                        sdr["department"], sdr["rvd"], sdr["Res"]
                    });
                }
                cmd.Dispose();
                cn.Close();
                return chartData;
            }
            catch (Exception ex)
            {

                //   ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex + "');", true);
                return null;

            }
        }

        [WebMethod]
        public static List<object> GetChartDatares()
        {
            try
            {
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
                   "x", "y"
                });

                string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection cn = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("PN21_Grievance_Departmentwise", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", 3);
                cn.Open();
                SqlDataReader sdr;
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    chartData.Add(new object[]
                    {
                        sdr["x"], sdr["y"]
                    });
                }
                cmd.Dispose();
                cn.Close();
                return chartData;
            }
            catch (Exception ex)
            {

                //   ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex + "');", true);
                return null;

            }
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_DashBoard.aspx", true);
        }

        protected void lnkdashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_DashBoard.aspx", true);
        }

        protected void lnkofficewise_Click(object sender, EventArgs e)
        {

        }

        protected void lnksubjectwise_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_Rpt_SubjectWise.aspx", true);
        }       
    }
}