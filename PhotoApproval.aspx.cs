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
    public partial class PhotoApproval : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 27)
            {

                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    bindgrid();
                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        public void bindgrid()
        {

            DataSet ds1 = new DataSet();

            ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                          new SqlParameter("@flag", "4"));

            grdgallery.DataSource = ds1;
            grdgallery.DataBind();

        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void grdgallery_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "msgEdit")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int PicId = (int)grdgallery.DataKeys[row.RowIndex].Value;
                    ViewState["msgidedit"] = PicId;
                    CheckBox chkverify1 = (CheckBox)row.FindControl("chkverify1");
                    Label lblshwmsg = (Label)row.FindControl("lblshwmsg");
                    lblshwmsg.Visible = false;
                    chkverify1.Visible = true;
                    LinkButton lnkedit = (LinkButton)row.FindControl("lnkedit");
                    LinkButton lnkupdate = (LinkButton)row.FindControl("lnkupdate");
                    LinkButton lnkcancel = (LinkButton)row.FindControl("lnkcancel");
                    lnkcancel.Visible = true;
                    lnkupdate.Visible = true;
                    lnkedit.Visible = false;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }


            }
            if (e.CommandName == "msgUpdate")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int PicId = (int)grdgallery.DataKeys[row.RowIndex].Value;
                    CheckBox chkverify1 = (CheckBox)row.FindControl("chkverify1");
                    Label lblshwmsg = (Label)row.FindControl("lblshwmsg");
                    int chk;
                    if (chkverify1.Checked)
                    {
                        chk = 1;
                    }
                    else
                        chk = 0;

                    int i = 0;
                    i = cmm.RunSP("PN18_galleryProc", "PRASARNETConnectionString", new SqlParameter("@picid", PicId),
                                                                           new SqlParameter("@Pic_tobe_Display", chk),
                                                                           new SqlParameter("AppforPSliderby", Convert.ToString(Session["UserName"])),
                                                                                        new SqlParameter("@flag", 6));

                    if (i > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
                       
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }

                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
                bindgrid();
                //lblshwmsg.Visible = true;
                //chkverify1.Visible = false;
            }
            if (e.CommandName == "msgcancel")
            {
                try
                {
                    grdgallery.EditIndex = -1;
                    bindgrid();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }

            }
        }

        protected void grdgallery_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdgallery.PageIndex = e.NewPageIndex;
            bindgrid();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grdgallery.AllowPaging = false;
            bindgrid();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdgallery.RenderControl(hw);
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
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            grdgallery.AllowPaging = true;
            bindgrid();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grdgallery_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataSet ds1 = new DataSet();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkedit = (LinkButton)e.Row.FindControl("lnkedit");
                Label lblshwmsg = (Label)e.Row.FindControl("lblshwmsg");

                int picid = Convert.ToInt32(grdgallery.DataKeys[e.Row.RowIndex].Values[0].ToString());

                ds1 = cmm.RunSpReturnDSParam("PN18_galleryProc", "PRASARNETConnectionString",
                                                          new SqlParameter("@picid", picid),
                                                          new SqlParameter("@flag", "2"));
                if (Convert.ToBoolean(ds1.Tables[0].Rows[0][5]))
                {
                    lblshwmsg.ForeColor = System.Drawing.Color.LimeGreen;
                    //lnkedit.Visible = false;
                }
                else
                {
                    lblshwmsg.ForeColor = System.Drawing.Color.Red;
                    //lnkedit.Visible = true;
                }


            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Approve.aspx");
        }


    }
}