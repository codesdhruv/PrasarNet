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
    public partial class GetaPDF_Grievance : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 14 ||
                Convert.ToInt16(Session["Usertype"]) == 15 || Convert.ToInt16(Session["Usertype"]) == 16 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 ||
                Convert.ToInt16(Session["Usertype"]) == 24 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 27
                || Convert.ToInt16(Session["Usertype"]) == 47)
            {

                if (!IsPostBack)
                {
                    if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and sections
                    {
                        AdminMenu.Visible = false;
                        StationSectionMenu.Visible = true;
                    }
                    else
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
                        if (Convert.ToInt16(Session["Usertype"]) == 47 || Convert.ToInt16(Session["Usertype"]) == 14)
                        {
                            AdminMenu.Visible = true;
                            StationSectionMenu.Visible = false;
                        }
                    }
                    lblgrievance.Text = Session["GrievanceComp"].ToString();
                    lbldateofGrie.Text = Session["G_REGDon"].ToString();
                    lblstatus.Text = Session["currentStatus"].ToString();
                    Label7.Text=Session["name_res"].ToString() ;
                    Label9.Text = Session["email_res"].ToString();
                    Label12.Text = Session["mob_res"].ToString();
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    Label23.Text = Session["referenceId_res"].ToString();
                    Label26.Text = Session["section"].ToString()+"/ "+ Session["Dept"].ToString();
                    
                    
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

       
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void Button1_Click1(object sender, EventArgs e)
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
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }

    //        try  
    //{  
    //    Document pdfDoc = new Document(PageSize.A4.Rotate(), 0, 0, 5, 0);  
    //    PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, HttpContext.Current.Response.OutputStream);  
    //    pdfDoc.Open();  
    //    pdfDoc.Add(new Paragraph("This is Landscape Page"));  
  
    //    pdfDoc.SetPageSize(new Rectangle(850f, 1100f));            
    //    pdfDoc.NewPage();  
    //    pdfDoc.Add(new Paragraph("This is Portrait Page"));  
    //    pdfWriter.CloseStream = false;  
    //    pdfDoc.Close();  
    //    Response.Buffer = true;  
    //    Response.ContentType = "application/pdf";  
    //    Response.AddHeader("content-disposition", "attachment;filename=Test.pdf");  
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);  
    //}  
    //catch (Exception ex)  
    //{  
    //} 

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Grievance_Reports_Action.aspx", true);
        }
    }
}