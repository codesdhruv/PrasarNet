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

namespace PrasarNet.R_Roster
{
    public partial class M_Login : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["guest"] = 2;//login as authentication
                                     //this.Form.DefaultButton = "btnlogin";
                ViewState["OTPStatus"] = "NA";

            }
        }
        private string generateOTP()
        {
            //string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            //string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";

            string characters = "";
            // characters += alphabets;
            //characters += small_alphabets;
            characters = numbers;
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
        protected void btnsendotp_M_E_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds_email_Mob = new DataSet();
                ds_email_Mob = cmm.RunSpReturnDSParam("PN18_RRLogin", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                                           new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                if (ds_email_Mob.Tables[0].Rows.Count > 0)// Successful
                {
                    int updateid = Convert.ToInt32(ds_email_Mob.Tables[0].Rows[0][0]);
                    string mob = ds_email_Mob.Tables[0].Rows[0][1].ToString();
                    string email = ds_email_Mob.Tables[0].Rows[0][2].ToString();
                    string ip = cmm.GetIp_Priyank();
                    string otp = generateOTP();
                    int ret1 = 0, ret2 = 0, ret = 0;

                    int i = cmm.RunSP("PN18_RRLogin", "PRASARNETConnectionString",
                                                     new SqlParameter("@flag", 2),
                                                     new SqlParameter("@mobOTP", otp),
                                                     new SqlParameter("@emailOTP", otp),
                                                     new SqlParameter("@ip", ip),
                                                     new SqlParameter("@uid", updateid));
                    if (i > 0)
                    {
                        DataSet dsmobemail = new DataSet();
                        dsmobemail = cmm.RunSpReturnDSParam("PN18_RRLogin", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", 3),
                                                   new SqlParameter("@uid", updateid));

                        string Dtimeotpgenrated = "";
                        Dtimeotpgenrated = dsmobemail.Tables[0].Rows[0][0].ToString();
                        //ret1 = sendMobileOTP(mob, otp, Dtimeotpgenrated);
                        string msgsend = "Your OTP for PrasarNetReservationRoster is " + otp + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                        Boolean retb = cmm.sendMobileOTP1(mob, otp, msgsend);
                        if (retb)
                        {
                            ret1 = 1;
                        }
                        else
                        {
                            ret1 = 0;
                        }
                        ret2 = sendEmailOTP("Sir/Madam", email, otp, Dtimeotpgenrated);
                        ret = ret1 + ret2;

                        if (ret >= 1)// OTP sent Successfully
                        {
                            lblemail_mob_err.Text = "";
                            divbtnotp.Visible = false;
                            divotp.Visible = true;
                            divbtn.Visible = true;
                            btnsendotp.Visible = false;
                            btnlogin.Visible = true;
                            btnresend.Visible = true;
                            txtemail_mob.ReadOnly = true;

                            if (ViewState["OTPStatus"].ToString() == "old")
                            {
                                if (ret1 == 1 && ret2 != 1)
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Black;
                                    lblresult.Text = "<br />Sent an OTP on " + mob + ".<br />";
                                }
                                else if (ret1 != 1 && ret2 == 1)
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Black;
                                    lblresult.Text = "<br />Sent an OTP on " + email + ".<br />";
                                }
                                else
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Black;
                                    lblresult.Text = "<br />Sent an OTP on " + email + " & " + mob + ".<br />";
                                }

                            }
                            else
                            {
                                if (ret1 == 1 && ret2 != 1)
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Blue;
                                    lblresult.Text = "<br />Sent an OTP on " + mob + ".<br />";
                                }
                                else if (ret1 != 1 && ret2 == 1)
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Blue;
                                    lblresult.Text = "<br />Sent an OTP on " + email + ".<br />";
                                }
                                else
                                {
                                    lblresult.ForeColor = System.Drawing.Color.Blue;
                                    lblresult.Text = "<br />Sent an OTP on " + email + " & " + mob + ".<br />";
                                }
                            }
                        }
                        else// Issue Occured
                        {
                            lblemail_mob_err.Text = "Error occured while sending an OTP!! Please Try Again..";
                            divbtnotp.Visible = true;
                            divotp.Visible = false;
                            divbtn.Visible = false;
                            txtemail_mob.ReadOnly = false;
                            txtemail_mob.Focus();
                        }
                    }
                    else
                    {
                        lblemail_mob_err.Text = "Error Occured!! Please Try Again..";
                        divbtnotp.Visible = true;
                        divotp.Visible = false;
                        divbtn.Visible = false;
                        txtemail_mob.ReadOnly = false;
                        txtemail_mob.Focus();
                    }
                }
                else//fail no Email Found
                {
                    divbtnotp.Visible = true;
                    divotp.Visible = false;
                    divbtn.Visible = false;
                    txtemail_mob.ReadOnly = false;
                    lblemail_mob_err.Text = "Email-ID/Mobile No. is not registered with Us!!";
                    txtemail_mob.Focus();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again..');", true);
            }
        }


        //public int sendMobileOTP(string Mobstring, string msg_to_send, string timestring)
        //        {
        //            int ret = 0;
        //            try
        //            {
        //                //ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(AcceptAllCertifications);
        //                string bodyofmsg = "Your OTP for PrasarNetReservationRoster is "+ msg_to_send + ". This OTP is Valid for next 20 minutes Prasar Bharati";
        //                //"Your OTP for PrasarNetEmployeeVerification is " + msg_to_send + ". This OTP is Valid for next 20 minutes Prasar Bharati";
        //                byte[] buffer = Encoding.ASCII.GetBytes("username=prasarbharati&pin=prasarmsg@123&message=" + bodyofmsg + "&mnumber=" + Mobstring + "&signature=PRASAR");
        //                string sURL;
        //                sURL = ("http://bhashsms.com/api/sendmsg.php?user=prasarbharati&pass=prasarmsg@123&sender=PRASAR&phone=" + Mobstring + "&text=" + bodyofmsg + "&priority=ndnd&stype=normal");

        //                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(sURL);

        //                WebReq.Method = "POST";

        //                WebReq.ContentType = "application/x-www-form-urlencoded";

        //                WebReq.ContentLength = buffer.Length;
        //                using (Stream postStream = WebReq.GetRequestStream())
        //                {
        //                    postStream.Write(buffer, 0, buffer.Length);
        //                    System.Threading.Thread.Sleep(50);
        //                }
        //                //if (ViewState["OTPStatus"].ToString() == "old")
        //                //{
        //                //    lblresult.ForeColor = System.Drawing.Color.Black;
        //                //    lblresult.Text = "<br />Re-Send OTP on " + Mobstring + "<br />";
        //                //}
        //                //else 
        //                //{
        //                //    lblresult.ForeColor = System.Drawing.Color.Blue;
        //                //    lblresult.Text = "<br />Send OTP on " + Mobstring + "<br />";
        //                //}

        //                ret = 1;
        //                return ret;
        //            }

        //            catch (Exception ex)
        //            {
        //                lblresult.ForeColor = System.Drawing.Color.Red;
        //                lblresult.Text = "<br />Unable to send OTP.<br />";
        //                ret = 0;
        //                return ret;
        //            }

        //        }
        private int sendEmailOTP(string empName, string empEmail, string EOTP, string timestring)
        {
            int ret = 0;

            string appSubject, appBody;
            appSubject = "OTP for PrasarNet-Reservation Roster Login";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> Your OTP for PrasarNet-Reservation Roster Login is " + EOTP;
            appBody += "<br />This OTP is valid for 20 minutes, from " + timestring + ". Please, don't share this OTP with anyone.";
            appBody += "<br /> <br />* Note: This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />With Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />Prasar Bharati- IT Division";
            int i = cmm.sendemail(appBody, empEmail, appSubject, "smtp_hrispb");
            if (i == 1)
            {
                //int len = empEmail.Length;
                //string e1 = empEmail.Substring(4);
                //string e9 = "XXXX" + e1;
                //lblresult.Text += "Sent an OTP on: " + e9;
                ret = 1;
                return ret;
            }
            else
            {
                lblresult.ForeColor = System.Drawing.Color.Red;
                lblresult.Text += " <br/> <br/>Unable to sent an OTP on Email.<br /><br />";
                //+ ex.ToString() 
                ret = 0;
                return ret;
                
            }
           
        }

        protected void btnresend_Click(object sender, EventArgs e)
        {
            try
            {
                string ip = cmm.GetIp_Priyank();
                txtOTP.Text = "";
                ds = cmm.RunSpReturnDSParam("PN18_RRLogin", "PRASARNETConnectionString",
                                                      new SqlParameter("@flag", 4),
                                                      new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                int time = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                string otpfromdb = Convert.ToString(ds.Tables[0].Rows[0][1]);
                string otp = "";
                if (time <= 19)
                {
                    otp = otpfromdb;
                    ViewState["OTPStatus"] = "old";
                }
                else
                {
                    otp = generateOTP();
                    ViewState["OTPStatus"] = "new";
                }
                int ret = 0, ret1 = 0, ret2 = 0;
                int i = 0;
                if (ViewState["OTPStatus"].ToString() == "old")
                {
                    i = cmm.RunSP("PN18_RRLogin", "PRASARNETConnectionString",
                                                    new SqlParameter("@flag", 6),
                                                    new SqlParameter("@mobOTP", otp),
                                                    new SqlParameter("@emailOTP", otp),
                                                    new SqlParameter("@ip", ip),
                                                    new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                }
                else if (ViewState["OTPStatus"].ToString() == "new")
                {
                    i = cmm.RunSP("PN18_RRLogin", "PRASARNETConnectionString",
                                                     new SqlParameter("@flag", 5),
                                                     new SqlParameter("@mobOTP", otp),
                                                     new SqlParameter("@emailOTP", otp),
                                                     new SqlParameter("@ip", ip),
                                                     new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                }
                if (i > 0)
                {
                    DataSet dsmobemail = new DataSet();
                    string mob = "";
                    string email = "";
                    string Dtimeotpgenrated = "";
                    dsmobemail = cmm.RunSpReturnDSParam("PN18_RRLogin", "PRASARNETConnectionString",
                                               new SqlParameter("@flag", 7),
                                               new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                    Dtimeotpgenrated = dsmobemail.Tables[0].Rows[0][0].ToString();
                    mob = dsmobemail.Tables[0].Rows[0][1].ToString();
                    email = dsmobemail.Tables[0].Rows[0][2].ToString();
                    //ret1 = sendMobileOTP(mob, otp, Dtimeotpgenrated);
                    string msgsend = "Your OTP for PrasarNetReservationRoster is " + otp + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                    Boolean retb = cmm.sendMobileOTP1(mob, otp, msgsend);
                    if (retb)
                    {
                        ret1 = 1;
                    }
                    else
                    {
                        ret1 = 0;
                    }
                    ret2 = sendEmailOTP("Sir/Madam", email, otp, Dtimeotpgenrated);
                    ret = ret1 + ret2;
                    if (ret >= 1)// Email OTP sent Successfully
                    {
                        lblresult.Text = "";
                        divbtnotp.Visible = false;
                        divotp.Visible = true;
                        divbtn.Visible = true;
                        btnsendotp.Visible = false;
                        btnlogin.Visible = true;
                        btnresend.Visible = true;
                        txtemail_mob.ReadOnly = true;

                        if (ViewState["OTPStatus"].ToString() == "old")
                        {
                            if (ret1 == 1 && ret2 != 1)
                            {
                                lblresult.ForeColor = System.Drawing.Color.Black;
                                lblresult.Text = "<br />Re-Sent an OTP on " + mob + ".<br />";
                            }
                            else if (ret1 != 1 && ret2 == 1)
                            {
                                lblresult.ForeColor = System.Drawing.Color.Black;
                                lblresult.Text = "<br />Re-Sent an OTP on " + email + ".<br />";
                            }
                            else
                            {
                                lblresult.ForeColor = System.Drawing.Color.Black;
                                lblresult.Text = "<br />Re-Sent an OTP on " + email + " & " + mob + ".<br />";
                            }

                        }
                        else
                        {
                            if (ret1 == 1 && ret2 != 1)
                            {
                                lblresult.ForeColor = System.Drawing.Color.Blue;
                                lblresult.Text = "<br />Re-Sent an OTP on " + mob + ".<br />";
                            }
                            else if (ret1 != 1 && ret2 == 1)
                            {
                                lblresult.ForeColor = System.Drawing.Color.Blue;
                                lblresult.Text = "<br />Re-Sent an OTP on " + email + ".<br />";
                            }
                            else
                            {
                                lblresult.ForeColor = System.Drawing.Color.Blue;
                                lblresult.Text = "<br />Re-Sent an OTP on " + email + " & " + mob + ".<br />";
                            }
                        }
                    }
                    else// Issue Occured
                    {
                        lblemail_mob_err.Text = "Error occured while sending an OTP!! Please Try Again..";
                        divbtnotp.Visible = true;
                        divotp.Visible = false;
                        divbtn.Visible = false;
                        txtemail_mob.ReadOnly = false;
                        txtemail_mob.Focus();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured. Try Again!!');", true);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }



        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                ds = cmm.RunSpReturnDSParam("PN18_RRLogin", "PRASARNETConnectionString",
                                     new SqlParameter("@flag", 8),
                                     new SqlParameter("@mobOTP", txtOTP.Text.Trim()),
                                     new SqlParameter("@contactinfo", txtemail_mob.Text.Trim()));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string o1 = ds.Tables[0].Rows[0][5].ToString();
                    if (o1 == "exp")
                    {
                        lblresult.ForeColor = System.Drawing.Color.Red;
                        lblresult.Text = "OTP Expired!!";

                    }
                    else if (o1 == "ne")
                    {
                        lblresult.ForeColor = System.Drawing.Color.Blue;
                        lblresult.Text = "OTP Verified!!";
                        Session["nameRR"] = ds.Tables[0].Rows[0][1];//Name of Member
                        Session["isloginRR"] = "1";
                        Session["UsertypeRR"] = "ministry";
                        Session["UidRR"] = ds.Tables[0].Rows[0][0];
                        Session["emailRR"] = ds.Tables[0].Rows[0][2];
                        Session["mobRR"] = ds.Tables[0].Rows[0][3];
                        Session["designationRR"] = ds.Tables[0].Rows[0][4];
                        Response.Redirect("~/R_Roster/RR_Reports_Ministry.aspx", true);
                    }

                    else
                    {
                        lblresult.Text = "Try Again!!";
                    }
                }
                else
                {
                    lblresult.Text = "Incorrect OTP!!";
                }
            }
            catch (Exception ex)
            {
                lblresult.Text = "Error Occured!!";
            }
        }
    }
}