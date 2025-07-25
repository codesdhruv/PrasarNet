using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PrasarNet.BLL;

namespace PrasarNet
{
    public partial class Feedback_Rpt : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        string query;
        Commonclass1 cmm = new Commonclass1();
        DataSet ds11 = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Convert.ToInt32(Session["Usertype"]) == 27)
            {
                if (!IsPostBack)
                {
                    Label16.Text = Convert.ToString(Session["UserName"]);
                    Bind_Feed_All();
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }

        }

        protected void Btnfeedrpt_Click(object sender, EventArgs e)
        {
            Bind_Feed();
        }

        private void Bind_Feed()
        {
            DateTime? pinsertdt_from = null;
            DateTime? pinsertdt_to = null;
            if (Txtdtfrom.Text != "")
                pinsertdt_from = DateTime.ParseExact(Txtdtfrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //pinsertdt_from = Convert.ToDateTime(Txtdtfrom.Text);
            if (Txtdtto.Text != "")
                pinsertdt_to = DateTime.ParseExact(Txtdtto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

            ds11 = cmm.RunSpReturnDSParam("PN18_Feedbacknew2", "PRASARNETConnectionString", new SqlParameter("@ptopic", ddlfeedback.SelectedItem.Text),
                                                                                       new SqlParameter("@pinsertdt_from", pinsertdt_from),
                                                                                       new SqlParameter("@pinsertdt_to", pinsertdt_to));
            Gridrptfeed.DataSource = ds11;
            Gridrptfeed.DataBind();
            Gridrptfeed.Focus();

        }



        private void Bind_Feed_All()
        {
            DateTime? pinsertdt_from = null;
            DateTime? pinsertdt_to = null;
           
            if (Txtdtfrom.Text != "")
                pinsertdt_from = DateTime.ParseExact(Txtdtfrom.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //pinsertdt_from = Convert.ToDateTime(Txtdtfrom.Text);
            if (Txtdtto.Text != "")
                pinsertdt_to = DateTime.ParseExact(Txtdtto.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            
            ds11 = cmm.RunSpReturnDSParam("PN18_Feedbacknew2", "PRASARNETConnectionString", new SqlParameter("@ptopic", ddlfeedback.SelectedItem.Text),
                                                                                       new SqlParameter("@pinsertdt_from", pinsertdt_from),
                                                                                       new SqlParameter("@pinsertdt_to", pinsertdt_to));
            Gridrptfeed.DataSource = ds11;
            Gridrptfeed.DataBind();
            Gridrptfeed.Focus();

        }

        protected void Gridrptfeed_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridrptfeed.PageIndex = e.NewPageIndex;
            Bind_Feed_All();

        }
    }
}