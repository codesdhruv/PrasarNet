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


namespace PrasarNet
{
    public partial class AdminCalender : System.Web.UI.Page
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
                    //lbluser.Text = Convert.ToString(Session["UserName"]);
                    grdbind();
                    Label16.Text = Convert.ToString(Session["UserName"]);
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
        private void grdbind()
        {
            ds = cmm.RunSpReturnDSParam("PN18Calender", "PRASARNETConnectionString", new SqlParameter("@calname", ""),
                                                 new SqlParameter("@year", "0"),
                                                 new SqlParameter("@uploadby", Convert.ToString(Session["UserName"])),
                                                 new SqlParameter("@flag", "3"));
            ViewState["dscalgrd"] = ds;
            grdcalender.DataSource = ds;
            grdcalender.DataBind();
        }
        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx", false);
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            DataSet ds1 = new DataSet();
            ds1 = cmm.RunSpReturnDSParam("PN18Calender", "PRASARNETConnectionString", new SqlParameter("@calname", ""),
                                                  new SqlParameter("@year", txtyear.Text.Trim()),
                                                  new SqlParameter("@uploadby", Convert.ToString(Session["UserName"])),
                                                  new SqlParameter("@flag", "2"));

            if (ds1.Tables[0].Rows.Count == 0)
            {
                if (FileUpload1.HasFile)
                {
                    try
                    {
                        string path = "";
                        string filetype = "";
                        filetype = System.IO.Path.GetExtension(FileUpload1.FileName);
                        filetype = filetype.ToLower();
                        //string str = "select FileName from ProjectNoteMaster where RwoId='" + ID + "'";
                        string max = cmm.SelectMaxId("select isnull(max(cid),0)+1 from PN18_tblcalender", "PRASARNETConnectionString");
                        if (max == "")
                        {
                            max = "1";
                        }
                        //string img = cmm.ReturnValue(str);
                        if (filetype == ".pdf")
                        {
                            string files = "";
                            FileUpload1.SaveAs(MapPath("~/Calender/" + FileUpload1.FileName.ToString()));
                            files = FileUpload1.FileName.ToString();
                            path = Server.MapPath("~") + "\\Calender\\";
                            string Fromfile = path + files;
                            string savefile = max + "_" + txtyear.Text + filetype;
                            string Tofile = path + savefile;
                            File.Move(Fromfile, Tofile);
                            int d = cmm.RunSP("PN18Calender", "PRASARNETConnectionString", new SqlParameter("@calname", Convert.ToString(savefile)),
                                                      new SqlParameter("@year", txtyear.Text.Trim()),
                                                      new SqlParameter("@uploadby", Convert.ToString(Session["UserName"])),
                                                      new SqlParameter("@flag", "1"));
                            txtyear.Text = "";
                            if (d > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Calender Uploaded Successfully');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Only, You Can Upload the Calender in pdf format !!!! Try Again!!');", true);
                        }


                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                    }
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Pl. Attach a file !!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Same Year Calender Already Exists!!');", true);
            }
            grdbind();
        }

        protected void btncncl_Click(object sender, EventArgs e)
        {
            txtyear.Text = "";
            grdbind();
        }

        protected void grdcalender_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                GridViewRow gvr = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                int id = Convert.ToInt32(grdcalender.DataKeys[gvr.RowIndex].Value.ToString());
                ds = cmm.RunSQLReturnDS("Select calendername from PN18_tblcalender where cid=" + id, "PRASARNETConnectionString");
                string paths = Server.MapPath("~/Calender/" + ds.Tables[0].Rows[0][0].ToString());
                //Response.Redirect(paths);
                //if (ds.Tables[0].Rows[0][0].ToString() != "")
                //{
                FileInfo file = new FileInfo(paths);
                if (file.Exists)
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=PBCalender.pdf");
                    Response.WriteFile(Server.MapPath("~/Calender/" + ds.Tables[0].Rows[0][0].ToString()));
                    Response.End();
                    //Response.Write("<script>");
                    //Response.Write("window.open('" + paths + "','_blank')");
                    //Response.Write("</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('There is no Calender to download!');", true);

            }

            if (e.CommandName == "Delete")
            {
                int i = 0;
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int RowID = (int)grdcalender.DataKeys[row.RowIndex].Value;
                ds = cmm.RunSQLReturnDS("Select calendername from PN18_tblcalender where cid=" + RowID, "PRASARNETConnectionString");
                string filename = Convert.ToString(ds.Tables[0].Rows[0][0]);
                string path = Server.MapPath("~/Calender/" + filename);
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    file.Delete();
                    i = cmm.RunSql("Delete from PN18_tblcalender where cid=" + RowID, "PRASARNETConnectionString");
                }
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Calender Deleted Sucessfully!!');", true);
                    grdbind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Try Again!!');", true);
            }
        }

        protected void grdcalender_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            grdbind();
        }

        protected void grdcalender_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            grdbind();
        }

        protected void grdcalender_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcalender.PageIndex = e.NewPageIndex;
            grdcalender.DataSource = (DataSet)ViewState["dscalgrd"];
            grdcalender.DataBind();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardNew.aspx");
        }

    }
}
