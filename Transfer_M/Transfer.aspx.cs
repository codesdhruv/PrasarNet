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


namespace PrasarNet.Transfer_M
{
    public partial class Transfer : System.Web.UI.Page
    {
        Commonclass1 cmm = new Commonclass1();
        DataSet ds = new DataSet();
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
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    if (Convert.ToInt16(Session["Usertype"]) == 10)// employee
                    {
                        empmenu.Visible = true;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;

                    }
                    else
                    {
                        empmenu.Visible = false;
                        StationSectionMenu.Visible = false;
                        AdminMenu.Visible = false;
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
                    int noofactions_pending = cmm.RunSPReturnCountParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 14),
                                                                                                  new SqlParameter("@dealingOffc", offc_empid),
                                                                                                  new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
                    lblactiontobetaken.Text = "(" + noofactions_pending.ToString() + "-Pending)";

                    //------End-------------------------//
                    int noofactions_taken = cmm.RunSPReturnCountParam("PN21_trans_Action", "PRASARNETConnectionString", new SqlParameter("@flag", 15),
                                                                                          new SqlParameter("@dealingOffc", offc_empid),
                                                                                          new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
                    lblactionalreadytaken.Text = "(" + noofactions_taken.ToString() + "-Action Taken)";
                    //---- No of Actions already been taken---//



                    //------End-------------------------//


                }
            }
            else
            {
                Response.Redirect("../Logout.aspx");
            }
        }


        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx");
        }

        protected void lnktakeanaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/TransferApp_ActionN.aspx");
        }

        protected void lnknewapplication_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/DashBoard_T.aspx", true);
        }

        protected void lnk_actiontaken__Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transfer_M/App_ActionTaken.aspx", true);
        }

        protected void lnkdownload_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/Transfer_M/Download/TransferModule_FinalManual.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "PrasarNet_TransferMod_HelpBook.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }
    }
}