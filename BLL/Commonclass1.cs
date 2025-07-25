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
using System.Collections.Generic;
using System.Web.Configuration;
using System.Net.Sockets;
using RestSharp;
using PrasarNet.BLL;
using System.Security.Cryptography;
using System.Text;

namespace PrasarNet.BLL
{
    public class Commonclass1
    {
        public SqlConnection ret_conn = new SqlConnection();

        private string cnn = "";
        public Commonclass1()
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
        public string SelectMaxId(string query, string constr)
        {
            string maximumid = "";
            SqlDataReader dr = RunSqlReturnDR(query, constr);
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
        public string ReturnValue(string query, string constr)
        {
            string maximumid = "";
            SqlDataReader dr = RunSqlReturnDR(query, constr);
            while (dr.Read())
            {
                maximumid = dr[0].ToString();
            }
            dr.Close();
            return maximumid;
        }


        public SqlDataReader RunSqlReturnDR(string SQL, string constr)
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
        public DataSet RunSQLReturnDS(string strSQL, string constr)
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
        public DataSet RunSpReturnDS(string strSP, string constr)
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
        public int RunSqlReturnCount(string strSQL, string constr)
        {
            int count = 0;
            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlCommand myCommand = new SqlCommand(strSQL, cn);
            count = (int)myCommand.ExecuteScalar();
            return count;
        }
        //priyank 04 Apr 2019
        public int RunSPReturnCountParam(string strSP, string constr, params SqlParameter[] commandParameters)
        {
            int count = 0;
            //string rowe = string.Empty;
            SqlConnection cn;
            cn = OpenConnection(constr);
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p1 in commandParameters)
            {
                cmd.Parameters.Add(p1);
                p1.Direction = ParameterDirection.Input;
                //rowe = rowe + "#" + p.Value.ToString();
            }
            count = (int)cmd.ExecuteScalar();
            return count;
        }
        //vivek 21 Feb 2016 ------------
        public DataSet RunSpReturnDSParam(string strSP, string constr, params SqlParameter[] commandParameters)
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

        public DataSet RunSpRtnDsParam(string strSp, string constr, params SqlParameter[] commandPrarameters)
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

        public DataView RunSQLReturnDV(string strSQL, string constr)
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
        public int RunSql(string strSQL, string constr)
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
        public SqlDataReader RunSPReturnDR(string strSP, string constr)
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
        public int RunSP(string strSP, string constr, params SqlParameter[] commandParameters)
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

