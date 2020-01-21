﻿using System;
using Game.Web.UI;
using System.Data;
using Game.Facade;
using Game.Utils;

namespace Game.Web.Module.DataStatistics
{
    public partial class DailyGame : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime time = DateTime.Now;
                txtStartDate.Text = time.AddDays(-15).ToString("yyyy-MM-dd");
                txtEndDate.Text = time.AddDays(-1).ToString("yyyy-MM-dd");
            }
        }
    }
}