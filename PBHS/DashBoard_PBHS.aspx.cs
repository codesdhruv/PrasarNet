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

namespace PrasarNet.PBHS
{
    public partial class DashBoard_PBHS : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        string cont = WebConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("../homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                if (!IsPostBack)
                {
                    ds = cmm.RunSpReturnDSParam("PN22_PBHS_Allow_EmpPBHS", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                                        new SqlParameter("@flag", 1));
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) == 1)
                        {
                            divnewapp_link.Visible = true;
                            Label1.Text = Convert.ToString(Session["UserName"]);
                            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                            {
                                empmenu.Visible = true;
                                StationSectionMenu.Visible = false;
                                AdminMenu.Visible = false;
                                gridbind();
                            }
                            else
                            {
                                empmenu.Visible = false;
                                StationSectionMenu.Visible = false;
                                AdminMenu.Visible = false;
                            }
                            DataSet dsblock = new DataSet();
                            dsblock = cmm.RunSpReturnDSParam("PN22_PBHS_Blockuser_new", "PRASARNETConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                                                                        new SqlParameter("@flag", 1));
                            int count = Convert.ToInt16(dsblock.Tables[0].Rows[0][0]);
                            if (count == 3 || count == 2|| count ==1  )
                            {
                                lnknewapplication.Visible = true;

                            }
                            
                            else
                            {
                                lnknewapplication.Visible = false;
                            }
                        }
                        else
                        {
                            divnewapp_link.Visible = false;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Only Employee, who joined On and After 2007 are allowed to avail the PBHS facility..'); window.open('../DashBoardNew.aspx','_self');", true);
                        }
                    }
                    else
                    {
                        divnewapp_link.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Only Employee, who joined On and After 2007 are allowed to avail the PBHS facility..'); window.open('../DashBoardNew.aspx','_self');", true);
                    }
                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        private void gridbind()
        {
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 1),
                                                                                        new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
            grdapplications.DataSource = ds;
            grdapplications.DataBind();
        }
        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/PBHS_Action.aspx", true);
        }

        protected void lnknewapplication_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/Apply_PBHS.aspx", true);
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                grdapplications.AllowPaging = false;
                gridbind();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdapplications.RenderControl(hw);
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
                ClientScript.RegisterStartupScript(this.GetType(), "Report Print", sb.ToString());
                grdapplications.AllowPaging = true;
                gridbind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error in Printing!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            gridbind();
        }
        private void bindapplicationTrack()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN22_PBHS_Track", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                                                                                                  , new SqlParameter("@basid", Convert.ToInt32(ViewState["basid_popup_track"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdtrack.DataSource = dsedu;
                grdtrack.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdtrack.DataSource = dsedu;
                grdtrack.DataBind();
                int columncount = grdtrack.Rows[0].Cells.Count;
                grdtrack.Rows[0].Cells.Clear();
                grdtrack.Rows[0].Cells.Add(new TableCell());
                grdtrack.Rows[0].Cells[0].ColumnSpan = columncount;
                grdtrack.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void grdapplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Trackinfo")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblappNo = row.FindControl("lblappNo") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup_track"] = lblbasicid.Text;
                    mpetrack.Show();
                    bindapplicationTrack();
                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName == "GetaPdf")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup"] = lblbasicid.Text;
                    mpe1.Show();
                    bindbasicinfo();
                    bindgrid_Family_prev();
                    bindgridupload_prev();
                }
                catch (Exception ex)
                {

                }
            }
        }
        private void bindgridupload_prev()
        {
            DataSet dsupload = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString"
                                                                        //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 9)
                                                                        , new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsupload.Tables[0].Rows.Count > 0)
            {
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
            }
            else
            {
                dsupload.Tables[0].Rows.Add(dsupload.Tables[0].NewRow());
                grdupload.DataSource = dsupload;
                grdupload.DataBind();
                int columncount = grdupload.Rows[0].Cells.Count;
                grdupload.Rows[0].Cells.Clear();
                grdupload.Rows[0].Cells.Add(new TableCell());
                grdupload.Rows[0].Cells[0].ColumnSpan = columncount;
                grdupload.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindgrid_Family_prev()
        {
            DataSet dsedu = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString"
                                                                        //, new SqlParameter("@employeeid", Convert.ToInt32(Session["empid"]))
                                                                        , new SqlParameter("@flag", 8)
                                                                        , new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            if (dsedu.Tables[0].Rows.Count > 0)
            {
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
            }
            else
            {
                dsedu.Tables[0].Rows.Add(dsedu.Tables[0].NewRow());
                grdhealth.DataSource = dsedu;
                grdhealth.DataBind();
                int columncount = grdhealth.Rows[0].Cells.Count;
                grdhealth.Rows[0].Cells.Clear();
                grdhealth.Rows[0].Cells.Add(new TableCell());
                grdhealth.Rows[0].Cells[0].ColumnSpan = columncount;
                grdhealth.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        private void bindbasicinfo()
        {
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 7),
                                                                                            new SqlParameter("@id", Convert.ToInt32(ViewState["basid_popup"])));
            lblname_bas.Text = ds.Tables[0].Rows[0][0].ToString();
            lbldeptt_bas.Text = ds.Tables[0].Rows[0][1].ToString();
            lbldesgn_bas.Text = ds.Tables[0].Rows[0][2].ToString();
            lblcontact_bas.Text = ds.Tables[0].Rows[0][3].ToString();
            lblemail_bas.Text = ds.Tables[0].Rows[0][4].ToString();
            lbldate_superannu_bas.Text = ds.Tables[0].Rows[0][5].ToString();
            lblrenew_bas.Text = ds.Tables[0].Rows[0][6].ToString();

            lblrenew_no.Text = ds.Tables[0].Rows[0][7].ToString();
            lblgazetted.Text = ds.Tables[0].Rows[0][8].ToString();
            lblbasiclbl.Text = ds.Tables[0].Rows[0][9].ToString();

            lbllevelLBL.Text = ds.Tables[0].Rows[0][10].ToString();
            lblOfficialAdd.Text = ds.Tables[0].Rows[0][11].ToString();
            lblresAdd_Lbl.Text = ds.Tables[0].Rows[0][12].ToString();

            lblOnDep.Text = ds.Tables[0].Rows[0][13].ToString();
            lbldep_LBL.Text = ds.Tables[0].Rows[0][14].ToString();
            lbltransfer_lbl.Text = ds.Tables[0].Rows[0][15].ToString();

            lblapplforwared_bas.Text = ds.Tables[0].Rows[0][16].ToString();
            lblresidingwithme.Text = ds.Tables[0].Rows[0][17].ToString();
            lblapprovemsg2.Text = ds.Tables[0].Rows[0][18].ToString();
        }
        protected void grdhealth_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloadresiding"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    int id = (int)grdhealth.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_Family", "PRASARNETConnectionString", new SqlParameter("@flag", "5"),
                                                                                                 new SqlParameter("@id", id));

                    string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);

                    string paths1 = urlfixedpath + docname;
                    FileInfo file = new FileInfo(paths1);
                    if (file.Exists)
                    {
                        string paths = urlfixedpath + docname;
                        ViewState["pathLO"] = paths;
                        string str = ds1.Tables[0].Rows[0][1].ToString();
                        string substr = str.Substring(str.Length - 3).ToLower();
                        if (substr == "pdf")
                        {
                            if (ds1.Tables[0].Rows[0][1].ToString() != "")
                            {
                                Response.Clear();
                                Response.ContentType = "application/octet-stream";
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                                Response.WriteFile(paths);
                                Response.End();
                            }
                            else
                            {
                                bindgrid_Family_prev();
                                //Label59.Text = "There is no document to download!!";
                            }
                            grdhealth.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        bindgrid_Family_prev();
                        // Label59.Text = "There is no document to download!!";
                        grdhealth.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {
                    bindgrid_Family_prev();
                    //  Label59.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdhealth.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
        }
        protected void grdupload_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloaddoc"))
            {
                //try
                //{
                string urlfixedpath = Server.MapPath("~/PBHS/Documents/");
                DataSet ds1 = new DataSet();
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                int id = (int)grdupload.DataKeys[row.RowIndex].Value;
                ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@flag", "4"),
                                                                                                new SqlParameter("@id", id));

                string docname = Convert.ToString(ds1.Tables[0].Rows[0][1]);
                string paths1 = urlfixedpath + docname;
                FileInfo file = new FileInfo(paths1);
                if (file.Exists)
                {
                    string paths = urlfixedpath + docname;
                    ViewState["pathLO"] = paths;
                    string str = ds1.Tables[0].Rows[0][1].ToString();
                    string substr = str.Substring(str.Length - 3).ToLower();
                    if (substr == "pdf")
                    {
                        if (ds1.Tables[0].Rows[0][1].ToString() != "")
                        {
                            Response.Clear();
                            Response.ContentType = "application/octet-stream";
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + ds1.Tables[0].Rows[0][1].ToString());
                            Response.WriteFile(paths);
                            Response.End();
                        }
                        else
                        {
                            bindgridupload_prev();
                            //Label22.Text = "There is no document to download!!";
                        }
                        grdupload.Focus();
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }

                }
                else
                {
                    bindgridupload_prev();
                    // Label22.Text = "There is no document to download!!";
                    grdupload.Focus();
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                }
                //}
                //catch (Exception ex)
                //{
                //    bindgridupload_prev();
                //    // Label22.Text = "Some Issue occured while downloading a document.Try Again!!";
                //    grdupload.Focus();
                //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                //}
            }
        }

        protected void grdapplications_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkapplicationstatus = (LinkButton)e.Row.FindControl("lnkapplicationstatus");
                Label lnkstatus = (Label)e.Row.FindControl("lnkstatus");
                LinkButton lnktrack = (LinkButton)e.Row.FindControl("lnktrack");
                LinkButton lnkviewapplication = (LinkButton)e.Row.FindControl("lnkviewapplication");
                Label lblstatusid = (Label)e.Row.FindControl("lblstatusid");
                Label lblfinalsubmitid = (Label)e.Row.FindControl("lblfinalsubmitid");

                //Boolean lblfinalsubmit = false;
                //if (lblfinalsubmitid.Text != "")
                //    lblfinalsubmit = Convert.ToBoolean(lblfinalsubmitid.Text);
                int id = Convert.ToInt32(grdapplications.DataKeys[e.Row.RowIndex].Values[0]);

                //lnkapplicationstatus.CssClass = "pending";
                lnktrack.Visible = true;
                lnkviewapplication.Visible = true;
                if (lblstatusid.Text == "2")//Pending
                {
                    lnkstatus.CssClass = "inprocess";
                }


            }
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg3.Visible = true;
                lblmsg3.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                panelprint.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'")
                    .Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                //sb.Append("printWin.document.title = newTitle");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "Application", sb.ToString());
                divmsg3.Visible = false;
                lblmsg3.Text = "";
                mpe1.Show();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
                mpe1.Show();
            }
        }
    }
}