using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using PrasarNet.BLL;
using Path = System.IO.Path;
namespace PrasarNet.CommonDPC
{


    public partial class Listupload1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridviewDPCList();
                Commonclass1 cmm = new Commonclass1();
                if ((Convert.ToInt32(Session["Orgid"]) == 4) || (Convert.ToInt32(Session["Usertype"]) == 28))// Only Zonal Ofices can use  the Common DPC Reports
                {
                    DataSet dsstnadg = new DataSet();

                    dsstnadg = cmm.RunSpReturnDSParam("PN18_ADGEoffices", "PRASARNETConnectionString", new SqlParameter("@stationid", Convert.ToInt32(Session["Station_SectionID"])),
                                                                                                new SqlParameter("@flag", "1"));// Only ADGE office
                    if (dsstnadg.Tables[0].Rows.Count > 0)
                    {
                        BindGridviewDPCList();
                        BindGridview();
                        BindGridviewPB();
                    }
                    else if (Convert.ToInt32(Session["Usertype"]) == 28)
                    {
                        BindGridviewDPCList();
                        BindGridview();
                        BindGridviewPB();
                    }


                    else
                    {

                        Response.Redirect("~/dashboardnew.aspx");

                    }

                }
                else
                {

                    Response.Redirect("~/Login.aspx");

                }
            }
        }

        private void BindGridviewDPCList()
        {
            string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllDPCEmployee", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", 5);
                cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Station_SectionID"]));
                con.Open();
                grdDPCdetails.DataSource = cmd.ExecuteReader();
                // grdDPCdetails.ShowHeader = true;
                grdDPCdetails.DataBind();
            }
        }
        protected void btnDPCcreate_Click(string Descr, String postname)
        {
            int customerId;
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                String query = "spGetAllDPCEmployee";
                // query += " SELECT SCOPE_IDENTITY()";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@description", Descr);
                    cmd.Parameters.AddWithValue("@postname", postname);
                    cmd.Parameters.AddWithValue("@flag", 3);
                    cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Station_SectionID"]));
                    cmd.Connection = con;
                    con.Open();
                    customerId = Convert.ToInt32(cmd.ExecuteScalar());

                    Session["DPCdesc"] = Descr;
                    Session["DPCId"] = customerId;
                    con.Close();
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('DPC Details Added: " + Descr + "');", true);
            BindGridviewDPCList();
        }



        protected int btnDPCExcelUpload(string excelName, string excelfor, int DPCID)
        {
            int excelinsid = 0;
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                String query = "spGetAllDPCEmployee";
                // query += " SELECT SCOPE_IDENTITY()";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ExcelName", excelName);
                    cmd.Parameters.AddWithValue("@DPCid", DPCID);
                    cmd.Parameters.AddWithValue("@ExcelFor", excelfor);
                    cmd.Parameters.AddWithValue("@flag", 4);
                    cmd.Connection = con;
                    con.Open();
                    excelinsid = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    return excelinsid;
                }
            }
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Inserted Customer ID: " + customerId + "');", true);
            //grdDPCdetails.DataBind();
        }
        protected void lbdesc_Click(object sender, EventArgs e)
        {
            cleardetails();
            lblMessage.Focus();
            LinkButton lb = (LinkButton)sender;

            Session["DPCdesc"] = lb.Text;
            Session["DPCId"] = lb.CommandArgument;

            divuploadexcel.Visible = true;
            if (btnGenerateList.Enabled == true)
            {
                btnGenerateList.Focus();
            }
            else
            {
                FileUpload1.Focus();
            }


            lbluploadexceltext.Text = "DPC Description ::: " + Session["DPCdesc"].ToString();
            commodpccheck(Convert.ToInt32(Session["DPCId"]));

        }

        private void BindGridview()
        {
            string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllDPCEmployee", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", 1);
                cmd.Parameters.AddWithValue("@DPCid", Convert.ToInt32(Session["DPCId"]));

                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();

                GridView1.DataBind();
            }
        }
        private void BindGridviewPB()
        {
            string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllDPCEmployee", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", 2);

                cmd.Parameters.AddWithValue("@DPCid", Convert.ToInt32(Session["DPCId"]));
                con.Open();
                GridView2.DataSource = cmd.ExecuteReader();

                GridView2.DataBind();
            }
        }
        //protected void PageIndexChanging(object sender, GridViewPageEventArgs e)

        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    this.BindGridview();
        //}
        protected void btnUploadPB_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                try
                {
                    string FileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

                    string Extension = Path.GetExtension(FileUpload2.PostedFile.FileName);

                    //string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                    //tring FolderPath = ("~/Files/");

                    FileName = Session["DPCdesc"].ToString() + "_PB_" + DateTime.Now.ToString("yyyyMMddHHmmss") + Extension;
                    //string FilePath = Server.MapPath(FolderPath + FileName);
                    string FilePath = Server.MapPath("~/CommonDPC/Files/" + FileName);
                    FileUpload2.SaveAs(FilePath);

                    int excelid = btnDPCExcelUpload(FileName, "PB", Convert.ToInt32(Session["DPCId"]));

                    //string path = string.Concat(Server.MapPath("~/UploadFile/" + FileUpload1.FileName));
                    //FileUpload1.SaveAs(path);
                    // Connection String to Excel Workbook  
                    //string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);

                    string conStr = "";

                    switch (Extension)

                    {

                        case ".xls": //Excel 97-03

                            conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]

                                     .ConnectionString;

                            break;

                        case ".xlsx": //Excel 07

                            conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]

                                      .ConnectionString;

                            break;

                    }
                    string header = "Yes";
                    conStr = String.Format(conStr, FilePath, header);

                    OleDbConnection connExcel = new OleDbConnection(conStr);

                    OleDbCommand cmdExcel = new OleDbCommand();

                    OleDbDataAdapter oda = new OleDbDataAdapter();

                    DataTable dt = new DataTable();

                    cmdExcel.Connection = connExcel;



                    //Get the name of First Sheet

                    connExcel.Open();

                    DataTable dtExcelSchema;

                    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                    string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

                    connExcel.Close();



                    //Read Data from First Sheet

                    connExcel.Open();

                    cmdExcel.CommandText = "SELECT [SNO],[NAME],[EMPNO],[DOB(yyyy-mm-dd)],[Date of Joining Service(yyyy-mm-dd)],[Date of Joining Post in the Zone(yyyy-mm-dd)],[CAT],[STATION],[REMARKS],[HRISCode] From [" + SheetName + "]";
                    //cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";

                    //oda.SelectCommand = cmdExcel;

                    //oda.Fill(dt);



                    DbDataReader dr = cmdExcel.ExecuteReader();
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr);
                    string emptype = "PB";
                    dt1.Columns.Add("EmpType", typeof(string));
                    //dt1.Columns.Add("DPCExcelId", typeof(int),excelid.ToString());
                    dt1.Columns.Add("DPCExcelId", typeof(int));

                    //

                    foreach (DataRow row in dt1.Rows)
                    {
                        row["EmpType"] = emptype.ToString(); // Setting default value
                        row["DPCExcelId"] = excelid.ToString(); // Setting default value
                    }

                    //
                    // SQL Server Connection String  
                    string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                    // Bulk Copy to SQL Server   
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                    bulkInsert.DestinationTableName = "DPCEmployeeList1";
                    bulkInsert.WriteToServer(dt1);

                    connExcel.Close();
                    BindGridviewPB();
                    lblmessagepb.Text = "Your file uploaded successfully";
                    lblmessagepb.ForeColor = System.Drawing.Color.Green;
                    commodpccheck(Convert.ToInt32(Session["DPCid"]));

                    //using (OleDbConnection con = new OleDbConnection(conStr))
                    //{

                    //    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", con);
                    //    con.Open();
                    //    // Create DbDataReader to Data Worksheet  
                    //    DbDataReader dr = cmd.ExecuteReader();
                    //    // SQL Server Connection String  
                    //    string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                    //    // Bulk Copy to SQL Server   
                    //    SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                    //    bulkInsert.DestinationTableName = "Employee";
                    //    bulkInsert.WriteToServer(dr);
                    //    BindGridview();
                    //    lblMessage.Text = "Your file uploaded successfully";
                    //    lblMessage.ForeColor = System.Drawing.Color.Green;
                    //}
                }
                catch (Exception ex)
                {
                    lblmessagepb.Text = "Your file not uploaded" + ex.ToString();
                    lblmessagepb.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                    //string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                    //string FolderPath = Server.MapPath("~/Files/") ;

                    FileName = Session["DPCdesc"].ToString() + "_DD_" + DateTime.Now.ToString("yyyyMMddHHmmss") + Extension;
                    //string FilePath = Server.MapPath(FolderPath + FileName);
                    string FilePath = Server.MapPath("~/CommonDPC/Files/" + FileName);
                    FileUpload1.SaveAs(FilePath);
                    int excelid = btnDPCExcelUpload(FileName, "DD", Convert.ToInt32(Session["DPCId"]));


                    //string path = string.Concat(Server.MapPath("~/UploadFile/" + FileUpload1.FileName));
                    //FileUpload1.SaveAs(path);
                    // Connection String to Excel Workbook  
                    //string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);

                    string conStr = "";

                    switch (Extension)

                    {

                        case ".xls": //Excel 97-03

                            conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]

                                     .ConnectionString;

                            break;

                        case ".xlsx": //Excel 07

                            conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]

                                      .ConnectionString;

                            break;

                    }
                    string header = "Yes";
                    conStr = String.Format(conStr, FilePath, header);

                    OleDbConnection connExcel = new OleDbConnection(conStr);

                    OleDbCommand cmdExcel = new OleDbCommand();

                    OleDbDataAdapter oda = new OleDbDataAdapter();

                    DataTable dt = new DataTable();

                    cmdExcel.Connection = connExcel;

                    //Get the name of First Sheet

                    connExcel.Open();

                    DataTable dtExcelSchema;

                    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                    string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

                    connExcel.Close();
                    //Read Data from First Sheet

                    connExcel.Open();


                    cmdExcel.CommandText = "SELECT [SNO],[NAME],[EMPNO],[DOB(yyyy-mm-dd)],[Date of Joining Service(yyyy-mm-dd)],[Date of Joining Post in the Zone(yyyy-mm-dd)],[CAT],[STATION],[REMARKS],[HRISCode] From [" + SheetName + "]";
                    //cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";

                    
                    //oda.SelectCommand = cmdExcel;
                    //oda.Fill(dt);


                    DbDataReader dr = cmdExcel.ExecuteReader();
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr);
                    string emptype = "DD";
                    dt1.Columns.Add("EmpType", typeof(string));
                    //dt1.Columns.Add("DPCExcelId", typeof(int),excelid.ToString());
                    dt1.Columns.Add("DPCExcelId", typeof(int));

                    //

                    foreach (DataRow row in dt1.Rows)
                    {
                        row["EmpType"] = emptype.ToString(); // Setting default value
                        row["DPCExcelId"] = excelid.ToString(); // Setting default value
                    }

                    // SQL Server Connection String  
                    string CS = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
                    // Bulk Copy to SQL Server   
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                    bulkInsert.DestinationTableName = "DPCEmployeeList1";
                    //bulkInsert.WriteToServer(dr);
                    bulkInsert.WriteToServer(dt1);


                    connExcel.Close();
                    BindGridview();
                    lblMessage.Text = "Your file uploaded successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;


                    commodpccheck(Convert.ToInt32(Session["DPCid"]));


                }
                catch (Exception ex)
                {

                    lblMessage.Text = "Your file not uploaded" + ex.ToString();
                    lblMessage.ForeColor = System.Drawing.Color.Red;



                }
            }

        }
        protected void cleardetails()
        {
            lblMessage.Text = "";
            lblmessagepb.Text = "";
            
        }
        protected void btnaddaDPC_Click(object sender, EventArgs e)
        {
            try
            {
                btnDPCcreate_Click(txtdpcdescr.Text, txtPostName.Text);
                lbldpcdsr.Text = "Upload Excel for DPC: " + txtdpcdescr.Text + " & the post : " + txtPostName.Text; ;
                //  lbldpcpost.Text = txtPostName.Text;

                divdpcdscr.Visible = true;
                divaddadpc.Visible = false;
                divuploadexcel.Visible = true;
            }
            catch (Exception ex)
            {
                divdpcdscr.Visible = false;
                divaddadpc.Visible = true;
                divuploadexcel.Visible = false;
            }

        }

        protected void grdDPCdetails_OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells.RemoveAt(1);
                e.Row.Cells.RemoveAt(2);
                e.Row.Cells.RemoveAt(3);

                e.Row.Cells[0].Width = 1000;
                e.Row.Cells[0].ColumnSpan = 4;
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblsno = (Label)e.Row.FindControl("lblsno");
                Label lbldd = (Label)e.Row.FindControl("lbldd");
                Label lblpb = (Label)e.Row.FindControl("lblpb");
                Label lblcommon = (Label)e.Row.FindControl("lblcommon");

                LinkButton lbddexcel = (LinkButton)e.Row.FindControl("lbddexcel");
                LinkButton lbpbexcel = (LinkButton)e.Row.FindControl("lbpbexcel");
                LinkButton lbcommonexcel = (LinkButton)e.Row.FindControl("lbcommonexcel");
                if (lblsno.Text == "0")
                {
                    e.Row.Visible = false;
                }
                if (lbldd.Text == "No")
                {
                    lbddexcel.Enabled = false;
                    lbddexcel.Text = "File not uploaded";
                    lbddexcel.CssClass = "bg-danger";
                }
                if (lblpb.Text == "No")
                {
                    lbpbexcel.Enabled = false;
                    lbpbexcel.Text = "File not uploaded";
                    lbpbexcel.CssClass = "bg-danger";

                }
                if (lblcommon.Text == "No")
                {
                    lbcommonexcel.Enabled = false;
                    lbcommonexcel.Text = "List not generated";
                    lbcommonexcel.CssClass = "bg-info";

                }


            }

        }
        protected void btnDPCGenerate(int dpcid)
        {
            int customerId;
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                String query = "spGetAllDPCEmployee";
                // query += " SELECT SCOPE_IDENTITY()";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DPCid", dpcid);
                    cmd.Parameters.AddWithValue("@flag", 6);
                    cmd.Connection = con;
                    con.Open();
                    customerId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('List Generated');", true);
            BindGridviewDPCList();
            commodpccheck(Convert.ToInt32(Session["DPCid"]));
            divprvdpc.Visible = true;
            divnewdpc.Visible = false;
            clearuploads();
        }

        protected void clearuploads()
        {
            lblMessage.Text = "";
            lblmessagepb.Text = "";
            txtdpcdescr.Text = "";
            txtPostName.Text = "";

        }
        protected void btnGenerateList_Click(object sender, EventArgs e)
        {
            btnDPCGenerate(Convert.ToInt32(Session["DPCId"]));
            BindGridviewDPCList();
        }

        protected void commodpccheck(int dpcid)
        {
            int customerId;
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                String query = "spGetAllDPCEmployee";
                // query += " SELECT SCOPE_IDENTITY()";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DPCid", dpcid);
                    cmd.Parameters.AddWithValue("@flag", 7);
                    cmd.Connection = con;
                    con.Open();
                    customerId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }

                if (customerId == 3) //DD excel Check
                {
                    btnGenerateList.Enabled = false;
                    btnGenerateList.Text = "Upload Deemed Dep. Employees Excel";
                    //btnGenerateList.BackColor = System.Drawing.Color.PaleVioletRed;
                    //divuploadpbexcel.Visible = false;


                }
                else if (customerId == 4) //PB excel Check
                {
                    btnGenerateList.Enabled = false;
                    btnGenerateList.Text = "Upload PB Employees Excel";
                    //btnGenerateList.BackColor = System.Drawing.Color.PaleGreen;
                    //divuploadddexcel.Visible = false;


                }
                else if (customerId == 1)
                {
                    btnGenerateList.Enabled = false;
                    btnGenerateList.Text = "Common DPC has been Generated already";
                    //btnGenerateList.BackColor = System.Drawing.Color.GreenYellow;
                }
                else
                {

                    btnGenerateList.Enabled = true;
                    btnGenerateList.Text = "Generate Common DPC List";
                    // btnGenerateList.BackColor = System.Drawing.Color.LightGoldenrodYellow;
                }
            }
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('List Generated');", true);
            //BindGridviewDPCList();
        }

        protected void ExportExcel(int dpcid, int flag)
        {
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {


                DataSet ds = new DataSet();

                using (SqlCommand cmd = new SqlCommand())
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        cmd.CommandText = "[spGetAllDPCEmployee]";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@flag", flag));
                        cmd.Parameters.Add(new SqlParameter("@DPCid", dpcid));

                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            using (XLWorkbook wb = new XLWorkbook())
                            {
                                wb.Worksheets.Add(dt, "Employees");

                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                if (flag == 1)
                                {
                                    Response.AddHeader("content-disposition", "attachment;filename=DDE_excelList.xlsx");
                                }
                                else if (flag == 2)
                                {
                                    Response.AddHeader("content-disposition", "attachment;filename=PBE_excelList.xlsx");
                                }
                                else if (flag == 8)
                                {
                                    Response.AddHeader("content-disposition", "attachment;filename=commonSE_excelList.xlsx");
                                }
                                using (MemoryStream MyMemoryStream = new MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void lbexcel_Click(object sender, EventArgs e)
        {

            LinkButton lb = (LinkButton)sender;
            int dpcid = Convert.ToInt32(lb.CommandArgument);
            
            if (lb.Text == "File Uploaded-1")
            {
                ExportExcel(dpcid, 1);
            }
            
            if (lb.Text == "File Uploaded-2")
            {
                ExportExcel(dpcid, 2);
            }
            
            if (lb.Text == "Download File")
            {
                ExportExcel(dpcid, 8);
            }
        }


        protected void grdDPCdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddaDPC")
            {
                GridViewRow footerRow = grdDPCdetails.FooterRow;
                TextBox txt = (TextBox)footerRow.FindControl("txtDPCcreate");

                btnDPCcreate_Click(txt.Text, "");

            }
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DashBoardNew.aspx", true);
        }
        protected void exporttoexcelsample(int flag)
        {
            string constr = ConfigurationManager.ConnectionStrings["PRASARNETConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {


                DataSet ds = new DataSet();

                using (SqlCommand cmd = new SqlCommand())
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        cmd.CommandText = "[spGetAllDPCEmployee]";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@flag", flag));


                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            using (XLWorkbook wb = new XLWorkbook())
                            {
                                wb.Worksheets.Add(dt, "Employees");

                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";


                                Response.AddHeader("content-disposition", "attachment;filename=Templateexcel.xlsx");
                                using (MemoryStream MyMemoryStream = new MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                    }
                }
            }
        }
        protected void exporttoexcelsample(object sender, EventArgs e)
        {
            exporttoexcelsample(9);
        }
        protected void btntotal_Click(object sender, EventArgs e)
        {
            exporttoexcelsample(9);
        }
        protected void btnprv_Click(object sender, EventArgs e)
        {
            divprvdpc.Visible = true;
            divnewdpc.Visible = false;
            divuploadexcel.Visible = false;
            clearuploads();
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            divprvdpc.Visible = false;
            divnewdpc.Visible = true;
            divaddadpc.Visible = true;
            divdpcdscr.Visible = false;
            divuploadexcel.Visible = false;
            clearuploads();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            divprvdpc.Visible = false;
            divnewdpc.Visible = false;
            divaddadpc.Visible = false;
            divdpcdscr.Visible = false;
            divuploadexcel.Visible = false;
            clearuploads();
        }
    }
}




