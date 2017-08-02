using System;
using System.IO;
using System.Net;
using System.Text;

namespace ngpvanapi.Controllers
{
    public class ReturnObject
    {
        private string _body;
        private HttpStatusCode _code;

        public ReturnObject(HttpStatusCode code, string body)
        {
            _code = code;
            _body = body;
        }

        public HttpStatusCode Code()
        {
            return _code;
        }

        public string Body()
        {
            return _body;
        }
    }

    public class Helper
    {
        public static ReturnObject Get(string url, string username, string password)
        {
            var request = CreateRequest(url, "GET", username, password);
            return ExecuteGetRequest(request);
        }

        public static ReturnObject Post(string url, string username, string password, string serializedData)
        {
            var request = CreateRequest(url, "POST", username, password);
            return ExecutePostRequest(request, serializedData);
        }

        internal static WebRequest CreateRequest(string url, string method, string username, string password)
        {
            var request = (HttpWebRequest) WebRequest.Create(url);
            request.Method = method;
            request.Headers.Add("Authorization", GetAuthorizationHeaderValue(username, password));
            request.ContentType = "application/json";
            return request;
        }

        private static string GetAuthorizationHeaderValue(string username, string password)
        {
            var token = Convert.ToBase64String(Encoding.UTF8.GetBytes(string.Format("{0}:{1}", username, password)));
            return string.Format("Basic {0}", token);
        }

        private static ReturnObject ExecuteGetRequest(WebRequest webRequest)
        {
            HttpStatusCode responseCode;
            string responseBody;
            try
            {
                using (var response = webRequest.GetResponse() as HttpWebResponse)
                {
                    responseCode = response.StatusCode;
                    responseBody = ReadStream(response.GetResponseStream());
                    return new ReturnObject(responseCode, responseBody);
                }
            }
            catch (WebException webException)
            {
                if (webException.Response != null)
                {
                    var resp = (HttpWebResponse) webException.Response;
                    responseCode = resp.StatusCode;
                    responseBody = ReadStream(resp.GetResponseStream());
                    return new ReturnObject(responseCode, responseBody);
                }
                throw;
            }
        }

        private static ReturnObject ExecutePostRequest(WebRequest webRequest, string serializedData)
        {
            HttpStatusCode responseCode;
            string responseBody;
            try
            {
                using (var streamWriter = new StreamWriter(webRequest.GetRequestStream()))
                {
                    streamWriter.Write(serializedData);
                    streamWriter.Flush();
                    streamWriter.Close();
                    using (var response = webRequest.GetResponse() as HttpWebResponse)
                    {
                        responseCode = response.StatusCode;
                        responseBody = ReadStream(response.GetResponseStream());
                        return new ReturnObject(responseCode, responseBody);
                    }
                }
            }
            catch (WebException webException)
            {
                if (webException.Response != null)
                {
                    var resp = (HttpWebResponse) webException.Response;
                    responseCode = resp.StatusCode;
                    responseBody = ReadStream(resp.GetResponseStream());
                    return new ReturnObject(responseCode, responseBody);
                }
                throw;
            }
        }

        private static string ReadStream(Stream stream)
        {
            using (var reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }
    }
}