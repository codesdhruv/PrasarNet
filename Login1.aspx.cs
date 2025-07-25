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
using PBDll;
namespace PrasarNet

{
    public partial class Login1 : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["guest"] = 2;//login as authentication
                this.Form.DefaultButton = "btnlogin";
                ds = cmm.RunSpReturnDS("PN18_GetUsers", "PRASARNETConnectionString");
                rblusertype.DataSource = ds;
                rblusertype.DataTextField = "UserName";
                rblusertype.DataValueField = "uid";
                rblusertype.DataBind();
                rblusertype.SelectedIndex = 0;
                divusr.Visible = false;
                //Image1.ImageUrl = "/images/login2.png";
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
        private int activitylog(int selection, int off_empID, string username, string password, string selectedusertype, int utypeid)
        {
            int a = 0;
            string ipaddress2 = cmm.GetIp_Priyank();
            if (selection == 1)// For Sucessful Login
            {
                string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(conf);
                conn.Open();
                SqlCommand cmd = new SqlCommand("Pn18_User_login_activitylog_Sp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usertypeid", utypeid);
                cmd.Parameters.AddWithValue("@Office_empid", off_empID);
                cmd.Parameters.AddWithValue("@lastloginOn", Convert.ToDateTime(DateTime.Now));
                cmd.Parameters.AddWithValue("@ipaddress", ipaddress2);
                cmd.Parameters.AddWithValue("@userloginStatus", true);
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.Parameters.Add("@pid", SqlDbType.Int);// to get a out value from sql query
                cmd.Parameters["@pid"].Direction = ParameterDirection.Output;// to get a out value from sql query
                int i = cmd.ExecuteNonQuery();
                Session["pid"] = cmd.Parameters["@pid"].Value.ToString();
                conn.Close();
            }
            else if (selection == 0)// Invalid Credentials
            {
                a = cmm.RunSP("Pn18_User_login_activitylog_Sp", "PRASARNETConnectionString", new SqlParameter("@FailedLoginUsername", username),
                                                                                      new SqlParameter("@FailedPasssword", password),
                                                                                      new SqlParameter("@FailedtypeofUserSelected", selectedusertype),
                                                                                      new SqlParameter("@ipaddress", ipaddress2),
                                                                                      new SqlParameter("@userloginStatus", false),
                                                                                      new SqlParameter("@flag", 1));
            }
            else if (selection == 3)// for guest sucessful login
            {
                string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(conf);
                conn.Open();
                SqlCommand cmd = new SqlCommand("Pn18_User_login_activitylog_Sp", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FailedLoginUsername", username);
                cmd.Parameters.AddWithValue("@FailedPasssword", password);
                cmd.Parameters.AddWithValue("@FailedtypeofUserSelected", selectedusertype);
                cmd.Parameters.AddWithValue("@ipaddress", ipaddress2);
                cmd.Parameters.AddWithValue("@userloginStatus", true);
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.Parameters.Add("@pid", SqlDbType.Int);// to get a out value from sql query
                cmd.Parameters["@pid"].Direction = ParameterDirection.Output;// to get a out value from sql query
                int i = cmd.ExecuteNonQuery();
                Session["pid"] = cmd.Parameters["@pid"].Value.ToString();
                conn.Close();
            }
            else if (selection == 4)// for guest unsucessful login
            {
                a = cmm.RunSP("Pn18_User_login_activitylog_Sp", "PRASARNETConnectionString", new SqlParameter("@FailedLoginUsername", username),
                                                                                     new SqlParameter("@FailedPasssword", password),
                                                                                     new SqlParameter("@FailedtypeofUserSelected", selectedusertype),
                                                                                     new SqlParameter("@ipaddress", ipaddress2),
                                                                                     new SqlParameter("@userloginStatus", false),
                                                                                     new SqlParameter("@flag", 1));
            }
            return a;
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {

            if (Convert.ToInt16(Session["guest"]) == 2)// login by authentication
            {
                if (rblusertype.SelectedIndex == 0)// for Employee
                {
                    try
                    {
                        Session["empcode"] = txtusr.Text.Trim();
                        ds = cmm.RunSpReturnDSParam("PrasarNetLogin", "HRITConnectionString", new SqlParameter("@stnid", -1),
                                                                                              new SqlParameter("@pswd", Convert.ToString(txtpassword.Text)),
                                                                                              new SqlParameter("@empcode", Convert.ToString(txtusr.Text.Trim())),
                                                                                              new SqlParameter("@flag", 2));
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Session["isLogin"] = 1;

                            Session["UserName"] = ds.Tables[0].Rows[0][2];
                            Session["UserName"] +=" - "+ ds.Tables[0].Rows[0][0];
                            //+ " (" + ds.Tables[0].Rows[0][4] + " )";
                            Session["empid"] = ds.Tables[0].Rows[0][1];
                            Session["empcode"] = ds.Tables[0].Rows[0][0];
                            Session["Usertype"] = 10;
                            Session["DesignationName_login"] = ds.Tables[0].Rows[0][4];
                            Session["WingID"] = ds.Tables[0].Rows[0][3];
                            Session["UserId"] = 1;
                            int a = activitylog(1, Convert.ToInt32(Session["empcode"]), txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, Convert.ToInt32(Session["Usertype"]));
                            DataSet dschkvaccDet=new DataSet();
                            dschkvaccDet = cmm.RunSpReturnDSParam("PN21_checkEmpVaccinated", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToString(txtusr.Text.Trim())),
                                                                                   new SqlParameter("@flag", 1));
                            if (dschkvaccDet.Tables[0].Rows.Count > 0)
                            {
                                Response.Redirect("DashBoardNew.aspx", true);
                            }
                            else
                            {
                                Response.Redirect("PB_Corona_Vaccination_Status.aspx", true);
                            }

                        }
                        else
                        {
                            DataSet ds2 = new DataSet();
                            ds2 = cmm.RunSpReturnDSParam("PrasarNetLogin", "HRITConnectionString", new SqlParameter("@stnid", -1),
                                                                                  new SqlParameter("@pswd", Convert.ToString(txtpassword.Text)),
                                                                                  new SqlParameter("@empcode", Convert.ToString(txtusr.Text.Trim())),
                                                                                  new SqlParameter("@flag", 3));
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                if (!(Convert.ToBoolean(ds2.Tables[0].Rows[0][3])))
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee Code, does not Exists!!');", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                            }
                            int a = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                           
                        }
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message != "Thread was being aborted.")
                        {
                            int a = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                        }
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('OOPs..Some Error Occured!!');", true);
                    }
                }
                else if (rblusertype.SelectedIndex == 1)// For Station
                {
                    try
                    {
                        ds = cmm.RunSpReturnDSParam("PrasarNetLogin", "HRITConnectionString", new SqlParameter("@stnid", ddlstn.SelectedValue),
                                                                    new SqlParameter("@pswd", Convert.ToString(txtpassword.Text)),
                                                                    new SqlParameter("@empcode", -1),
                                                                    new SqlParameter("@flag", 1));
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DataSet dsstn = new DataSet();
                            dsstn = cmm.RunSpReturnDSParam("PrasarNetLogin", "HRITConnectionString", new SqlParameter("@stnid", ddlstn.SelectedValue),
                                                                    new SqlParameter("@pswd", "abc"),
                                                                    new SqlParameter("@empcode", -1),
                                                                    new SqlParameter("@flag", 4));
                            Session["zoneidLogin_A"] = dsstn.Tables[0].Rows[0][2];
                            Session["isLogin"] = 1;
                            Session["UserName"] = ddlstn.SelectedItem.Text;
                            Session["Org"] = ddlorg.SelectedItem.Text;
                            Session["Orgid"] = ds.Tables[0].Rows[0][4];
                            DataSet ds1 = new DataSet();
                            ds1 = cmm.RunSpReturnDSParam("PN18_usertypeproc", "PRASARNETConnectionString", new SqlParameter("@flag", 4),
                                                                                                          new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
                                                                                                          new SqlParameter("@userid", Convert.ToInt32(rblusertype.SelectedValue)));


                            Session["Usertype"] = ds1.Tables[0].Rows[0][0];
                            Session["Station_SectionID"] = ds.Tables[0].Rows[0][1];
                            Session["Uidmanagement"] = ds.Tables[0].Rows[0][1];
                            Session["stnid"] = ds.Tables[0].Rows[0][1];//Used by Monthly Reports ... Tarun and Mayuri 
                            Session["UserId"] = 2;
                            int a = activitylog(1, Convert.ToInt32(Session["Station_SectionID"]), ddlstn.SelectedItem.Text, txtpassword.Text, rblusertype.SelectedItem.Text, Convert.ToInt32(Session["Usertype"]));

                            Response.Redirect("DashBoardNew.aspx", true);

                        }
                        else
                        {
                            int a = activitylog(0, 0, ddlstn.SelectedItem.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                            //ddlstn.ClearSelection();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message != "Thread was being aborted.")
                        {
                            int a = activitylog(0, 0, ddlstn.SelectedItem.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('OOPs..Some Error Occured!!');", true);
                    }


                }
                else if (rblusertype.SelectedIndex == 2)// For Section
                {
                    try
                    {
                        ds = cmm.RunSpReturnDSParam("pnlogin", "PRASARNETConnectionString", new SqlParameter("@username", Convert.ToString(txtusr.Text)),
                                                                   new SqlParameter("@password", Convert.ToString(txtpassword.Text)));
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Session["isLogin"] = 1;
                            Session["UserName"] = Convert.ToString(ds.Tables[0].Rows[0][3]) + "(" + Convert.ToString(ds.Tables[0].Rows[0][0]) + ")";//Section Name- organisation name
                            Session["Org"] = ds.Tables[0].Rows[0][0];
                            Session["Orgid"] = ds.Tables[0].Rows[0][6];
                            DataSet ds1 = new DataSet();
                            ds1 = cmm.RunSpReturnDSParam("PN18_usertypeproc", "PRASARNETConnectionString", new SqlParameter("@flag", 4),
                                                                                                          new SqlParameter("@orgid", Convert.ToInt32(Session["Orgid"])),
                                                                                                          new SqlParameter("@userid", Convert.ToInt32(rblusertype.SelectedValue)));


                            Session["Usertype"] = ds1.Tables[0].Rows[0][0];
                            Session["Station_SectionID"] = ds.Tables[0].Rows[0][1];
                            Session["Uidmanagement"] = ds.Tables[0].Rows[0][1];
                            Session["UserId"] = 3;
                            int a2 = activitylog(1, Convert.ToInt32(Session["Station_SectionID"]), txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, Convert.ToInt32(Session["Usertype"]));
                            Response.Redirect("DashBoardNew.aspx", true);

                        }
                        else
                        {
                            int a1 = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                        }
                    }

                    catch (Exception ex)
                    {
                        if (ex.Message != "Thread was being aborted.")
                        {
                            int a1 = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('OOPs..Some Error Occured!!');", true);
                    }
                }

                else if (rblusertype.SelectedIndex == 3)//for Management Users like CEO, DG:DD, DG:AIR, Admin, SuperAdmin etc
                {
                    //pnlogin
                    try
                    {
                        ds = cmm.RunSpReturnDSParam("PN18_getotherUserDetails", "PRASARNETConnectionString", new SqlParameter("@usr", Convert.ToString(txtusr.Text)),
                                                                   new SqlParameter("@pwd", Convert.ToString(txtpassword.Text)));
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Session["isLogin"] = 1;
                            Session["UserName"] = ds.Tables[0].Rows[0][5];// Description of Table
                            Session["Usertype"] = ds.Tables[0].Rows[0][6];
                            Session["Orgid"] = ds.Tables[0].Rows[0][7];
                            Session["Uidmanagement"] = ds.Tables[0].Rows[0][0];
                            Session["UserId"] = 4;
                            Session["Station_SectionID"]= ds.Tables[0].Rows[0][0];
                            int a = activitylog(1, Convert.ToInt32(Session["Uidmanagement"]), txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, Convert.ToInt32(Session["Usertype"]));

                            Response.Redirect("DashBoardNew.aspx", true);

                        }
                        else
                        {
                            int a = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message != "Thread was being aborted.")
                        {
                            int a = activitylog(0, 0, txtusr.Text, txtpassword.Text, rblusertype.SelectedItem.Text, 0);
                        }

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('OOPs..Some Error Occured!!');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                }
            }
            else// login as guest session["guest"]==1
            {
                try
                {
                    if (txtusr.Text == "air" && txtpassword.Text == "guest")
                    {
                        Session["isLogin"] = 1;
                        Session["UserName"] = "Guest";
                        int a = activitylog(3, 0, txtusr.Text, txtpassword.Text, "None", 0);
                        Response.Redirect("GuestLogin.aspx", true);

                    }
                    else
                    {
                        int a = activitylog(4, 0, txtusr.Text, txtpassword.Text, "None", 0);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Invalid Credentials!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    if (ex.Message != "Thread was being aborted.")
                    {
                        int a = activitylog(4, 0, txtusr.Text, txtpassword.Text, "None", 0);
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('OOPs..Some Error Occured!!');", true);
                }
            }

        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblusertype.SelectedIndex == 1)
            {
                divstn.Visible = true;
                divusr.Visible = false;
                divpswd.Visible = true;
                btnlogin.Visible = true;
                btnloginParichay.Visible = false;
                cmm.bindDDL(ddlorg, "ATSorginculdingCCW", "Abbreviation", "OrganizationId", " -- Select Organisation -- ", "HRITConnectionString");
            }
            else if (rblusertype.SelectedIndex == 0)
            {
                divstn.Visible = false;
                divusr.Visible = false;
                divpswd.Visible = false;
                btnlogin.Visible = false;
                btnloginParichay.Visible = true;
            }
            else
            {
                divstn.Visible = false;
               
                divpswd.Visible = true;
                divusr.Visible = true;
                btnlogin.Visible = true;
                btnloginParichay.Visible = false;
            }
        }
        protected void ddlorg_selectedindex(object sender, EventArgs e)
        {
            if (ddlorg.SelectedValue == "2" || ddlorg.SelectedValue == "3")
            {
                cmm.bindDDLWidParam(ddlstn, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", " -- Select Station -- ",
                    new SqlParameter("@OrgId", ddlorg.SelectedValue));
            }
            else
            {
                cmm.bindDDLWidParam(ddlstn, "PrasarNet_select_stnbyOrg", "Expr1", "StationID", "HRITConnectionString", " -- Select Office -- ",
                   new SqlParameter("@OrgId", ddlorg.SelectedValue));
            }

        }

        protected void lnkloginguest_Click(object sender, EventArgs e)
        {
            if (lnkloginguest.Text == "Click here to Login as guest")
            {
                Session["guest"] = 1;
                rbllogintype.Visible = false;
                lnkloginguest.Text = "Login through Authentication";

                divstn.Visible = false;
                divusr.Visible = false;
                divpswd.Visible = true;

            }
            else
            {
                Session["guest"] = 2;
                rbllogintype.Visible = true;
                lnkloginguest.Text = "Click here to Login as guest";
                ds = cmm.RunSpReturnDS("PN18_GetUsers", "PRASARNETConnectionString");
                rblusertype.SelectedIndex = 0;
                divstn.Visible = false;
                divusr.Visible = false;
                divpswd.Visible = true;
            }
        }

        protected void btnloginParichay_Click(object sender, EventArgs e)
        {
            string url = PBDll.Class1.login();
            Response.Redirect(url);
        }
    }
}