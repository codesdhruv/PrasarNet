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
    public partial class PBHS_Action : System.Web.UI.Page
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
                    int noofactions_pending = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 10),
                                                                                                  new SqlParameter("@dealingOffc", offc_empid),
                                                                                                  new SqlParameter("@dealingUsertypeid", Convert.ToInt16(Session["Usertype"])));
                    lblactiontobetaken.Text = "(" + noofactions_pending.ToString() + "-Pending)";

                    //------End-------------------------//

                    int noofactions_taken = cmm.RunSPReturnCountParam("PN22_PBHS_Reports", "PRASARNETConnectionString", new SqlParameter("@flag", 11),
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

        protected void lnknewapplication_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/DashBoard_PBHS.aspx", true);
        }

        protected void lnktakeanaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/PBHS_Verify_Action.aspx", true);
        }

        protected void lnk_actiontaken__Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PBHS/App_ActionTaken.aspx", true);
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../DashBoardNew.aspx", true);
        }

        protected void lnkdownload_Click(object sender, EventArgs e)
        {
            string paths = Server.MapPath("~/PBHS/Download/PBHS_User_Manual.pdf");
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + "PrasarNet_PBHS_User_Manual.pdf" + "\"");
            byte[] data = req.DownloadData(paths);
            response.BinaryWrite(data);
            response.End();
        }
    }
}