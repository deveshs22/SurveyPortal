using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;

namespace HPPortal.Web
{
    public static class UtilityBL
    {
        public static string Encrypt(string toEncrypt, bool useHashing)
        {
            byte[] keyArray;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            //System.Windows.Forms.MessageBox.Show(key);
            //If hashing use get hashcode regards to your key
            string key = @"SecurityKey";

            if (useHashing)
            {
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //Always release the resources and flush data
                // of the Cryptographic service provide. Best Practice

                hashmd5.Clear();
            }
            else
                keyArray = UTF8Encoding.UTF8.GetBytes(key);

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes.
            //We choose ECB(Electronic code Book)
            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)

            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();
            //transform the specified region of bytes array to resultArray
            byte[] resultArray =
              cTransform.TransformFinalBlock(toEncryptArray, 0,
              toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor
            tdes.Clear();
            //Return the encrypted data into unreadable string format
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }

        public static string Decrypt(string cipherString, bool useHashing)
        {
            byte[] keyArray;
            //get the byte code of the string

            byte[] toEncryptArray = Convert.FromBase64String(cipherString);

            //Get your key from config file to open the lock!
            string key = @"SecurityKey";

            if (useHashing)
            {
                //if hashing was used get the hash code with regards to your key
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //release any resource held by the MD5CryptoServiceProvider

                hashmd5.Clear();
            }
            else
            {
                //if hashing was not implemented get the byte code of the key
                keyArray = UTF8Encoding.UTF8.GetBytes(key);
            }

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes. 
            //We choose ECB(Electronic code Book)

            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateDecryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(
                                 toEncryptArray, 0, toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor                
            tdes.Clear();
            //return the Clear decrypted TEXT
            return UTF8Encoding.UTF8.GetString(resultArray);
        }

       public static IDictionary<int, string> FinalColorList()
        {
            string[] allColors = Enum.GetNames(typeof(System.Drawing.KnownColor));
            string[] systemEnvironmentColors =
                new string[(
                typeof(System.Drawing.SystemColors)).GetProperties().Length];

            int index = 0;

            foreach (MemberInfo member in (
                typeof(System.Drawing.SystemColors)).GetProperties())
            {
                systemEnvironmentColors[index++] = member.Name;
            }

            List<string> finalColorList = new List<string>();
            var dictionary = new Dictionary<int, string>();
            var count = 0;
            foreach (string color in allColors)
            {
                count++;
                if (Array.IndexOf(systemEnvironmentColors, color) < 0)
                {
                    //  finalColorList.Add(color);
                    dictionary.Add(count, color);
                }
            }
            return dictionary;
        }

        public enum SectionType
        {
            Patient = 1,
            Doctor = 2            
        }

        public enum Mode
        {
            None=0,
            Entry =1,
            ApproveMode = 2,
            ViewMode = 3
        }

        public static IDictionary<int, string> GetAll<TEnum>() where TEnum : struct
        {
            var enumerationType = typeof(TEnum);

            if (!enumerationType.IsEnum)
                throw new ArgumentException("Enumeration type is expected.");

            var dictionary = new Dictionary<int, string>();

            foreach (int value in Enum.GetValues(enumerationType))
            {
                var name = Enum.GetName(enumerationType, value);
                dictionary.Add(value, name);
            }

            return dictionary;
        }

        public static void Alert(string message, Page page)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(),
           "err_msg",
           "alert('" + message + "');",
           true);
        }
        public static void OpenWindow(string url, Page page)
        {
            string redirect = "<script>window.open('" + url + "','_blank','toolbar=no,location=no,directories=no,status=no,menub ar=no,');</script>";
            HttpContext.Current.Response.Write(redirect);
        }

        public static void AlertAndRedirect(Page instance, string Message, string url)
        {
            instance.Response.Write(@"<script language='javascript'>alert('" + Message + "');document.location.href='" + url + "'; </script>");
        }

    }
}