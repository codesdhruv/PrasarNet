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
    public partial class PoliciesUpload : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("Logout.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 27)
            {
                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    cmm.bindDDLWidParam(ddlpolicytype, "PN18_Policytyp", "PolicyType", "ptypid", "PRASARNETConnectionString", "-- policy type --", new SqlParameter("@flag", 1));
                    gridbind();
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void clear()
        {
            ddlpolicytype.SelectedIndex = 0;
            txttitle.Text = "";
            txtpolicyno.Text = "";
            txtdatedoc.Text = "";
            FileUpload1.Attributes.Clear();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            clear();
            divgrd.Visible = true;
        }
        private void gridbind()
        {

            ds = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@flag", "2"));
            grdpolicy.DataSource = ds;
            grdpolicy.DataBind();
        }

        protected void grdpolicy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdpolicy.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    DateTime? dated = null;
                    if (txtdatedoc.Text != "")
                        dated = DateTime.ParseExact(txtdatedoc.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                    filetype = filetype.ToLower();
                    //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                    string max = "";
                    if (btnupload.Text == "Upload")
                    {
                        max = cmm.SelectMaxId("select max(Policyid)+1 from PN18_Policy", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                    }
                    else
                    {
                        max = Convert.ToString(Session["policyid"]);
                        ds = cmm.RunSQLReturnDS("Select filenme from PN18_Policy where Policyid=" + Convert.ToInt64(Session["policyid"]), "PRASARNETConnectionString");
                        string docname1 = Convert.ToString(ds.Tables[0].Rows[0][0]);
                        string path1 = Server.MapPath("~/Policies/" + docname1);
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)
                        {
                            //file.Delete();
                        }
                    }
                    //string img = cmm.ReturnValue(str);
                    if (filetype == ".pdf")
                    {
                        string files = "";
                        FileUpload1.SaveAs(MapPath("~/Policies/" + FileUpload1.FileName.ToString()));
                        files = FileUpload1.FileName.ToString();
                        path = Server.MapPath("~") + "\\Policies\\";
                        string Fromfile = path + files;
                        string dtetm = ((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Trim();
                        string savefile = "pol" + max + "_" + dtetm + filetype;
                        string Tofile = path + savefile;
                        File.Move(Fromfile, Tofile);
                        int d;
                        if (btnupload.Text == "Upload")
                        {

                            d = cmm.RunSP("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@title", txttitle.Text.Trim()),
                                                                                       new SqlParameter("@typeid", Convert.ToInt32(ddlpolicytype.SelectedValue)),
                                                                                       new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                       new SqlParameter("@filename", savefile),
                                                                                       new SqlParameter("@policyno", txtpolicyno.Text.Trim()),
                                                                                       new SqlParameter("@dated", dated),
                                                                                       new SqlParameter("@flag", "1"));

                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Uploaded Successfully');", true);
                                clear();
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                        }
                        else
                        {
                            d = cmm.RunSP("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@title", txttitle.Text.Trim()),
                                                                                       new SqlParameter("@typeid", Convert.ToInt32(ddlpolicytype.SelectedValue)),
                                                                                       new SqlParameter("@createdby", Convert.ToString(Session["UserName"])),
                                                                                       new SqlParameter("@filename", savefile),
                                                                                       new SqlParameter("@policyno", txtpolicyno.Text.Trim()),
                                                                                       new SqlParameter("@dated", dated),
                                                                                       new SqlParameter("@policyid", Convert.ToInt64(Session["policyid"])),
                                                                                       new SqlParameter("@flag", "4"));
                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully');", true);
                                clear();
                                btnupload.Text = "Upload";
                                divgrd.Visible = true;
                            }
                            else
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the policy in pdf format !!!! Try Again!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Attach a file !!');", true);
            gridbind();
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdpolicy.AllowPaging = false;
                grdpolicy.Columns[2].Visible = false;

                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdpolicy.RenderControl(hw);
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
                grdpolicy.AllowPaging = true;
                grdpolicy.Columns[2].Visible = true;
                gridbind();
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grdpolicy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int policyid = (int)grdpolicy.DataKeys[row.RowIndex].Value;
                ds = cmm.RunSQLReturnDS("Select filenme from PN18_Policy where Policyid=" + policyid, "PRASARNETConnectionString");
                string filenme = Convert.ToString(ds.Tables[0].Rows[0][0]);
                string path = Server.MapPath("~/Policies/" + filenme);
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    file.Delete();
                    i = cmm.RunSP("PN18_Policyproc", "PRASARNETConnectionString",
                                                  new SqlParameter("@flag", "5"),
                                                  new SqlParameter("@policyid", policyid));
                }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Sucessfully!!');", true);
                    gridbind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
            if (e.CommandName == "Edit")
            {
                divgrd.Visible = false;
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int policyid = (int)grdpolicy.DataKeys[row.RowIndex].Value;
                Session["policyid"] = policyid;
                ds1 = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString", new SqlParameter("@policyid", policyid),
                                                                                       new SqlParameter("@flag", "3"));
                ddlpolicytype.SelectedValue = ds1.Tables[0].Rows[0][2].ToString();
                txttitle.Text = ds1.Tables[0].Rows[0][1].ToString();
                txtdatedoc.Text = ds1.Tables[0].Rows[0][8].ToString();
                txtpolicyno.Text = ds1.Tables[0].Rows[0][7].ToString();
                btnupload.Text = "Update";

            }
            if (e.CommandName == "Download")
            {
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int polid = (int)grdpolicy.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN18_Policyproc", "PRASARNETConnectionString",
                                                   new SqlParameter("@flag", "3"),
                                                   new SqlParameter("@policyid", polid));


                string paths = Server.MapPath("~/Policies/" + ds1.Tables[0].Rows[0][6].ToString());
                //Response.Redirect(paths);
                //if (ds1.Tables[0].Rows[0][0].ToString() != "")
                //{
                FileInfo file = new FileInfo(paths);
                //if (ds1.Tables[0].Rows.Count != 0)
                if (file.Exists)
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=DownloadPolicy.pdf");
                    Response.WriteFile(Server.MapPath("~/Policies/" + ds1.Tables[0].Rows[0][6].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no Policy to download!!');", true);

            }
        }

        protected void grdpolicy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdpolicy.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void grdpolicy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdpolicy_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

    }
}