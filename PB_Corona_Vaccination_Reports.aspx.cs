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
    public partial class PB_Corona_Vaccination_Reports : System.Web.UI.Page
    {
        int totalemp = 0, totempvac = 0, totnonvac = 0, totcovaxin = 0, totcovish = 0, totsput = 0, tototh = 0, totvac1 = 0, totvac2 = 0;
        int totalemp_c = 0, totempvac_c = 0, totnonvac_c = 0, totcovaxin_c = 0, totcovish_c = 0, totsput_c = 0, tototh_c = 0, totvac1_c = 0, totvac2_c = 0;
        double perr = 0.0, perc = 0.0, pert = 0.0, Fperr = 0.0, Fperc = 0.0, Fpert = 0.0, Sperr = 0.0, Sperc = 0.0, Spert = 0.0;


        //protected void lnkviewdet_Click(object sender, EventArgs e)
        //{
        //    
        //}

        int totalemp_r = 0, totempvac_r = 0, totnonvac_r = 0, totcovaxin_r = 0, totcovish_r = 0, totsput_r = 0, tototh_r = 0, totvac1_r = 0, totvac2_r = 0;
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("HomePage.aspx", false);
            }
            else if (Convert.ToInt16(Session["UserId"]) == 1 || Convert.ToInt16(Session["UserId"]) == 4 || Convert.ToInt16(Session["UserId"]) == 2 || Convert.ToInt16(Session["UserId"]) == 3 || Session["UserName"].ToString() == "Guest")
            {
                if (!IsPostBack)
                {

                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        guestmenu.Visible = false;
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 26 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)// station and Sections
                    {
                        if (Convert.ToInt16(Session["Usertype"]) == 11 || Convert.ToInt16(Session["Usertype"]) == 20 || Convert.ToInt16(Session["Usertype"]) == 22 || Convert.ToInt16(Session["Usertype"]) == 23 || Convert.ToInt16(Session["Usertype"]) == 24)//station and CCW
                        {
                            DataSet dsccw = new DataSet();
                            dsccw = cmm.RunSpReturnDSParam("PN18_CCW_Offices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                            new SqlParameter("@flag", "1"));

                            if (Convert.ToInt32(Session["Orgid"]) == 2 || Convert.ToInt32(Session["Orgid"]) == 3)// Only DD and AIR can fill the Monthly Reports
                            {
                                divmonthlystationreportsforadg.Visible = false;
                                if (dsccw.Tables[0].Rows.Count == 0)
                                {
                                    divmonthlystationreports.Visible = true;

                                }
                                else
                                {
                                    divmonthlystationreports.Visible = false;
                                }
                            }
                            else
                            {
                                DataSet dsadg = new DataSet();
                                dsadg = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                                new SqlParameter("@flag", "1"));
                                if (dsccw.Tables[0].Rows.Count == 0)
                                {
                                    divmonthlystationreportsforadg.Visible = true;

                                }
                                else
                                {
                                    divmonthlystationreportsforadg.Visible = false;
                                }
                                divmonthlystationreports.Visible = false;
                            }
                        }
                        else if (Convert.ToInt16(Session["Usertype"]) == 12 || Convert.ToInt16(Session["Usertype"]) == 25 || Convert.ToInt16(Session["Usertype"]) == 26)//section
                        {
                            divmonthlystationreports.Visible = false;
                            divmonthlystationreportsforadg.Visible = false;
                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 244))
                            {
                                divlandrecords.Visible = true;
                            }
                            else
                            {
                                divlandrecords.Visible = false;
                            }
                            if ((Convert.ToInt16(Session["Usertype"]) == 26 && Convert.ToInt32(Session["Station_SectionID"]) == 245))
                            {
                                divboradmeetingrecordsUpload.Visible = true;
                                //divboardmeetingreport.Visible = true;
                            }
                            else
                            {
                                divboradmeetingrecordsUpload.Visible = false;
                                //divboardmeetingreport.Visible = false;
                            }
                        }
                        guestmenu.Visible = false;
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = true;
                        AdminMenu.Visible = false;
                        AdminMenuIT.Visible = false;
                    }
                    else// management
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
                        if (Convert.ToInt16(Session["Usertype"]) == 27)
                        {
                            guestmenu.Visible = false;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = false;
                            AdminMenuIT.Visible = true;
                        }
                        else//14,15,16,18,19
                        {
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
                            guestmenu.Visible = false;
                            empmenu.Visible = false;
                            StationSectionMenu.Visible = false;
                            AdminMenu.Visible = true;
                            AdminMenuIT.Visible = false;
                        }
                    }
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    gridbind();

                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void gridbind()
        {
            totalemp = 0; totempvac = 0; totnonvac = 0; totcovaxin = 0; totcovish = 0; totsput = 0; tototh = 0; totvac1 = 0; totvac2 = 0;
            totalemp_c = 0; totempvac_c = 0; totnonvac_c = 0; totcovaxin_c = 0; totcovish_c = 0; totsput_c = 0; tototh_c = 0; totvac1_c = 0; totvac2_c = 0;
            totalemp_r = 0; totempvac_r = 0; totnonvac_r = 0; totcovaxin_r = 0; totcovish_r = 0; totsput_r = 0; tototh_r = 0; totvac1_r = 0; totvac2_r = 0;
            perr = 0; perc = 0; pert = 0;
            ds = cmm.RunSpReturnDSParam("PN18_VaccinationReports", "PRASARNETConnectionString", new SqlParameter("@flag", 1));
            grddoc.DataSource = ds;
            grddoc.DataBind();
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("PB_CoronaWarriors.aspx", true);
        }
        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("PB_VaccinationStatus_Details.aspx", true);
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void btnprint1_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                grddoc.AllowPaging = false;
                gridbind();
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
                ClientScript.RegisterStartupScript(this.GetType(), "PB_Emp_Vaccination_Report", sb.ToString());
                grddoc.AllowPaging = true;
                gridbind();
                divmsg.Visible = false;
                lblmsg.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }


        protected void btnexporttoexcel_Click(object sender, EventArgs e)
        {
            try
            {
                divmsg.Visible = true;
                lblmsg.Text = "This Data taken from PrasarNet, on " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=PB_Emp_Vaccination_Report.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);

                grddoc.AllowPaging = false;
                gridbind();

                grddoc.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in grddoc.HeaderRow.Cells)
                {
                    cell.BackColor = grddoc.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grddoc.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        cell.BackColor = grddoc.RowStyle.BackColor;
                    }
                }
                panelprint.RenderControl(ht);
                Response.Write(sw.ToString());
                grddoc.AllowPaging = true;
                gridbind();
                divmsg.Visible = false;
                lblmsg.Text = "";
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Error Occured!!');", true);
            }
        }

        protected void grddoc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
                {
                    Label typeofemp = (Label)e.Row.FindControl("Label39");
                    Label lbltotemp = (Label)e.Row.FindControl("lbltotal"); //
                    Label lblempvaccination = (Label)e.Row.FindControl("lblempvaccination");
                    Label lblempnonvaccination = (Label)e.Row.FindControl("lblempnonvaccination");
                    Label lblcovaxin = (Label)e.Row.FindControl("lblcovaxin");
                    Label lblcovisheild = (Label)e.Row.FindControl("lblcovisheild");
                    Label lblsputnik = (Label)e.Row.FindControl("lblsputnik");
                    Label lblother = (Label)e.Row.FindControl("lblother");
                    Label lblvaccinationist = (Label)e.Row.FindControl("lblvaccinationist");
                    Label lblvaccination2 = (Label)e.Row.FindControl("lblvaccination2");
                    if (typeofemp.Text == "Regular")
                    {
                        if (lbltotemp.Text != "")
                        {
                            totalemp_r += Convert.ToInt32(lbltotemp.Text);
                        }
                        else
                        {
                            totalemp_r += 0;

                        }

                        if (lblempvaccination.Text != "")
                        {
                            totempvac_r += Convert.ToInt32(lblempvaccination.Text);
                        }
                        else
                        {
                            totempvac_r += 0;
                        }

                        if (lblempnonvaccination.Text != "")
                        {
                            totnonvac_r += Convert.ToInt32(lblempnonvaccination.Text);
                        }
                        else
                        {
                            totnonvac_r += 0;
                        }

                        if (lblcovaxin.Text != "")
                        {
                            totcovaxin_r += Convert.ToInt32(lblcovaxin.Text);
                        }
                        else
                        {
                            totcovaxin_r += 0;
                        }

                        if (lblcovisheild.Text != "")
                        {
                            totcovish_r += Convert.ToInt32(lblcovisheild.Text);
                        }
                        else
                        {
                            totcovish_r += 0;
                        }

                        if (lblsputnik.Text != "")
                        {
                            totsput_r += Convert.ToInt32(lblsputnik.Text);
                        }
                        else
                        {
                            totsput_r += 0;
                        }

                        if (lblother.Text != "")
                        {
                            tototh_r += Convert.ToInt32(lblother.Text);
                        }
                        else
                        {
                            tototh_r += 0;
                        }

                        if (lblvaccinationist.Text != "")
                        {
                            totvac1_r += Convert.ToInt32(lblvaccinationist.Text);
                        }
                        else
                        {
                            totvac1_r += 0;
                        }

                        if (lblvaccination2.Text != "")
                        {
                            totvac2_r += Convert.ToInt32(lblvaccination2.Text);
                        }
                        else
                        {
                            totvac2_r += 0;
                        }
                    }

                    else
                    {
                        if (lbltotemp.Text != "")
                        {
                            totalemp_c += Convert.ToInt32(lbltotemp.Text);
                        }
                        else
                        {
                            totalemp_c += 0;

                        }

                        if (lblempvaccination.Text != "")
                        {
                            totempvac_c += Convert.ToInt32(lblempvaccination.Text);
                        }
                        else
                        {
                            totempvac_c += 0;
                        }

                        if (lblempnonvaccination.Text != "")
                        {
                            totnonvac_c += Convert.ToInt32(lblempnonvaccination.Text);
                        }
                        else
                        {
                            totnonvac_c += 0;
                        }

                        if (lblcovaxin.Text != "")
                        {
                            totcovaxin_c += Convert.ToInt32(lblcovaxin.Text);
                        }
                        else
                        {
                            totcovaxin_c += 0;
                        }

                        if (lblcovisheild.Text != "")
                        {
                            totcovish_c += Convert.ToInt32(lblcovisheild.Text);
                        }
                        else
                        {
                            totcovish_c += 0;
                        }

                        if (lblsputnik.Text != "")
                        {
                            totsput_c += Convert.ToInt32(lblsputnik.Text);
                        }
                        else
                        {
                            totsput_c += 0;
                        }

                        if (lblother.Text != "")
                        {
                            tototh_c += Convert.ToInt32(lblother.Text);
                        }
                        else
                        {
                            tototh_c += 0;
                        }

                        if (lblvaccinationist.Text != "")
                        {
                            totvac1_c += Convert.ToInt32(lblvaccinationist.Text);
                        }
                        else
                        {
                            totvac1_c += 0;
                        }

                        if (lblvaccination2.Text != "")
                        {
                            totvac2_c += Convert.ToInt32(lblvaccination2.Text);
                        }
                        else
                        {
                            totvac2_c += 0;
                        }
                    }
                }

                ViewState["totalempG_r"] = totalemp_r;
                ViewState["totvacG_r"] = totempvac_r;
                ViewState["totnonvacG_r"] = totnonvac_r;
                ViewState["totcovaxinG_r"] = totcovaxin_r;
                ViewState["totcoviG_r"] = totcovish_r;
                ViewState["totsputG_r"] = totsput_r;
                ViewState["totothG_r"] = tototh_r;
                ViewState["totvac1G_r"] = totvac1_r;
                ViewState["totvac2G_r"] = totvac2_r;

                ViewState["totalempG_c"] = totalemp_c;
                ViewState["totvacG_c"] = totempvac_c;
                ViewState["totnonvacG_c"] = totnonvac_c;
                ViewState["totcovaxinG_c"] = totcovaxin_c;
                ViewState["totcoviG_c"] = totcovish_c;
                ViewState["totsputG_c"] = totsput_c;
                ViewState["totothG_c"] = tototh_c;
                ViewState["totvac1G_c"] = totvac1_c;
                ViewState["totvac2G_c"] = totvac2_c;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbltotemp = (Label)e.Row.FindControl("lbltotemp");
                Label lblvac = (Label)e.Row.FindControl("lblvac");
                Label lbltotnonvac = (Label)e.Row.FindControl("lbltotnonvac");
                Label lbltotcovaxin = (Label)e.Row.FindControl("lbltotcovaxin");
                Label lbltotcovsheild = (Label)e.Row.FindControl("lbltotcovsheild");
                Label lbltotsputnik = (Label)e.Row.FindControl("lbltotsputnik");
                Label lbltototh = (Label)e.Row.FindControl("lbltototh");
                Label lbltotvac1 = (Label)e.Row.FindControl("lbltotvac1");
                Label lbltotvac2 = (Label)e.Row.FindControl("lbltotvac2");

                Label lbltotemp_r = (Label)e.Row.FindControl("lbltotemp_r");
                Label lblvac_r = (Label)e.Row.FindControl("lblvac_r");
                Label lbltotnonvac_r = (Label)e.Row.FindControl("lbltotnonvac_r");
                Label lbltotcovaxin_r = (Label)e.Row.FindControl("lbltotcovaxin_r");
                Label lbltotcovsheild_r = (Label)e.Row.FindControl("lbltotcovsheild_r");
                Label lbltotsputnik_r = (Label)e.Row.FindControl("lblsputnik_r");
                Label lbltototh_r = (Label)e.Row.FindControl("lbltototh_r");
                Label lbltotvac1_r = (Label)e.Row.FindControl("lbltotvac1_r");
                Label lbltotvac2_r = (Label)e.Row.FindControl("lbltotvac2_r");

                Label lbltotemp_c = (Label)e.Row.FindControl("lbltotemp_c");
                Label lblvac_c = (Label)e.Row.FindControl("lblvac_c");
                Label lbltotnonvac_c = (Label)e.Row.FindControl("lbltotnonvac_c");
                Label lbltotcovaxin_c = (Label)e.Row.FindControl("lbltotcovaxin_c");
                Label lbltotcovsheild_c = (Label)e.Row.FindControl("lbltotcovsheild_c");
                Label lbltotsputnik_c = (Label)e.Row.FindControl("lblsputnik_c");
                Label lbltototh_c = (Label)e.Row.FindControl("lbltototh_c");
                Label lbltotvac1_c = (Label)e.Row.FindControl("lbltotvac1_c");
                Label lbltotvac2_c = (Label)e.Row.FindControl("lbltotvac2_c");

                Label lblper_r = (Label)e.Row.FindControl("lblper_r");
                Label lblper_c = (Label)e.Row.FindControl("lblper_c");
                Label lblperT = (Label)e.Row.FindControl("lblperT");

                Label lblper_istr = (Label)e.Row.FindControl("lblper_istr");
                Label lblper_istc = (Label)e.Row.FindControl("lblper_istc");
                Label lblperistT = (Label)e.Row.FindControl("lblperistT");

                Label lblper_iir = (Label)e.Row.FindControl("lblper_iir");
                Label lblper_iic = (Label)e.Row.FindControl("lblper_iic");
                Label lblperiiT = (Label)e.Row.FindControl("lblperiiT");


                lbltotemp_r.Text = Convert.ToString(ViewState["totalempG_r"]);
                lblvac_r.Text = Convert.ToString(ViewState["totvacG_r"]);
                lbltotnonvac_r.Text = Convert.ToString(ViewState["totnonvacG_r"]);
                lbltotcovaxin_r.Text = Convert.ToString(ViewState["totcovaxinG_r"]);
                lbltotcovsheild_r.Text = Convert.ToString(ViewState["totcoviG_r"]);
                lbltotsputnik_r.Text = Convert.ToString(ViewState["totsputG_r"]);
                lbltototh_r.Text = Convert.ToString(ViewState["totothG_r"]);
                lbltotvac1_r.Text = Convert.ToString(ViewState["totvac1G_r"]);
                lbltotvac2_r.Text = Convert.ToString(ViewState["totvac2G_r"]);

                lbltotemp_c.Text = Convert.ToString(ViewState["totalempG_c"]);
                lblvac_c.Text = Convert.ToString(ViewState["totvacG_c"]);
                lbltotnonvac_c.Text = Convert.ToString(ViewState["totnonvacG_c"]);
                lbltotcovaxin_c.Text = Convert.ToString(ViewState["totcovaxinG_c"]);
                lbltotcovsheild_c.Text = Convert.ToString(ViewState["totcoviG_c"]);
                lbltotsputnik_c.Text = Convert.ToString(ViewState["totsputG_c"]);
                lbltototh_c.Text = Convert.ToString(ViewState["totothG_c"]);
                lbltotvac1_c.Text = Convert.ToString(ViewState["totvac1G_c"]);
                lbltotvac2_c.Text = Convert.ToString(ViewState["totvac2G_c"]);

                lbltotemp.Text = (Convert.ToInt32(ViewState["totalempG_r"]) + Convert.ToInt32(ViewState["totalempG_c"])).ToString();
                lblvac.Text = (Convert.ToInt32(ViewState["totvacG_r"]) + Convert.ToInt32(ViewState["totvacG_c"])).ToString();
                lbltotnonvac.Text = (Convert.ToInt32(ViewState["totnonvacG_r"]) + Convert.ToInt32(ViewState["totnonvacG_c"])).ToString();
                lbltotcovaxin.Text = (Convert.ToInt32(ViewState["totcovaxinG_r"]) + Convert.ToInt32(ViewState["totcovaxinG_c"])).ToString();
                lbltotcovsheild.Text = (Convert.ToInt32(ViewState["totcoviG_c"]) + Convert.ToInt32(ViewState["totcoviG_r"])).ToString();
                lbltotsputnik.Text = (Convert.ToInt32(ViewState["totsputG_r"]) + Convert.ToInt32(ViewState["totsputG_c"])).ToString();
                lbltototh.Text = (Convert.ToInt32(ViewState["totothG_r"]) + Convert.ToInt32(ViewState["totothG_c"])).ToString();
                lbltotvac1.Text = (Convert.ToInt32(ViewState["totvac1G_r"]) + Convert.ToInt32(ViewState["totvac1G_c"])).ToString();
                lbltotvac2.Text = (Convert.ToInt32(ViewState["totvac2G_r"]) + Convert.ToInt32(ViewState["totvac2G_c"])).ToString();

                perr = RoundUp(((Convert.ToDouble(ViewState["totvacG_r"]) + Convert.ToDouble(ViewState["totnonvacG_r"])) / Convert.ToDouble(ViewState["totalempG_r"])) * 100, 2);
                perc = RoundUp(((Convert.ToDouble(ViewState["totvacG_c"]) + Convert.ToDouble(ViewState["totnonvacG_c"])) / Convert.ToDouble(ViewState["totalempG_c"])) * 100, 2);
                pert = RoundUp(((Convert.ToDouble(lblvac.Text) + Convert.ToDouble(lbltotnonvac.Text)) / Convert.ToDouble(lbltotemp.Text)) * 100, 2);

                Fperr = RoundUp(((Convert.ToDouble(ViewState["totvac1G_r"])) / Convert.ToDouble(ViewState["totalempG_r"])) * 100, 2);
                Fperc = RoundUp(((Convert.ToDouble(ViewState["totvac1G_c"])) / Convert.ToDouble(ViewState["totalempG_c"])) * 100, 2);
                Fpert = RoundUp(((Convert.ToDouble(lbltotvac1.Text)) / Convert.ToDouble(lbltotemp.Text)) * 100, 2);

                Sperr = RoundUp(((Convert.ToDouble(ViewState["totvac2G_r"])) / Convert.ToDouble(ViewState["totalempG_r"])) * 100, 2);
                Sperc = RoundUp(((Convert.ToDouble(ViewState["totvac2G_c"])) / Convert.ToDouble(ViewState["totalempG_c"])) * 100, 2);
                Spert = RoundUp(((Convert.ToDouble(lbltotvac2.Text)) / Convert.ToDouble(lbltotemp.Text)) * 100, 2);

                lblper_istr.Text = Fperr.ToString();
                lblper_istc.Text = Fperc.ToString();
                lblperistT.Text = Fpert.ToString();

                lblper_iir.Text = Sperr.ToString();
                lblper_iic.Text = Sperc.ToString();
                lblperiiT.Text = Spert.ToString();


                lblper_r.Text = perr.ToString();
                lblper_c.Text = perc.ToString();
                lblperT.Text = pert.ToString();
            }
        }
        public static double RoundUp(double input, int places)
        {
            double multiplier = Math.Pow(10, Convert.ToDouble(places));
            return Math.Ceiling(input * multiplier) / multiplier;
        }
    }
}