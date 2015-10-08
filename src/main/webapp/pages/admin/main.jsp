<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>it分享联盟后台管理系统</title>
<link href="<%=path%>/resources/css/easyui/default.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/css/easyui/easyui.css">
	<script type="text/javascript"
		src="<%=path%>/resources/js/jquery/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
	<script type="text/javascript">
		var _menus = {
			basic : [ {
				"menuid" : "10",
				"icon" : "icon-sys",
				"menuname" : "视频管理",
				"menus" : [ {
					"menuid" : "111",
					"menuname" : "视频列表",
					"icon" : "icon-nav",
					"url" : "/admin/videolist?new=" + Math.random()
				} ]
			}
			, {
				"menuid" : "20",
				"icon" : "icon-sys",
				"menuname" : "网站资料管理",
				"menus" : [ {
					"menuid" : "411",
					"menuname" : "编辑网站简介",
					"icon" : "icon-nav",
					"url" : "/admin/webinfolist?new=" + Math.random()
				} ]
			}
			, {
				"menuid" : "20",
				"icon" : "icon-sys",
				"menuname" : "会员管理",
				"menus" : [ {
					"menuid" : "211",
					"menuname" : "会员列表",
					"icon" : "icon-nav",
					"url" : "/admin/userlist?new=" + Math.random()
				} ]
			}
			, {
				"menuid" : "20",
				"icon" : "icon-sys",
				"menuname" : "后台用户管理",
				"menus" : [ {
					"menuid" : "211",
					"menuname" : "用户资料",
					"icon" : "icon-nav",
					"url" : "/admin/adminuser?new=" + Math.random()
				} ]
			}
			]
		};

		//修改密码
		function serverLogin() {
			var $newpass = $('#txtNewPass');
			var $rePass = $('#txtRePass');

			if ($newpass.val() == '') {
				msgShow('系统提示', '请输入密码！', 'warning');
				return false;
			}
			if ($rePass.val() == '') {
				msgShow('系统提示', '请在一次输入密码！', 'warning');
				return false;
			}

			if ($newpass.val() != $rePass.val()) {
				msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
				return false;
			}
			var newPwd = $newpass.val();
			$newpass.val(hex_md5( newPwd));
			$.post('/admin/modifyPwd/' + $newpass.val(),
					function(msg) {
						msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + newPwd, 'info');
						$newpass.val('');
						$rePass.val('');
						close();
					})

		}
		
		 //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }
		 
		 $(function() {
			 closePwd();
	            $('#editpass').click(function() {
	                $('#w').window('open');
	            });

	            $('#btnEp').click(function() {
	                serverLogin();
	            })

				$('#btnCancel').click(function(){closePwd();})

	            $('#loginOut').click(function() {
	                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

	                    if (r) {
	                    	$.post('/admin/loginout',
	            					function(msg) {
	            						if(msg=='1'){
	            							alert("成功退出！")
	            							location.href="/admin/login.html"
	            						}
	            					})
	                    }
	                });
	            })
	        });
			
	</script>

	<style>
#css3menu li {
	float: left;
	list-style-type: none;
}

#css3menu li a {
	color: #fff;
	padding-right: 20px;
}

#css3menu li a.active {
	color: yellow;
}
</style>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 30px; background: url(<%=path%>/resources/css/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;" class="head"><span>欢迎您</span><span class="userName" id="adminPhone"></span>
			<a href="javascript:void(0)" id="editpass">修改密码</a> <a href="javascript:void(0)"
			id="loginOut">安全退出</a>
		</span> <span style="padding-left: 10px; font-size: 16px; float: left;"><img
			src="<%=path%>/resources/css/images/blocks.gif" width="20" height="20"
			align="absmiddle" /> </span>
		<ul id="css3menu"
			style="padding: 0px; margin: 0px; list-type: none; float: left; display: none; margin-left: 40px;">
			<li><a class="active" name="basic" href="javascript:;" title=""></a></li>
			<li><a name="point" href="javascript:;" title=""></a></li>

		</ul>
	</div>
	<div region="south" split="true"
		style="height: 30px; background: #D2E0F2;">
		<div class="footer">二手车后台管理</div>
	</div>
	<div region="west" hide="true" split="true" title="系统分类导航"
		style="width: 180px;" id="west">
		<div id='wnav' class="easyui-accordion" fit="true" border="false">
			<!--  导航内容 -->

		</div>

	</div>
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y: hidden">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">

			</div>
		</div>
	</div>

  
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
    
	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>

	<script type="text/javascript" src="<%=path%>/resources/js/outlook.js"></script>
<script type="text/javascript">

var adminRole='0';
jQuery.ajax({  
    type : 'POST',  
    contentType : 'application/json',  
    url : '/admin/getSessionUser',
    dataType : 'json',  
    success : function(data) 
    { 
      if(data!=null && data.id!=null){
    	  $("#adminPhone").html(data.phone);
    	  adminRole = data.role;
      }
        
    }
} );

</script>
</body>
</html>