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
using RestSharp;

namespace PrasarNet
{
    public partial class signup : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();

        string con = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEmpidOtp.Enabled = false;
                txtempcodpwd.Enabled = false;
            }
        }

        protected void lnkgetempcode_Click(object sender, EventArgs e)
        {
            lnkgetempcode.Visible = false;
            lnksignup.Visible = true;
            divgetempcode.Visible = true;
            txtstation.Text = "";
            txtdob.Text = "";
            divlistofstn.Visible = false;
            div1.Visible = false;
            tbldob1.Visible = false;
            Panel2.Visible = false;
            Panel1.Visible = false;
            Panel3.Visible = false;
            panelPwd.Visible = false;
            Panel4.Visible = false;
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            tbldob1.Visible = false;
            div1.Visible = false;
            rblstn.SelectedIndex = -1;
            txtdob.Text = "";
            //Code Example: 

            //foreach(ListItem li in RadioButtonList1)` 
            //{ 
            //if(li.Selected) 
            //{ 
            //li.Selected = false; 
            //} 
            //} 
        }

        protected void lnksignup_Click(object sender, EventArgs e)
        {
            lnkgetempcode.Visible = true;
            lnksignup.Visible = false;
            divgetempcode.Visible = false;
            txtstation.Text = "";
            divlistofstn.Visible = false;
            txtdob.Text = "";
            div1.Visible = false;
            tbldob1.Visible = false;
            divgrd.Visible = false;
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = true;
            txtEmpid.Text = "";
            txtmobile.Text = "";
            txtEmailid.Text = "";
        }

        protected void btnstn_Click(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("Prasarnet_searchstation", "HRITConnectionString", new SqlParameter("@stationname", txtstation.Text),
                                                                                           new SqlParameter("@flag", 1));
            rblstn.DataSource = ds;
            rblstn.DataTextField = "station";
            rblstn.DataValueField = "StationID";
            rblstn.DataBind();
            divlistofstn.Visible = true;
            div1.Visible = false;
            tbldob1.Visible = false;
            txtdob.Text = "";
        }

        protected void rblstn_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label5.Text = rblstn.SelectedItem.Text;
            div1.Visible = true;
            tbldob1.Visible = true;
            tbldob1.Focus();
            divgrd.Visible = false;
            txtdob.Text = "";
        }

        protected void btnget_Click(object sender, EventArgs e)
        {
            string dat = txtdob.Text;
            DateTime datednew = DateTime.ParseExact(txtdob.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //Convert.ToDateTime(txtdob.Text).Date.ToString("yyyy-MM-dd");

            ds = cmm.RunSpReturnDSParam("prasarnet_getempcode", "HRITConnectionString", new SqlParameter("@stationid", rblstn.SelectedValue),
                                                                                        new SqlParameter("@dob", datednew),
                                                                                        new SqlParameter("@flag", 1));

            grdemp.DataSource = ds;
            grdemp.DataBind();
            divgrd.Visible = true;
            divgrd.Focus();
            grdemp.Focus();
        }

        protected void lbtnValidate_Click(object sender, EventArgs e)
        {

        }
        private string generateOTP()
        {
            //string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            //string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";

            string characters = "";

            characters += numbers;
            //int length = int.Parse(ddlLength.SelectedItem.Value);
            string otp = string.Empty;
            for (int i = 0; i <= 5; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    // Then a loop is executed and inside the loop a random number is used to fetch the character from the combination of 
                    //Alphabets and Numeric strings or only the Numeric string based on the type selected in the RadioButtonList.
                    //Inside the For Loop, a While loop is used to avoid repetition of the characters.
                    //The generated unique random OTP i.e. One Time Password is displayed in the Label control.
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }
            return otp;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //string emailvalue1 = txtEmailid.Text.Trim();
            if (Convert.ToInt32(ViewState["check"]) == 1)
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_Checkmobileemail", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "mobemail");
                        cmd.Parameters.AddWithValue("@emailid", txtEmailid.Text);
                        cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count == 0)
                            {
                                SqlCommand cmd1 = new SqlCommand("PN18_Checkmobileemail", conn);
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@pAction", "emcdchk");
                                cmd1.Parameters.AddWithValue("@emailid", txtEmailid.Text);
                                cmd1.Parameters.AddWithValue("@mobile", txtmobile.Text);
                                cmd1.Parameters.AddWithValue("@empcode", txtEmpid.Text);
                                using (SqlDataAdapter adap1 = new SqlDataAdapter(cmd1))
                                {
                                    DataSet ds1 = new DataSet();
                                    adap1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count == 0)
                                    {
                                        string emailid = txtEmailid.Text.Trim().ToLower();
                                        SqlCommand cmd2 = new SqlCommand("PN18_Checkmobileemail", conn);
                                        cmd2.CommandType = CommandType.StoredProcedure;
                                        cmd2.Parameters.AddWithValue("@pAction", "mobemledt");
                                        cmd2.Parameters.AddWithValue("@emailid", emailid);
                                        cmd2.Parameters.AddWithValue("@mobile", txtmobile.Text);
                                        cmd2.Parameters.AddWithValue("@empcode", txtEmpid.Text);
                                        hfEmailOTP.Value = generateOTP();
                                        cmd2.Parameters.AddWithValue("@otpMob", hfEmailOTP.Value);
                                        cmd2.Parameters.AddWithValue("@otpEmail", hfEmailOTP.Value);
                                        conn.Open();
                                        cmd2.ExecuteNonQuery();
                                        conn.Close();
                                        if (txtEmailid.Text != "")
                                        {
                                            sendEmailOTP(hfName.Value, emailid, hfEmailOTP.Value);
                                        }
                                        // sendMobileOTP(txtmobile.Text, hfEmailOTP.Value);
                                        string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                                        Boolean ret = cmm.sendMobileOTP1(txtmobile.Text, hfEmailOTP.Value, msgsend);
                                        if (ret)
                                        {
                                            lblresult.Text += "Successfully sent an OTP on " + txtmobile.Text + "<br /><br />";
                                        }
                                        else
                                        {
                                            lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                                        }
                                        lbtnEmail.Visible = false;
                                        lbtnMob.Visible = true;
                                        Panel1.Visible = true;// panel1 for verification of OTP
                                        Panel2.Visible = false;// panel2 for registration and send OTP
                                        panelPwd.Visible = false;
                                        Panel4.Visible = false;
                                        txtEmpidOtp.Text = txtEmpid.Text;
                                        txtOtpMobile.Focus();
                                        txtEmpidOtp.Enabled = false;


                                    }
                                }

                            }
                        }
                    }
                }
            }
            else
            {
                try
                {
                    string emailid = txtEmailid.Text.Trim().ToLower();
                    if (Button1.Text != "Get New OTP")
                    {
                        string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
                        SqlConnection connection = new SqlConnection(connetionString);
                        connection.Open();

                        SqlCommand cmd = new SqlCommand("prasarnet_IT_EmpRegiter", connection);
                        cmd.CommandType = CommandType.StoredProcedure;
                        hfEmailOTP.Value = generateOTP();
                        // hfMobileOTP.Value = generateOTP();
                        cmd.Parameters.AddWithValue("@empcode", Convert.ToInt64(txtEmpid.Text));
                        cmd.Parameters.AddWithValue("@emailid", emailid);
                        cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
                        cmd.Parameters.AddWithValue("@otpMob", hfEmailOTP.Value);
                        cmd.Parameters.AddWithValue("@otpEmail", hfEmailOTP.Value);
                        cmd.Parameters.Add("@result", SqlDbType.VarChar, 3);
                        cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100);
                        cmd.Parameters["@name"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        string o1 = (string)cmd.Parameters["@result"].Value;
                        string o2 = "";
                        if (cmd.Parameters["@name"].Value != DBNull.Value)
                        {
                            o2 = (string)cmd.Parameters["@name"].Value;
                        }

                        try
                        {
                            SqlDataReader sqlReader = cmd.ExecuteReader();
                            sqlReader.Close();
                            cmd.Dispose();
                            connection.Close();
                            hfName.Value = o2.ToUpper();

                            switch (o1)
                            {
                                case "nf":
                                    lblresult.Text = "No Employee found with the entered HRIS Emp Code";
                                    break;
                                case "rna":
                                    lblresult.Text = "Employee Registered, but NOT Activated.";
                                    break;
                                case "ra":
                                    lblresult.Text = "Employee Already Registered and Activated with a given employee code.";
                                    break;
                                case "e":
                                    lblresult.Text = "Email Already Registered.";
                                    break;
                                case "m":
                                    lblresult.Text = "Mobile No. Already Registered.";
                                    break;
                                case "em":
                                    lblresult.Text = "Email-ID/Mobile No. are Already Registered with other employee.";
                                    break;
                                case "r":
                                    lblresult.Text = "Registration Succesful for : " + hfName.Value + ".";
                                    break;
                                case "AR":
                                    lblresult.Text = "Employee Already Registered and Activated with a given employee code.";
                                    break;
                            }
                            Session["empname"] = o2.ToString();
                            if (o1 == "r")
                            {
                                // '-*-*-*-*-*-*-*-*-*-*-* Sending   OTP *-*-*-*-*-*-*-*-*-*-*-*-*-*-*
                                if (txtEmailid.Text != "")
                                {
                                    sendEmailOTP(hfName.Value, emailid, hfEmailOTP.Value);
                                }

                                //            '*-*-*-*-*-*-*-*-*-*-*-*-* Sedidng OTP SMS *-*-*-*-*-*-*-*-*-*-*-*-

                                // sendMobileOTP(txtmobile.Text, hfEmailOTP.Value);
                                string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                                Boolean ret = cmm.sendMobileOTP1(txtmobile.Text, hfEmailOTP.Value, msgsend);
                                if (ret)
                                {
                                    lblresult.Text += "Successfully sent an OTP on " + txtmobile.Text + "<br /><br />";
                                }
                                else
                                {
                                    lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                                }
                                //            '********************************************************************

                                lbtnEmail.Visible = false;
                                lbtnMob.Visible = true;
                                Panel1.Visible = true;// panel1 for verification of OTP
                                Panel2.Visible = false;// panel2 for registration and send OTP
                                panelPwd.Visible = false;
                                Panel4.Visible = false;
                                txtEmpidOtp.Text = txtEmpid.Text;
                                txtOtpMobile.Focus();
                                txtEmpidOtp.Enabled = false;
                            }
                            else
                            {
                                lblresult.Text += "So, Unable to sent an OTP.";
                                if (o1 == "rna")//Employee Registered, but NOT Activated
                                {
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = true;
                                    Button1.Visible = false;
                                    Button3.Visible = false;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = false;
                                    txtEmpid.ReadOnly = true;
                                    txtEmailid.ReadOnly = true;
                                    txtmobile.ReadOnly = true;
                                    //string emailvalue = ddlemailext.SelectedItem.Value;
                                    //ddlemailext.Items.FindByValue(emailvalue).Selected = true;
                                    //ddlemailext.Enabled = false;
                                    ds = cmm.RunSpReturnDSParam("getdataofemployee_asperempcode", "HRITConnectionString", new SqlParameter("@empcode", Convert.ToInt64(txtEmpid.Text)),
                                                                                                                   new SqlParameter("@flag", 1));
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        if (txtEmailid.Text.Trim() != (ds.Tables[0].Rows[0][4]).ToString() || txtmobile.Text != ds.Tables[0].Rows[0][3].ToString())
                                        {

                                            txtmobile.Text = ds.Tables[0].Rows[0][3].ToString();
                                            //int index = ds.Tables[0].Rows[0][4].ToString().IndexOf('@');
                                            txtEmailid.Text = ds.Tables[0].Rows[0][4].ToString();//ds.Tables[0].Rows[0][4].ToString().Substring(0, index);

                                        }
                                    }
                                }
                                else if (o1 == "em")// Email id and mobile no already registered
                                {
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = false;
                                    txtEmpid.ReadOnly = false;
                                    txtEmailid.ReadOnly = true;
                                    txtmobile.ReadOnly = false;
                                    txtmobile.Focus();
                                    //ddlemailext.Enabled = false;
                                }
                                else if (o1 == "e")// Email id already registered
                                {
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = false;
                                    txtEmpid.ReadOnly = false;
                                    txtEmailid.ReadOnly = true;
                                    txtmobile.ReadOnly = false;
                                    txtEmailid.Focus();
                                    // ddlemailext.Enabled = false;
                                }
                                else if (o1 == "m")// Mobile No already registered
                                {
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = false;
                                    txtEmpid.ReadOnly = false;
                                    txtEmailid.ReadOnly = true;
                                    txtmobile.ReadOnly = false;
                                    txtmobile.Focus();
                                    //ddlemailext.Enabled = false;
                                }
                                else if (o1 == "ra")// Employee Already Registered and Activated
                                {
                                    txtEmailid.Text = "";
                                    txtEmailid.ReadOnly = true;
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = false;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = true;
                                }
                                else if (o1 == "AR")// Employee Already Registered and Activated
                                {
                                    txtEmailid.Text = "";
                                    txtEmailid.ReadOnly = true;
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = false;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = true;
                                }
                                else//No Employee found with the supplied HRIS Emp Code
                                {
                                    lnkchangeemailmob.Visible = false;
                                    lnksendotpagain.Visible = false;
                                    Button1.Visible = true;
                                    Button3.Visible = true;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    panelPwd.Visible = false;
                                    Panel4.Visible = false;
                                    txtEmpid.ReadOnly = false;
                                    txtEmailid.Text = "";
                                    txtEmailid.ReadOnly = true;
                                    txtmobile.ReadOnly = false;
                                    // ddlemailext.Enabled = false;
                                }

                            }
                        }


                        catch (Exception ex)
                        {

                        }

                    }
                    else// If Employee already register 
                    {
                        ds = cmm.RunSpReturnDSParam("prasarnet_getemailandmob_emp", "HRITConnectionString", new SqlParameter("@flag", 1),
                                                                                                         new SqlParameter("@empcode", txtEmpid.Text));
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Boolean isreg = false;
                            Boolean isact = false;
                            if (ds.Tables[0].Rows[0][4] != null || ds.Tables[0].Rows[0][4].ToString() != "")
                            {
                                isreg = Convert.ToBoolean(ds.Tables[0].Rows[0][4]);
                            }
                            if (ds.Tables[0].Rows[0][5] != null || ds.Tables[0].Rows[0][5].ToString() != "")
                            {
                                isact = Convert.ToBoolean(ds.Tables[0].Rows[0][5]);
                            }
                            if (isreg)
                            {
                                if (!isact)
                                {
                                    hfEmailOTP.Value = generateOTP();
                                    // hfMobileOTP.Value = generateOTP();
                                    string email = "";
                                    email = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][0]));
                                    string mob = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][1]));
                                    hfName.Value = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][2]).ToUpper());
                                    //if (email != "" && mob != "")
                                    if (mob != "")
                                    {
                                        int i = cmm.RunSP("prasarnet_getemailandmob_emp", "HRITConnectionString", new SqlParameter("@flag", 2),
                                                                                                                      new SqlParameter("@empcode", txtEmpid.Text),
                                                                                                                      new SqlParameter("@otpmob", hfMobileOTP.Value),
                                                                                                                      new SqlParameter("@otpemail", hfEmailOTP.Value));
                                        if (i > 0)
                                        {
                                            // '-*-*-*-*-*-*-*-*-*-*-* Sending   OTP *-*-*-*-*-*-*-*-*-*-*-*-*-*-*
                                            if (txtEmailid.Text != "")
                                            {
                                                sendEmailOTP(hfName.Value, email, hfEmailOTP.Value);
                                            }
                                            //            '*-*-*-*-*-*-*-*-*-*-*-*-* Sedidng OTP SMS *-*-*-*-*-*-*-*-*-*-*-*-

                                           // sendMobileOTP(mob, hfEmailOTP.Value);
                                            string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                                            Boolean ret = cmm.sendMobileOTP1(mob, hfEmailOTP.Value, msgsend);
                                            if (ret)
                                            {
                                                lblresult.Text += "Successfully sent an OTP on " + mob + "<br /><br />";
                                            }
                                            else
                                            {
                                                lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                                            }
                                            //            '********************************************************************

                                            lbtnEmail.Visible = false;
                                            lbtnMob.Visible = true;
                                            Panel1.Visible = true;
                                            Panel2.Visible = false;
                                            txtEmpidOtp.Text = txtEmpid.Text;
                                            txtOtpMobile.Focus();
                                            txtEmpidOtp.Enabled = false;
                                            lnksendotpagain.Visible = false;
                                            Button1.Visible = true;
                                            Button3.Visible = true;
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                                        }
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('You are not a registered employee!!');", true);
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('The mentioned employee code is already registered and activated!!');", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('The mentioned employee code is not registered!!');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee Code is not Correct!!');", true);
                        }
                    }
                }


                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Due to some technical errors, you cant register right now.Please try after sometime or contact with technical team');", true);

                }

            }
        }
        //public void sendMobileOTP(string Mobstring, string msg_to_send)
        //{
        //    try
        //    {
        //        //ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(AcceptAllCertifications);
        //        string bodyofmsg = "Your OTP for PrasarNetEmployeeVerification is " + msg_to_send + ". This OTP is Valid for next 20 minutes Prasar Bharati";
        //        byte[] buffer = Encoding.ASCII.GetBytes("username=prasarbharati&pin=prasarmsg@123&message=" + bodyofmsg + "&mnumber=" + Mobstring + "&signature=PRASAR");
        //        string sURL;
        //        sURL = ("http://bhashsms.com/api/sendmsg.php?user=prasarbharati&pass=prasarmsg@123&sender=PRASAR&phone=" + Mobstring + "&text=" + bodyofmsg + "&priority=ndnd&stype=normal");


        //        HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(sURL);

        //        WebReq.Method = "POST";

        //        WebReq.ContentType = "application/x-www-form-urlencoded";

        //        WebReq.ContentLength = buffer.Length;
        //        using (Stream postStream = WebReq.GetRequestStream())
        //        {
        //            postStream.Write(buffer, 0, buffer.Length);
        //            System.Threading.Thread.Sleep(50);
        //        }
        //        lblresult.Text += "OTP(Mobile) has been sent to you via sms on " + Mobstring + "<br /><br />";
        //    }

        //    catch (Exception ex)
        //    {
        //        lblresult.Text += "<br/>Oopps.. Unable to send OTP to your Mobile." + ex.ToString() + "<br /><br />";
        //    }

        //}
        //private void sendEmailOTP(string empName, string empEmail, string EOTP)
        //{
        //    string appSubject, appBody;
        //    string wfrom = "no-reply.hris@akashvani.in";
        //    //string wfrom = "priyankglb2012@gmail.com";
        //    appSubject = "OTP for PrasarNet Employee Verification";
        //    appBody = "Dear " + empName + "<br/> ";
        //    appBody += "<br /> Your OTP is : " + EOTP;
        //    appBody += "<br />Please use this OTP for Employee Verification on PrasarNet. This OTP is valid for 20 Minutes.";
        //    appBody += "<br /> <br />* Note,This is a system generated mail. Please, do not reply on this.";
        //    appBody += "<br /><br />Regards";
        //    appBody += "<br /><br />Team PrasarNet";
        //    appBody += "<br />IT Division";
        //    appBody += "<br />PB Sectt.";
        //    SmtpClient client = new SmtpClient();
        //    client.Host = "203.122.51.200";
        //    client.Port = 25;
        //    //client.EnableSsl = true;
        //    //'client.Host = "mail.akashvani.in"
        //    //client.Host = "smtp.gmail.com";
        //    //client.Port = 587;

        //    //client.UseDefaultCredentials = false;
        //    System.Net.NetworkCredential wCred = new NetworkCredential("no-reply.hris", "HRIS@2018");
        //    client.Credentials = wCred;
        //    client.DeliveryMethod = SmtpDeliveryMethod.Network;

        //    //MailMessage message = new MailMessage(wfrom, empEmail, appSubject, appBody);
        //    MailMessage message = new MailMessage();
        //    message.From = new MailAddress(wfrom);
        //    message.To.Add(empEmail);
        //    message.Subject = appSubject;
        //    message.Body = appBody;
        //    message.IsBodyHtml = true;
        //    try
        //    {
        //        client.Send(message);
        //        lblresult.Text += "OTP has been sent on: " + empEmail;
        //    }

        //    catch (Exception ex)
        //    {
        //        lblresult.Text += " <br/> <br/>Unable to sent an OTP on Email.<br /><br />";
        //        //+ ex.ToString() 
        //    }
        //}
        private void sendEmailOTP(string empName, string empEmail, string EOTP)
        {
            string appSubject, appBody;
            appSubject = "OTP for PrasarNet Employee Verification";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> Your OTP is : " + EOTP;
            appBody += "<br />Please use this OTP for Employee Verification on PrasarNet. This OTP is valid for 20 Minutes.";
            appBody += "<br /> <br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            int i = cmm.sendemail(appBody, empEmail, appSubject, "smtp_hrispb");
            if (i == 1)
            {
                int len = empEmail.Length;
                string e1 = empEmail.Substring(5);
                string e9 = "XXXXX" + e1;
                lblresult.Text += "Sent an OTP on: " + e9;
            }
            else
            {
                lblresult.Text += " <br/> <br/>Unable to sent an OTP on Email.<br /><br />";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);

            connection.Open();
            SqlCommand cmd = new SqlCommand("prasarnet_verifyotp", connection);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empcode", Convert.ToInt64(txtEmpidOtp.Text));
            cmd.Parameters.AddWithValue("@OTP_EMAIL", txtOtpEmail.Text.Trim().ToLower());
            cmd.Parameters.AddWithValue("@OTP_MOBILE", txtOtpEmail.Text.Trim());
            cmd.Parameters.Add("@resout", SqlDbType.VarChar, 10);
            cmd.Parameters["@resout"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@emp", SqlDbType.Int);
            cmd.Parameters["@emp"].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            string o1 = (string)cmd.Parameters["@resout"].Value;
            int empc = (int)cmd.Parameters["@emp"].Value;
            if (o1 == "exp" && empc == 0)
            {
                lblact.Text = "OTP Expired.Regenerate OTP!!";
                panelPwd.Visible = false;
            }
            else if (o1 == "ne" && empc != 0)
            {
                lblact.Text = "OTP Verified. Generate Password!!";
                panelPwd.Visible = true;
                txtempcodpwd.Text = txtEmpidOtp.Text;
                txtempcodpwd.Enabled = false;
                txtPwd.Focus();
                txtOtpEmail.Text = "";
                txtOtpMobile.Text = "";
                Panel1.Visible = false;
                lblresult.Visible = false;
                lblresult0.Visible = false;
            }

            else
            {
                lblact.Text = "Try Again!!";
                panelPwd.Visible = false;
            }

        }

        protected void btnpwd_Click(object sender, EventArgs e)
        {
            string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);

            connection.Open();
            SqlCommand cmd = new SqlCommand("IT_userActivationSelect", connection);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmployeeCode", Convert.ToInt64(txtempcodpwd.Text.Trim()));
            cmd.Parameters.AddWithValue("@pwd", txtPwd.Text);
            cmd.Parameters.Add("@result", SqlDbType.Int);
            cmd.Parameters["@result"].Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            int o1 = (int)cmd.Parameters["@result"].Value;
            if (o1 == 0)
            {
                lblpwdtext.Text = "Employee Code Not Found!!";
                Panel4.Visible = false;
            }
            else if (o1 == 2)
            {
                lblpwdtext.Text = "User has been Activated!!";
                Panel4.Visible = true;
                Panel4.Focus();
                lbtnLogin.Focus();
                txtPwd.Text = "";
                txtPwd1.Text = "";
                panelPwd.Visible = false;
                lblact.Visible = false;
            }

            else
            {
                lblpwdtext.Text = "User Already Activated!!";
                Panel4.Visible = false;
            }

        }

        protected void lbtnMob_Click(object sender, EventArgs e)
        {
            lblresult.Text = "";
            lblresult0.Text = "";
            ds = cmm.RunSpReturnDSParam("prasarnet_getemailandmob_emp", "HRITConnectionString", new SqlParameter("@flag", 1),
                                                                                                    new SqlParameter("@empcode", txtEmpid.Text));
            if (ds.Tables[0].Rows.Count > 0)
            {
                hfName.Value = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][2]).ToUpper());
            }

            hfEmailOTP.Value = generateOTP();
            // hfMobileOTP.Value = generateOTP();

            string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("prasarnet_IT_ResendOTP", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@empcode", Convert.ToInt64(txtEmpid.Text));
            cmd.Parameters.AddWithValue("@otpMob", hfEmailOTP.Value);

            cmd.Parameters.AddWithValue("@otpEmail", hfEmailOTP.Value);
            cmd.Parameters.AddWithValue("@flag", 3);
            cmd.ExecuteNonQuery();
            try
            {
                SqlDataReader sqlReader = cmd.ExecuteReader();
                sqlReader.Close();
                cmd.Dispose();
                connection.Close();
                string emailid = txtEmailid.Text.Trim().ToLower();
                //            '-*-*-*-*-*-*-*-*-*-*-* Sending   OTP *-*-*-*-*-*-*-*-*-*-*-*-*-*-*
                if (txtEmailid.Text != "")
                {
                    sendEmailOTP(hfName.Value, emailid, hfEmailOTP.Value);
                }
                //            '*-*-*-*-*-*-*-*-*-*-*-*-* Sedidng OTP SMS *-*-*-*-*-*-*-*-*-*-*-*-

                //sendMobileOTP(txtmobile.Text, hfEmailOTP.Value);
                string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                Boolean ret = cmm.sendMobileOTP1(txtmobile.Text, hfEmailOTP.Value, msgsend);
                if (ret)
                {
                    lblresult.Text += "Successfully sent an OTP on " + txtmobile.Text + "<br /><br />";
                }
                else
                {
                    lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                }
                //            '********************************************************************
                lbtnEmail.Visible = false;
                lbtnMob.Visible = true;
                txtEmpidOtp.Text = txtEmpid.Text;
                txtOtpMobile.Focus();
                txtEmpidOtp.Enabled = false;
                //lblresult.Text = "OTP has been send successfully to your respective Email-ID and Mobile Number.";
                Panel1.Visible = true;// panel1 for verification of OTP
                Panel2.Visible = false;// panel2 for registration and send OTP
                panelPwd.Visible = false;
                Panel4.Visible = false;
                //txtEmpid.ReadOnly = false;
            }
            catch (Exception ex)
            {

            }
        }

        protected void lbtnEmail_Click(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("prasarnet_getemailandmob_emp", "HRITConnectionString", new SqlParameter("@flag", 1),
                                                                                                  new SqlParameter("@empcode", txtEmpidOtp.Text));
            if (ds.Tables[0].Rows.Count > 0)
            {

                hfName.Value = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][2]).ToUpper());
            }
            hfEmailOTP.Value = generateOTP();

            string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("prasarnet_IT_ResendOTP", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@empcode", Convert.ToInt64(txtEmpidOtp.Text));
            cmd.Parameters.AddWithValue("@otpEmail", hfEmailOTP.Value);
            cmd.Parameters.AddWithValue("@flag", 1);
            cmd.ExecuteNonQuery();

            SqlDataReader sqlReader = cmd.ExecuteReader();
            sqlReader.Close();
            cmd.Dispose();
            connection.Close();

            string email = txtEmailid.Text.Trim().ToLower(); //+ ddlemailext.SelectedItem.Text.Trim();

            //            '-*-*-*-*-*-*-*-*-*-*-* Sending   OTP *-*-*-*-*-*-*-*-*-*-*-*-*-*-*
            if (txtEmailid.Text != "")
            {
                sendEmailOTP(hfName.Value, email, hfEmailOTP.Value);
                lblresult.Text = "OTP Resend sucessfully";
                lblresult.Focus();
            }
            else
            {
                lblresult.Text = "Please fill a Email-Id";
                txtEmailid.Focus();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            tr1.Visible = false;
            tr2.Visible = false;
            Button1.Text = "Get New OTP";
            Label20.Visible = true;
            Label6.Visible = false;
            Panel2.Visible = true;
            Panel1.Visible = false;
            panelPwd.Visible = false;
            Panel4.Visible = false;
            Button3.Visible = true;
            lblresult.Text = "";
            lblact.Text = "";
            lblpwdtext.Text = "";
            txtEmpid.Text = "";
            txtEmpid.ReadOnly = false;
            txtEmailid.ReadOnly = false;
            txtmobile.ReadOnly = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            tr1.Visible = true;
            tr2.Visible = true;
            Button1.Text = "Register & Get OTP";
            Label20.Visible = false;
            Label6.Visible = true;
            Panel2.Visible = true;
            Button3.Visible = false;
            lblresult.Text = "";
            lblact.Text = "";
            lblpwdtext.Text = "";
            txtEmpid.Text = "";
            txtEmailid.Text = "";
            txtmobile.Text = "";
            //ddlemailext.Enabled = true;
        }

        protected void lbtnValidate_Click1(object sender, EventArgs e)
        {
            lnkgetempcode.Visible = false;
            lnksignup.Visible = true;
            divgetempcode.Visible = true;
            txtstation.Text = "";
            txtdob.Text = "";
            divlistofstn.Visible = false;
            div1.Visible = false;
            tbldob1.Visible = false;
            Panel2.Visible = false;
            Panel1.Visible = false;
            Panel3.Visible = false;
            panelPwd.Visible = false;
            Panel4.Visible = false;
        }

        protected void imghome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/HomePage.aspx", true);
        }

        protected void lnksendotpagain_Click(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("prasarnet_getemailandmob_emp", "HRITConnectionString", new SqlParameter("@flag", 1),
                                                                                                    new SqlParameter("@empcode", txtEmpid.Text));
            if (ds.Tables[0].Rows.Count > 0)
            {

                hfName.Value = Server.HtmlEncode(Convert.ToString(ds.Tables[0].Rows[0][2]).ToUpper());//name of employee
            }

            hfEmailOTP.Value = generateOTP();
            //hfMobileOTP.Value = generateOTP();

            string connetionString = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("prasarnet_IT_ResendOTP", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@empcode", Convert.ToInt64(txtEmpid.Text));
            cmd.Parameters.AddWithValue("@otpMob", hfEmailOTP.Value);

            cmd.Parameters.AddWithValue("@otpEmail", hfEmailOTP.Value);
            cmd.Parameters.AddWithValue("@flag", 3);
            cmd.ExecuteNonQuery();

            SqlDataReader sqlReader = cmd.ExecuteReader();
            sqlReader.Close();
            cmd.Dispose();
            connection.Close();

            if (txtEmailid.Text != "")
            {
                string emailid = txtEmailid.Text.Trim().ToLower();
                //            '-*-*-*-*-*-*-*-*-*-*-* Sending   OTP *-*-*-*-*-*-*-*-*-*-*-*-*-*-*
                sendEmailOTP(hfName.Value, emailid, hfEmailOTP.Value);
            }

            //            '*-*-*-*-*-*-*-*-*-*-*-*-* Sedidng OTP SMS *-*-*-*-*-*-*-*-*-*-*-*-

            //sendMobileOTP(txtmobile.Text, hfEmailOTP.Value);
            string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
            Boolean ret = cmm.sendMobileOTP1(txtmobile.Text, hfEmailOTP.Value, msgsend);
            if (ret)
            {
                lblresult.Text += "Successfully sent an OTP on " + txtmobile.Text + "<br /><br />";
            }
            else
            {
                lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
            }
            //            '********************************************************************

            lbtnEmail.Visible = false;
            lbtnMob.Visible = true;

            txtEmpidOtp.Text = txtEmpid.Text;
            txtOtpMobile.Focus();
            txtEmpidOtp.Enabled = false;
            lblresult.Text = "OTP has been sent successfully to your respective Email-ID and Mobile Number.";
            Panel1.Visible = true;// panel1 for verification of OTP
            Panel2.Visible = false;// panel2 for registration and send OTP
            panelPwd.Visible = false;
            Panel4.Visible = false;

        }

        protected void lnkchangeemailmob_Click(object sender, EventArgs e)
        {
            txtEmpid.ReadOnly = false;
            txtEmailid.ReadOnly = true;
            txtmobile.ReadOnly = false;
            lnkchangeemailmob.Visible = false;
            lnksendotpagain.Visible = false;
            Button1.Visible = true;
            Button3.Visible = true;
            Button3.Text = "X Cancel";
            int val = 1;
            ViewState["check"] = val;
            //ddlemailext.Enabled = true;
        }

        protected void txtEmpid_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtEmpid.Text.Trim())),
                                                                                  new SqlParameter("@flag", 3));

                if (ds.Tables[0].Rows.Count > 0)//employee exist
                {
                    DataSet dsRegister = new DataSet();

                    dsRegister = cmm.RunSpReturnDSParam("Signup", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtEmpid.Text.Trim())),
                                                                                  new SqlParameter("@flag", 1));
                    if (dsRegister.Tables[0].Rows.Count != 0)// Employee Already Registered 
                    {
                        DataSet dsRegister_A = new DataSet();

                        dsRegister_A = cmm.RunSpReturnDSParam("Signup", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(txtEmpid.Text.Trim())),
                                                                                      new SqlParameter("@flag", 2));
                        if (dsRegister_A.Tables[0].Rows.Count != 0)// Employee Already Registered and Activated
                        {
                            txtEmailid.Text = dsRegister_A.Tables[0].Rows[0][1].ToString();
                            txtmobile.Text = dsRegister_A.Tables[0].Rows[0][0].ToString();
                            Button1.Enabled = false;
                            txtEmpid.Focus();
                            divmobmsg.Visible = true;
                            Label21.Visible = true;
                            Label21.Text = "Employee Already Registered and Activated on " + dsRegister_A.Tables[0].Rows[0][3].ToString() + "!!";
                        }
                        else
                        {
                            txtEmailid.Text = dsRegister.Tables[0].Rows[0][1].ToString();
                            txtmobile.Text = dsRegister.Tables[0].Rows[0][0].ToString();
                            divmobmsg.Visible = true;
                            Button1.Enabled = false;
                            lnkchangeemailmob.Visible = false;
                            lnksendotpagain.Visible = true;
                            Button1.Visible = false;
                            Button3.Visible = false;
                            txtEmpid.Focus();
                            Label21.Visible = true;
                            Label21.Text = "Employee Already Registered on " + dsRegister.Tables[0].Rows[0][2].ToString() + ", Please Click on Send OTP Again/Get New OTP for Activation Process/setting a password..";
                        }
                    }

                    else// Employee Not Registered
                    {
                        Label21.Visible = false;
                        Label21.Text = "";
                        //if (ds.Tables[0].Rows[0][3].ToString() != "" || ds.Tables[0].Rows[0][3].ToString() != null)
                        //{
                        divmobmsg.Visible = true;
                        txtEmailid.Text = ds.Tables[0].Rows[0][3].ToString();
                        txtmobile.Text = ds.Tables[0].Rows[0][4].ToString();
                        lnkchangeemailmob.Visible = false;
                        lnksendotpagain.Visible = false;
                        Button1.Visible = true;
                        Button3.Visible = false;
                        Button1.Enabled = true;
                        txtmobile.Focus();
                        //}
                        //else
                        //{
                        //    txtEmailid.Text = "";
                        //    txtmobile.Text = "";
                        //    Button1.Enabled = false;
                        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Email is not linked with mentioned Employee Code. Please write us on email@prasarbharati.gov.in!!');", true);
                        //    txtEmpid.Focus();
                        //}
                    }

                }
                else// Employee not Active
                {

                    Label21.Visible = false;
                    Label21.Text = "";
                    txtmobile.Text = "";
                    txtEmailid.Text = "";
                    Button1.Enabled = false;
                    divmobmsg.Visible = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee code is not Active/Incorrect!!');", true);
                    txtEmpid.Focus();
                }

            }


            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);

            }
        }
    }
}