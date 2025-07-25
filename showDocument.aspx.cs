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
    public partial class showDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["UserName"]) == "" || Convert.ToString(Session["isLogin"]) == "")
            {
                Response.Redirect("HomePage.aspx");
               
            }
            else
            {

                if (!IsPostBack)
                {

                    //System.Web.HttpContext.Current.Response.Clear();
                    //System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" + filePath);
                    //System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
                    try
                    {
                        dispFile();
                     
                    }
                    catch
                    {
                        
                    }

                }
            }
        }
        private void dispFile()
        {
            String filePath = Convert.ToString(Session["showDocFilePath"]);
            StringBuilder sb = new StringBuilder();
            sb.Append("<title>PrasarNet:Document </title>");
            sb.Append("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
        sb.Append("<meta charset='utf-8'>");
            sb.Append("<meta name='viewport' content='width=device-width, initial-scale=1'>");
            sb.Append("<link rel='stylesheet' href='~/style/responsive.css'>");
            sb.Append(" <div class='row' style='background-color: White'>");
            sb.Append("<div class='col-xs-4 col-lg-4 text-center' style='padding-left: 25px; padding-top: 8px; padding-bottom: 5px'>");
            sb.Append("<img class='img-responsive pull-left' Height='93%' ImageAlign='Left' src='images/AIR.png' Width='100px' /></div>");

            sb.Append("<div class='col-xs-4 col-lg-4 text-center'>");
            sb.Append("<h3 style='color: Blue; font-weight: bolder'>");
            sb.Append("PrasarNet <BR> (प्रसार नेट)  </h3>");
            sb.Append("<h5 style='color: Blue; font-weight: normal'>");
            sb.Append(" An Intranet for Prasar Bharati Employees </h5></div>");

            sb.Append(" <div class='col-xs-4 col-lg-4 text-center' style='padding-right: 25px; padding-top: 10px;padding-bottom: 4px'>");

            sb.Append("<img class='img-responsive pull-right' Height='105%' ImageAlign='Right' src='images/Doordarshan.png' Width='125px' />  </div> </div>");

            sb.Append("<hr>");
            sb.Append("<div class='row'>");
            sb.Append("<div align='left' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' style='padding-left: 40px; padding-top: 0px; padding-bottom: 3px'><img src = 'images/printer.png' style='width:22px; height:22px';/><span CssClass='btn'>&nbsp;<a href='javascript:window.print()'><span style='font-weight: bold; font-size:small; color: #000000'>Print</span></a></span>");

            sb.Append("</div>");
            if (Convert.ToInt32(Session["dash/order"]) == 2)
            {
                sb.Append("<div id='order' runat='server' align='right' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' style='padding-right: 40px; padding-top: 0px;padding-bottom: 3px'><img src = 'images/back.png' style='width:22px; height:22px';/><span CssClass='btn'>&nbsp;<a href='OrdernCircular.aspx'><span style='font-weight: bold; font-size:small; color: #000000'>Back</span></a></span>");
                sb.Append("</div></br>");
            }
            else
            {
                sb.Append("<div id='home' runat='server' align='right' class='col-md-6 col-lg-6 col-sm-6 col-xs-6' style='padding-right: 40px; padding-top: 0px;padding-bottom: 3px'><img src = 'images/back.png' style='width:22px; height:22px';/><span CssClass='btn'>&nbsp;<a href='HomePage.aspx'><span style='font-weight: bold; font-size:small; color: #000000'>Back</span></a></span>");
                sb.Append("</div></br>");
            }
            //sb.Append("<div align='right' valign='bottom'><img src = 'images/printer.png' style='width:25px; height:25px';/><span Style='background-color: #33FFFF' CssClass='btn'><a href='javascript:window.print()'><span style='font-weight: bold; color: #000000'>Print</span></a></span>&nbsp;&nbsp;&nbsp;&nbsp;<a href='OrdernCircular.aspx'><font size='2'>Back</font></a></div>");
            sb.Append("</div></br>");
            
            //sb.Append("<table width='100%' style='background-color: #FFFFFF' ><tr><td style='padding-left: 25px; padding-top: 8px;padding-bottom: 5px' align='left'width='20%'><img src='images/AIR.png' style='width: 81px; height: 85px'/></td>");
            //sb.Append("<td width='60%'align='center' valign='bottom'><font style='color: Blue; font-weight: bolder font-size: xx-large;'> PrasarNet</font> <BR>");
            //sb.Append("<font style='font-size: large; color: Blue; font-weight: bolder'> (प्रसार नेट) </font><BR>");
            //sb.Append("<font style='font-size: small;color: Blue; font-weight: normal'>  An Intranet for Prasar Bharati Employees </font></td> <BR>");
            //sb.Append("<td style='padding-right: 25px; padding-top: 10px;padding-bottom: 4px' align='right'width='20%'><img src='images/Doordarshan.png' style='width: 95px; height: 85px'/></td> </tr></table>");

            //sb.Append("<td align='center'  valign='bottom'></td>");
            //sb.Append("<td align='right' valign='bottom'><img src = 'image/printer1.bmp' style='width:25px; height:25px';/><a href='javascript:window.print()'>Print</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='OrdernCircular.aspx'><font size='2'>Back</font></a></td> </tr></table>");
          
            System.Web.HttpContext.Current.Response.Write(sb);
            
            WebClient client = new WebClient();
            Stream data = client.OpenRead(filePath);
            //StreamReader reader = new StreamReader(data);
            StreamReader reader = new StreamReader(data, System.Text.Encoding.ASCII);
            //string s = reader.ReadToEnd();
            String s = "";
            while ((s = reader.ReadLine()) != null)
            {
                if (s != "")
                {
                    s = " " + s.Replace("?", "&nbsp;");
                    System.Web.HttpContext.Current.Response.Write(s);
                }
            }
            data.Close();
            //s = reader.ReadToEnd();
            reader.Close();
            //Response.Write(s);
            //dispFile();
            //System.Diagnostics.Process.Start(filePath);


            System.Web.HttpContext.Current.Response.Write("<hr>");
            System.Web.HttpContext.Current.Response.Write("<div align='center'><font style='font-size: small;'>This document is printed from : <b>PrasarNet</b>, IT Division</font></div>");
            System.Web.HttpContext.Current.Response.Write("<div align='center'><BR><img src = 'images/printer.png' style='width:22px; height:22px';/><span CssClass='btn'>&nbsp;<a href='javascript:window.print()'><span style='font-weight: bold; font-size:small; color: #000000'>Print</span></a></span> </div>");

        }
    }
}