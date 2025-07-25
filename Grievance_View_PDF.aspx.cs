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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace PrasarNet
{
    public partial class Grievance_View_PDF : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10)
            {

                if (!IsPostBack)
                {
                    empmenu.Visible = true;
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    lblgrievance.Text = Session["Grievance_Emp"].ToString();
                    lbldateofGrie.Text = Session["G_regdon_emp"].ToString();
                    lblstatus.Text = Session["FinalStatus_emp"].ToString();
                    lblGrefID.Text = Session["G_Refid_Emp"].ToString();
                    if (Session["fileuploadoutput_emp"].ToString() == "0")
                    {
                        lblfile.Text = "None";//
                        lblfile.Enabled = false;
                        lblfile.ForeColor = System.Drawing.Color.Black;
                        lblfile.CssClass = "font2";
                    }
                    else
                    {
                        lblfile.Text = "Yes";
                        lblfile.Enabled = true;
                        lblfile.ForeColor = System.Drawing.Color.Blue;
                        lblfile.CssClass = "font2";
                    }


                    lblreplyrecievedon.Text = Session["G_recvdOn_emp"].ToString();

                    if (Session["G_reply_Fileoutput_emp"].ToString() == "0")
                    {
                        lblreplyfilerecvd.Text = "None";//  
                        lblreplyfilerecvd.Enabled = false;
                        lblreplyfilerecvd.ForeColor = System.Drawing.Color.Black;
                        lblreplyfilerecvd.CssClass = "font2";
                    }
                    else
                    {
                        lblreplyfilerecvd.Text = "Yes";
                        lblreplyfilerecvd.Enabled = true;
                        lblreplyfilerecvd.ForeColor = System.Drawing.Color.Blue;
                        lblreplyfilerecvd.CssClass = "font2";
                    }

                    lblreplyrecvd.Text = Session["Replyrecvd_Emp"].ToString();
                    Label26.Text = Session["section_emp"].ToString() + "/ " + Session["Dept_emp"].ToString();


                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Grievances.aspx", true);
        }

        protected void lblfile_Click(object sender, EventArgs e)
        {
            try
            {
                string urlfixedpath = Server.MapPath("~/GrievanceDoc/");

                string docname = Session["grie_filename"].ToString();
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
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
            }
        }

        protected void lblreplyfilerecvd_Click(object sender, EventArgs e)
        {
            try
            {
                string urlfixedpath = Server.MapPath("~/GrievanceDoc/");

                string docname = Session["G_reply_File_emp"].ToString();
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
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
        
                Label31.Visible = true;
                Label31.Text = "**This Print/Data is taken from PrasarNet, by " + Convert.ToString(Session["UserName"]) + ", on " + System.DateTime.Now;
                Button1.Visible = false;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Grievance.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                divforwardedaction.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 40f, 100f, 40f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
                Button1.Visible = true;
                Label31.Visible = false;
                Label31.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }
    }
}