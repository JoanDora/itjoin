<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <style>
        .sidebar-nav{
            display:none!important;
        }
    </style>
    
<title>会员注册 - it分享联盟</title>
<!--<fk:styles>-->
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/user-page.css">
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/register.css" />
<link rel="stylesheet"  href="<%=path%>/resources/css/itjoin/register2.css">
<link rel="stylesheet"  href="<%=path%>/resources/css/itjoin/logincox.css">
<link rel="stylesheet" href="<%=path%>/resources/css/itjoin/loginbase.css">
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
<!--</fk:styles>-->

    
<script type="application/json" data-id="user-data">

</script>

</head>
<body>
<%@ include file="header.jsp" %> 
       <div class="grid-c1 container  C_content C_content2" style="width:800px; padding:0px;">
      	<div class="C_title">注册it分享联盟
        	<div ><span>已有it分享联盟账号？ </span> <a href="/login">立即登录</a> </div>
        </div>
          <div class="content " >
            <div class="content-wrap">
              <div class="register-form grid-c2">
                
                <div class="clearfix">
                	<form class="grid-c-l"  onsubmit="return onSubmit();"
								id="user_register"  action="/user/register" method="post">
								<div class="label">
									<span class="error-tip"></span>
								</div>
								<label> <span class="title">称呼/姓名</span> <input
									type="text" placeholder="张三" autocomplete="off"
									name="userName" class="input-text"
									onblur="javascript:checkName(this)" /> <span class="tip">
										<span class="state-tip "> 
									</span> 请填写您的姓名
								</span>
								</label> <label> <span class="title">手机号码</span> <input
									type="text" placeholder="18682377245" autocomplete="off"
									name="phone" class="input-text"
									onblur="javascript:checkPhone(this);" /> <span class="tip">
										<span class="state-tip ">
										
									</span> 请填写11位手机号码
								</span>
								</label> 
								
								<label> <span class="title">邮箱</span> <input
									type="text" placeholder="xxxx@xxx.com" autocomplete="off" onBlur="javascript:checkEmail(this);" 
									name="email" class="input-text"/> <span class="tip">
										<span class="state-tip ">
										 
									</span> 请填写正确的邮箱
								</span>
								</label>
								
								<label> <span class="title">密 码</span> <input
									type="password" autocomplete="off" name="loginPwd" id="loginPwd"
									class="input-text" onBlur="javascript:checkPwd(this);"
									test="and(must, reg(/^(?!(.)\1+$)(?!\d+$)(?![a-zA-Z]+$).{6,20}$/))"
									maxlength="20" /> <span class="tip"> 
                                    <span
										class="state-tip">
										
										</span> 长度6~20位，至少包含数字、字母、字符中的两种
								</span>
								</label> <label> <span class="title">确认密码</span> <input
									type="password" autocomplete="off" name="confirmPwd"
									class="input-text" onBlur="javascript:checkRePwd(this);"
									test="and(must, eq('Password'))" /> <span class="tip">
										<span class="state-tip">
										
										</span> 请再次输入密码
								</span>
								</label> <label> <span class="title">验证码</span> <input
									type="text" name="authCode" class="input-text auth-code-input" id="authCode"  onblur="javascript:checkCode(this);"
									test="must" maxlength="4" /> <span class="auth-code-wrap">
										<img src="/user/validataCode" id="imageCode"
										style="display: inline" class="auth-code-img"
										title="点击刷新验证码图片" /> <a href="javascript:nextImageCode();"
										class="auth-code-refresh-btn" style="display: inline"
										title="点击刷新验证码图片">换一张</a>
								</span> <span class="tip"> <span class="state-tip">
								<i class="state-icon " id="authCodeInfo"></i>
								</span></label>
								<div class="btn-wrap">
									<button type="submit"  id="submit" style="cursor:pointer">注册</button>
								<!-- 	<a href="#">《用户协议》</a> -->
								</div>
							</form>
                     <div class="grid-c-l other">
                    
                    <div class="sns-user-entry"> <span>使用合作网站账号登录</span></div>
                  </div>
                </div>
              </div>
           

</div>
  </div>