        public void bindDDL(DropDownList ddl, string StrProc, string dataText, string dataValue, string select, string constr)
        {
            DataSet ds = new DataSet();
            ds = RunSpReturnDS(StrProc, constr);
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
        public void bindDDLWidParamwithoutselect(DropDownList ddl, string StrProc, string dataText, string dataValue, string constr, params SqlParameter[] parameter)
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
            //ddl.Items.Add(new ListItem(select, ""));
            ddl.AppendDataBoundItems = true;
            ddl.DataSource = ds;
            ddl.DataTextField = dataText;
            ddl.DataValueField = dataValue;
            ddl.DataBind();
            //ddl.Items.Insert(0, "--Select--");
            CloseConnection(cn);
        }
        public void bindDDLByDataSet(DropDownList ddl, DataSet ds, string dataText, string dataValue)
        {
            ds = new DataSet();
            ddl.DataSource = ds;
            ddl.DataTextField = dataText;
            ddl.DataValueField = dataValue;
            ddl.DataBind();
            ddl.Items.Insert(0, "--Select--");
        }
        public Boolean sendMobileOTP1(string Mobstring, string msg_to_send, string msg)
        {
            try
            {
                string host = Environment.GetEnvironmentVariable("BHASH_SMSApiHost");
                string sender = Environment.GetEnvironmentVariable("BHASH_SMSApiSender");
                string user = Environment.GetEnvironmentVariable("BHASH_SMSApiUser");
                string pwd = Environment.GetEnvironmentVariable("BHASH_SMSApiPassword");


                string url = host;
                url += "?user=" + user;
                url += "&pass=" + pwd;
                url += "&sender=" + sender;
                url += "&phone=" + Mobstring;
                url += "&text=" + msg + "&priority=ndnd&stype=normal";


                //string url = "http://bhashsms.com/api/sendmsg.php?user="+ "prasarbharati";
                //url += "&pass=" + "prasarmsg@123";
                //url += "&sender=" + "PRASAR";
                //url += "&phone=" + Mobstring;
                //url += "&text=" + msg + "&priority=ndnd&stype=normal";

                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(url);
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                msg = responseString;
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public Boolean sendMobileOTP2(string Mobstring, string msg_to_send, string msg)
        {
            try
            {
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00); 
                var client = new RestSharp.RestClient("https://api.tatacommunications.com/mmx/v1/messaging/sms");
                client.Timeout = -1;
                var request = new RestSharp.RestRequest(Method.POST);
                request.AddHeader("Authorization", "Basic dGNsLUVtejF5cVE0bFBEUGhTVWZ5UE1CQkg5YXBBdjZkV25WVzk3bGx3NWo6YzMzZjM2ZGY0YTk0MjhhYTFlOWFlZDg2MmY3OTBlNmYxZWMxZTgwMWRlYWM2Mzc1ZTM0NDJmM2Y2NTUxMjA5OA==");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Cookie", "TS01d3ea36=01ad3e0a737319040c399c39276e6c675f28d37612641b6a4dcf36959a227a26b8ef2476563a47a9e3152f58958e40659fadb2960e");
                string PRASAR = "PRASAR";
                string mobile = "91" + Mobstring + "";
                string msgsend = msg;
                var body = "{\"from\":" + "\"" + PRASAR + "\",\"to\":" + "\"" + mobile + "\",\"msg\":" + "\"" + msgsend + "\"}";
                request.AddParameter("application/json", body, ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                return true;
            }

            catch (Exception ex)
            {
                return false;
                // lblresult.Text += "<br/>Oopps.. Unable to sent an OTP to your Mobile." + ex.ToString() + "<br /><br />";
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

        public DateTime dtconv(string dt)
        {
            // DateTime? dated = null;
            // dated = DateTime.ParseExact(dt, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            return (DateTime.ParseExact(dt, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture));
        }
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
        public string GetIPAddressHostName()
        {
            strHostName = Dns.GetHostName();
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            strIPAddress = addr[addr.Length - 1].ToString();
            return strIPAddress;
        }
        public string GetIp_Priyank()
        {
            string ipaddress;
            ipaddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            return ipaddress;
        }
        public static string GetLocalIPAddress()
        {

            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("No network adapters with an IPv4 address in the system!");
        }
        public bool Filecontenttypecheck(FileUpload file)
        {
            if (file.HasFile)
            {
                string fileExt =
                      System.IO.Path.GetExtension(file.FileName).ToLower();

                if (fileExt == ".doc" || fileExt == ".docx" || fileExt == ".pdf" || fileExt == ".xls" || fileExt == ".xlsx" || fileExt == ".jpg" || fileExt == ".png" || fileExt == ".jpeg")
                {
                    if (file.PostedFile.ContentType == "application/msword" || file.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document" || file.PostedFile.ContentType == "application/vnd.ms-excel" || file.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" || file.PostedFile.ContentType == "application/pdf" || file.PostedFile.ContentType == "image/jpg" || file.PostedFile.ContentType == "image/jpeg" || file.PostedFile.ContentType == "image/png")
                    {
                        System.IO.Stream fs;
                        fs = file.PostedFile.InputStream;
                        System.IO.StreamReader rs;
                        rs = new System.IO.StreamReader(fs, true);
                        string lastline = rs.ReadLine().ToString();
                        if ((file.PostedFile.ContentType.ToString() == "application/msword") & (lastline.IndexOf("MSWordDoc") > -1))
                        {
                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "application/vnd.openxmlformats-officedocument.wordprocessingml.document") & (lastline.IndexOf("docProps") > -1))
                        {
                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "application/vnd.ms-excel") & (lastline.IndexOf("Microsoft Office Excel") > -1))
                        {
                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") & (lastline.IndexOf("docProps") > -1))
                        {
                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "application/pdf") & (lastline.IndexOf("%PDF") > -1))
                        {

                            return true;
                        }


                        else if ((file.PostedFile.ContentType.ToString() == "image/jpg"))
                        {

                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "image/jpeg"))
                        {

                            return true;
                        }
                        else if ((file.PostedFile.ContentType.ToString() == "image/png"))
                        {

                            return true;
                        }

                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }

                }
                else
                {

                    return false;
                }

            }
            else
            {
                return true;
            }
        }

        public int sendemail(string appBody, string empEmail, string appSubject, string sectionName)
        {
            int w=0;
            SmtpClient _smtpClient;
            System.Net.Configuration.SmtpSection section = (System.Net.Configuration.SmtpSection)ConfigurationManager.GetSection("mailSettings/" + sectionName);
            _smtpClient = new SmtpClient();
            
            if (section != null)
            {
                if (section.Network != null)
                {
                    _smtpClient.Host = section.Network.Host;
                    _smtpClient.Port = section.Network.Port;
                    //  _smtpClient.UseDefaultCredentials = section.Network.DefaultCredentials;
                    _smtpClient.Credentials = new NetworkCredential(section.Network.UserName, section.Network.Password, section.Network.ClientDomain);
                    _smtpClient.EnableSsl = section.Network.EnableSsl;

                    if (section.Network.TargetName != null)
                        _smtpClient.TargetName = section.Network.TargetName;
                }

                _smtpClient.DeliveryMethod = section.DeliveryMethod;
                MailMessage message = new MailMessage();
                message.From = new MailAddress(section.Network.UserName);
                message.To.Add(empEmail);
                message.Subject = appSubject;
                message.Body = appBody;
                message.IsBodyHtml = true;
                
                try
                {
                    _smtpClient.Send(message);
                    w= 1;
                    return w;
                }

                catch (Exception ex)
                {
                    //+ ex.ToString() 
                    w= 0;
                    return w;
                }
            }

            return w;
        }
    }
}