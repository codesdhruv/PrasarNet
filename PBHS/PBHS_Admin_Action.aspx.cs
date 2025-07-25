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
    public partial class PBHS_Admin_Action : System.Web.UI.Page
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
            else if (Session["Station_SectionID"].ToString() == "23")
            {
                btncertify.Attributes.Add("onclick", " this.disabled = true; " + ClientScript.GetPostBackEventReference(btncertify, null) + ";");
                btncertify2.Attributes.Add("onclick", " this.disabled = true; " + ClientScript.GetPostBackEventReference(btncertify2, null) + ";");
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                if (!IsPostBack)
                {
                    using (SqlConnection conn = new SqlConnection(cont))
                    {
                        using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@flag", "1");
                            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                            {
                                DataSet ds = new DataSet();
                                adap.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {

                                    ddlwingfilter.DataSource = ds;
                                    ddlwingfilter.DataValueField = "wingid";
                                    ddlwingfilter.DataTextField = "wing";
                                    ddlwingfilter.DataBind();
                                    ddlwingfilter.Items.Insert(0, new ListItem("Select Wing", ""));
                                }

                            }
                        }
                    }
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        gridbind();
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 ||
                     Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 ||
                     Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 ||
                     Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)
                    {
                        gridbind();
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24) //Station
                        {
                            DataSet dsccw = new DataSet();
                            dsccw = cmm.RunSpReturnDSParam("PN18_CCW_Offices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "1"));

                            ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                       new SqlParameter("@flag", 1));
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)// Sections
                        {
                            divmonthlystationreports.Visible = false;
                            divmonthlystationreportsforadg.Visible = false;

                            ds = cmm.RunSpReturnDSParam("PN18_DDO", "PRASARNETConnectionString", new SqlParameter("@secid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                      new SqlParameter("@flag", 4));
                        }

                    }
                    else
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 28)
                        {
                            divstatementsmanagement.Visible = true;
                            //divRRReports_UM.Visible = true;
                        }
                        else
                        {
                            divstatementsmanagement.Visible = true;
                            // divRRReports_UM.Visible = false;
                        }

                    }

                }
                //---- No of Actions are Pending---//
                int offc_empid = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 10)
                {
                    offc_empid = Convert.ToInt32(Session["empid"]);
                }
                else
                {
                    offc_empid = Convert.ToInt32(Session["Station_SectionID"]);
                }
            }

            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }
        private void gridbind()
        {
            int offc_empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                offc_empid = Convert.ToInt32(Session["empid"]);
            }
            else
            {
                offc_empid = Convert.ToInt32(Session["Station_SectionID"]);
            }
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                                                                                          new SqlParameter("@dealingOffc", offc_empid),
                                                                                          new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
            grdapplications.DataSource = ds;
            grdapplications.DataBind();
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx", true);
        }

        protected void ddlwingfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlwingfilter.SelectedIndex != 0)
                {
                    using (SqlConnection conn = new SqlConnection(cont))
                    {
                        using (SqlCommand cmd = new SqlCommand("PN21_Trans_TPosting", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@flag", "2");
                            cmd.Parameters.AddWithValue("@wingid", ddlwingfilter.SelectedValue.ToString());
                            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                            {
                                DataSet ds = new DataSet();
                                adap.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {

                                    ddldesignationfilter.DataSource = ds;
                                    ddldesignationfilter.DataValueField = "DesignationID";
                                    ddldesignationfilter.DataTextField = "DesignationName";
                                    ddldesignationfilter.DataBind();
                                    ddldesignationfilter.Items.Insert(0, new ListItem("Select Designation", ""));
                                }

                            }
                        }
                    }
                    ddldesignationfilter.Focus();
                }
                else
                {
                    ddldesignationfilter.ClearSelection();
                    ddldesignationfilter.Items.Clear();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnUpdateBasic_Click(object sender, EventArgs e)
        {
            string empname = null, mobile = null, email = null, appstatus=null;
            DateTime? from = null;
            DateTime? to = null;
         
            if (txtdatefrom.Text != "")
            {
                from = DateTime.ParseExact(txtdatefrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            if (txtdateto.Text != "")
            {
                to = DateTime.ParseExact(txtdateto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }

            if (txtnamefilter.Text != "")
            {
                empname = txtnamefilter.Text.Trim();
            }

            if (txtmobfilter.Text != "")
            {
                mobile = txtmobfilter.Text.Trim();
            }

            if (txtemailfilter.Text != "")
            {
                email = txtemailfilter.Text.Trim();
            }

            string desgn = null;
            int app_empid = 0, wingid = 0, appstatusid = 0;

            if (ddlwingfilter.SelectedIndex != 0)
            {
                wingid = Convert.ToInt16(ddlwingfilter.SelectedValue);
                if (ddldesignationfilter.SelectedIndex != 0)
                {
                    desgn = Convert.ToString(ddldesignationfilter.SelectedItem.Text);
                }
            }
            if (ddlstatusfilter.SelectedIndex != 0)
            {
                appstatusid = Convert.ToInt16(ddlstatusfilter.SelectedValue);
                if (ddlstatusfilter.SelectedIndex != 0)
                {
                    appstatus = Convert.ToString(ddlstatusfilter.SelectedItem.Text);
                }
            }
            
            if (txtempcodefilter.Text != "")
            {
                DataSet dsempid = new DataSet();
                dsempid = cmm.RunSpReturnDSParam("PN21_Trans_SearchByName_EmpCode", "PRASARNETConnectionString", new SqlParameter("@flag", 2)
                                                                                                             , new SqlParameter("@prefixtext", Convert.ToInt32(txtempcodefilter.Text.Trim())));
                app_empid = Convert.ToInt32(dsempid.Tables[0].Rows[0][0]);
            }

            int offc_empid = 0;//empid of login user
            if (Convert.ToInt16(Session["Usertype"]) == 10)
            {
                offc_empid = Convert.ToInt32(Session["empid"]);
            }
            else
            {
                offc_empid = Convert.ToInt32(Session["Station_SectionID"]);
            }
            ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 3),
                                                                                          new SqlParameter("@empname", empname),
                                                                                          new SqlParameter("@empmob", mobile),
                                                                                           new SqlParameter("@status", appstatusid),
                                                                                          new SqlParameter("@empdegn", desgn),
                                                                                          new SqlParameter("@Employeeid", app_empid),
                                                                                          new SqlParameter("@datefrom", from),
                                                                                          new SqlParameter("@dateto", to),
                                                                                          new SqlParameter("@empemail", email),
                                                                                          new SqlParameter("@wingid", wingid),
                                                                                          new SqlParameter("@dealingOffc", offc_empid),
                                                                                          new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
            grdapplications.DataSource = ds;
            grdapplications.DataBind();
            grdapplications.Focus();
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

        protected void lnkFilterrec_Click(object sender, EventArgs e)
        {
            divfilterrec.Visible = true;
            ddlwingfilter.Focus();
        }

        protected void grdapplications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdapplications.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void grdapplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            divfilterrec.Visible = false;
            if (e.CommandName == "takeaction")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblbasicid = row.FindControl("lblbasicid") as Label;
                Label lblappNo = row.FindControl("lblappNo") as Label;
                Label lblempemail = row.FindControl("Label18") as Label;
                Label lblsubmittedon = row.FindControl("Label50") as Label;
                Label lblempname = row.FindControl("lblop1") as Label;
                Label lblempdesgn = row.FindControl("lblop2") as Label;

                Label lblserialno = row.FindControl("lblserialno") as Label;
                Label lblcertify = row.FindControl("lblcertify") as Label;

                Label lblempstn_offc = row.FindControl("lblop3") as Label;
                Label lblempmob = row.FindControl("Label21") as Label;

                Boolean iscertify = false;
                if (Convert.ToBoolean(lblcertify.Text))
                    iscertify = Convert.ToBoolean(lblcertify.Text);
                //if (Convert.ToInt16(lblserialno.Text) >= 3)
                //{
                if (!iscertify)
                {
                    CheckBoxList1.Items.FindByValue("3").Enabled = false;

                }
                else
                {
                    CheckBoxList1.Items.FindByValue("3").Enabled = true;
                }
                //}

                int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                ViewState["AppNo_action_"] = lblappNo.Text;
                ViewState["subOn_action"] = lblsubmittedon.Text;
                ViewState["EmpName_action_"] = lblempname.Text;
                ViewState["empdesgn_action"] = lblempdesgn.Text;
                ViewState["empstn_action_"] = lblempstn_offc.Text;
                ViewState["empmob_action"] = lblempmob.Text;

                ViewState["basicid_action_"] = lblbasicid.Text;
                ViewState["empemail_"] = lblempemail.Text;
                ViewState["trnid_action"] = trnid;
                //Resolved panel
                divresorfor.Visible = true;
                CheckBoxList1.Focus();
                //-----
                lbltrackApp.Text = lblappNo.Text;
                ViewState["EmpName_Action"] = lblempname.Text;
                ViewState["EmpDsg_Action"] = lblempdesgn.Text;
                ViewState["EmpMob_Action"] = lblempmob.Text;
                ViewState["EmpEMail_Action"] = lblempemail.Text;
            }
            if (e.CommandName == "Trackinfo")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblappNo = row.FindControl("lblappNo") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label55.Text = lblappNo.Text;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup_track"] = lblbasicid.Text;
                    mpetrack.Show();
                    bindapplicationTrack();

                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName == "Approve")
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    Label lblempname = row.FindControl("lblop1") as Label;
                    Label lblappN = row.FindControl("lblappNo") as Label;
                    int trnid = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_approve"] = lblbasicid.Text;
                    ViewState["trnid_approve"] = trnid;
                    Label46.Text = lblappN.Text;
                    lblnamecertify.Text = lblempname.Text.Trim();
                    cmm.bindDDLWidParam(ddlcerfwdto, "PN22_PBHS_CerFwdTo", "secname", "idstring", "PRASARNETConnectionString", " --Select-- ", new SqlParameter("@flag", 1));
                    ddlcerfwdto.Focus();
                    mpeapprove.Show();

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
                    Label lblempname = row.FindControl("lblop1") as Label;
                    Label lblbasicid = row.FindControl("lblbasicid") as Label;
                    ViewState["basid_popup"] = lblbasicid.Text;
                    ViewState["trnid_popup"] = trnid;
                    lblnamepopupPDF.Text = lblempname.Text.Trim();

                   cmm.bindDDLWidParamwithoutselect(ddlcertify_fwdto_view, "PN22_PBHS_CerFwdTo", "secname", "idstring", "PRASARNETConnectionString",  new SqlParameter("@flag", 1));

                    mpe1.Show();
                    bindbasicinfo();
                    bindgrid_Family_prev();
                    bindgridupload_prev();
                    
                }
                catch (Exception ex)
                {

                }
            }
            if (e.CommandName.Equals("downloaddoc"))
            {
                try
                {
                    string urlfixedpath = Server.MapPath("~/PBHS/Action_Docs/");
                    DataSet ds1 = new DataSet();
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int id = (int)grdapplications.DataKeys[row.RowIndex].Value;
                    ds1 = cmm.RunSpReturnDSParam("PN22_PBHS_UploadSP", "PRASARNETConnectionString", new SqlParameter("@flag", "6"),
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

                                //Label22.Text = "There is no document to download!!";
                            }
                            grdapplications.Focus();
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                        }

                    }
                    else
                    {
                        gridbind();

                        // Label22.Text = "There is no document to download!!";
                        grdapplications.Focus();
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no document to download!!');", true);
                    }
                }
                catch (Exception ex)
                {

                    // Label22.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdapplications.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
        }
        public void clearform()
        {

            txtEmailres.Text = "";
            txtccresto.Text = "";
            CheckBoxList1.ClearSelection();
            txtremarksres.Text = "";
            
            txtccresto.Text = "";
            //ddlrequestaccepted.ClearSelection();
            //rblwing.ClearSelection();
            //ddlwing.ClearSelection();
            //ddldesgn.ClearSelection();
            //txtordernum.Text = "";
            //txtorderdate.Text = "";
            //ddlorg.ClearSelection();
            //rborg.ClearSelection();
            //ddlstn.ClearSelection();
            //ddlvipref.ClearSelection();
            //RadioButtonList1.ClearSelection();
            //DropDownList1.ClearSelection();
            //RadioButtonList2.ClearSelection();
            //RadioButtonList2.ClearSelection();
            //txtVIPName.Text = "";
            txtremarksres.Text = "";

            //txtappforwarded.Text = "";
            txtemailforwarded.Text = "";
            txtcc.Text = "";
            txtremarksforward.Text = "";
        }
        protected void btncertify2_Click(object sender, EventArgs e)
        {
            try
            {
                
                    string sec_stn = ddlcertify_fwdto_view.SelectedValue.ToString();
                    string[] arr = sec_stn.Split(',');
                    int usertypeid = Convert.ToInt32(arr[1]), section_stationid = Convert.ToInt32(arr[0]);//Welfare section DGAIR

                    int basicid = Convert.ToInt32(ViewState["basid_popup"]);
                    int trnid = Convert.ToInt32(ViewState["trnid_popup"]);
                    string remarks = "Approved by Welfare with remarks ::  " + txtrmk2.Text.Trim();//, email = "";

                    string ip = cmm.GetIp_Priyank();//



                    int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString",  new SqlParameter("@Ipfromactiontaken", ip)
                                                                                               //, new SqlParameter("@approvedbyUsrTypID", 10)
                                                                                               
                                                                                               , new SqlParameter("@flag", 18)
                                                                                               , new SqlParameter("@trnid", trnid)
                                                                                               , new SqlParameter("@remarks", remarks )
                                                                                               , new SqlParameter("@fwdtoUserTypeId", usertypeid)
                                                                                               , new SqlParameter("@fwdtooffcid", section_stationid)
                                                                                               //, new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                               //, new SqlParameter("@ccmail", txtcc.Text.Trim())
                                                                                               , new SqlParameter("@appId", basicid));
                    if (i > 0)
                    {
                        gridbind();
                        divapprovebtn2.Visible = false;
                        divapprovemsg2.Visible = true;
                        divrmk_approve2.Visible = false;
                        lblapprovemsg2.Text = "approved by welfare";
                        lblrmkapprove2.Text = txtrmk2.Text.Trim();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('approval Done by welfare..');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }
              
            }
            catch (Exception ex)
            {
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
            }

            mpe1.Show();
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
            lblapprovemsg2welfare.Text = ds.Tables[0].Rows[0][18].ToString();

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
        protected void btncertify_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlcerfwdto.SelectedIndex != 0)
                {
                    string sec_stn = ddlcerfwdto.SelectedValue.ToString();
                    string[] arr = sec_stn.Split(',');

                    int usertypeid = Convert.ToInt32(arr[1]), section_stationid = Convert.ToInt32(arr[0]);//Welfare section DGAIR
                    int basicid = Convert.ToInt32(ViewState["basid_approve"]);
                    int trnid = Convert.ToInt32(ViewState["trnid_approve"]);
                    string remarks = "Certified";//, email = "";

                    string ip = cmm.GetIp_Priyank();//

                    int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@approvedbyid", Convert.ToInt32(Session["empid"]))
                                                                                               , new SqlParameter("@Ipfromactiontaken", ip)
                                                                                               , new SqlParameter("@approvedbyUsrTypID", 10)
                                                                                               , new SqlParameter("@HOO_rmk_certify", txtremarks_approve.Text.Trim())
                                                                                               , new SqlParameter("@flag", 5)
                                                                                               , new SqlParameter("@trnid", trnid)
                                                                                               , new SqlParameter("@remarks", remarks)
                                                                                               , new SqlParameter("@fwdtoUserTypeId", usertypeid)
                                                                                               , new SqlParameter("@fwdtooffcid", section_stationid)
                                                                                               //, new SqlParameter("@emailidsend", txtemailforwarded.Text.Trim())
                                                                                               //, new SqlParameter("@ccmail", txtcc.Text.Trim())
                                                                                               , new SqlParameter("@appId", Convert.ToInt32(ViewState["basid_approve"])));
                    if (i > 0)
                    {
                        //ds = cmm.RunSpReturnDSParam("PN22_PBHS_certifyrights_det", "PRASARNETConnectionString", new SqlParameter("@flag", 1)
                        //                                                                       , new SqlParameter("@stnid", section_stationid)
                        //                                                                       , new SqlParameter("@utid", usertypeid));
                        //string Subofemail="", bodyofemail="";
                        //if (ds.Tables[0].Rows[0][1].ToString() != "")
                        //{
                        //    Subofemail = "Recieved a new PBHS Card Request of" + nameofapp + " having Reference Id " + referenceappNo;

                        //    bodyofemail += "The details of received application are given below: <br /> <br />";
                        //    bodyofemail += "<b>1. Application Reference ID: <b>";
                        //    bodyofemail += referenceappNo + "<br /><br />";
                        //    bodyofemail += "2. Application Received On: ";
                        //    bodyofemail += app_RegdOn + "<br /><br />";
                        //    bodyofemail += "3. Forwarded By: ";
                        //    bodyofemail += Convert.ToString(Session["UserName"]) + "-" + Session["DesignationName_login"].ToString() + "<br /><br />";
                        //    bodyofemail += "4. Remarks/Comments given by forwarding officer while forwarding this Application: ";
                        //    bodyofemail += remarks + "<br /><br />";
                        //    bodyofemail += "5. Name of the Applicant: ";
                        //    bodyofemail += nameofapp + "<br /><br />";
                        //    bodyofemail += "6. Email of the Applicant: ";
                        //    bodyofemail += emailofapp + "<br /><br />";
                        //    bodyofemail += "7. Mobile No. of the Applicant: ";
                        //    bodyofemail += mobnoofapp + "<br /><br />";
                        //    bodyofemail += "8. Present place of posting of the Applicant: ";
                        //    bodyofemail += StationofEmployee + "<br /><br />";
                        //    bodyofemail += "Kindly login into PrasarNet to take a necessary action." + "<br />";
                        //    bodyofemail += "If you have any query then you may write to Forwarding Officer at " + ViewState["actionOfficer_Email"].ToString() + ", mentioning the transfer application reference id: "
                        //                + referenceappNo + " in a subject.";
                        //    bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                        //}

                        //if (txtemailforwarded.Text != "")
                        //{
                        //    sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, "");
                        //}

                        //if (mobilefwdofficer != "")
                        //{
                        //    //A new {#var#} {#var#} has been received, with Application RefID {#var#}.Kindly login into {#var#} for necessary actions.Prasar Bharati
                        //    string msgsend = "A new PBHSCard request has been received, with Application RefID " + referenceappNo + ".Kindly login into PrasarNet for necessary actions.Prasar Bharati";
                        //    Boolean re2t = cmm.sendMobileOTP1(mobilefwdofficer, "", msgsend);
                        //}

                        gridbind();
                        divapprovebtn.Visible = false;
                        divapprovemsg.Visible = true;
                        divrmk_approve.Visible = false;
                        lblapprovemsg.Text = "Ceritified";
                        lblrmkapprove.Text = txtremarks_approve.Text.Trim();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Cerification Done..');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
                    }
                }
                else
                {
                    ddlcerfwdto.Focus();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error occured.Try Again!!');", true);
            }
            mpeapprove.Show();
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
                // LinkButton lnkapproved = (LinkButton)e.Row.FindControl("lnkapproved");
                Label lblbasicid = (Label)e.Row.FindControl("lblbasicid");

                Label lblserialno = (Label)e.Row.FindControl("lblserialno");
                Label lblcertify = (Label)e.Row.FindControl("lblcertify");
                Label lblcertifymsg = (Label)e.Row.FindControl("lblcertifymsg");
                LinkButton lnkaction = (LinkButton)e.Row.FindControl("lnkaction");
                Label lblaction1 = (Label)e.Row.FindControl("lblaction1");

                Boolean iscertify = false;
                Boolean iscardissue = false;

                if (Convert.ToBoolean(lblcertify.Text))
                    iscertify = Convert.ToBoolean(lblcertify.Text);
                if (lblaction1.Text == "True")
                {
                    iscardissue = true;

                }
                else
                {
                    iscardissue = false;
                }
                //if (Convert.ToInt16(lblserialno.Text) >= 25)
                //{
                if (iscardissue)
                {
                    lnkaction.Visible = false;
                    lblaction1.Text = "Card has been issued to the User";
                    lblaction1.ForeColor = System.Drawing.Color.Green;

                }
                else
                {

                    if (iscertify)
                    {
                        lnkaction.Visible = true;
                        lblcertifymsg.Text = "* Actions by welfare section are allowed after the verification of the Applicant's Information by the HOO.";
                    }
                    else
                    {
                        lnkaction.Visible = false;
                        lblcertifymsg.Text = "* Approve/Certify details  by HOO/Admin in mandatory .";
                    }
                }
                //}
                //else if (Convert.ToInt16(lblserialno.Text) == 1 || Convert.ToInt16(lblserialno.Text) == 2)
                //{
                //    if (iscertify)
                //    {
                //        lnkaction.Visible = true;
                //        lblcertifymsg.Text = "* Actions by Welfare section are  allowed after the verification of the Applicant's Information.";
                //    }
                //    else
                //    {
                //        lnkaction.Visible = false;
                //        lblcertifymsg.Text = "* Approve/Certify details are mandatory for HOO/Admin";
                //    }
                //}
                //else
                //{
                //    lnkaction.Visible = false;
                //    lblcertifymsg.Text = "* Actions are not allowed after the verification of the Applicant's Information.";
                //}

                Boolean lblfinalsubmit = false;
                if (lblfinalsubmitid.Text != "")
                    lblfinalsubmit = Convert.ToBoolean(lblfinalsubmitid.Text);
                int id = Convert.ToInt32(grdapplications.DataKeys[e.Row.RowIndex].Values[0]);//trnid
                ds = cmm.RunSpReturnDSParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 6)
                                                                                                 , new SqlParameter("@appid", Convert.ToInt32(lblbasicid.Text)));

                Boolean isapprove = false;
                if (Convert.ToBoolean(ds.Tables[0].Rows[0][0]))
                {
                    isapprove = Convert.ToBoolean(ds.Tables[0].Rows[0][0]);
                }

                if (isapprove)
                {
                    ////lnkapproved.ForeColor = System.Drawing.Color.Green;
                    //lnkapproved.Text = "Certified by " + ds.Tables[0].Rows[0][1].ToString();
                    divapprovebtn.Visible = false;
                    divrmk_approve.Visible = false;
                    divapprovemsg.Visible = true;
                    lblapprovemsg.Text = "Certified by " + ds.Tables[0].Rows[0][1].ToString();
                    lblrmkapprove.Text = ds.Tables[0].Rows[0][2].ToString();
                }
                else
                {
                    //lnkapproved.ForeColor = System.Drawing.Color.Blue;
                    //lnkapproved.Text = "Approve/Certify";
                    divapprovebtn.Visible = true;
                    divrmk_approve.Visible = true;
                    divapprovemsg.Visible = false;
                    lblapprovemsg.Text = "";
                    lblrmkapprove.Text = "";
                }


            }
        }
        private int uploaddoc(FileUpload FileUpload1, string foldername, Label lblResultUpload)
        {
            try
            {
                string path = "";
                string filetype = "";
                filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                filetype = filetype.ToLower();
                //string max = "";
                //max = cmm.SelectMaxId("select isnull(max(id),0)+1 from PN21_Trans_Documents", "JobAppConnectionString");
                if (filetype == ".pdf")
                {
                    string files = "";

                    files = FileUpload1.FileName.ToString();
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        System.IO.Stream fs;
                        fs = FileUpload1.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        //if ((lastline.IndexOf("%PDF") > -1))
                        //{
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize > 363520)//355kB
                        {
                            lblResultUpload.Text = "Maximum file size(350kbB) exceeded..";
                            return 0;
                        }
                        else
                        {
                            FileUpload1.SaveAs(MapPath("~/PBHS/" + foldername + "/" + FileUpload1.FileName.ToString()));
                            path = Server.MapPath("~") + "PBHS\\" + foldername + "\\";
                            string Fromfile = path + files;
                            string dtetm = (((Convert.ToString(DateTime.Now).Replace('/', 'o')).Replace(':', 'o')).Replace(' ', '_')).Trim();

                            string savefile = "";

                            savefile = "FwdPBHS_" + Convert.ToString(Session["empid"]) + "_" + dtetm + filetype;

                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            ViewState["filename"] = savefile;
                            return 1;
                        }

                    }
                    else
                    {

                        lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                        return 0;
                    }

                }
                else
                {
                    lblResultUpload.Text = "Only,pdf file are allowed to upload!!";
                    return 0;
                }
            }
            catch (Exception ex)
            {
                lblResultUpload.Text = "Error Occured while Uploading a Document!!";
                return 0;

            }
        }
        private int sendEmailforward(string appsub, string empEmail, string ccemail, string body, string docname)
        {
            try
            {
                string urlfixedpath = Server.MapPath("~/PBHS/Action_Docs");
                string paths1 = "";
                int w = 0;
                SmtpClient _smtpClient;
                System.Net.Configuration.SmtpSection section = (System.Net.Configuration.SmtpSection)ConfigurationManager.GetSection("mailSettings/smtp_hrispb");
                _smtpClient = new SmtpClient();

                if (section != null)
                {
                    if (section.Network != null)
                    {
                        _smtpClient.Host = section.Network.Host;
                        _smtpClient.Port = section.Network.Port;
                        //  _smtpClient.UseDefaultCredentials = section.Network.DefaultCredentials;
                        _smtpClient.Credentials = new NetworkCredential(section.Network.UserName, section.Network.Password, section.Network.ClientDomain);
                        _smtpClient.EnableSsl = section.Network.EnableSsl;

                        if (section.Network.TargetName != null)
                            _smtpClient.TargetName = section.Network.TargetName;
                    }

                    _smtpClient.DeliveryMethod = section.DeliveryMethod;
                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(section.Network.UserName);

                    if (docname != "")
                    {
                        paths1 = urlfixedpath + docname;
                        FileInfo file = new FileInfo(paths1);
                        if (file.Exists)
                        {
                            var attachment = new System.Net.Mail.Attachment(paths1);
                            message.Attachments.Add(attachment);
                            body = "<br /> Please, find an attachment.";
                        }
                    }
                    message.To.Add(empEmail);
                    if (ccemail != "")
                    {
                        string[] CCId = ccemail.Split(',');
                        foreach (string CCEmail in CCId)
                        {
                            message.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                        }
                    }
                    message.Subject = appsub;
                    message.Body = body;
                    message.IsBodyHtml = true;

                    _smtpClient.Send(message);
                    w = 1;
                    return w;
                }

                return w;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        protected void btnfwd_Click(object sender, EventArgs e)
        {
            try
            {
                lblfwdresult.Text = "";
                string ipaddress2 = cmm.GetIp_Priyank();
                int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                string filename = Convert.ToString(ViewState["filename"]);
                string remarks = txtremarksforward.Text;
                string emailofapp = ViewState["empemail_"].ToString();
                string nameofapp = ViewState["EmpName_action_"].ToString();
                string degnEmp = ViewState["empdesgn_action"].ToString();

                string mobnoofapp = ViewState["empmob_action"].ToString();
                string referenceappNo = ViewState["AppNo_action_"].ToString();

                string app_RegdOn = ViewState["subOn_action"].ToString();
                string StationofEmployee = ViewState["empstn_action_"].ToString();

                string Subofemail = "";
                string bodyofemail = "";
                if (txtemailforwarded.Text != "")
                {
                    Subofemail = " PBHS Card Request of" + nameofapp + " having Reference Id " + referenceappNo;

                    bodyofemail = " PBHS Card Request of" + nameofapp + " having Reference Id " + referenceappNo + "has been issued";

                }

                if (FileUpload2.HasFile)
                {
                    int ret = uploaddoc(FileUpload2, "Action_Docs", lblfwdresult);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {

                        int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 17)
                                                                                 , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                  , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                  , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                  , new SqlParameter("@trnid", trnid)
                                                                                    , new SqlParameter("@filename", filename)
                                                                                  , new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                  , new SqlParameter("@dealingOffc", Convert.ToInt16(Session["Station_SectionID"]))
                                                                                  , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                  , new SqlParameter("@appid", basicid));
                        if (i > 0)
                        {
                            if (txtemailforwarded.Text != "")
                            {
                                sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, "");//emsil sent commented
                            }



                            divresorfor.Visible = false;


                            txtemailforwarded.Text = "";
                            txtcc.Text = "";
                            txtremarksforward.Text = "";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert( 'The Application with Reference ID " + referenceappNo + " has been sucessfully issued ')", true);
                            //txtappforwarded.Text = "";
                            gridbind();
                        }


                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                        }
                    }
                }
                else
                {
                    int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 17)
                                                                                   , new SqlParameter("@remarks", remarks)
                                                                                    , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                    , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                    , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                    , new SqlParameter("@trnid", trnid)

                                                                                    , new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                    , new SqlParameter("@dealingOffc", Convert.ToInt16(Session["Station_SectionID"]))
                                                                                    , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                    , new SqlParameter("@appid", basicid));
                    if (i > 0)
                    {
                        if (txtemailforwarded.Text != "")
                        {
                            sendEmailforward(Subofemail, txtemailforwarded.Text.Trim(), txtcc.Text.Trim(), bodyofemail, "");//emsil sent commented
                        }



                        divresorfor.Visible = false;


                        txtemailforwarded.Text = "";
                        txtcc.Text = "";
                        txtremarksforward.Text = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert( 'The Application with Reference ID " + referenceappNo + " has been sucessfully issued ')", true);
                        //txtappforwarded.Text = "";
                        gridbind();
                    }


                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }

            }

            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchbyName_empcode(string prefixText, int count)
        {
            DataSet ds = new DataSet();
            Commonclass1 cmm = new Commonclass1();
            ds = cmm.RunSpReturnDSParam("PN21_Trans_SearchByName_EmpCode", "PRASARNETConnectionString", new SqlParameter("@prefixtext", prefixText),
                                                              new SqlParameter("@flag", 3));
            List<string> Output = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string str = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString());
                Output.Add(str);
            }
            return Output;

        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            txtemailforwarded.Text = "";
            //txtappforwarded.Text = "";
            txtremarksforward.Text = "";
            divresorfor.Visible = false;
            txtcc.Text = "";
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void grdupload_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("downloaddoc"))
            {
                try
                {
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
                }
                catch (Exception ex)
                {
                    bindgridupload_prev();
                    // Label22.Text = "Some Issue occured while downloading a document.Try Again!!";
                    grdupload.Focus();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Some Issue occured while downloading a document.Try Again!!');", true);
                }
            }
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

        protected void Button6_Click(object sender, EventArgs e)
        {
            txtEmailres.Text = "";
            //txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
            txtremarksres.Text = "";
            txtccresto.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();

            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
            divresorfor.Visible = false;
            divfilterrec.Visible = false;

            txtemailforwarded.Text = "";
            //txtappforwarded.Text = "";
            txtremarksforward.Text = "";
            txtcc.Text = "";
            gridbind();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CheckBoxList1.SelectedValue == "1") //close
            {
                divresolvedaction.Visible = true;
                divforwardedaction.Visible = false;
                //int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                //int trnid = Convert.ToInt32(ViewState["trnid_action"]);

                //string remarks = txtremarksforward.Text;
                //int empid_fwd_ = Convert.ToInt32(hdnValue.Value);
                //int usertypeid_action = 10;
                lblname_res.Text = "Name: " + ViewState["EmpName_Action"].ToString() + " (" + ViewState["EmpDsg_Action"].ToString() + ")" + ", Mobile No: " + ViewState["EmpMob_Action"].ToString() + ", E-Mail: " + ViewState["EmpEMail_Action"].ToString();
                txtremarksres.Focus();
                ////string ip = cmm.GetIp_Priyank();
                txtEmailres.Text = ViewState["EmpEMail_Action"].ToString();
                txtEmailres.Focus();


                //       int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 17)
                //                                                                    , new SqlParameter("@ClosedbyUserTypeId", ViewState)
                //                                                                    , new SqlParameter("@dealingOffc", txtemailforwarded.Text.Trim())
                //                                                                    , new SqlParameter("@Remarks", txtcc.Text.Trim())
                //                                                                    , new SqlParameter("@trnid", ViewState["trnid_action"])
                //                                                                    , new SqlParameter("@appId", ip)
                //                                                                   );
                //if (i > 0)
                //{


                //}


                ViewState["actionOfficer_EmailClosed"] = "dgairwelfare@prasarbharati.gov.in";

                txtccresto.Text = "dgairwelfare@prasarbharati.gov.in";

            }
            else if (CheckBoxList1.SelectedValue == "3") //issue card
            {
                divresolvedaction.Visible = false;
                divforwardedaction.Visible = true;
                //int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                //int trnid = Convert.ToInt32(ViewState["trnid_action_"]);

                lblnamefwd.Text = "Name: " + ViewState["EmpName_Action"].ToString() + " (" + ViewState["EmpDsg_Action"].ToString() + ")" + ", Mobile No: " + ViewState["EmpMob_Action"].ToString() + ", E-Mail: " + ViewState["EmpEMail_Action"].ToString();
                txtemailforwarded.Focus();

                //int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 17)
                //                                                                    , new SqlParameter("@ClosedbyUserTypeId", )
                //                                                                    , new SqlParameter("@dealingOffc", txtemailforwarded.Text.Trim())
                //                                                                    , new SqlParameter("@Remarks", txtcc.Text.Trim())
                //                                                                    , new SqlParameter("@trnid", trnid)
                //                                                                    , new SqlParameter("@appId", basicid)
                //                                                                   );
                //if (i > 0)
                //{ 


                //}
                //DataSet dsActionOfficername = new DataSet();
                //dsActionOfficername = cmm.RunSpReturnDSParam("PN21_Trans_EmpDetails", "PRASARNETConnectionString", new SqlParameter("@flag", 2),
                //                                                                          new SqlParameter("@empid", Convert.ToInt32(Session["empid"])));
                txtemailforwarded.Text = ViewState["EmpEMail_Action"].ToString();
                txtemailforwarded.Focus();
                ViewState["actionOfficer_EmailClosed"] = "dgairwelfare@prasarbharati.gov.in";

                txtcc.Text = "dgairwelfare@prasarbharati.gov.in";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string ipaddress2 = cmm.GetIp_Priyank();
                string filename = Convert.ToString(ViewState["filename"]);
                int trnid = Convert.ToInt32(ViewState["trnid_action"]);
                int basicid = Convert.ToInt32(ViewState["basicid_action_"]);
                string remarks = txtremarksres.Text;

                string emailofapp = ViewState["empemail_"].ToString();
                string nameofapp = ViewState["EmpName_action_"].ToString();
                string degnEmp = ViewState["empdesgn_action"].ToString();

                string mobnoofapp = ViewState["empmob_action"].ToString();
                string referenceappNo = ViewState["AppNo_action_"].ToString();

                string app_RegdOn = ViewState["subOn_action"].ToString();
                string StationofEmployee = ViewState["empstn_action_"].ToString();

                string Subofemail = "";
                string bodyofemail = "";

                if (FileUpload1.HasFile)
                {
                    int ret = uploaddoc(FileUpload1, "Action_Docs", lblcloseresult);
                    if (ret == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Unable to Upload a File.Try Again!!');", true);
                    }
                    else
                    {


                        if (txtEmailres.Text != "")
                        {
                            Subofemail = "Regarding PBHS Card request having Reference Id: " + referenceappNo;
                            bodyofemail = "Your PBHS Card Request has been closed and answered. Kindly login into PrasarNet for more details.";
                            //bodyofemail += "<br/>If you have any query then you may write to action Officer at " + ViewState["actionOfficer_EmailClosed"].ToString() + ", mentioning the transfer application reference id: "
                            //            + referenceappNo + " in a subject.";
                            bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                        }
                        // @remarks,@emailidsend,@ccmail,@Ipfromactiontaken,@filename,@trnid,@appid,@dealingUsertypeid,@dealingOffc,@updatdedby

                        int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 16)
                                                                                  , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                  , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                  , new SqlParameter("@filename", filename)
                                                                                  , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                  , new SqlParameter("@trnid", trnid)
                                                                                  , new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                  , new SqlParameter("@dealingOffc", Convert.ToInt16(Session["Station_SectionID"]))
                                                                                  , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                  , new SqlParameter("@appid", basicid));


                        if (i > 0)
                        {
                            if (txtEmailres.Text != "")
                            {
                                sendEmailforward(Subofemail, txtEmailres.Text.Trim(), txtccresto.Text.Trim(), bodyofemail, filename);
                            }
                            if (mobnoofapp != "")
                            {
                                string msgsend = "Your PBHSCard Request,having reference id " + referenceappNo + ", has been closed & answered. Kindly login into PrasarNet for more details.Prasar Bharati";
                                Boolean re2t = cmm.sendMobileOTP1(mobnoofapp, "", msgsend);
                            }
                            divresolvedaction.Visible = false;
                            divresorfor.Visible = false;
                            txtremarksres.Text = "";
                            txtEmailres.Text = "";
                            txtccresto.Text = "";
                            //txtEmailres.ReadOnly = true;
                            txtEmailres.CssClass = "select font2 widthofboxes1";

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The PBHS Card Request with Reference ID " + referenceappNo + ". has been closed.')", true);
                            gridbind();
                        }

                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                    }
                }
                else
                {


                    if (txtEmailres.Text != "")
                    {
                        Subofemail = "Regarding PBHS Card request having Reference Id: " + referenceappNo;
                        bodyofemail = "Your PBHS Card Request has been closed and answered. Kindly login into PrasarNet for more details.";
                        //bodyofemail += "<br/>If you have any query then you may write to action Officer at " + ViewState["actionOfficer_EmailClosed"].ToString() + ", mentioning the transfer application reference id: "
                        //            + referenceappNo + " in a subject.";
                        bodyofemail += "<br />**Note: This is system generated mail. please do not reply on this.<br />";
                    }

                    int i = cmm.RunSP("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 16)
                                                                                 , new SqlParameter("@remarks", remarks)
                                                                                  , new SqlParameter("@emailidsend", txtEmailres.Text.Trim())
                                                                                  , new SqlParameter("@ccmail", txtccresto.Text.Trim())
                                                                                  , new SqlParameter("@Ipfromactiontaken", ipaddress2)
                                                                                  , new SqlParameter("@trnid", trnid)
                                                                                  , new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"]))
                                                                                  , new SqlParameter("@dealingOffc", Convert.ToInt16(Session["Station_SectionID"]))
                                                                                  , new SqlParameter("@updatdedby", Convert.ToString(Session["UserName"]))
                                                                                  , new SqlParameter("@appid", basicid));
                    if (i > 0)
                    {
                        if (txtemailforwarded.Text != "")
                        {
                            sendEmailforward(Subofemail, txtEmailres.Text.Trim(), txtccresto.Text.Trim(), bodyofemail, "");// email commneted 
                        }
                        if (mobnoofapp != "")
                        {
                            //Your {#var#} {#var#},having reference id {#var#}, has been {#var#} & {#var#}. Kindly login into {#var#} for more details.Prasar Bharati
                            string msgsend = "Your PBHSCard Request,having reference id " + referenceappNo + ", has been closed & answered. Kindly login into PrasarNet for more details.Prasar Bharati";
                            Boolean re2t = cmm.sendMobileOTP1(mobnoofapp, "", msgsend);
                        }
                        divresolvedaction.Visible = false;
                        divresorfor.Visible = false;
                        txtremarksres.Text = "";
                        txtEmailres.Text = "";
                        txtccresto.Text = "";
                        //txtEmailres.ReadOnly = true;
                        txtEmailres.CssClass = "select font2 widthofboxes1";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The PBHS Card Request with Reference ID " + referenceappNo + ". has been closed.')", true);
                        gridbind();
                    }

                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again!!')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again. If you are facing same issue then you may contact PB-IT Team')", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtEmailres.Text = "";
            //txtEmailres.ReadOnly = true;
            txtEmailres.CssClass = "select font2 widthofboxes1";
            txtremarksres.Text = "";
            txtccresto.Text = "";
            CheckBoxList1.ClearSelection();
            CheckBoxList1.Focus();
            divresolvedaction.Visible = false;
            divforwardedaction.Visible = false;
        }


    }
}