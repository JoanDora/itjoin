<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<!--<fk:base-styles>-->
<link rel="stylesheet"  href="<%=path%>/resources/css/itjoin/logincox.css">
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/loginbase.css">
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >

<style>
.sidebar-nav {
	display:none!important;
}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<!--</fk:jquery-script>-->

<title>会员登录 - 登录it分享联盟</title>
<!--<fk:styles>-->
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/login2.css">
<!--</fk:styles>-->
<style>
.grid-c1{
margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="akd_content" class="C_content">
  <div class="grid-c1 welcome-slogan">欢迎您 <span>登录it分享联盟会员系统</span> </div>
  <div class="login-container">
    <div class="grid-c1" >
      <div class="banner"></div>
      <div class="login-form">
        <div class="head">
          <h2>登录it分享联盟</h2>
          <span>还没有一起it分享联盟账号？<a href="/register" class="register-page-entry">30秒注册</a></span> </div>
        <form id="login_form"  method="post" onsubmit="return false">
          <div class="tip error"></div>
          <div class="input-text left user"> <span><i></i></span>
            <input type="text" name="phone"  name="phone"  test="must" label="登录账号" placeholder="请输入您的注册手机">
          </div>
          <div class="input-text left pwd"> <span><i></i></span>
            <input type="password" name="loginPwd"  id="loginPwd"  test="must" label="登录密码" maxlength="20" placeholder="请输入您的登录密码">
          </div>
          <div class="tools clearfix">
            <label>
              <input type="checkbox" name="Remember">
              记住账号 </label>
            <span> <a href="/user/skip/register" class="register-page-entry">免费注册</a> <a href="javascript:forgotPwd();">忘记密码？</a> </span> </div>
          <div class="btn-bar">
            <button type="button"  onclick="javascript:onSubmit();">登 录</button>
          </div>
          <!-- <div class="other-entry">
            <p>您可以使用以下账号登录</p>
            <a href="#" class="qq-user-entry"><i></i>QQ</a> <a href="#" class="weibo-user-entry"><i></i>新浪微博</a> </div> -->
        </form>
      </div>
    </div>
  </div>
</div>
     <%@ include file="footer.jsp" %> 
 
<div id="imgBox" style="display:none">
       <img src="<%=path%>/resources/images/loading.gif" alt="" />
     </div>
     
 <div id="emailId" style="display:none;width:300px;height: 200px; background-color:#fff;" >
      <form class="navbar-form pull-center"  id="emailForm" action="/email/send"  onsubmit="return false;">
  <input type="text" class="span2"   name="email" id="email" placeholder="请输入邮箱">
  <button type="submit" class="btn"  onclick="sendEmail();">提交</button>
</form>
 </div>
     
<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
<script type='text/javascript' src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>
<script type="text/javascript">

function openDialog(){
	easyDialog.open({
		  container : 'imgBox',
		  fixed : false
		});
}

function searchKeyWord(flag){
	var keywords = $("#keywordsValue").val();
	if(flag=='1'){
		keywords='';
	}
	location.href="akd.html?keywords="+keywords
}

function forgotPwd(){

	easyDialog.open({
	  container :'emailId',
		  fixed : false
	});

}


var btnFn = function(){
	  alert( e.target );
	  return false;
	};


function onSubmit() {
	$('#loginPwd').val(hex_md5(  $('#loginPwd').val()));
     $('#login_form').ajaxSubmit({
									url : spath+'/user/login',
									type : "POST",
									dataType : "json",
									beforeSubmit : function() {
										openDialog();
										
									},
									success : function(data) {
										if(data!=null && data.phone!=null){
											alert("登陆成功");
											easyDialog.close();
											window.location.href =spath+"/"
										}else{
											easyDialog.close();
											alert("登陆失败");
										}
									
									}
								});
     return false;
}


function sendEmail(){
	   $('#emailForm').ajaxSubmit({
			url : spath+'/email/send',
			type : "POST",
			dataType : "json",
			beforeSubmit : function() {
				openDialog();
				
			},
			success : function(data) {
				if(data!=null && data==1){
					alert("发送成功");
				}else{
					alert("发送失败");
				}
				easyDialog.close();
				
			}
		});
return false;

}
</script>

</body>
</html>