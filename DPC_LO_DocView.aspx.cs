using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrasarNet
{
    public partial class DPC_LO_DocView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Session["islogin"]) != "1")
            {
                Response.Redirect("homepage.aspx");
            }
            else if (Convert.ToInt16(Session["Usertype"]) == 28 || Convert.ToInt16(Session["Usertype"]) == 29 || Convert.ToInt16(Session["Usertype"]) == 30 || Convert.ToInt16(Session["Usertype"]) == 31 || Convert.ToInt16(Session["Usertype"]) == 32
                || Convert.ToInt16(Session["Usertype"]) == 42 || Convert.ToInt16(Session["Usertype"]) == 43 || Convert.ToInt16(Session["Usertype"]) == 44 || Convert.ToInt16(Session["Usertype"]) == 45 || Convert.ToInt16(Session["Usertype"]) == 46)
            {
                if (!IsPostBack)
                {
                    Label1.Text = Convert.ToString(Session["UserName"]);
                    string i = Session["DPCLOpath"].ToString() + "?ref={0}#toolbar=0";
                    //  shareddoc.Attributes.Add("src", "D:/www/LocalUser/AirNet/UploadedDocuments/Circulars/Doc42539_01-08-2019%2017o19o29.pdf");
                    viewDPCDoc.Attributes.Add("src", i);
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {

        }
    }
}