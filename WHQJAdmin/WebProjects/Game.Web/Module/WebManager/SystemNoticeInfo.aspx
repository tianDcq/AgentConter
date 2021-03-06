﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemNoticeInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.SystemNoticeInfo" %>

<%@ Register Src="/Tools/ImageUploader.ascx" TagName="ImageUploader" TagPrefix="GameImg" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="/styles/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/scripts/common.js"></script>
    <script type="text/javascript" src="/scripts/comm.js"></script>
    <script type="text/javascript" src="/scripts/jquery.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <title></title>
    <script type="text/javascript">
        /*
        * 设置图片文件
        */
        function setImgFilePath(frID, uploadPath) {
            document.getElementById(frID).contentWindow.setUploadFileView(uploadPath);
        }

        KE.show({
            id: 'txtWeb',
            imageUploadJson: '/Tools/KindEditorUpload.ashx?type=news',
            fileManagerJson: '/Tools/KindEditorFileManager.ashx?type=news',
            allowFileManager: true
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 新闻公告
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10">
                    <input id="btnReturn" type="button" value="返回" class="btn wd1" onclick="Redirect('SystemNoticeList.aspx')" />
                    <asp:Button ID="btnCreate" runat="server" Text="保存" CssClass="btn wd1" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="4" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3 pd7">
                        新闻详情
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">公告标题：</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="text" Width="450px" MaxLength="6"></asp:TextBox>
                    <span class="hong">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="请输入新闻标题"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">新闻来源：</td>
                <td>
                    <asp:DropDownList ID="ddtype" runat="server" Width="205px">
                        <asp:ListItem Text="活动" Value="1"></asp:ListItem>
                        <asp:ListItem Text="公告" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">新闻排序：</td>
                <td>
                    <asp:TextBox ID="txtSort" runat="server" CssClass="text wd7"></asp:TextBox>
                    <asp:CheckBox ID="cbNullity" runat="server" />禁用
                   <asp:CheckBox ID="cbHot" runat="server" />热门
                   <asp:CheckBox ID="cbTop" runat="server" />置顶
                   <span class="hong">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ControlToValidate="txtSort" Display="Dynamic" ErrorMessage="请输入新闻排序"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="新闻排序格式不正确" Display="Dynamic" ControlToValidate="txtSort" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">图片：</td>
                <td style="line-height: 35px;">
                    <GameImg:ImageUploader ID="upImage" MaxSize="2097152" runat="server" DeleteButtonClass="l2" DeleteButtonText="删除" Folder="/Upload/Active" ViewButtonClass="l2" ViewButtonText="查看" TextBoxClass="text" />
                    <span>[体积：不大于2M 尺寸：750*540]</span>
                </td>
            </tr>
            <tr>
                <td height="20px" colspan="2"></td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10">
                    <input id="btnReturn2" type="button" value="返回" class="btn wd1" onclick="Redirect('SystemNoticeList.aspx')" />
                    <asp:Button ID="btnSave2" runat="server" Text="保存" CssClass="btn wd1" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
