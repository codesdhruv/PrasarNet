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
    public partial class CEOMessage : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 14 || Convert.ToInt32(Session["Usertype"]) == 15 || Convert.ToInt32(Session["Usertype"]) == 16)
            {
                if (!IsPostBack)
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
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    bindgrid();
                    DataSet dspbb = new DataSet();
                    dspbb = cmm.RunSpReturnDSParam("pn18_pbbreports_authorisation", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                  , new SqlParameter("@usertypeid", Convert.ToInt16(Session["Usertype"])));
                    if (dspbb.Tables[0].Rows.Count > 0)//adgadmin and CEO
                    {
                        divmeetingrecordadmin.Visible = true;
                    }
                    else
                    {
                        divmeetingrecordadmin.Visible = false;
                    }
                }

            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        public void bindgrid()
        {
            ds = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                                 new SqlParameter("@flag", 2));
            grdmsg.DataSource = ds;
            grdmsg.DataBind();
        }
        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            //if (FileUpload1.HasFile)
            //{
            try
            {
                int usertypeid = Convert.ToInt32(Session["Usertype"]);
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                string max;
                max = cmm.SelectMaxId("select max(msgid)+1 from PN18_CEOMessage", "PRASARNETConnectionString");
                if (max == "")
                {
                    max = "1";
                }

                if (FileUpload1.HasFile)
                {
                    if (filetype == ".pdf")
                    {
                        string files = "";
                        FileUpload1.SaveAs(MapPath("~/CEO_Docs/" + FileUpload1.FileName.ToString()));
                        files = FileUpload1.FileName.ToString();
                        path = Server.MapPath("~") + "\\CEO_Docs\\";
                        string Fromfile = path + files;
                        string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                        string savefile = max + "_" + dtetm + filetype;
                        string Tofile = path + savefile;
                        File.Move(Fromfile, Tofile);

                        int d = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msg", txtmsg.Text.Trim()),
                                                 new SqlParameter("@filename", savefile),
                                                 new SqlParameter("@usertypeid", usertypeid),
                                                 new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                 new SqlParameter("@flag", 1));

                        if (d > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Added Successfully');", true);

                        }
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Document in pdf format !!!! Try Again!!');", true);
                    }
                    bindgrid();
                    txtmsg.Text = "";
                    FileUpload1.Attributes.Clear();
                }
                else
                {
                    int d = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msg", txtmsg.Text.Trim()),
                                               new SqlParameter("@usertypeid", usertypeid),
                                               new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                               new SqlParameter("@flag", 1));

                    if (d > 0)
                    {
                    
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Added Successfully');", true);

                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    bindgrid();
                    txtmsg.Text = "";
                    FileUpload1.Attributes.Clear();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again or Contact with IT Team');", true);
            }
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txtmsg.Text = "";
            FileUpload1.Attributes.Clear();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

        protected void grdmsg_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Download")
            {
                try
                {
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int msgid = (int)grdmsg.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
                                                                                          new SqlParameter("@flag", 4));

                    string paths = "CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString();
                    //Response.Redirect(paths);
                    if (ds1.Tables[0].Rows[0][3].ToString() != "")
                    {
                        Response.Clear();
                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", "attachment; filename=Download.pdf");
                        Response.WriteFile(Server.MapPath("~/CEO_Docs/" + ds1.Tables[0].Rows[0][3].ToString()));
                        Response.End();
                        //Response.Write("<script>");
                        //Response.Write("window.open('" + paths + "','_blank')");
                        //Response.Write("</script>");
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
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
                    int i = 0;
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int msgid = (int)grdmsg.DataKeys[row.RowIndex].Value;

                    // No deletion of file because it is not deleted ..only deactivated

                    //ds = cmm.RunSQLReturnDS("Select filenme from PN18_CEOMessage where msgid=" + msgid, "PRASARNETConnectionString");
                    //string docname = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    //string path = Server.MapPath("~/CEO_Docs/" + docname);
                    //FileInfo file = new FileInfo(path);
                    //if (file.Exists)
                    //{
                    //    file.Delete();

                    //}
                    i = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
                                                                           new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                           new SqlParameter("@flag", 5));
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Deleted Sucessfully!!');", true);
                        bindgrid();
                        divgrd.Focus();
                        grdmsg.Focus();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
            }
            if (e.CommandName == "msgEdit")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int msgid = (int)grdmsg.DataKeys[row.RowIndex].Value;
                    ViewState["msgidedit"] = msgid;
                    CheckBox chkverify1 = (CheckBox)row.FindControl("chkverify1");
                    Label lblshwmsg = (Label)row.FindControl("lblshwmsg");
                    lblshwmsg.Visible = false;
                    ds = cmm.RunSpReturnDSParam("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
                                                                                          new SqlParameter("@flag", 4));
                    //ddlshow.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0][8]);
                    chkverify1.Visible = true;
                    LinkButton lnkedit = (LinkButton)row.FindControl("lnkedit");
                    LinkButton lnkdelete = (LinkButton)row.FindControl("lnkdelete");
                    LinkButton lnkupdate = (LinkButton)row.FindControl("lnkupdate");
                    LinkButton lnkcancel = (LinkButton)row.FindControl("lnkcancel");
                    lnkcancel.Visible = true;
                    lnkupdate.Visible = true;
                    lnkdelete.Visible = false;
                    lnkedit.Visible = false;
                    divgrd.Focus();
                    grdmsg.Focus();
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
                    int msgid = (int)grdmsg.DataKeys[row.RowIndex].Value;
                    CheckBox chkverify1 = (CheckBox)row.FindControl("chkverify1");
                    Label lblshwmsg = (Label)row.FindControl("lblshwmsg");
                    int chk;
                    if (chkverify1.Checked)
                    {
                        chk = 1;

                        //int j = 0;
                        //j = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                        //                                                       new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                        //                                                       new SqlParameter("@flag", 7));

                    }
                    else
                        chk = 0;

                    int i = 0;
                    i = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
                                                                           new SqlParameter("@showondashboard", chk),
                                                                           new SqlParameter("@usertypeid", Convert.ToInt32(Session["Usertype"])),
                                                                           new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                        new SqlParameter("@flag", 9));

                    if (i > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
                        bindgrid();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                }

                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
                bindgrid();
                divgrd.Focus();
                grdmsg.Focus();
                //lblshwmsg.Visible = true;
                //chkverify1.Visible = false;
            }
            if (e.CommandName == "msgcancel")
            {
                try
                {
                    grdmsg.EditIndex = -1;
                    bindgrid();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }

            }
        }

        protected void grdmsg_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataSet ds1 = new DataSet();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    LinkButton lnkedit = (LinkButton)e.Row.FindControl("lnkedit");
                    LinkButton lnkdelete = (LinkButton)e.Row.FindControl("lnkdelete");
                    Label lblshwmsg = (Label)e.Row.FindControl("lblshwmsg");

                    int msgid = Convert.ToInt32(grdmsg.DataKeys[e.Row.RowIndex].Values[0].ToString());

                    ds1 = cmm.RunSpReturnDSParam("pn18_ceo", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
                                                                                          new SqlParameter("@flag", 4));
                    if (Convert.ToBoolean(ds1.Tables[0].Rows[0][8]))
                    {
                        lblshwmsg.ForeColor = System.Drawing.Color.LimeGreen;
                        //lnkedit.Visible = false;
                        //lnkdelete.Visible = false;
                    }
                    else
                    {
                        lblshwmsg.ForeColor = System.Drawing.Color.Red;
                        //lnkedit.Visible = true;
                        //lnkdelete.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }

            }
        }

        protected void grdmsg_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
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
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
            }
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

        //protected void grdmsg_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{

        //    try
        //    {

        //        Label lblshwmsg = (Label)grdmsg.Rows[e.RowIndex].FindControl("lblshwmsg");
        //        CheckBox chkverify1 = (CheckBox)grdmsg.Rows[e.RowIndex].FindControl("chkverify1");


        //        int msgid = Convert.ToInt32(ViewState["msgidedit"]);

        //        int chk;
        //        if (chkverify1.Checked)
        //            chk = 1;
        //        else
        //            chk = 0;

        //        int i = 0;
        //        i = cmm.RunSP("PN18_CEO", "PRASARNETConnectionString", new SqlParameter("@msgid", msgid),
        //                                                               new SqlParameter("@showondashboard", chk),
        //                                                               new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
        //                                                                            new SqlParameter("@flag", 6));
        //        if (i > 0)
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Sucessfully!!');", true);
        //            bindgrid();
        //        }
        //        else
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
        //    }

        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
        //    }
        //    bindgrid();
        //    //lblshwmsg.Visible = true;
        //    //chkverify1.Visible = false;

        //}

        //protected void grdmsg_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        //{
        //    bindgrid();
        //}


    }
}