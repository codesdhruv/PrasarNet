using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PEMS.BLL
{
    public class Globastic
    {
        public static string GetPass(int length)
        {
            char[] chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string Pass = string.Empty;
            Random rnd = new Random();
            for (int i = 0; i < length; i++)
            {
                int x = rnd.Next(1, chars.Length);
                {
                    if (!Pass.Contains(chars.GetValue(x).ToString()))
                    {
                        Pass += chars.GetValue(x);
                    }
                    else
                    {
                        i--;
                    }
                }
            }
            return Pass;
        }
    }
}