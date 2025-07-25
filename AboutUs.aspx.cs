using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrasarNet
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imghome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/HomePage.aspx", true);
        }

    
    }
}