</div>
 <!--脚部{-->
  <%@ include file="footer.jsp" %> 
<div id="imgBox" style="display: none">
						<img src="<%=path %><%=path%>/resources/images/loading.gif" alt="" />
					</div>

<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type='text/javascript' src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>
</div>
<!--}脚部--> 
<script type="text/javascript">
function nextImageCode() {
	$("#imageCode").attr("src", spath+"/user/validataCode?time=" + new Date());
}
					var tag1 = false;
					 var tag2 = false;
					 var tag3 = false;
					 var tag4 = false;
					 var tag5 = false;
					 var tag6= false;
						function openDialog(){
							easyDialog.open({
								  container : 'imgBox',
								  fixed : false
								});
						}
						function onSubmit() {
							
						    if(tag1 && tag2 && tag3 && tag4 && tag5 && tag6){
						    	
						    	  $('#loginPwd').val(hex_md5(  $('#loginPwd').val()));
						    	  $('#user_register').ajaxSubmit({
										url : spath+'/user/register',
										type : "POST",
										dataType : "json",
										beforeSubmit : function() {
											openDialog();
										},
										success : function(data) {
											if(data==1){
												alert("保存成功");
												easyDialog.close();
												window.location.href =spath+"/"
											}else{
												alert("保存失败，手机号码已经被占用");
											}
										
										}
									});
						    }
						    return false
						}

						function right(obj) {
							$(obj).next().children().removeClass('error')
							$(obj).next().children().addClass('check')
						   $(obj).next().children().html("");
							var htmlSrc = '<i class="state-icon check"></i>'
							$(obj).next().children().empty().append(htmlSrc);
						}
						function error(obj,messge) {
							$(obj).next().children().removeClass('check')
							$(obj).next().children().html("");
							var htmlSrc = '<i class="state-icon error"></i>'+messge;
							$(obj).next().children().append(htmlSrc);
							$(obj).next().children().addClass('error')
						}

						function checkName(obj) {
							 tag1 = false;
							var name = $(obj).val();
							$(obj).next().children().empty();
							if($.trim(name)==''){
								error(obj,"必填项") 
								return;
							}
							if (!(name.length > 2 && name.length < 20)) {
								error(obj,"长度在2-20之间")
							} else {
								right(obj)
								 tag1 = true;
							}
						}
						
						function checkPhone(obj){
							$(obj).next().children().empty();
							tag2=false;
							
								if($(obj).val()==""){
									error(obj,"必填项") 
									return;
								}
								var reg = /^((13[0-9])|(15[0-9])|(18[0-9]))[0-9]{8}$/;

								 var phone = $.trim($(obj).val());
								if(!phone.match(reg)){
									 error(obj,"手机号码输入不正确");
									 return;
								 }else{
									 
									 jQuery.ajax({
											type : 'GET',
											contentType : 'application/json',
											url :spath+ '/user/check/phone/'+phone,
											dataType : 'json',
											success : function(data) {
												
												if(data=='1'){
													 right(obj)
													 tag2=true;
												}else{
													 error(obj,"手机号码已经注册");
													 return;
												}
											}
										});
									
								 }
						}
						
						function  checkPwd(obj){
							$(obj).next().children().empty();
							tag3=false;
							var pwd =  $.trim($(obj).val());
							
                            var reg = /^(?!(.)\1+$)(?!\d+$)(?![a-zA-Z]+$).{6,20}$/
                            if(pwd==""){
								error(obj,"必填项");
								return;
							}
                            if(!pwd.match(reg)){
								 error(obj,"输入数据格式不符合要求");
								 return;
							 }else{
								 right(obj)	
								 tag3=true;
							 }
						}
						
						function checkEmail(obj){
							$(obj).next().children().empty();
							tag6=false;
							var email =  $.trim($(obj).val());
							
                            var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/
                            if(email==""){
								error(obj,"必填项");
								return;
							}
                            if(!email.match(reg)){
								 error(obj,"输入邮箱格式不对");
								 return;
							 }else{
								 jQuery.ajax({
										type : 'GET',
										contentType : 'application/json',
										url :spath+ '/user/check/email',
										data:{
											email : email
										},
										dataType : 'json',
										success : function(data) {
											
											if(data=='1'){
												 right(obj)
												 tag6=true;
											}else{
												 error(obj,"该邮箱已经注册");
												 return;
											}
										}
									});
							 }
						}
						
						function checkRePwd(obj){
							$(obj).next().children().empty();
							tag4=false;
							var repwd = $.trim($(obj).val());
							 if(repwd==""){
									error(obj,"必填项") 
									return;
								}
							var pwd = $.trim($("#loginPwd").val());
							if(pwd!=repwd){
								 error(obj,"两次输入不一至");
							}else{
								right(obj)
								tag4=true;
							}
						}
						
						function checkCode(obj){
							$(obj).next().children().empty();
							tag5=false;
							var authCode = $(obj).val();
							if($.trim(authCode)==''){
								 error(obj,"必填项");
								 return ;
							}
							 jQuery.ajax({  
							        type : 'GET',  
							        contentType : 'application/json',  
							        url :spath+ '/user/check/checkValidateCode?code='+authCode,
							        dataType : 'json',  
							        success : function(data) 
							        { 
							          if(data==2){
							        	  nextImageCode();
							        	  error(obj,"");
							          }else if(data==1){
							        		  right(obj)
							        		tag5=true;
							          }else if(data==0){
							        		 error(obj,"");
							          }
							           
							        	
							        }
							 });
							
						}
						
						function searchKeyWord(flag){
							var keywords = $("#keywordsValue").val();
							if(flag=='1'){
								keywords='';
							}
							location.href="akd.html?keywords="+keywords
						}
					</script>
</body></html>