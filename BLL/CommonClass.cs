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

namespace PEMS.BLL
{
    public class CommonClass : System.Web.UI.Page
    {
        public SqlConnection ret_conn = new SqlConnection();

        private string cnn = "";
        public CommonClass()
        {
        }
        public SqlConnection OpenConnection(string conpar)
        {
            try
            {
                ret_conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[conpar].ConnectionString);
                ret_conn.Open();

            }
            catch
            {
                throw;
            }
            return ret_conn;
        }
        //public SqlConnection OpenConnection()
        //{
        //    try
        //    {
        //        if (cnn == string.Empty)
        //        {
        //            ret_conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //        }
        //        else
        //        {
        //            ret_conn = new SqlConnection(cnn);
        //        }
        //        ret_conn.Open();

        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //    return ret_conn;
        //}
        public void CloseConnection(SqlConnection cnn)
        {
            try
            {
                if ((cnn != null) && (cnn.State & ConnectionState.Open) == ConnectionState.Open)
                {
                    cnn.Close();
                    cnn.Dispose();
                }
            }
            catch
            {
                cnn = null;
            }

        }
        public string SelectMaxId(string query,string constr)
        {
            string maximumid = "";
            SqlDataReader dr = RunSqlReturnDR(query,constr);
            while (dr.Read())
            {
                maximumid = dr[0].ToString();
            }
            if (maximumid == "0" || maximumid == "")
            {
                maximumid = "1";
            }
            dr.Close();

            return maximumid;
        }
        public string ReturnValue(string query,string constr)
        {
            string maximumid = "";
            SqlDataReader dr = RunSqlReturnDR(query,constr);
            while (dr.Read())
            {
                maximumid = dr[0].ToString();
            }
            dr.Close();
            return maximumid;
        }


