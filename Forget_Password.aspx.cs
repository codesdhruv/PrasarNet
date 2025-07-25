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
using RestSharp;

namespace PrasarNet

{
    public partial class Forget_Password : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();

        string con = ConfigurationManager.ConnectionStrings["HRITConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tr_otprow.Visible = false;
                trnewpassword.Visible = false;
                trconfmpassword.Visible = false;
                trbutton.Visible = false;
                //pnlcreatenewpassword.Visible = false;
                Bind_radiotype();
            }
        }


        private void Bind_radiotype()
        {
            ds = cmm.RunSpReturnDS("PN18_GetUsers_new", "PRASARNETConnectionString");
            rblusertype.DataSource = ds;
            rblusertype.DataTextField = "UserName";
            rblusertype.DataValueField = "uid";
            rblusertype.DataBind();
            rblusertype.SelectedIndex = 0;
        }

        protected void Btngetotp_Click(object sender, EventArgs e)
        {
            //try
            //{
                string emailid = lbluseremail.Text;
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_Getemployeeno", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "mob");
                        cmd.Parameters.AddWithValue("@pempcode", Txtempcode.Text);

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (Convert.ToBoolean(ds.Tables[0].Rows[0][3]) && Convert.ToBoolean(ds.Tables[0].Rows[0][4]))
                                {
                                    SqlCommand cmd2 = new SqlCommand("PN18_Getemployeeno", conn);
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    cmd2.Parameters.AddWithValue("@pAction", "otpmobeml");
                                    lblusernofromdb.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                                    ViewState["usermob"] = lblusernofromdb.Text;
                                    lbluseremail.Text = ds.Tables[0].Rows[0]["EMailId"].ToString();
                                    lblusername.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                                    ViewState["useremail"] = lbluseremail.Text;
                                    cmd2.Parameters.AddWithValue("@pempcode", Txtempcode.Text);

                                    cmd2.Parameters.AddWithValue("@pemailid", lbluseremail.Text);
                                    cmd2.Parameters.AddWithValue("@pempmobno", lblusernofromdb.Text);

                                    hfEmailOTP.Value = generateOTP();
                                    cmd2.Parameters.AddWithValue("@potpMob", hfEmailOTP.Value);
                                    cmd2.Parameters.AddWithValue("@potpEmail", hfEmailOTP.Value);
                                    conn.Open();
                                    cmd2.ExecuteNonQuery();
                                    conn.Close();
                                    lblresult.Text = "";
                                    lblresult.ForeColor = System.Drawing.Color.Red;
                                    if (lbluseremail.Text != "")
                                    {
                                        sendEmailOTP(lblusername.Text, lbluseremail.Text, hfEmailOTP.Value);
                                    }
                                    string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                                    Boolean ret = cmm.sendMobileOTP1(lblusernofromdb.Text, hfEmailOTP.Value, msgsend);
                                    if (ret)
                                    {
                                        string b = lblusernofromdb.Text.Substring(6, 4);
                                        string c = "XXXXXX" + b;
                                        lblresult.Text += "Successfully sent an OTP on " + c+ "<br /><br />";
                                    }
                                    else
                                    {
                                        lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                                    }
                                    tr_empcode.Visible = false;
                                    tr_buttongetotp.Visible = false;
                                    tr_otprow.Visible = true;  // OTP ROW visibility true when Goes to Employee Mobile
                                    string r = "--";
                                    if (lbluseremail.Text != "")
                                        r = lbluseremail.Text;
                                    //lblresult.Text = "OTP has been sent to your registered E-Mail Id: "+r+" and Mobile Number: "+ lblusernofromdb.Text;
                                }
                                else
                                {
                                    if (Convert.ToBoolean(ds.Tables[0].Rows[0][3]) && !(Convert.ToBoolean(ds.Tables[0].Rows[0][4])))
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee is not activated. Please complete the Sign Up process!!');", true);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee is not registered with us. Please complete the Sign Up process!!');", true);
                                    }
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee Code is not Correct!!');", true);
                            }
                        }
                    }
                }
            //}
            //catch (Exception ex)
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!! Please try after sometime or contact with IT Team!!');", true);
            //}
        }

        private string generateOTP()
        {
            //string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            //string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "123456789";

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

        private void sendEmailOTP1(string empName, string empEmail, string EOTP)
        {
            string appSubject, appBody;
            string wfrom = "no-reply.hris@akashvani.in";
            //string wfrom = "priyankglb2012@gmail.com";
            appSubject = "OTP for PrasarNet Employee Verification";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> Your OTP, required for re-setting a password on PrasarNet is : " + EOTP;
            appBody += ". This OTP is valid for 20 Minutes.";
            appBody += "<br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            SmtpClient client = new SmtpClient();
            client.Host = "203.122.51.200";
            client.Port = 25;
            //client.EnableSsl = true;
            //'client.Host = "mail.akashvani.in"
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
                lblresult.Text += "Sent an OTP on: " + empEmail;
            }

            catch (Exception ex)
            {
                lblresult.Text += " <br/> <br/>Unable to sent an OTP on Email.<br /><br />";
                //+ ex.ToString() 
            }
        }

        private void sendEmailOTP(string empName, string empEmail, string EOTP)
        {
            string appSubject, appBody;
            appSubject = "OTP for PrasarNet Employee Verification";
            appBody = "Dear " + empName + "<br/> ";
            appBody += "<br /> Your OTP, required for re-setting a password on PrasarNet is : " + EOTP;
            appBody += ". This OTP is valid for 20 Minutes.";
            appBody += "<br />* Note,This is a system generated mail. Please, do not reply on this.";
            appBody += "<br /><br />Regards";
            appBody += "<br /><br />Team PrasarNet";
            appBody += "<br />IT Division";
            appBody += "<br />PB Sectt.";
            int i=cmm.sendemail(appBody, empEmail, appSubject, "smtp_hrispb");
            if(i==1)
            {
                int len = empEmail.Length;
                string e1 = empEmail.Substring(4);
                string e9 = "XXXX" + e1;
                lblresult.Text += "Sent an OTP on: " + e9;

            }
            else
            {
                lblresult.Text += " <br/> <br/>Unable to sent an OTP on Email.<br /><br />";
            }
        }


        protected void Btncreatepassword_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(con);
            SqlCommand cmd3 = new SqlCommand("PN18_Getemployeeno", conn);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Parameters.AddWithValue("@pAction", "updtpasswd");
            cmd3.Parameters.AddWithValue("@pemailid", ViewState["useremail"]);
            cmd3.Parameters.AddWithValue("@pempmobno", ViewState["usermob"]);
            cmd3.Parameters.AddWithValue("@pempcode", Txtempcode.Text);
            cmd3.Parameters.AddWithValue("@ppwd", Txtnewpassword.Text);
            conn.Open();
            cmd3.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                             "alert('New Password Created Successfully.. Please Login with New Password...'); window.location='" +
                             Request.ApplicationPath + "Login.aspx';", true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('New Password Created Successfully.. Please Login with New Password...')window.location='" +
            // Request.ApplicationPath + "Login.aspx';", true);



        }

        protected void Btnverifyotp_Click1(object sender, EventArgs e)
        {
            try
            {
                string dbotpmob, dbotpemail;

                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_Getemployeeno", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "tpmobeml"); // Select OTP Mob and Email from table which was inserted for correpondent Empcode
                        cmd.Parameters.AddWithValue("@pempcode", Txtempcode.Text);
                        cmd.Parameters.AddWithValue("@pemailid", ViewState["useremail"]);
                        cmd.Parameters.AddWithValue("@pempmobno", ViewState["usermob"]);

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                dbotpmob = ds.Tables[0].Rows[0]["OTP_MOBILE"].ToString();
                                dbotpemail = ds.Tables[0].Rows[0]["OTP_EMAIL"].ToString();

                                if (dbotpemail.ToString() == Txtotp.Text && dbotpmob.ToString() == Txtotp.Text)
                                {
                                    // tr row create new password will open
                                    trradiobutton.Visible = false;
                                    tr_empcode.Visible = false;
                                    tr_buttongetotp.Visible = false;
                                    tr_otprow.Visible = false;

                                    trnewpassword.Visible = true;
                                    trconfmpassword.Visible = true;
                                    trbutton.Visible = true;

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Incorrect OTP!!');", true);
                                }


                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!! Please Try after Sometime or Contact with IT Team!!');", true);
            }
        }

        protected void imghome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/HomePage.aspx", true);
        }

        protected void lnksendotpagain_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_Getemployeeno", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pAction", "mob");
                        cmd.Parameters.AddWithValue("@pempcode", Txtempcode.Text);

                        using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adap.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                if (Convert.ToBoolean(ds.Tables[0].Rows[0][3]) && Convert.ToBoolean(ds.Tables[0].Rows[0][4]))
                                {
                                    SqlCommand cmd2 = new SqlCommand("PN18_Getemployeeno", conn);
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    cmd2.Parameters.AddWithValue("@pAction", "otpmobeml");
                                    lblusernofromdb.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                                    ViewState["usermob"] = lblusernofromdb.Text;
                                    lbluseremail.Text = ds.Tables[0].Rows[0]["EMailId"].ToString();
                                    lblusername.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                                    ViewState["useremail"] = lbluseremail.Text;
                                    cmd2.Parameters.AddWithValue("@pempcode", Txtempcode.Text);

                                    cmd2.Parameters.AddWithValue("@pemailid", lbluseremail.Text);
                                    cmd2.Parameters.AddWithValue("@pempmobno", lblusernofromdb.Text);

                                    hfEmailOTP.Value = generateOTP();
                                    cmd2.Parameters.AddWithValue("@potpMob", hfEmailOTP.Value);
                                    cmd2.Parameters.AddWithValue("@potpEmail", hfEmailOTP.Value);
                                    conn.Open();
                                    cmd2.ExecuteNonQuery();
                                    conn.Close();
                                    lblresult.Text = "";
                                    lblresult.ForeColor = System.Drawing.Color.Blue;
                                    if (lbluseremail.Text != "")
                                    {
                                        sendEmailOTP(lblusername.Text, lbluseremail.Text, hfEmailOTP.Value);
                                    }
                                    // sendMobileOTP(lblusernofromdb.Text, hfEmailOTP.Value);
                                    string msgsend = "Your OTP for PrasarNetEmployeeVerification is " + hfEmailOTP.Value + ". This OTP is Valid for next 20 minutes Prasar Bharati";
                                    Boolean ret = cmm.sendMobileOTP1(lblusernofromdb.Text, hfEmailOTP.Value, msgsend);
                                    if (ret)
                                    {
                                        lblresult.Text += "Successfully sent an OTP on " + lblusernofromdb.Text + "<br /><br />";
                                    }
                                    else
                                    {
                                        lblresult.Text += "<br/>Unable to sent an OTP on Mobile.<br /><br />";
                                    }
                                    tr_empcode.Visible = false;
                                    tr_buttongetotp.Visible = false;
                                    tr_otprow.Visible = true;  // OTP ROW visibility true when Goes to Employee Mobile
                                    string r = "--";
                                    if (lbluseremail.Text != "")
                                        r = lbluseremail.Text;
                                    // lblresult.Text = "Re-Send an OTP on E-Mail Id: " + r + " and Mobile Number: " + lblusernofromdb.Text;
                                }
                                else
                                {
                                    if (Convert.ToBoolean(ds.Tables[0].Rows[0][3]))
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee is not registered with us. Please complete the Sign Up process!!');", true);
                                    }
                                    else if (Convert.ToBoolean(ds.Tables[0].Rows[0][4]))
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee is not activated. Please complete the Sign Up process!!');", true);
                                    }
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee Code is not Correct!!');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!! Please try again or Contact with IT Team!!');", true);
            }
        }

        protected void Txtempcode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ds = cmm.RunSpReturnDSParam("PN18_Info_Employee", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Txtempcode.Text.Trim())),
                                                                                  new SqlParameter("@flag", 3));

                if (ds.Tables[0].Rows.Count == 0)
                {
                    Label21.Visible = false;
                    Label21.Text = "";
                    Btngetotp.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Employee code is not Active/Incorrect!!');", true);
                    Txtempcode.Focus();
                }
                else
                {
                    DataSet dsRegister_A = new DataSet();
                    dsRegister_A = cmm.RunSpReturnDSParam("Signup", "PRASARNETConnectionString", new SqlParameter("@empcode", Convert.ToInt32(Txtempcode.Text.Trim())),
                                                                                  new SqlParameter("@flag", 2));
                    if (dsRegister_A.Tables[0].Rows.Count != 0)// Employee Already Registered and Activated
                    {
                        string a = dsRegister_A.Tables[0].Rows[0][0].ToString().Substring(0, 6);
                        string b = dsRegister_A.Tables[0].Rows[0][0].ToString().Substring(6, 4);

                        string c = "XXXXXX" + b;

                        int len = dsRegister_A.Tables[0].Rows[0][1].ToString().Length;
                        string e1 = dsRegister_A.Tables[0].Rows[0][1].ToString().Substring(4);
                        string e9 = "XXXXXXX" + e1;
                            
                        Btngetotp.Enabled = true;
                        Label21.Visible = true;
                        Label21.Text = "Employee is Registered and Activated with mobile no " + c + " & EMail-Id " + e9 + ". Please Click on the Get OTP Button, for further process. If you like to change your MobileNo then You may contact us on ddgitpb@prasarbharati.gov.in & email@prasarbharati.gov.in";
                    }
                    else
                    {
                        Btngetotp.Enabled = false;
                        Label21.Visible = true;
                        Label21.Text = "Employee is not activated OR did not complete his/her SignUp Process on PrasarNet. Please complete your Sign Up Process.";
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);

            }
        }
    }
}