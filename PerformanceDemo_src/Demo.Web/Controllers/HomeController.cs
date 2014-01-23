using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Configuration;

namespace Demo.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SlowPage()
        {
            // This for loop is for demo purpose.
            for (int i = 0; i < 10; i++)
            {
                System.Threading.Thread.Sleep(1000);
            }

            return View();
        }

        public ActionResult SlowDatabasePage()
        {
            // This sql is for demo purpose.
            string sql = @"
            select COUNT(*)
            from person a
            inner join person b on a.name = b.name
            inner join person c on b.name = c.name
            inner join person d on c.name = d.name
            inner join person e on d.name = e.name
            inner join person f on e.name = f.name
            inner join person g on f.name = g.name
            inner join person h on g.name = h.name
            inner join person i on h.name = i.name
            inner join person j on i.name = j.name
            inner join person k on j.name = k.name
            ";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString()))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(sql, conn);
                object count = comm.ExecuteScalar();

                ViewBag.Count = count;
            }

            return View();
        }
    }
}
