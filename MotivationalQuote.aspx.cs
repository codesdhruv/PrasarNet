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
    public partial class MotivationalQuote : System.Web.UI.Page
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

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txtmsg.Text = "";
            TextBox1.Text = "";
            divgrd.Visible = true;
            btnadd.Text = "Add";
            bindgrid();
        }
        public void bindgrid()
        {
            ds = cmm.RunSpReturnDSParam("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@flag", 6));
            grdmsg.DataSource = ds;
            grdmsg.DataBind();
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            int usertypeid = Convert.ToInt32(Session["Usertype"]);
            if (btnadd.Text == "Update")
            {
                int d = cmm.RunSP("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@quote", txtmsg.Text.Trim()),
                                                    new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                    new SqlParameter("@qid", Convert.ToInt32(ViewState["qidedit"])),
                                                    new SqlParameter("@flag", 3),
                                                    new SqlParameter("@author", TextBox1.Text.Trim()));
                if (d > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                    txtmsg.Text = "";
                    TextBox1.Text = "";
                    divgrd.Visible = true;
                    btnadd.Text = "Add";
                   
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    divgrd.Visible = false;
                    btnadd.Text = "Update";
                }
                
            }
            else
            {
                int d = cmm.RunSP("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@quote", txtmsg.Text.Trim()),
                                                     new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                     new SqlParameter("@flag", 1),
                                                     new SqlParameter("@author", TextBox1.Text.Trim()));
                if (d > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Added Successfully');", true);
                    txtmsg.Text = "";
                    TextBox1.Text = "";
                    divgrd.Visible = true;
                    btnadd.Text = "Add";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    divgrd.Visible = true;
                    btnadd.Text = "Add";
                }

            }
            bindgrid();
        }

        protected void grdmsg_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataSet ds1 = new DataSet();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkdelete = (LinkButton)e.Row.FindControl("lnkdelete");
                LinkButton lnkedit = (LinkButton)e.Row.FindControl("lnkedit");
                Label lblshwmsg = (Label)e.Row.FindControl("lblshwmsg");
                int qid = Convert.ToInt32(grdmsg.DataKeys[e.Row.RowIndex].Values[0].ToString());
                ds1 = cmm.RunSpReturnDSParam("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@qid", qid),
                                                                                      new SqlParameter("@flag", 8));
                if (Convert.ToBoolean(ds1.Tables[0].Rows[0][6]))
                {
                    lblshwmsg.ForeColor = System.Drawing.Color.LimeGreen;
                    lnkedit.Visible = false;
                    lnkdelete.Visible = false;
                }
                else
                {
                    lblshwmsg.ForeColor = System.Drawing.Color.Red;
                    lnkedit.Visible = true;
                    lnkdelete.Visible = true;
                }
            }
        }

        protected void grdmsg_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "msgEdit")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int qid = (int)grdmsg.DataKeys[row.RowIndex].Value;
                    ViewState["qidedit"] = qid;
                    Label lnkmsg = (Label)row.FindControl("lnkmsg");
                    Label lblauthor = (Label)row.FindControl("lblauthor");
                    txtmsg.Text = lnkmsg.Text;
                    TextBox1.Text = lblauthor.Text;
                    divgrd.Visible = false;
                    btnadd.Text = "Update";
                
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }


            }
            if (e.CommandName == "msgDelete")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int qid = (int)grdmsg.DataKeys[row.RowIndex].Value;
                    int d = cmm.RunSP("PN18_MotQuote", "PRASARNETConnectionString", new SqlParameter("@qid", qid),
                                                  new SqlParameter("@flag", 2));
                    bindgrid(); 
                    if (d > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Deleted Successfully');", true);


                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }


            }
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grdmsg.AllowPaging = false;
            bindgrid();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdmsg.RenderControl(hw);
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
            grdmsg.AllowPaging = true;
            bindgrid();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grdmsg_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdmsg.PageIndex = e.NewPageIndex;
            bindgrid();
        }
        
    }
}