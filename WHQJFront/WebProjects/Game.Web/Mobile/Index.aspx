﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Game.Web.Mobile.Index" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title><%=Title %></title>
        <meta content="text/html; charset=utf-8" http-equiv="content-type"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes"/>
        <meta name="format-detection" content="telephone=no">
        <script src="/js/reset.js" type="text/javascript"></script>
        <link href="/css/mindex.css" rel="stylesheet" type="text/css"/>
        <link href="/css/weixin.css" rel="stylesheet" />
        <script src="/js/zepto/1.1.6/zepto.min.js" type="text/javascript"></script>
        <script src="/js/weixin.js" type="text/javascript"></script>
    </head>
    <body>
          <div class="ui-page">
            <img src="<%= Mobilebg %>" class="ui-bg"/>
            <img src="<%= Mobilelogo %>" class="ui-logo" />
            <img src="<%= MobileQrcode %>" class="ui-qrcode" />
            <a id ="ui-btn" href="<%= PlatformDownloadUrl %>" class="ui-btn"><img src="<%= Mobiledown %>" /></a>
            <img src="<%= MobileCase %>" class="ui-product" />
          </div>

         <footer class="ui-footer">
           <a href="http://wpa.b.qq.com/cgi/wpa.php?ln=2&uin=<%= Qq %>" class="fn-left" target="_blank">
             <img src="/image/qqbtn.png" />QQ咨询
           </a>
           <img src="/image/line.png"  class="ui-line fn-left" />
           <a href="tel:<%= Tel %>"  class="fn-left">
             <img src="/image/telbtn.png" />电话咨询
           </a>
         </footer>
        <div id="weixin-tip" class="ui-weixin-tip fn-hide">
          <p>
            <img src="/image/live_weixin.png" alt="微信打开" />
            <span title="关闭" class="close">×</span>
          </p>
        </div>
        
        <%--<script type="text/javascript" src="/js/mindex.js"></script>
        <script type="text/javascript">
          $(document).ready(function() {
            var msg = "<%=msg %>";
            var action = "<%=action %>";
            if (action === "payreturn" && msg) {
              alert(msg);
              window.location.href = "newryclient://?action=3&msg=" + msg;
            }
          });
        </script>--%>
    </body>

<!-- 以下为openinstall集成代码，建议在html文档中尽量靠前放置，加快初始化过程 -->
<!-- 强烈建议直接引用下面的cdn加速链接，以得到最及时的更新，我们将持续跟踪各种主流浏览器的变化，提供最好的服务；不推荐将此js文件下载到自己的服务器-->
<link rel="preconnect" href="https://openinstall.io" crossorigin="use-credentials"/>
<script type="text/javascript" charset="utf-8" src="https://res.cdn.openinstall.io/openinstall.js"></script>
<script type="text/javascript">
  	//openinstall初始化时将与openinstall服务器交互，应尽可能早的调用
	/*web页面向app传递的json数据(json string/js Object)，应用被拉起或是首次安装时，通过相应的android/ios api可以获取此数据*/
	var data = OpenInstall.parseUrlParams();//openinstall.js中提供的工具函数，解析url中的所有查询参数
	new OpenInstall({
		/*appKey必选参数，openinstall平台为每个应用分配的ID*/
		appKey : "spjm49",
		/*可选参数，自定义android平台的apk下载文件名，只有apk在openinstall托管时才有效；个别andriod浏览器下载时，中文文件名显示乱码，请慎用中文文件名！*/
		//apkFileName : '',
		/*可选参数，是否优先考虑拉起app，以牺牲下载体验为代价*/
		//preferWakeup:true,
		/*自定义遮罩的html*/
        //mask:function(){
        //  return "<div id='openinstall_shadow' style='position:fixed;left:0;top:0;background:rgba(0,255,0,0.5);filter:alpha(opacity=50);width:100%;height:100%;z-index:10000;'></div>"
        //},
        /*openinstall初始化完成的回调函数，可选*/
		onready : function() {
			var m = this, button = document.getElementById("ui-btn");
			button.style.visibility = "visible";

			/*在app已安装的情况尝试拉起app*/
			m.schemeWakeup();
			/*用户点击某个按钮时(假定按钮id为downloadButton)，安装app*/
			button.onclick = function() {
				m.wakeupOrInstall();
				return false;
			}
		}
	}, data);

</script>
</html>
