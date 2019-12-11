﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Game.Web.UI;
using Game.Utils;
using Game.Entity.Treasure;
using Game.Facade;
using System.Data;
using Game.Kernel;
using Game.Entity.Enum;
using Game.Entity.Platform;

namespace Game.Web.Module.FilledManager
{
    public partial class OnLineWeChatInfo : AdminPage
    {
        /// <summary>
        /// 页面加载
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            base.moduleID = 202;
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        /// <summary>
        /// 数据保存
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            OnLineWeChat config = new OnLineWeChat();
            if (IntParam > 0)
            {
                if (!AuthUserOperationPermission(Permission.Edit))
                {
                    return;
                }
                config = FacadeManage.aideTreasureFacade.GetOnLineWeChat(IntParam);
            }


            config.ConfigName = CtrlHelper.GetText(txtConfigName);
            config.WeChat = CtrlHelper.GetText(txtWeChat);
            config.SortID = CtrlHelper.GetInt(txtSortID, 0);
            config.NickName = CtrlHelper.GetText(txtNickName);
            config.Nullity = Convert.ToByte(rblNullity.SelectedValue);
            config.TagID = Convert.ToByte(ddlTagID.SelectedValue);

            int result = IntParam > 0 ? FacadeManage.aideTreasureFacade.UpdateOnLineWeChat(config) : FacadeManage.aideTreasureFacade.InsertOnLineWeChat(config);
            if (result > 0)
            {
                ShowInfo("操作成功", "OnLineWeChatList.aspx", 1200);
            }
            else
            {
                ShowError("操作失败");
            }
        }
        /// <summary>
        /// 数据绑定
        /// </summary>
        private void BindData()
        {
            if (IntParam > 0)
            {
                OnLineWeChat config = FacadeManage.aideTreasureFacade.GetOnLineWeChat(IntParam);
                if (config != null)
                {
                    CtrlHelper.SetText(txtConfigName, config.ConfigName.ToString());
                    CtrlHelper.SetText(txtSortID, config.SortID.ToString());
                    CtrlHelper.SetText(txtWeChat, config.WeChat.ToString());
                    CtrlHelper.SetText(txtNickName, config.NickName.ToString());
                    ddlTagID.SelectedValue = config.TagID.ToString();
                    rblNullity.SelectedValue = config.Nullity.ToString();
                }
            }
        }
    }
}