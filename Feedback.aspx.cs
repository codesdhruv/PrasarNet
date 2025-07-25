using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrasarNet
{
    public partial class Feedback : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnsavefeedback_Click(object sender, EventArgs e)
        {
            if (ddlfeedback.SelectedIndex > 0 && TxtName.Text != "" && Txtfeedback.Text != "" && TxtMobile.Text !="")
            {
                using (SqlConnection conn = new SqlConnection(con))
                {
                    using (SqlCommand cmd = new SqlCommand("PN18_Feedbacknew", conn))
                    {

                       
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@pACTION", "feedinst");
                        cmd.Parameters.AddWithValue("@ptopic", ddlfeedback.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@pname", TxtName.Text);
                        cmd.Parameters.AddWithValue("@pemail", TxtEmail.Text);
                        cmd.Parameters.AddWithValue("@pfeedback", Txtfeedback.Text);
                        cmd.Parameters.AddWithValue("@pmobile", TxtMobile.Text);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('Feedback submitted successfully...'); window.location='" +
                            Request.ApplicationPath + "Feedback.aspx';", true);
                       
                        conn.Close();



                    }
                }
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert",
                            "alert('* mark fields are mandatory.'); window.location='" +
                            Request.ApplicationPath + "Feedback.aspx';", true);
                
            }

        }

        protected void imghome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/HomePage.aspx", true);
        }
    }
}