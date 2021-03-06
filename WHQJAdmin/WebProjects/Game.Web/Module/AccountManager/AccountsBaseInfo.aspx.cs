﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Game.Utils;
using Game.Web.UI;
using Game.Entity.Accounts;
using Game.Kernel;
using Game.Entity.Platform;
using Game.Entity.Enum;
using System.Collections;
using Game.Entity.Record;
using Game.Facade;
using System.Text;

namespace Game.Web.Module.AccountManager
{
    public partial class AccountsBaseInfo : AdminPage
    {
        /// <summary>
        /// 页面加载
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            base.moduleID = 100;
            if (!IsPostBack)
            {
                if (IntParam > 0)
                {
                    AccountsInfo model = FacadeManage.aideAccountsFacade.GetAccountInfoByUserId(IntParam);
                    if (model != null)
                    {

                        DropDownList2.Items.Clear();
                        string cfg = FacadeManage.aideNativeWebFacade.GetConfigInfo(3).Field5;
                        if (cfg == null)
                        {
                            return;
                        }
                        DropDownList2.Items.Add(new ListItem("无", "0"));
                        string[] strList = cfg.Split(',');
                        for (int i = 0; i < strList.Length; ++i)
                        {
                            DropDownList2.Items.Add(new ListItem(strList[i], (i + 1).ToString()));
                        }
                        DropDownList2.SelectedValue = model.RankID.ToString();

                        DropDownList1.SelectedValue = model.BankType.ToString();
                        int logonTimes = model.WebLogonTimes + model.GameLogonTimes;
                        //CtrlHelper.SetText(ltAgent, model.AgentID > 0 ? "代理" : "非代理");
                        CtrlHelper.SetText(ltGameID, model.GameID.ToString());
                        CtrlHelper.SetText(ltGameLogonTimes, model.GameLogonTimes.ToString());
                        CtrlHelper.SetText(ltLastLogonDate,
                            logonTimes > 0 ? model.LastLogonDate.ToString("yyyy-MM-dd HH:mm:ss") : "");
                        CtrlHelper.SetText(ltLastLogonIP, logonTimes > 0 ? model.LastLogonIP : "");
                        CtrlHelper.SetText(ltLastLogonMachine, model.LastLogonMachine);
                        CtrlHelper.SetText(ltNickName, model.NickName);
                        CtrlHelper.SetText(ltOnLineTimeCount, Fetch.ConverTimeToDHMS(model.OnLineTimeCount));
                        CtrlHelper.SetText(ltPlayTimeCount, Fetch.ConverTimeToDHMS(model.PlayTimeCount));
                        CtrlHelper.SetText(ltRegisterDate, model.RegisterDate.ToString("yyyy-MM-dd HH:mm:ss"));
                        CtrlHelper.SetText(ltRegisterIP, model.RegisterIP);
                        CtrlHelper.SetText(ltRegisterMachine, model.RegisterMachine);
                        CtrlHelper.SetText(ltRegisterOrigin, GetRegisterOrigin(model.RegisterOrigin));
                        CtrlHelper.SetText(ltWebLogonTimes, model.WebLogonTimes.ToString());
                        CtrlHelper.SetText(ltLogonSpacingTime,
                            logonTimes > 0
                                ? (Fetch.GetTimeSpan(Convert.ToDateTime(model.LastLogonDate), DateTime.Now) + "前")
                                : "");
                        CtrlHelper.SetText(ltRegSpacingTime,
                            Fetch.GetTimeSpan(Convert.ToDateTime(model.RegisterDate), DateTime.Now) + "前");
                        CtrlHelper.SetText(ltSex, model.Gender == 1 ? "男" : "女");

                        CtrlHelper.SetText(txtRealName, model.Compellation);
                        CtrlHelper.SetText(txtPhoneNum, model.RegisterMobile);
                        CtrlHelper.SetText(TextAli, model.AliAccount);
                        CtrlHelper.SetText(TextBank, model.BankAccount);
                        CtrlHelper.SetText(txtUnderWrite, model.UnderWrite);

                        //ckbNullity.Checked = model.Nullity == 1 ? true : false;
                        //ckbLock.Checked = model.MoorMachine == 1 ? true : false;

                        imgFace.ImageUrl = FacadeManage.aideAccountsFacade.GetAccountsFaceById(model.CustomID);
                    }
                }
            }
        }

        /// <summary>
        /// 保存修改
        /// </summary>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //权限验证
            if (!AuthUserOperationPermission(Permission.Edit))
            {
                return;
            }

            if (IntParam > 0)
            {
                //获取保存数值
                string realname = CtrlHelper.GetText(txtRealName);
                string phone = CtrlHelper.GetText(txtPhoneNum);
                string underwrite = CtrlHelper.GetText(txtUnderWrite);
                string bankAcc = CtrlHelper.GetText(TextBank);
                string aliAcc = CtrlHelper.GetText(TextAli);

                //输入验证
                AccountsInfo model = FacadeManage.aideAccountsFacade.GetAccountInfoByUserId(IntParam);
                if (model != null && model.Compellation.Length > 0 && string.IsNullOrEmpty(realname))
                {
                    MessageBox("已实名认证信息保存不能为空");
                    return;
                }

                //int isNullity = ckbNullity.Checked ? 1 : 0;
                //int isLock = ckbLock.Checked ? 1 : 0;

                StringBuilder sb = new StringBuilder($" WHERE UserID <> {IntParam} AND (1=2 ");
                if (phone != "")
                {
                    sb.AppendFormat(" OR RegisterMobile= '{0}' ", phone);
                }
                if (bankAcc != "")
                {
                    sb.AppendFormat(" OR BankAccount = '{0}' ", bankAcc);
                }
                if (aliAcc != "")
                {
                    sb.AppendFormat(" OR AliAccount = '{0}' ", aliAcc);
                }
                sb.Append(")");
                if (FacadeManage.aideAccountsFacade.CheckRepeat(sb.ToString()))
                {
                    MessageBox("资料重复");
                    return;
                }


                AccountsInfo info = new AccountsInfo();
                info.UserID = IntParam;
                info.Compellation = realname;
                info.RegisterMobile = phone;
                info.UnderWrite = underwrite;
                info.BankAccount =bankAcc;
                info.AliAccount = aliAcc;
                //info.Nullity = (byte) isNullity;
                //info.MoorMachine = (byte) isLock;
                info.RankID = Convert.ToInt32(DropDownList2.SelectedValue);
                info.BankType= Convert.ToInt32(DropDownList1.SelectedValue);
                info.InsurePass = !string.IsNullOrEmpty(CtrlHelper.GetText(txtInsurePass))
                    ? Utility.MD5(CtrlHelper.GetText(txtInsurePass))
                    : model?.InsurePass ?? "";

                info.LogonPass = !string.IsNullOrEmpty(CtrlHelper.GetText(txtLognPass))
                    ? Utility.MD5(CtrlHelper.GetText(txtLognPass))
                    : model?.LogonPass ?? "";

                int result = FacadeManage.aideAccountsFacade.UpdateAccountsBaseInfo(info);
                MessageBox(result > 0 ? "修改资料成功" : "修改资料失败");
            }
        }
    }
}
