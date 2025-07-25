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
    public partial class HOS : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        int stnid;
        string stnname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1)
            {

                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    stnname = Convert.ToString(Session["UserName"]);// here stnname means empname.. modification is done after the page design and programming was over
                    if (!IsPostBack)
                    {
                        string currentDate = DateTime.Today.ToShortDateString();
                        cValFrom.ValueToCompare = currentDate;
                        cValTo.ValueToCompare = currentDate;
                        divemp.Visible = false;
                        divHOS.Visible = true;
                        divback.Visible = false;
                        divbackemp.Visible = true;
                        grdempdetails.Caption = "Posting History of " + Convert.ToString(Session["UserName"]);
                        grdbindHOS(Convert.ToInt32(Session["empid"]));
                        cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", Convert.ToInt32(Session["WingID"])));
                        cmm.bindDDL(ddlorg_add_details, "ATSorg", "Abbreviation", "OrganizationId", "--Select Organisation--", "HRITConnectionString");

                        ds = cmm.RunSpReturnDSParam("ATS_HOS_verify", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(Session["empid"])),
                                                           new SqlParameter("@hosverify", false),
                                                           new SqlParameter("@hosupddate", ""),
                                                           new SqlParameter("@flag", 2));
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0][0]) == true)
                        {
                            lnkadddetails.Visible = false;
                            grdempdetails.Columns[10].Visible = false;
                        }
                        else
                        {
                            lnkadddetails.Visible = true;
                            grdempdetails.Columns[10].Visible = true;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        public void grdbind()
        {
            ds = cmm.RunSpReturnDSParam("IT_StnEmpDetAadhar", "HRITConnectionString", new SqlParameter("@Param1", stnid),// accept a session value of stationid
                                                          new SqlParameter("@wingid", rblwing.SelectedValue));
            grddesgn.DataSource = ds;
            ViewState["dsgrd"] = ds;
            grddesgn.DataBind();
        }
        public void grdbindHOS(int id)
        {
            ds = cmm.RunSpReturnDSParam("ATS_HOS", "HRITConnectionString", new SqlParameter("@empid", id),
                                                        new SqlParameter("@flag", 1),
                                                        new SqlParameter("@desgnid", 1000),
                                                        new SqlParameter("@stnid", 1000),
                                                        new SqlParameter("@todate", ""),
                                                        new SqlParameter("@fromdate", ""),
                                                        new SqlParameter("@rmks", ""),
                                                        new SqlParameter("@createdby", ""),
                                                        new SqlParameter("@historyid", 1000));

            grdempdetails.DataSource = ds;

            grdempdetails.DataBind();
            //ViewState["dsgrdempdet"] = ds;
        }

        //Convert.ToInt32(Session("stnId"))
        protected void rblwing_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtsearch.Text = "";
            Panel2.Visible = true;
            grdbind();
        }
        protected void grddesgn_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grddesgn.PageIndex = e.NewPageIndex;
            grddesgn.DataSource = (DataSet)ViewState["dsgrd"];
            grddesgn.DataBind();
        }
        protected void grddesgn_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "MouseEvent(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvent(this, event)");
                //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grddesgn, "Select$" + e.Row.RowIndex);
                //e.Row.Attributes["style"] = "cursor:pointer";

                ImageButton imgbtnUpdate = (ImageButton)e.Row.FindControl("imgbtnUpdate");
                CheckBox chkverify = (CheckBox)e.Row.FindControl("chkverify");
                Label lblupdate = (Label)e.Row.FindControl("lblupdate");
                Label lblhistoryverifydate = (Label)e.Row.FindControl("lblhistoryverifydate");
                Label lblempid = (Label)e.Row.FindControl("lblempid");
                ds = cmm.RunSpReturnDSParam("ATS_HOS_verify", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(lblempid.Text)),
                                                        new SqlParameter("@hosverify", false),
                                                        new SqlParameter("@hosupddate", ""),
                                                        new SqlParameter("@flag", 2));
                if (Convert.ToBoolean(ds.Tables[0].Rows[0][0]) == true)
                {
                    chkverify.Enabled = false;
                    lblupdate.Visible = true;
                    lblhistoryverifydate.Visible = true;
                    imgbtnUpdate.Visible = false;
                }
                else
                {
                    chkverify.Enabled = true;
                    lblupdate.Visible = false;
                    lblhistoryverifydate.Visible = false;
                    imgbtnUpdate.Visible = true;
                }
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {

            divemp.Visible = true;
            divHOS.Visible = false;
            entry.Visible = false;
            Panelempdetails.Visible = true;
            grdempdetails.EditIndex = -1;
            grdbindHOS(Convert.ToInt32(ViewState["empid"]));
            clear();
        }
        public void clear()
        {
            ddldesgn.SelectedIndex = 0;
            ddlorg_add_details.SelectedIndex = 0;
            comstation.ClearSelection();
            comstation.Items.Clear();
            txtfromdate.Text = "";
            txttodate.Text = "";
            txtrmks.Text = "";
        }
        protected void lnkadddetails_Click(object sender, EventArgs e)
        {
            entry.Visible = true;
            Panelempdetails.Visible = true;
            lnkadddetails.Visible = false;
            divempdetprint.Visible = false;
            if (Convert.ToBoolean(Session["EmpvalidLogin"]) == true)
            {
                divback.Visible = false;
                divbackemp.Visible = true;
            }
            else if (Convert.ToBoolean(Session["validLogin"]) == true)
            {
                divback.Visible = true;
                divbackemp.Visible = false;
            }
            clear();

        }
        protected void btnclose_Click(object sender, EventArgs e)
        {
            lnkadddetails.Visible = true;
            entry.Visible = false;
            Panelempdetails.Visible = true;
            divempdetprint.Visible = true;
            if (Convert.ToBoolean(Session["EmpvalidLogin"]) == true)
            {
                divback.Visible = false;
                divbackemp.Visible = true;
            }
            else if (Convert.ToBoolean(Session["validLogin"]) == true)
            {
                divback.Visible = true;
                divbackemp.Visible = false;
            }
            clear();
        }

        public void submitvalue()
        {
            DateTime? strt = null;// initialise by null
            DateTime? end = null;
            if (txtfromdate.Text != "")
                strt = Convert.ToDateTime(txtfromdate.Text);
            if (txttodate.Text != "")
                end = Convert.ToDateTime(txttodate.Text);
            //int empid = 0;
            //if (Convert.ToBoolean(Session["EmpvalidLogin"]) == true)
            //{
            //    empid = Convert.ToInt32(Session["EmployeeId"]);
            //}
            //else if (Convert.ToBoolean(Session["validLogin"]) == true)
            //{
            //    empid = Convert.ToInt32(ViewState["empid"]);
            //}
            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                empid = Convert.ToInt32(ViewState["empid"]);
                //Label lblempid = (Label)grdempdetails.Rows[e.RowIndex].FindControl("lblempid");
                //empid = Convert.ToInt32(lblempid.Text);
            }


            int i = cmm.RunSP("ATS_HOS", "HRITConnectionString", new SqlParameter("@empid", empid),
                                                        new SqlParameter("@flag", 2),
                                                        new SqlParameter("@desgnid", ddldesgn.SelectedValue),
                                                        new SqlParameter("@stnid", comstation.SelectedValue),
                                                        new SqlParameter("@todate", end),
                                                        new SqlParameter("@fromdate", strt),
                                                        new SqlParameter("@rmks", txtrmks.Text),
                                                        new SqlParameter("@createdby", stnname),
                                                        new SqlParameter("@historyid", 1));
            //Convert.ToString(Session("stnId")
            if (i > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Details Submitted Successfully!!');", true);
            clear();
            Panelempdetails.Visible = true;
            entry.Visible = false;
            lnkadddetails.Visible = true;
            divempdetprint.Visible = true;
            grdbindHOS(empid);
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {

            //DateTime dt1 = DateTime.Now.Date;
            ////DateTime? strt1 = null;// initialise by null
            ////DateTime? end1 = null;
            //if (txtfromdate.Text != "")
            //    strt1 = Convert.ToDateTime(txtfromdate.Text);
            //if (txttodate.Text != "")
            //    end1 = Convert.ToDateTime(txttodate.Text);
            //if (end1 != null)
            //{
            //    if (end1 <= dt1 && strt1 <= dt1)
            //    {
            //        if (end1 > strt1)
            //        {
            submitvalue();
            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Date of Relieving can't be less than the Date of Joining!!');", true);
            //        }
            //    }
            //    else
            //    {

            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Date of Joining/Relieving can't be greater than Today Date!!');", true);
            //    }

            //}
            //else
            //{
            //    if (strt1 <= dt1)
            //    {
            //        submitvalue();
            //    }
            //    else
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Date of Joining can't be greater than Today Date!!');", true);
            //    }
            //}
        }

        protected void grdempdetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdempdetails.EditIndex = e.NewEditIndex;

            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                empid = Convert.ToInt32(ViewState["empid"]);
            }
            grdbindHOS(empid);
        }
        protected void grdempdetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdempdetails.EditIndex = -1;
            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                //empid = Convert.ToInt32(ViewState["empid"]);
            }
            grdbindHOS(empid);
        }
        protected void grdempdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdempdetails.PageIndex = e.NewPageIndex;
            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                empid = Convert.ToInt32(ViewState["empid"]);
            }
            grdbindHOS(empid);
        }
        protected void grdempdetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //ViewState["empid"]
            //string Plan = gvDetails.DataKeys[e.RowIndex].Values["CCWOffices"].ToString();

            DropDownList ddldesign1 = (DropDownList)grdempdetails.Rows[e.RowIndex].FindControl("ddldesign1");
            DropDownList ddlstation = (DropDownList)grdempdetails.Rows[e.RowIndex].FindControl("ddlstation");
            TextBox txtstrtdate = (TextBox)grdempdetails.Rows[e.RowIndex].FindControl("txtfromdategrd");
            TextBox txtenddate = (TextBox)grdempdetails.Rows[e.RowIndex].FindControl("txttodategrd");
            TextBox txtremarks = (TextBox)grdempdetails.Rows[e.RowIndex].FindControl("txtrmk");

            DateTime? strt = null;
            DateTime? end = null;
            if (txtstrtdate.Text != "")
                strt = DateTime.ParseExact(txtstrtdate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.CurrentUICulture.DateTimeFormat);
                //strt = Convert.ToDateTime(txtstrtdate.Text);
            if (txtenddate.Text != "")
                end = DateTime.ParseExact(txtenddate.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.CurrentUICulture.DateTimeFormat);

            //end = Convert.ToDateTime(txtenddate.Text);
            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                //empid = Convert.ToInt32(ViewState["empid"]);
                Label lblempid = (Label)grdempdetails.Rows[e.RowIndex].FindControl("lblempid");
                empid = Convert.ToInt32(lblempid.Text);
            }



            Label lblhisid = (Label)grdempdetails.Rows[e.RowIndex].FindControl("lblhisid");
            //cmm.bindDDL(ddlEditZone, "GetZones", "ZoneName", "ZoneId");
            int i = cmm.RunSP("ATS_HOS", "HRITConnectionString", new SqlParameter("@empid", empid),
                                                        new SqlParameter("@flag", 3),
                                                        new SqlParameter("@desgnid", ddldesign1.SelectedValue),
                                                        new SqlParameter("@stnid", ddlstation.SelectedValue),
                                                        new SqlParameter("@todate", end),
                                                        new SqlParameter("@fromdate", strt),
                                                        new SqlParameter("@rmks", txtremarks.Text),
                                                        new SqlParameter("@createdby", stnname),
                                                        new SqlParameter("@historyid", Convert.ToInt32(lblhisid.Text)));
            //Convert.ToString(Session("stnId")
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                grdempdetails.EditIndex = -1;
                grdbindHOS(empid);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);


        }
        protected void grdempdetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblhisid = (Label)grdempdetails.Rows[e.RowIndex].FindControl("lblhisid");
            int i = cmm.RunSP("ATS_HOS", "HRITConnectionString", new SqlParameter("@empid", 1000),
                                                      new SqlParameter("@flag", 4),
                                                      new SqlParameter("@desgnid", ""),
                                                      new SqlParameter("@stnid", ""),
                                                      new SqlParameter("@todate", null),
                                                      new SqlParameter("@fromdate", null),
                                                      new SqlParameter("@rmks", ""),
                                                      new SqlParameter("@createdby", ""),
                                                      new SqlParameter("@historyid", Convert.ToInt32(lblhisid.Text)));
            //Convert.ToString(Session("stnId")
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Delete Successfully!!');", true);
                int empid = 0;
                if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                {
                    empid = Convert.ToInt32(Session["empid"]);
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
                {
                    empid = Convert.ToInt32(ViewState["empid"]);
                }
                grdbindHOS(empid);
            }
        }
        protected void grdempdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddldesign1 = (DropDownList)e.Row.FindControl("ddldesign1");
                DropDownList ddlstation = (DropDownList)e.Row.FindControl("ddlstation");
                DropDownList ddlorg = (DropDownList)e.Row.FindControl("ddlorg");
                Label lblorgid1 = (Label)e.Row.FindControl("lblorgid2");
                Label lbldesign = (Label)e.Row.FindControl("lbldesignid1");
                Label lblstn = (Label)e.Row.FindControl("lblstnid1");
                int wingid = 0;

                if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                {
                    wingid = Convert.ToInt32(Session["WingID"]);
                }
                else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
                {
                    wingid = Convert.ToInt32(rblwing.SelectedItem.Value);
                }


                cmm.bindDDLWidParam(ddldesign1, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Wing--", new SqlParameter("@wingid", wingid));
                cmm.bindDDL(ddlorg, "ATSorg", "Abbreviation", "OrganizationId", "--Select Organisation--", "HRITConnectionString");


                DataRowView dr = e.Row.DataItem as DataRowView;
                if (Convert.ToInt16(lbldesign.Text) != 0)
                    ddldesign1.SelectedValue = lbldesign.Text;


                if (Convert.ToInt16(lblorgid1.Text) != 0)
                {
                    ddlorg.SelectedValue = lblorgid1.Text;
                    cmm.bindDDLWidParam(ddlstation, "IT_orgStation", "stationName", "StationID", "HRITConnectionString", "--Select Station--", new SqlParameter("@orgId", Convert.ToInt16(lblorgid1.Text)));
                    ddlstation.SelectedValue = lblstn.Text;
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "MouseEvent(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvent(this, event)");
            }
        }

        protected void ddlorg_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;

            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            string selectedValue = ((DropDownList)(row.FindControl("ddlorg"))).SelectedValue;

            //DropDownList ddlorg = ((DropDownList)(grdempdetails.FindControl("ddlorg")));
            //ddlorg = (DropDownList)sender;
            DropDownList ddlstation = ((DropDownList)(row.FindControl("ddlstation")));
            //GridViewRow gvr = (GridViewRow)ddlorg.NamingContainer;
            cmm.bindDDLWidParam(ddlstation, "IT_orgStation", "stationName", "StationID", "HRITConnectionString", "--Select Station--", new SqlParameter("@orgId", selectedValue));
            //"IT_orgStation", new SqlParameter("@orgId", ddlorg.SelectedValue));
        }
        protected void ddlorg_add_details_SelectedIndexChanged(object sender, EventArgs e)
        {
            comstation.ClearSelection();
            DataRow dr;
            cmm.OpenConnection("HRITConnectionString");
            ds = cmm.RunSpReturnDSParam("IT_orgStation", "HRITConnectionString", new SqlParameter("@orgId", ddlorg_add_details.SelectedValue));
            dr = ds.Tables[0].NewRow();
            dr.ItemArray = new object[] { 0, "--Select--" };
            ds.Tables[0].Rows.InsertAt(dr, 0);
            comstation.DataValueField = "StationID";
            comstation.DataTextField = "stationName";
            comstation.DataSource = ds;
            comstation.DataBind();
            comstation.SelectedIndex = 0;
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            ds = cmm.RunSpReturnDSParam("IT_StnEmpDetAadhar", "HRITConnectionString", new SqlParameter("@Param1", stnid),// accept a session value of stationid
                                                              new SqlParameter("@fullname", txtsearch.Text),
                                                              new SqlParameter("@wingid", rblwing.SelectedValue));
            grddesgn.DataSource = ds;
            grddesgn.DataBind();
        }
        //protected void btnprint_Click(object sender, EventArgs e)
        //{

        //}

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grddesgn_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblempid = (Label)grddesgn.Rows[e.RowIndex].FindControl("lblempid");
            Label lblverify = (Label)grddesgn.Rows[e.RowIndex].FindControl("lblverify");
            Label lblupdate = (Label)grddesgn.Rows[e.RowIndex].FindControl("lblupdate");
            CheckBox chkverify = (CheckBox)grddesgn.Rows[e.RowIndex].FindControl("chkverify");
            int HOSverified = 1;
            if (!chkverify.Checked)
            {
                HOSverified = 0;
            }
            int i = cmm.RunSP("ATS_HOS_verify", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(lblempid.Text)),
                                                        new SqlParameter("@hosverify", HOSverified),
                                                        new SqlParameter("@hosupddate", ""),
                                                        new SqlParameter("@flag", 1));
            //Convert.ToString(Session("stnId")
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Updated Successfully!!');", true);
                grddesgn.EditIndex = -1;
                grddesgn.DataSource = (DataSet)ViewState["dsgrd"];
                grddesgn.DataBind();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
        }
        protected void grddesgn_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblempid = (Label)row.FindControl("lblempid");
                LinkButton lblemp = (LinkButton)row.FindControl("lblempname");
                Label lbldesgn = (Label)row.FindControl("lbldesgn");
                ViewState["empid"] = lblempid.Text;
                ds = cmm.RunSpReturnDSParam("ATS_HOS_verify", "HRITConnectionString", new SqlParameter("@empid", Convert.ToInt32(lblempid.Text)),
                                                       new SqlParameter("@hosverify", false),
                                                       new SqlParameter("@hosupddate", ""),
                                                       new SqlParameter("@flag", 2));
                if (Convert.ToBoolean(ds.Tables[0].Rows[0][0]) == true)
                {
                    lnkadddetails.Visible = false;
                    grdempdetails.Columns[10].Visible = false;
                }
                else
                {
                    lnkadddetails.Visible = true;
                    grdempdetails.Columns[10].Visible = true;
                }
                //lblempname.Text = lblemp.Text;
                divemp.Visible = false;
                divHOS.Visible = true;
                grdempdetails.Caption = "Posting History of " + lblemp.Text + ", " + lbldesgn.Text;
                grdbindHOS(Convert.ToInt32(lblempid.Text));
                cmm.bindDDLWidParam(ddldesgn, "ATS_getdesignationbywing", "DesignationName", "DesignationID", "HRITConnectionString", "--Select Designation--", new SqlParameter("@wingid", rblwing.SelectedItem.Value));
                cmm.bindDDL(ddlorg_add_details, "ATSorg", "Abbreviation", "OrganizationId", "HRITConnectionString", "--Select Organsation--");
            }

        }
        protected void grddesgn_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            grddesgn.DataSource = (DataSet)ViewState["dsgrd"];
            grddesgn.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/myprofile.aspx");
        }
        protected void btnbackemp_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/myprofile.aspx");
        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            grdempdetails.AllowPaging = false;
            grdempdetails.Columns[10].Visible = false;
            int empid = 0;
            if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
            {
                empid = Convert.ToInt32(Session["empid"]);
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station
            {
                empid = Convert.ToInt32(ViewState["empid"]);
            }
            grdbindHOS(empid);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdempdetails.RenderControl(hw);
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
            grdempdetails.AllowPaging = true;
            grdempdetails.Columns[10].Visible = false;
            grdbindHOS(empid);
        }


    }
}
