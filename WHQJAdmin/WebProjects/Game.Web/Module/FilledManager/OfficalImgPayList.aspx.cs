﻿using System;
using Game.Web.UI;
using Game.Kernel;
using Game.Facade;
using Game.Entity.Treasure;
using Game.Entity.Enum;

namespace Game.Web.Module.FilledManager
{
    public partial class OfficalImgPayList : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.moduleID = 200;
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //判断权限
            AuthUserOperationPermission(Permission.Delete);
            int result = FacadeManage.aideTreasureFacade.DeleteImgPay(StrCIdList);
            if (result > 0)
            {
                ShowInfo("删除成功");
                BindData();
            }
            else
            {
                ShowInfo("删除失败");
            }
        }

        private void BindData()
        {
            PagerSet pagerSet = FacadeManage.aideTreasureFacade.GetList(OfficalImgPay.Tablename, "WHERE 1=1", "ORDER BY SortId DESC", anpNews.CurrentPageIndex, anpNews.PageSize);
            anpNews.RecordCount = pagerSet.RecordCount;
            litNoData.Visible = pagerSet.PageSet.Tables[0].Rows.Count <= 0;
            rptDataList.DataSource = pagerSet.PageSet;
            rptDataList.DataBind();
        }

        protected string GetTypeStr(int type)
        {
            switch (type)
            {
                case 1:
                    return "微信";
                case 2:
                    return "qq";
                case 3:
                    return "支付宝";
                case 4:
                    return "云闪付";
                default:
                    return "未知类型";

            }
        }

        protected void anpNews_PageChanged(object sender, EventArgs e)
        {
            BindData();
        }

    }
}