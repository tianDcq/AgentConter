﻿using System;

using Game.Web.UI;
using Game.Entity.Treasure;
using Game.Facade;
using Game.Entity.Enum;
using System.Web.UI.WebControls;
using Game.Utils;
using System.Collections.Generic;

namespace Game.Web.Module.FilledManager
{
    public partial class AddOnlineChanel : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.moduleID = 200;
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            OnlinePayConfig config = new OnlinePayConfig();
            if (IntParam > 0)
            {
                AuthUserOperationPermission(Permission.Edit);
                config = FacadeManage.aideTreasureFacade.GetOnlinePayConfig(IntParam);
            }
            else
            {
                AuthUserOperationPermission(Permission.Add);
            }
            config.PayType = Convert.ToByte(ddlProductType.SelectedValue);
            config.PayName = CtrlHelper.GetText(txtProductName);
            config.UID= CtrlHelper.GetText(tetUID);
            config.Md5key = CtrlHelper.GetText(TexMd5);
            config.PublicKey = CtrlHelper.GetText(TxtPublicKey);
            config.PrivateKey= CtrlHelper.GetText(TxtPrivateKey);
            config.MaxAmount = Convert.ToInt32(TextMax.Text);
            config.MinAmount = Convert.ToInt32(TextMin.Text);
            config.ShoutCut = CtrlHelper.GetText(txtPrice);
            config.PayIdentity = Convert.ToByte(DropDownList1.SelectedValue);
            config.SortID = Convert.ToInt32(SortID.Text);
            config.FristPresent = Convert.ToInt32(txtFristPresent.Text);
            config.PresentScore = Convert.ToInt32(txtPresentScore.Text);
            config.ChanelID = Convert.ToInt32(DropDownList2.SelectedValue);
            config.ChanelName = DropDownList2.SelectedItem.Text;
            config.AttachStr1 = CtrlHelper.GetText(AttaBox1);
            config.AttachStr2 = CtrlHelper.GetText(AttaBox2);
            config.PayUrl= CtrlHelper.GetText(TexPayUrl);
            if (IntParam > 0)
            {
                config.ID = IntParam;
            }

            int result = FacadeManage.aideTreasureFacade.SaveOnlinePayConfig(config);
            if (result > 0)
            {
                ShowInfo("配置信息操作成功", "OnLinePayPage.aspx", 1200);
            }
            else
            {
                ShowError("配置信息操作失败");
            }
        }

        protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangePayType(Convert.ToInt32(ddlProductType.SelectedValue));
        }

        private void ChangePayType(int typeid)
        {
            DropDownList2.Items.Clear();
            //搜索数据得到
            IList<pay_chanel> list = FacadeManage.aideTreasureFacade.GetPay_ChanelsByType(typeid);
            if (list == null)
            {
                return;  
            }

            for (int i = 0; i < list.Count; ++i)
            {
                DropDownList2.Items.Add(new ListItem(list[i].name, list[i].id.ToString()));
            }
            DropDownList2.SelectedValue = list[0].id.ToString();
        }


        private void BindData()
        {
            ChangePayType(Convert.ToInt32(ddlProductType.SelectedValue));
            if (IntParam > 0)
            {
                OnlinePayConfig config = FacadeManage.aideTreasureFacade.GetOnlinePayConfig(IntParam);
                if (config != null)
                {
                    ChangePayType(config.PayType);
                    ddlProductType.SelectedValue = config.PayType.ToString();
                    txtProductName.Text = config.PayName;
                    DropDownList2.SelectedValue = config.ChanelID.ToString();
                    tetUID.Text = config.UID;
                    TexMd5.Text = config.Md5key;
                    TxtPrivateKey.Text = config.PrivateKey;
                    TxtPublicKey.Text = config.PublicKey;
                    TextMin.Text = config.MinAmount.ToString();
                    TextMax.Text = config.MaxAmount.ToString();

                    txtPrice.Text = config.ShoutCut;
                    DropDownList1.SelectedValue = config.PayIdentity.ToString();
                    txtFristPresent.Text = config.FristPresent.ToString();
                    txtPresentScore.Text = config.PresentScore.ToString();
                    SortID.Text = config.SortID.ToString();
                    TexPayUrl.Text = config.PayUrl;
                    AttaBox1.Text = config.AttachStr1;
                    AttaBox2.Text = config.AttachStr2;
                }
            }
        }

    }
}