        public SqlDataReader RunSqlReturnDR(string SQL,string constr)
        {
            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(SQL, cn);
            dr = cmd.ExecuteReader();
            cmd.Dispose();
            //CloseConnection(cn);
            return dr;
        }
        public DataSet RunSQLReturnDS(string strSQL,string constr)
        {
            SqlConnection cn;
            cn = OpenConnection(constr);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, cn);
            da.Fill(ds);
            da.Dispose();
            CloseConnection(cn);
            return ds;
        }
        public DataSet RunSpReturnDS(string strSP,string constr)
        {

            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlDataAdapter sqlDa = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand = cmd;
            DataSet dsSql = new DataSet();
            sqlDa.Fill(dsSql);
            sqlDa.Dispose();
            CloseConnection(cn);
            return dsSql;

        }
        public int RunSqlReturnCount(string strSQL,string constr)
        {
            int count = 0;
            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlCommand myCommand = new SqlCommand(strSQL, cn);
            count = (int)myCommand.ExecuteScalar();
            return count;
        }
        //vivek 21 Feb 2016 ------------
        public DataSet RunSpReturnDSParam(string strSP,string constr, params SqlParameter[] commandParameters)
        {
            //string rowe = string.Empty;
            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlDataAdapter sqlDa = new SqlDataAdapter();
            DataSet dsSql = new DataSet();
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            //
            //SqlParameter p;
            foreach (SqlParameter p1 in commandParameters)
            {
                cmd.Parameters.Add(p1);
                p1.Direction = ParameterDirection.Input;
                //rowe = rowe + "#" + p.Value.ToString();
            }

            sqlDa.SelectCommand = cmd;
            //cmd.Dispose();        

            sqlDa.Fill(dsSql);
            cmd.CommandTimeout = cn.ConnectionTimeout;
            sqlDa.Dispose();
            cn.Close();
            return dsSql;

        }

        public DataSet RunSpRtnDsParam(string strSp,string constr, params SqlParameter[] commandPrarameters)
        {
            SqlConnection cn;
            cn = OpenConnection(constr);
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand(strSp, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p1 in commandPrarameters)
            {
                cmd.Parameters.Add(p1);
                p1.Direction = ParameterDirection.Input;
            }
            cmd.CommandTimeout = cn.ConnectionTimeout;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);
            da.Dispose();
            CloseConnection(cn);
            return ds;
        }

        public DataView RunSQLReturnDV(string strSQL,string constr)
        {
            SqlConnection cn;
            cn = OpenConnection(constr);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, cn);
            da.Fill(ds);
            da.Dispose();
            CloseConnection(cn);
            return ds.Tables[0].DefaultView;
        }
        public int RunSql(string strSQL,string constr)
        {
            SqlConnection cn;
            cn = OpenConnection(constr);
            int objRowsAffected = 0;
            try
            {
                SqlCommand sqlComm = new SqlCommand(strSQL, cn);
                objRowsAffected = sqlComm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            CloseConnection(cn);
            return objRowsAffected;

        }
        public SqlDataReader RunSPReturnDR(string strSP,string constr)
        {
            SqlConnection cn = OpenConnection(constr);
            SqlDataReader rdr;
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Dispose();
            CloseConnection(cn);
            return rdr;
        }
        public int RunSP(string strSP,string constr, params SqlParameter[] commandParameters)
        {
            int Roweffect = 0;
            //string rowe = "";
            SqlConnection cn = OpenConnection(constr);
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p;
            foreach (SqlParameter p1 in commandParameters)
            {
                p = cmd.Parameters.Add(p1);
                p.Direction = ParameterDirection.Input;
                // rowe = rowe + "#" + p.Value.ToString();
            }

            Roweffect = cmd.ExecuteNonQuery();
            cmd.Dispose();
            CloseConnection(cn);
            return Roweffect;

        }

        public void bindDDL(DropDownList ddl, string StrProc, string dataText, string dataValue, string select,string constr)
        {
            DataSet ds = new DataSet();
            ds = RunSpReturnDS(StrProc,constr);
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem(select, ""));
            ddl.AppendDataBoundItems = true;
            ddl.DataSource = ds;
            ddl.DataTextField = dataText;
            ddl.DataValueField = dataValue;
            ddl.DataBind();

            //ddl.Items.Insert(0, "--Select--");
        }

        public void bindDDLWidParam(DropDownList ddl, string StrProc, string dataText, string dataValue, string constr, string select, params SqlParameter[] parameter)
        {

            SqlConnection cn;
            cn = OpenConnection(constr);
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand(StrProc, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p1 in parameter)
            {
                cmd.Parameters.Add(p1);
                p1.Direction = ParameterDirection.Input;
            }
            cmd.CommandTimeout = cn.ConnectionTimeout;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);
            da.Dispose();
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem(select, ""));
            ddl.AppendDataBoundItems = true;
            ddl.DataSource = ds;
            ddl.DataTextField = dataText;
            ddl.DataValueField = dataValue;
            ddl.DataBind();
            //ddl.Items.Insert(0, "--Select--");
            CloseConnection(cn);
        }

        //public void bindDDLByDataSet(DropDownList ddl, DataSet ds, string dataText, string dataValue)
        //{
        //    ds = new DataSet();
        //    ddl.DataSource = ds;
        //    ddl.DataTextField = dataText;
        //    ddl.DataValueField = dataValue;
        //    ddl.DataBind();
        //    ddl.Items.Insert(0, "--Select--");
        //}


        public void fileUpload(FileUpload fUp, string TableName, string ColmName, string whereClouse, string FolderN, string SubfolderN, string SessionName, string ids,string constr)
        {
            if (fUp.HasFile)
            {
                try
                {

                    string path = "";
                    string filetype = "";
                    filetype = System.IO.Path.GetExtension(fUp.FileName);
                    filetype = filetype.ToLower();

                    //string str = "select ImageName from TeacherProfile where T_Id='" + ID + "'";
                    string str = "select " + ColmName + " from " + TableName + "  where " + whereClouse + "='" + ids + "'";
                    string max = SelectMaxId("select max(" + whereClouse + ")+1 from " + TableName,constr);
                    string img = ReturnValue(str,constr);
                    if (filetype == ".bmp" || filetype == ".jpeg" || filetype == ".jpg" || filetype == ".gif" || filetype == ".png" || filetype == ".tif" || filetype == ".ico" || filetype == ".wmf" || filetype == ".pdf")
                    {
                        string pathBuilder = "~/" + FolderN + "/" + SubfolderN + "/" + fUp.FileName.ToString();
                        string files = "";
                        fUp.SaveAs(MapPath(pathBuilder));
                        files = fUp.FileName.ToString();
                        path = Server.MapPath("~") + "\\" + FolderN + "\\" + SubfolderN + "\\";
                        string Fromfile = path + files;
                        //string savefile = max + Globastic.GetPass(10) + filetype;
                        string savefile = max;
                        string Tofile = path + savefile;
                        //Session["SessionName"] = savefile;
                        Session["" + SessionName + ""] = savefile;
                        File.Move(Fromfile, Tofile);
                        //ImageButton1.ImageUrl = "~/Administrator/DynamicTeacherProfile/" + savefile;
                        //if (img != "")
                        //{
                        //    string stdel = Server.MapPath("~/Administrator/DynamicTeacherProfile/" + img);
                        //    File.Delete(stdel);
                        //}

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Please Select Image File!');", true);
                    }

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('" + ex.Message + "');", true);
                }
            }
        }

        public void deleteTextFile(string filename, string folder)
        {


            //string k1 = Server.MapPath(folder);
            //k1 = k1 + "\\" + filename + ".txt";
            //FileInfo fi = new FileInfo(k1);
            //fi.Delete();
        }
        public void createtextfile(string filenames, string textvalue, string folders)
        {
            //FileStream fs = null; ;
            //string k1 = Server.MapPath(folders);
            //k1 = k1 + "\\" + filenames + ".txt";
            //FileInfo fi = new FileInfo(k1);
            //if (!File.Exists(k1))
            //{
            //    using (fs = File.Create(k1))
            //    {
            //    }

            //}
            //if (File.Exists(k1))
            //{
            //    using (StreamWriter sw = new StreamWriter(k1))
            //    {
            //        sw.Write(textvalue);
            //        sw.Close();
            //    }
            //}
            //FileStream fstr = File.Create(k1);
            //fstr.Close();
            //StreamWriter strm = new StreamWriter(k1);
            //strm.Write(textvalue);
            //strm.Close();
        }
        //public string Readtxtfile(string id, string folders)
        //{
        //    //string filename = "";
        //    //string k2 = Server.MapPath(folders);

        //    //k2 = k2 + "\\" + id + ".txt";
        //    //StreamReader re = File.OpenText(k2);
        //    //string inputext = null;
        //    //string Cnotevalue = null;

        //    //while ((inputext = re.ReadLine()) != null)
        //    //{

        //    //    Console.WriteLine(inputext);
        //    //    Cnotevalue = Cnotevalue + "\n" + inputext;
        //    //}
        //    //filename = Cnotevalue;

        //    //re.Close();
        //    //return filename;
        //}
        public Boolean SendMail(string strFrom, string strTo, string strSubject, string strBody)
        {
            try
            {

                MailMessage message = new MailMessage();
                System.Net.Mail.SmtpClient smtpClient = new SmtpClient();
                MailAddress fromAddress = new MailAddress(strFrom);
                message.From = fromAddress;
                message.To.Add(strTo);
                message.Subject = strSubject;
                message.IsBodyHtml = true;
                message.Body = strBody;
                smtpClient.Host = "smptl.gmail.com";
                smtpClient.Port = 587;
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = new NetworkCredential(strFrom, "*********");
                smtpClient.Send(message);
                return true;

            }
            catch (Exception ex)
            {
                //Response.Write(ex);
                return false;
            }
        }
        static string strHostName, strIPAddress = string.Empty;
        protected void GetIPAddressHostName()
        {

            strHostName = Dns.GetHostName();
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            strIPAddress = addr[addr.Length - 1].ToString();
        }

    }
}