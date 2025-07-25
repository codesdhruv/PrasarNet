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
using System.Collections.Generic;
using System.Text;
using PEMS.BLL;

namespace WebApplication2
{

    public partial class usermanagement : System.Web.UI.Page
    {
        CommonClass cmm = new CommonClass();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["validloginflag"]) == 1 || Convert.ToInt32(Session["usertype"]) == 3)//Admin Login
            {
                if (!IsPostBack)
                {
                    divbtnuser.Visible = false;
                    bindgrid();
                    Label3.Text = Session["Name"].ToString();
                }
            }
            else
            {
                Response.Redirect("home.aspx");
            }

        }
        private void bindgrid()
        {
            ds = cmm.RunSpReturnDSParam("SP_registration", "con", new SqlParameter("@searchname", txtsearch.Text.Trim()),
                                                                  new SqlParameter("@radiocolonyid", Convert.ToInt32(Session["loginradiocolonyid"])),
                                                                  new SqlParameter("@flag", 3));
            grdusermanagement.DataSource = ds;
            grdusermanagement.DataBind();
        }

        protected void grdusermanagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                Label lblst = (Label)row.FindControl("lblst");
                ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");
                lblst.Visible = false;
                chk.Visible = true;
                imgedit.Visible = false;
                imgupdate.Visible = true;
                imgcancel.Visible = true;


            }
            if (e.CommandName == "print")
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                Label lblresid = (Label)row.FindControl("lblresid");
                Session["resid"] = lblresid.Text;
                Response.Redirect("UserProfile.aspx",false);
            }
                
            if (e.CommandName == "cancel")
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                Label rid = (Label)row.FindControl("lblresid");
                CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                Label lblst = (Label)row.FindControl("lblst");
                ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");
                lblst.Visible = true;
                chk.Visible = false;
                imgedit.Visible = true;
                imgupdate.Visible = false;
                imgcancel.Visible = false;
                bindgrid();
            }
            if (e.CommandName == "Download")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label rid = (Label)row.FindControl("lblresid");
                ds = cmm.RunSpReturnDSParam("SP_registration", "con", new SqlParameter("@rid", Convert.ToInt64(rid.Text)),
                                                            new SqlParameter("@flag", 5));
                if (ds.Tables[0].Rows.Count != 0)
                {
                    string paths = "~/Resident Documents/" + ds.Tables[0].Rows[0][0].ToString();

                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=Resident_Proof.pdf");
                    Response.WriteFile(paths);
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);


            }
            if (e.CommandName == "update")
            {
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                Label rid = (Label)row.FindControl("lblresid");
                CheckBox chk = (CheckBox)row.FindControl("chkstatus");
                Label lblst = (Label)row.FindControl("lblst");
                ImageButton imgedit = (ImageButton)row.FindControl("imgedit");
                ImageButton imgupdate = (ImageButton)row.FindControl("imgupdate");
                ImageButton imgcancel = (ImageButton)row.FindControl("imgcancel");
                Boolean b;
                if (chk.Checked)
                {
                    b = true;
                }
                else { b = false; }
                int i = 0;
                try
                {
                    i = cmm.RunSP("SP_registration", "con", new SqlParameter("@verifyuserflag", b),
                                                            new SqlParameter("@Userverifiedby", Convert.ToString(Session["user"])),
                                                            new SqlParameter("@rid", Convert.ToInt64(rid.Text)),
                                                            new SqlParameter("@flag", 4));
                }
                catch (Exception ex)
                {

                }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!')", true);
                    lblst.Visible = true;
                    chk.Visible = false;
                    imgedit.Visible = true;
                    imgupdate.Visible = false;
                    imgcancel.Visible = false;
                    bindgrid();
                }

            }
        }
        protected void grdusermanagement_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void grdusermanagement_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdusermanagement.EditIndex = -1;
            bindgrid();
        }
        protected void grdusermanagement_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void grdusermanagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdusermanagement.PageIndex = e.NewPageIndex;
            bindgrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            bindgrid();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepassword.aspx", true);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompliantStatus.aspx",true);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllComplaints.aspx", true);
        }
        protected void btnusermanage_Click(object sender, EventArgs e)
        {
            Response.Redirect("usermanagement.aspx", true);
        }

        protected void lnkaddofficial_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterOfficals.aspx", true);
        }
    }
}