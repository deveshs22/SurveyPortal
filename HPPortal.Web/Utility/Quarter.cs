using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HPPortal.Web.Utility
{
    public static class QuarterHelper
    {
        static QuarterHelper()
        {
            Quarters = new List<Quarter>();
            Quarters.Add(new Quarter { MonthId = 1, QuarterId = 1, QuarterDescription = "Q1", MonthIndex = 3 });
            Quarters.Add(new Quarter { MonthId = 2, QuarterId = 2, QuarterDescription = "Q2", MonthIndex = 1 });
            Quarters.Add(new Quarter { MonthId = 3, QuarterId = 2, QuarterDescription = "Q2", MonthIndex = 2 });
            Quarters.Add(new Quarter { MonthId = 4, QuarterId = 2, QuarterDescription = "Q2", MonthIndex = 3 });
            Quarters.Add(new Quarter { MonthId = 5, QuarterId = 3, QuarterDescription = "Q3", MonthIndex = 1 });
            Quarters.Add(new Quarter { MonthId = 6, QuarterId = 3, QuarterDescription = "Q3", MonthIndex = 2 });
            Quarters.Add(new Quarter { MonthId = 7, QuarterId = 3, QuarterDescription = "Q3", MonthIndex = 3 });
            Quarters.Add(new Quarter { MonthId = 8, QuarterId = 4, QuarterDescription = "Q4", MonthIndex = 1 });
            Quarters.Add(new Quarter { MonthId = 9, QuarterId = 4, QuarterDescription = "Q4", MonthIndex = 2 });
            Quarters.Add(new Quarter { MonthId = 10, QuarterId = 4, QuarterDescription = "Q4", MonthIndex = 3 });
            Quarters.Add(new Quarter { MonthId = 11, QuarterId = 1, QuarterDescription = "Q1", MonthIndex = 1 });
            Quarters.Add(new Quarter { MonthId = 12, QuarterId = 1, QuarterDescription = "Q1", MonthIndex = 2 });
        }

        public static Quarter GetCurrentQuarter(DateTime date)
        {
            var qtr = Quarters.Find(q => q.MonthId == date.Month);
            var qtrYr = qtr.QuarterDescription + " " + date.Year;

            if(qtr.QuarterId==1)
                qtrYr = qtr.QuarterDescription + " " + date.AddYears(1).Year;

            return new Quarter
            {
                MonthId = qtr.MonthId,
                QuarterId = qtr.QuarterId,
                QuarterDescription =qtr.QuarterDescription,
                QuarterYear = qtrYr
            };
        }

        public static string GetMonthName(string quarterYear, int monthIndex)
        {
            var qtr = Quarters.Find(q => q.QuarterDescription == quarterYear.Substring(0,2) && q.MonthIndex==monthIndex);
            var date = new DateTime(DateTime.Now.Year, qtr.MonthId, 1);
            return date.ToString("MMMM");
        }     

        public static Quarter GetPrevQuarter(string quarterYear)
        {
            var qtr = Quarters.Find(q => q.QuarterDescription == quarterYear.Substring(0, 2));
            var year = quarterYear.Substring(3);
            var prevQtrId= qtr.QuarterId - 1;

            if (qtr.QuarterId == 1)
            {
                prevQtrId = 4;
                year = (Convert.ToInt32(year) - 1).ToString();
            }

            var preQtr = Quarters.First(q => q.QuarterId == prevQtrId);
            var qtrYr = preQtr.QuarterDescription + " " + year;

            return new Quarter
                {
                    MonthId = preQtr.MonthId,
                    QuarterId = preQtr.QuarterId,
                    QuarterDescription = preQtr.QuarterDescription,
                    QuarterYear = qtrYr
                };
        }

        public static Quarter GetCurrentQtr(string quarterYear)
        {
            var qtr = Quarters.Find(q => q.QuarterDescription == quarterYear.Substring(0, 2));
           
            return new Quarter
            {
                MonthId = qtr.MonthId,
                QuarterId = qtr.QuarterId,
                QuarterDescription = qtr.QuarterDescription,
                QuarterYear = quarterYear
            };
        }

        public static Quarter GetPrevYearQtr(string quarterYear)
        {
            var qtr = Quarters.Find(q => q.QuarterDescription == quarterYear.Substring(0, 2));
            var year = quarterYear.Substring(3);
            var prevQtrId = qtr.QuarterId - 1;
                       
            year = (Convert.ToInt32(year) - 1).ToString();
                        
            var qtrYr = qtr.QuarterDescription + " " + year;

            return new Quarter
            {
                MonthId = qtr.MonthId,
                QuarterId = qtr.QuarterId,
                QuarterDescription = qtr.QuarterDescription,
                QuarterYear = qtrYr
            };
        }

        public static IEnumerable<Quarter> GetNextnCurrentQuarter(DateTime date)
        {
            var list = new List<Quarter>();
            var currentQtr = GetCurrentQuarter(DateTime.Now);
            list.Add(currentQtr);

            var nextQtr = new Quarter();

            if (currentQtr.QuarterId == 1)
            {
                nextQtr = Quarters.FirstOrDefault(q => q.QuarterId == 2);
                var qtrYr = nextQtr.QuarterDescription + " " + date.AddYears(1).Year;
                nextQtr.QuarterYear = qtrYr;
            }
            else
            {
                nextQtr = Quarters.FirstOrDefault(q => q.QuarterId == currentQtr.QuarterId + 1);
                var qtrYr = nextQtr.QuarterDescription + " " + date.Year;
                nextQtr.QuarterYear = qtrYr;
            }
            
            list.Add(nextQtr);
            return list;
        }

        public static List<Quarter> Quarters { get; set; }
    }

    public class Quarter
    {
        public int MonthId { get; set; }
        public int QuarterId { get; set; }
        public string QuarterDescription { get; set; }
        public string QuarterYear { get; set; }
        public int MonthIndex { get; set; }
    }   
}