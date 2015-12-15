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
<script type="text/javascript"
 src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="1104947923" data-redirecturi="http://www.itjoin.org" charset="utf-8"></script> 
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="akd_content" class="C_content">
  
  <div class="login-container">
    <div class="grid-c1" >
       <div class="login-form">
        <div class="head">
          登录大象分享
          <span>还没有大象分享账号？<a href="/register" class="register-page-erynt" style="color:#fff; text-decoration:underline;">30秒注册</a></span> </div>
        <form id="login_form"  method="post" onSubmit="return false" style="padding:0 50px;">
          <div class="tip error"></div>
          <div class="input-text left user"> 
            <input type="text" name="phone"   test="must" label="登录账号" placeholder="请输入您的注册手机">
          </div></br>
          <div class="input-text left pwd"> 
            <input type="password" name="loginPwd"  id="loginPwd"  test="must" label="登录密码" maxlength="20" placeholder="请输入您的登录密码">
          </div>
          <div class="tools clearfix">
            <label>
              <input type="checkbox" name="Remember">
              记住账号 </label>
            <span> <a href="/user/skip/register" class="register-page-entry">免费注册</a> <a href="javascript:forgotPwd();">忘记密码？</a> </span> </div>
          <div class="btn-bar">
            <button type="button"  onclick="javascript:onSubmit();">登 录</button>  <span style="margin-left:30px;" id="qqLoginBtn"></span>
          </div>
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
  <script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
<script type='text/javascript' src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>
<script type="text/javascript">
//调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
QC.Login({
    //btnId：插入按钮的节点id，必选
    btnId:"qqLoginBtn",	
    //用户需要确认的scope授权项，可选，默认all
    scope:"all",
    //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
    size: "A_M"
}, function(reqData, opts){//登录成功
    //根据返回数据，更换按钮显示状态方法
    console.log(opts);
    console.log(reqData);
    var dom = document.getElementById(opts['btnId']),
    _logoutTemplate=[
         //头像
         '<span><img src="{figureurl}" class="{size_key}"/></span>',
         //昵称
         '<span>{nickname}</span>',
         //退出
         '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'	
                  ].join("");
    dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
        nickname : QC.String.escHTML(reqData.nickname),
        figureurl : reqData.figureurl
           }));
}, function(opts){//注销成功
alert('QQ登录 注销成功'); 
}
);




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