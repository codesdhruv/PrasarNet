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
    public partial class Grievances : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                //Response.Redirect("Logout.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                Response.Redirect("Logout.aspx");
                //if (!IsPostBack)
                //{
                //    Label1.Text = Convert.ToString(Session["UserName"]);
                //}
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btntrackgrievances_Click(object sender, EventArgs e)
        {
            diventry.Visible = false;
            divOPTIONS.Visible = false;
            btnback.Visible = false;
            divtrackgridprimary.Visible = true;
            divtrackgridsecondary.Visible = false;
            gridbindPrimary();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            diventry.Visible = false;
            divOPTIONS.Visible = true;
            btnback.Visible = true;
            divtrackgridprimary.Visible = false;
            divtrackgridsecondary.Visible = false;
        }

        protected void btnfileGrievance_Click(object sender, EventArgs e)
        {
            diventry.Visible = true;
            divOPTIONS.Visible = false;
            btnback.Visible = false;
            divtrackgridprimary.Visible = false;
            divtrackgridsecondary.Visible = false;
            cmm.bindDDLWidParam(ddldept, "PN18_Gre_Deptt", "department", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                  new SqlParameter("@flag", 1));
            cmm.bindDDLWidParam(ddlsubject, "PN18_gre_SP_Subject", "Subject", "id", "PRASARNETConnectionString", "--Select--",
                                                                                                                 new SqlParameter("@flag", 1));
        }

        protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldept.SelectedIndex != 0)
            {
                if (ddldept.SelectedValue != "8")
                {
                    ds = cmm.RunSpReturnDSParam("PN18_Gre_Deptt", "PRASARNETConnectionString", new SqlParameter("@id", Convert.ToInt32(ddldept.SelectedValue))
                                                                                           , new SqlParameter("@flag", 2));
                    int flag = 0, orgid, secORstn;
                    orgid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    secORstn = Convert.ToInt32(ds.Tables[0].Rows[0][2]);

                    if (secORstn == 1)
                    {
                        flag = 1;
                    }
                    else if (secORstn == 2)
                    {
                        flag = 2;
                    }
                    else if (secORstn == 3)
                    {
                        flag = 3;
                    }
                    else if (secORstn == 4)
                    {
                        flag = 4;
                    }
                    else if (secORstn == 5)
                    {
                        flag = 5;
                    }
                    cmm.bindDDLWidParam(ddlsection, "PN18_Gre_section", "Expr1", "secstnid", "PRASARNETConnectionString", "--Select--", new SqlParameter("@orgid", orgid),
                                                                                                                      new SqlParameter("@flag", flag));
                }
            }
            else
            {
                ddlsection.Items.Clear();
                ddlsection.SelectedIndex = -1;
                ddlsection.SelectedValue = null;
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
        }
        private void clear()
        {
            ddldept.SelectedIndex = 0;
            ddlsection.Items.Clear();
            ddlsection.SelectedIndex = -1;
            ddlsection.SelectedValue = null;
            txtgrievance.Text = "";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int usertypeid_forwarded = 0;
                if (ddldept.SelectedValue == "1")
                    usertypeid_forwarded = 26;
                else if (ddldept.SelectedValue == "2")
                    usertypeid_forwarded = 25;

                else if (ddldept.SelectedValue == "3" || ddldept.SelectedValue == "11")
                    usertypeid_forwarded = 20;

                else if (ddldept.SelectedValue == "4")
                    usertypeid_forwarded = 12;

                else if (ddldept.SelectedValue == "5" || ddldept.SelectedValue == "6" || ddldept.SelectedValue == "12")
                    usertypeid_forwarded = 11;

                else if (ddldept.SelectedValue == "9")
                    usertypeid_forwarded = 22;

                else if (ddldept.SelectedValue == "10")
                {
                    ds = cmm.RunSpReturnDSParam("pn18_gre_fetchUsertype", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                   , new SqlParameter("@uid", Convert.ToInt32(ddlsection.SelectedValue)));
                    usertypeid_forwarded = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                }
                //string IpAdress = cmm.GetIPAddressHostName();
                // string ipaddress22 = Commonclass1.GetLocalIPAddress();
                string ipaddress2 = cmm.GetIp_Priyank();
                ds = cmm.RunSpReturnDSParam("PN18_gre_getempdetails", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                                new SqlParameter("@empcode", Convert.ToInt32(Session["empcode"])));

                if (FileUpload1.HasFile)
                {
                    int ret = uploaddoc();
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {
                        string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                        SqlConnection conn = new SqlConnection(conf);
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("PN18_Grievances", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Gre_usertypeid", Convert.ToInt16(Session["GreUsertype"]));
                        cmd.Parameters.AddWithValue("@Emp_user_id", Session["empcode"].ToString());
                        cmd.Parameters.AddWithValue("@DeptId", Convert.ToInt32(ddldept.SelectedValue));
                        cmd.Parameters.AddWithValue("@Usertypeid", usertypeid_forwarded);
                        cmd.Parameters.AddWithValue("@Section_Stationid", Convert.ToInt32(ddlsection.SelectedValue));
                        cmd.Parameters.AddWithValue("@subjectid", Convert.ToInt32(ddlsubject.SelectedValue));
                        cmd.Parameters.AddWithValue("@filename", Convert.ToString(ViewState["GDfilename"]));
                        cmd.Parameters.AddWithValue("@Grievance_regdBy", Session["UserName"].ToString());
                        cmd.Parameters.AddWithValue("@IPAdress_RegdUser", ipaddress2);
                        cmd.Parameters.AddWithValue("@Grievance", txtgrievance.Text.Trim());
                        cmd.Parameters.AddWithValue("@NameofComplainant", ds.Tables[0].Rows[0][2].ToString());
                        cmd.Parameters.AddWithValue("@EmailOfComplainant", ds.Tables[0].Rows[0][3].ToString());
                        cmd.Parameters.AddWithValue("@MobileNoOfComplainant", ds.Tables[0].Rows[0][4].ToString());
                        //cmd.Parameters.AddWithValue("@Address", );
                        cmd.Parameters.AddWithValue("@flag", 1);


                        cmd.Parameters.Add("@GrievanceIdOUT", SqlDbType.VarChar, 50);// to get a out value from sql query
                        cmd.Parameters["@GrievanceIdOUT"].Direction = ParameterDirection.Output;// to get a out value from sql query

                        cmd.Parameters.Add("@GrievanceCreateddate", SqlDbType.DateTime);// to get a out value from sql query
                        cmd.Parameters["@GrievanceCreateddate"].Direction = ParameterDirection.Output;// to get a out value from sql query

                        int i = cmd.ExecuteNonQuery();
                        string complaintid = cmd.Parameters["@GrievanceIdOUT"].Value.ToString();
                        string grievance_regd_on = cmd.Parameters["@GrievanceCreateddate"].Value.ToString();
                        conn.Close();
                        if (i > 0)
                        {
                            clear();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Grievance Reference ID is " + complaintid + ". Please remember it for future reference.')", true);
                            DataSet dsmob = new DataSet();
                            string mob = "";
                            dsmob = cmm.RunSpReturnDSParam("PN18_Gre_Mobile", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                            foreach (DataRow row in dsmob.Tables[0].Rows)
                            {
                                mob = row["Mobile_No"].ToString();
                                //int retFU = sendMobileOTP(mob, complaintid, grievance_regd_on);
                                string msgsend = "A new grievance has been received, with Grievance Reference ID " + complaintid + " & dated " + grievance_regd_on + ". Prasar Bharati";
                                Boolean ret1 = cmm.sendMobileOTP1(mob, "1234", msgsend);

                            }
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {

                    string conf = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(conf);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("PN18_Grievances", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Gre_usertypeid", Convert.ToInt16(Session["GreUsertype"]));
                    cmd.Parameters.AddWithValue("@Emp_user_id", Session["empcode"].ToString());
                    cmd.Parameters.AddWithValue("@DeptId", Convert.ToInt32(ddldept.SelectedValue));
                    cmd.Parameters.AddWithValue("@Usertypeid", usertypeid_forwarded);
                    cmd.Parameters.AddWithValue("@Section_Stationid", Convert.ToInt32(ddlsection.SelectedValue));
                    cmd.Parameters.AddWithValue("@subjectid", Convert.ToInt32(ddlsubject.SelectedValue));
                    cmd.Parameters.AddWithValue("@Grievance_regdBy", Session["UserName"].ToString());
                    cmd.Parameters.AddWithValue("@IPAdress_RegdUser", ipaddress2);
                    cmd.Parameters.AddWithValue("@Grievance", txtgrievance.Text.Trim());
                    cmd.Parameters.AddWithValue("@NameofComplainant", ds.Tables[0].Rows[0][2].ToString());
                    cmd.Parameters.AddWithValue("@EmailOfComplainant", ds.Tables[0].Rows[0][3].ToString());
                    cmd.Parameters.AddWithValue("@MobileNoOfComplainant", ds.Tables[0].Rows[0][4].ToString());
                    //cmd.Parameters.AddWithValue("@Address", );
                    cmd.Parameters.AddWithValue("@flag", 1);


                    cmd.Parameters.Add("@GrievanceIdOUT", SqlDbType.VarChar, 50);// to get a out value from sql query
                    cmd.Parameters["@GrievanceIdOUT"].Direction = ParameterDirection.Output;// to get a out value from sql query

                    cmd.Parameters.Add("@GrievanceCreateddate", SqlDbType.DateTime);// to get a out value from sql query
                    cmd.Parameters["@GrievanceCreateddate"].Direction = ParameterDirection.Output;// to get a out value from sql query

                    int i = cmd.ExecuteNonQuery();
                    string complaintid = cmd.Parameters["@GrievanceIdOUT"].Value.ToString();
                    string grievance_regd_on = cmd.Parameters["@GrievanceCreateddate"].Value.ToString();

                    conn.Close();
                    if (i > 0)
                    {
                        clear();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Grievance Reference ID is " + complaintid + ". Please remember it for future reference.')", true);
                        DataSet dsmob = new DataSet();
                        string mob = "";
                        dsmob = cmm.RunSpReturnDSParam("PN18_Gre_Mobile", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                        foreach (DataRow row in dsmob.Tables[0].Rows)
                        {
                            mob = row["Mobile_No"].ToString();
                            // int ret= sendMobileOTP(mob, complaintid, grievance_regd_on);
                            string msgsend = "A new grievance has been received, with Grievance Reference ID " + complaintid + " & dated " + grievance_regd_on + ". Prasar Bharati";
                            Boolean ret = cmm.sendMobileOTP1(mob, "1234", msgsend);
                            //new grievance has been received, with a Grievance Reference ID  {#var#} & dated   {#var#}. Prasar Bharati
                        }

                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }



            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error Occured!! Try Again..')", true);

            }
        }
        //public int sendMobileOTP(string Mobstring, string GID, string timestring)
        //{
        //    try
        //    {
        //        //ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(AcceptAllCertifications);
        //        string bodyofmsg = "A new grievance has been received, raised by an Employee, having Grievance Reference ID " + GID + ", registered on  " + timestring + ". For more details and action, Please login into PrasarNet (https://prasarnet.prasarbharati.org).";

        //        //string bodyofmsg = "A new grievance has been received, raised by an Employee, having Grievance Reference ID: " + GID + "& registered on " + timestring + ". For more details and action, please login into PrasarNet.";
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
        //        //lblmobotpmsg.Text = "<br /><br />OTP(Mobile) has been sent to you via sms on " + Mobstring + "<br /><br />";
        //        return 1;
        //    }

        //    catch (Exception ex)
        //    {

        //        //lblmobotpmsg.Text = "<br /><br /> Oopps.. Unable to send OTP to your Mobile." + ex.ToString() + "<br /><br />";
        //        return 0;
        //    }

        //}

        private int uploaddoc()
        {

            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                string max = "";
                max = cmm.SelectMaxId("select max(Gre_Id)+1 from PN18_Gre_Grievances", "PRASARNETConnectionString");
                if (max == "")
                {
                    max = "1";
                }

                if (filetype == ".pdf")
                {
                    string files = "";
                    FileUpload1.SaveAs(MapPath("~/GrievanceDoc/" + FileUpload1.FileName.ToString()));
                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        if ((lastline.IndexOf("%PDF") > -1))
                        {
                            int filesize = FileUpload1.PostedFile.ContentLength;
                            if (filesize > 3145728)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Maximum file size(3MB) exceeded..');", true);
                                return 0;
                            }
                            else
                            {
                                path = Server.MapPath("~") + "\\GrievanceDoc\\";
                                string Fromfile = path + files;
                                string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();
                                string savefile = "GD_Emp" + max + "_" + dtetm + filetype;
                                string Tofile = path + savefile;
                                File.Move(Fromfile, Tofile);
                                ViewState["GDfilename"] = savefile;
                                return 1;
                            }

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                            return 0;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                        return 0;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert(Only,pdf file are allowed to upload!!');", true);
                    return 0;
                }
            }
            catch (Exception ex)
            {

                lblexception.Visible = true;
                lblexception.Text = ex.Message.ToString();
                return 0;
            }
        }

        protected void closedivs_Click(object sender, EventArgs e)
        {
            divtrackgridprimary.Visible = true;
            divtrackgridsecondary.Visible = false;
        }
        private void gridbindPrimary()
        {
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                        new SqlParameter("@Emp_user_id", Session["empcode"].ToString()));
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            diventry.Visible = false;
            divOPTIONS.Visible = true;
            btnback.Visible = true;
            divtrackgridprimary.Visible = false;
            divtrackgridsecondary.Visible = false;
        }

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            gridbindPrimary();
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            gridbindprimary_Search();
            ViewState["search"] = 1;
        }
        private void gridbindprimary_Search()
        {
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 3),
                                                                                        new SqlParameter("@GrievanceId", txtsearch.Text.Trim()),
                                                                                       new SqlParameter("@Emp_user_id", Session["empcode"].ToString()));
            grdcomdetails.DataSource = ds;
            grdcomdetails.DataBind();
        }
        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdcomdetails.AllowPaging = false;

                if (Convert.ToInt16(ViewState["search"]) == 1)//PBADG(E&A)
                {

                    gridbindprimary_Search();

                }
                else
                {
                    gridbindPrimary();
                }
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdcomdetails.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'")
                    .Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "Grievance Print", sb.ToString());
                grdcomdetails.AllowPaging = true;
                if (Convert.ToInt16(ViewState["search"]) == 1)
                {

                    gridbindprimary_Search();

                }
                else
                {
                    gridbindPrimary();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx", true);
        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "sendreminder")
            {
                txtrequest_remind.Text = "";
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                ViewState["greid_reminder"] = greid;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                //GridView grdresendmails = row.FindControl("grdresendmails") as GridView;
                Label16.Text = lblrefid.Text;
                //Display the ModalPopup Reminder...
                mpereminder.Show();
            }
            if (e.CommandName == "Trackinfo")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                ViewState["greid_popup_track"] = greid;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                //GridView grdresendmails = row.FindControl("grdresendmails") as GridView;
                Label55.Text = lblrefid.Text;
                ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 14)
                                                                                     , new SqlParameter("@Gre_ID", greid));
                grdtrack.DataSource = ds;
                grdtrack.DataBind();
                //Display the ModalPopup.
                mpetrack.Show();
            }
            if (e.CommandName == "HistoryOfReminder")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                ViewState["greid_popup_HOR"] = greid;
                Label lblrefid = row.FindControl("lblrefid") as Label;
                lblhorGRErefid.Text = lblrefid.Text;
                ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                     , new SqlParameter("@greid", greid));
                grdHOR.DataSource = ds;
                grdHOR.DataBind();
                //Display the ModalPopup.
                mpehor.Show();
            }

            if (e.CommandName == "downloadreplyfile")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkview = row.FindControl("lnkview") as LinkButton;
                try
                {
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                    // GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblreplyattached = row.FindControl("lblreplyattached") as Label;


                    string docname = lblreplyattached.Text;

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string str = docname;
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (docname != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + docname);
                                Response.WriteFile(paths1);
                                //Response.End();
                                HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                                HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                                HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdcomdetails.Focus();

            }

            if (e.CommandName == "download")
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/GrievanceDoc/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString",
                                                       new SqlParameter("@flag", 6),
                                                       new SqlParameter("@Gre_ID", greid));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][0]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        //if (ds2.Tables[0].Rows.Count != 0)
                        //{
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        //Response.Redirect(paths);
                        string str = ds1.Tables[0].Rows[0][0].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            //Response.Redirect(paths);
                            if (ds1.Tables[0].Rows[0][0].ToString() != "")
                            {
                                //Session["DPCLOpath"] = paths;
                                //Response.Redirect("DPC_LO_DocView.aspx", false);
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][0].ToString());
                                Response.WriteFile(paths);
                                // Response.End();
                                HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                                HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                                HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.

                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
                grdcomdetails.Focus();
            }
            if (e.CommandName == "GetaPdf")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lbltrnid = row.FindControl("lbltrnid") as Label;
                    LinkButton lnkstatus = row.FindControl("lnkstatus") as LinkButton;
                    Label lbldept2 = row.FindControl("lbldept2") as Label;
                    Label lblsection2 = row.FindControl("lblsection2") as Label;
                    LinkButton lblgrievancegrid = row.FindControl("lblgrievancegrid") as LinkButton;
                    Label lblrefid = row.FindControl("lblrefid") as Label;
                    Label lblfileuploadoutput = row.FindControl("lblfileuploadoutput") as Label;

                    Label lblgriefilename = row.FindControl("lblgriefilename") as Label;
                    Label lblgrievanceregon = row.FindControl("lblgrievanceregon") as Label;

                    Label lblreceivedon2 = row.FindControl("lblreceivedon2") as Label;
                    Label lblreplyattached = row.FindControl("lblreplyattached") as Label;

                    Label lblfilercvdoutput = row.FindControl("lblfilercvdoutput") as Label;
                    Label lblreplyrecvd = row.FindControl("Label22") as Label;

                    int greid = (int)grdcomdetails.DataKeys[row.RowIndex].Value;
                    ViewState["GREid_action"] = greid;

                    Session["section_emp"] = lblsection2.Text;
                    Session["Dept_emp"] = lbldept2.Text;
                    Session["FinalStatus_emp"] = lnkstatus.Text;
                    Session["Grievance_Emp"] = lblgrievancegrid.Text;
                    Session["G_Refid_Emp"] = lblrefid.Text;
                    Session["fileuploadoutput_emp"] = lblfileuploadoutput.Text;
                    Session["grie_filename"] = lblgriefilename.Text;

                    Session["G_regdon_emp"] = lblgrievanceregon.Text;
                    Session["G_recvdOn_emp"] = lblreceivedon2.Text;
                    Session["G_reply_File_emp"] = lblreplyattached.Text;
                    Session["G_reply_Fileoutput_emp"] = lblfilercvdoutput.Text;
                    Session["Replyrecvd_Emp"] = lblreplyrecvd.Text;


                    Response.Redirect("Grievance_View_PDF.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
            }
        }

        protected void grdcomdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblfilercvdoutput = (Label)e.Row.FindControl("lblfilercvdoutput");
                LinkButton lblfilercvd2 = (LinkButton)e.Row.FindControl("lblfilercvd2");
                string filercvdoutput = lblfilercvdoutput.Text;
                Label lblfileuploadoutput = (Label)e.Row.FindControl("lblfileuploadoutput");
                LinkButton lblgrievancegrid = (LinkButton)e.Row.FindControl("lblgrievancegrid");
                LinkButton lnkstatus = (LinkButton)e.Row.FindControl("lnkstatus");
                LinkButton lnkhisRem = (LinkButton)e.Row.FindControl("lnkhisRem");
                Label lblresolvedflag = (Label)e.Row.FindControl("lblresolvedflag");
                Boolean res = Convert.ToBoolean(lblresolvedflag.Text);
                string fileupload = lblfileuploadoutput.Text;
                //Get the value of column from the DataKeys using the RowIndex.
                int greid = Convert.ToInt32(grdcomdetails.DataKeys[e.Row.RowIndex].Values[0]);

                int count = cmm.RunSPReturnCountParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 2)
                                                                                     , new SqlParameter("@greid", greid));
                int count1 = cmm.RunSPReturnCountParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 3)
                                                                                   , new SqlParameter("@greid", greid));
                ImageButton imgreminder = (ImageButton)e.Row.FindControl("imgreminder");
                if (count > 0)
                {
                    imgreminder.Visible = true;
                }
                else
                {
                    imgreminder.Visible = false;
                }
                if(count1>0)
                {
                    lnkhisRem.Visible = true;
                }
                else
                {
                    lnkhisRem.Visible = false;
                }
                if (filercvdoutput == "0")// Reply File
                {
                    lblfilercvd2.ForeColor = System.Drawing.Color.Black;

                    lblfilercvd2.CssClass = "nounderline";
                    lblfilercvd2.Text = "None";
                }
                else
                {
                    lblfilercvd2.ForeColor = System.Drawing.Color.Blue;

                    lblfilercvd2.CssClass = "underline";
                    lblfilercvd2.Text = "Download";
                }
                if (fileupload == "0")// Grievance Attached File
                {
                    lblgrievancegrid.ForeColor = System.Drawing.Color.Black;

                    lblgrievancegrid.CssClass = "fontingrid nounderline";
                }
                else
                {
                    lblgrievancegrid.ForeColor = System.Drawing.Color.Blue;

                    lblgrievancegrid.CssClass = "fontingrid underline";
                }
                if (!res)//Pending
                {
                    lnkstatus.CssClass = "btnpending btn font2";
                }

                else if (res)//Pending
                {
                    lnkstatus.CssClass = "btncomplete  btn font2";
                }


            }
        }
        protected void grdtrack_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdtrack.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN18_Grievances", "PRASARNETConnectionString", new SqlParameter("@flag", 13)
                                                                                    , new SqlParameter("@Gre_ID", Convert.ToInt64(ViewState["greid_popup_track"])));
            grdtrack.DataSource = ds;
            grdtrack.DataBind();
        }
        protected void btnreminder_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtrequest_remind.Text.Trim() != "")
                {
                    string ip = cmm.GetIp_Priyank();
                    int i = cmm.RunSP("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                           , new SqlParameter("@greid", Convert.ToInt32(ViewState["greid_reminder"]))
                                                                                                           , new SqlParameter("@ip", ip)
                                                                                                           , new SqlParameter("@createdbyid", Convert.ToInt32(Session["empid"]))
                                                                                                           , new SqlParameter("@remarks", txtrequest_remind.Text.Trim()));
                    if (i > 0)
                    {
                        txtrequest_remind.Text = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sent a Reminder Sucessfully..')", true);
                        DataSet dsmob = new DataSet();
                        string mob = "";
                        dsmob = cmm.RunSpReturnDSParam("PN18_Gre_Mobile", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
                        foreach (DataRow row in dsmob.Tables[0].Rows)
                        {
                            mob = row["Mobile_No"].ToString();
                            string msgsend = "A new Reminder has been received, for a Grievance Reference ID " + Label16.Text + ". Prasar Bharati";
                            Boolean ret = cmm.sendMobileOTP1(mob, "1234", msgsend);
                        }
                       // mpereminder.Hide();
                        gridbindPrimary();
                        //request = 1;

                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Request can not be left empty!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error Occured!! Try Again..')", true);
            }
        }

        protected void grdHOR_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHOR.PageIndex = e.NewPageIndex;
            ds = cmm.RunSpReturnDSParam("PN21_gre_Reminder", "PRASARNETConnectionString", new SqlParameter("@flag", 4)
                                                                                     , new SqlParameter("@greid", Convert.ToInt32(ViewState["greid_popup_HOR"])));
            grdHOR.DataSource = ds;
            grdHOR.DataBind();
        }
    }
}