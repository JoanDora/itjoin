<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="shortcut icon"  href="<%=path%>/resources/image/favicon.ico" type="image/x-icon">
<link rel="icon" href="<%=path%>/resources/image/favicon.ico" type="image/x-icon">
<!--<fk:base-styles>-->
<link rel="stylesheet"  href="<%=path%>/resources/css/itjoin/logincox.css">
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/loginbase.css">
<!--</fk:base-styles>-->
<style>
.sidebar-nav {
	display:none!important;
}
</style>
<!--<fk:jquery-script>-->
<!--</fk:jquery-script>-->

<title>后台会员登录 -it分享联盟</title>
<!--<fk:styles>-->
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/adminlogin.css">
<!--</fk:styles>-->

<script type="application/json" data-id="user-data">
    null
</script>
</head>
<body>
<!--登录页头部--> 

<!--顶部工具条{--> 
<!--头部{-->

<!--}头部-->

<div id="akd_content">
  <div class="grid-c1 welcome-slogan">欢迎您！ <span>我们可爱的斗士们</span> </div>
  <div class="login-container1">
    <div class="grid-c1">
      <div class="banner"></div>
      <div class="login-form">
        <div class="head">
          <h2>希望在明天~！</h2>

          <form  id="login_form"  method="post" onsubmit="return onSubmit();">
          <div class="tip error"></div>
          <div class="input-text left user"> <span><i></i></span>
            <input type="text" name="phone" id="phone" test="must" label="登录账号" placeholder="请输入您的注册手机" />
          </div>
          <div class="input-text left pwd"> <span><i></i></span>
          <input type="password" name="loginPwd"  id="loginPwd" test="must" label="登录密码" maxlength="20" placeholder="根据你脸上的豆豆输入密码" />
          </div>
          <p>&nbsp;</p>
          <p>
            <label>
              <input type="checkbox" name="Remember">
              记住账号，你帐号出问题了...<br>
              那么恭喜你，黑祸由幸运的你来背！<br>
              点此选项代码您已默认您是伟大的糕羊~~<br>
              <br>
  <br>
            </label>
            
          </p>
          <div class="btn-bar">
            <button type="submit">登 录</button>
          </div>
         
        </form>
      </div>
    </div>
  </div>
</div>

</div>

  <div id="imgBox" style="display:none">
       <img src="<%=path%>/resources/image/loading.gif" alt="" />
     </div>
    <script type="text/javascript"src="<%=path%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type='text/javascript' src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>

<script type="text/javascript">

function openDialog(){
	easyDialog.open({
		  container : 'imgBox',
		  fixed : false
		});
}

function onSubmit() {
	$('#loginPwd').val(hex_md5(  $('#loginPwd').val()));
     $('#login_form').ajaxSubmit({
									url : '/admin/login',
									type : "POST",
									dataType : "json",
									beforeSubmit : function() {
										openDialog();
										
									},
									success : function(data) {
										console.log(data);
										if(data!=null && data.phone!=null){
											alert("登陆成功");
											easyDialog.close();
											window.location.href ="/admin/main?v="+Math.random();
										}else{
											easyDialog.close();
											alert("登陆失败");
										}
									
									}
								});
     return false;
}

</script>

</body>
</html>