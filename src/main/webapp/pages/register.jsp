<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <link rel="stylesheet" href="/resources/css/ack/index_yc.min.css" />
    <link rel="shortcut icon" href="/resources/image/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/image/favicon.ico"
    type="image/x-icon">
    <!--<fk:base-styles>-->
<link rel="stylesheet"  href="/resources/css/ack/logincox.css">
<link rel="stylesheet" href="/resources/css/ack/loginbase.css">
<link rel="stylesheet" href="/resources/css/ack/index.css?v=0.6.6" />
<link rel="stylesheet" href="/resources/css/ack/Cox.css?v=0.6.6" />
<link rel="stylesheet" href="/resources/css/ack/base.css?v=0.6.6" />
<!--</fk:base-styles>-->
    <style>
        .sidebar-nav{
            display:none!important;
        }
    </style>
    
<title>会员注册 - 一起咔名车广场</title>
<!--<fk:styles>-->
<link rel="stylesheet" href="/resources/css/ack/user-page.css">
<link rel="stylesheet" href="/resources/css/ack/register.css" />
<link rel="stylesheet"  href="/resources/css/ack/register2.css">
<!--</fk:styles>-->

    
<script type="application/json" data-id="user-data">

</script>

</head>
<body>
    <!--登录页头部-->

	<!--顶部工具条{-->
	<div id="akd_toolbar">
		<div class="grid-c1 clearfix">
			<div class="grid-c-l">
				<span>潮汕二手车经营</span> <span class="split"></span> <span>在线汽车交易电商平台</span>
			</div>
			<div class="grid-c-r">
				<span>欢迎您</span> <span class="userName" id="car_userName"></span> <span
					class="split"></span> <a href="javascript:logout();" class="logout">退出</a>
				<span class="login" id="car_login"> <a
					class="login-page-entry" href="/user/skip/login">请登录</a> <span
					class="split"></span> <a class="register-page-entry"
					href="/user/skip/register">免费注册</a>
				</span> <span class="split"></span>
				
			</div>
		</div>
	</div>
	<!--}顶部工具条-->

	<!--头部{-->
	<div id="akd_header" style="background:url(/resources/image/logo.jpg)")>
		<div class="mask"></div>
		<div class="header-wrap"   >
			<div class="grid-c1 clearfix"    style="float:left; padding-left:330px">
				<div class="grid-c-r-y clearfix" >
					<div class="grid-c-l search-bar"  >
						<div id="keywordForm"
							style="position: relative; z-index: 1000; display: block; padding: 3px; background-color: #404040; height: 30px;">
							<input type="text" autocomplete="off" name="word"
								id="keywordsValue" placeholder="输入您要查找车的关键字"
								x-webkit-grammar="builtin:search" x-webkit-speech />
							<button class="submit-btn" style="cursor: pointer"
								onclick="javascript:searchKeyWord('0');">
								搜&nbsp;&nbsp;&nbsp;索
							</button>
							<button class="all-btn" style="cursor: pointer"
								onclick="javascript:searchKeyWord('1');">全部车型</button>
							<div class="dropdown">
								<div class="wrap">
									<ul class="list unstyled">
									</ul>
								</div>
							</div>
						</div>
						<div class="top-keywords"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!--}头部-->

	<!--导航条{-->
	<div id="akd_nav">
		<div class="grid-c1">
			<div class="clearfix nav-wrap">
				<div class="grid-c-l category-nav">
					<a href="javascript:;" class="dropdown-btn">按照分类快速选车<i></i></a>
				</div>

				<div class="grid-c-l nav-bar-wrap">
					<ul class="nav-bar clearfix unstyled">
						<li class="first-item"></li>
						<li class="item"><a href="/car/main" title="首页">首 页</a></li>
						<li class="split"></li>
						<li class="item"><a href="/car/main" target="_blank"
							title="选车中心">选车中心</a></li>
						<li class="split"></li>
						<li class="item"><a href="javascript:void(0)" target="_blank"
							title="售后质保">售后质保</a></li>
						<li class="split"></li>

						<li class="item"><a href="javascript:void(0)" target="_blank"
							title="汽车保险">汽车保险</a></li>
						<li class="split"></li>
						<li class="last-item"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--}导航条-->
<!--顶部工具条{-->


<!--头部{-->

<!--}头部-->

<!--脚部{-->
<div id="akd_footer">
    <div class="footer-a">
        <div class="grid-c1 clearfix">
            <div class="grid-c-l links clearfix">
              <div class="grid-c-l category">
             
  
              </div>
                <div class="grid-c-l category">
                 
              </div>

            </div>
            <div class="contact grid-c-r clearfix">
                <div class="grid-c-l weixin">
                    <!--<fk:weixinqrcode>-->
                    <img  style="height:65PX; width:65px;"   src="/resources/image/together.jpg" ><!--</fk:weixinqrcode>--> 
                    <strong>关注一起咔微信账号</strong>
                    <p>
                        第一时间看车源！<br>
                        赶紧扫一下
                  </p>
                    <div><a href="http://weibo.com/u/5472956244" target="_blank" class="weibo-entry" rel="nofollow"><i></i>一起咔新浪微博</a></div>
              </div>
                <div class="grid-c-l tel">
                    <strong>购车热线</strong>
                    <em><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18029784887</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0768-6530230</p></em>
                    <span>营业时间: 08:30-21:30</span>
                </div>
            </div>
        </div>
      <div class="grid-c1 container">
          <div class="content">
            <div class="content-wrap">
              <div class="register-form grid-c2">
                <h2>&nbsp;</h2>
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
										<span class="state-tip "> <i
											class="state-icon "></i>
									</span> 请填写您的姓名
								</span>
								</label> <label> <span class="title">手机号码</span> <input
									type="text" placeholder="18682377245" autocomplete="off"
									name="phone" class="input-text"
									onblur="javascript:checkPhone(this);" /> <span class="tip">
										<span class="state-tip ">
										 <i class="state-icon " id="phoneInfo"></i>
									</span> 请填写11位手机号码
								</span>
								</label> 
								
								<label> <span class="title">邮箱</span> <input
									type="text" placeholder="xxxx@xxx.com" autocomplete="off" onblur="javascript:checkEmail(this);" 
									name="email" class="input-text"/> <span class="tip">
										<span class="state-tip ">
										 <i class="state-icon " id="emailInfo"></i>
									</span> 请填写正确的邮箱
								</span>
								</label>
								
								<label> <span class="title">密 码</span> <input
									type="password" autocomplete="off" name="loginPwd" id="loginPwd"
									class="input-text" onblur="javascript:checkPwd(this);"
									test="and(must, reg(/^(?!(.)\1+$)(?!\d+$)(?![a-zA-Z]+$).{6,20}$/))"
									maxlength="20" /> <span class="tip"> <span
										class="state-tip">
										<i class="state-icon " id="pwdInfo"></i>
										</span> 长度6~20位，至少包含数字、字母、字符中的两种
								</span>
								</label> <label> <span class="title">确认密码</span> <input
									type="password" autocomplete="off" name="confirmPwd"
									class="input-text" onblur="javascript:checkRePwd(this);"
									test="and(must, eq('Password'))" /> <span class="tip">
										<span class="state-tip">
										<i class="state-icon " id="comfirmPwdInfo"></i>
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
									<button type="submit"  id="submit" style="cursor:pointer">同意协议并注册</button>
									<a href="#">《用户协议》</a>
								</div>
							</form>
                  <div class="grid-c-l other">
                    <div class="old-user-entry"> <span>已有一起咔账号？ </span> <a href="/user/skip/login" class="login-page-entry">立即登录</a> </div>
                    <div class="sns-user-entry"> <span>使用合作网站账号登录</span> <a href="http://www.17car.cc/register/?ReturnUrl=http%3A%2F%2Fwww.17car.cc%2F#" class="qq-user-entry"><i></i>QQ</a> <a href="http://www.17car.cc/register/?ReturnUrl=http%3A%2F%2Fwww.17car.cc%2F#" class="weibo-user-entry"><i></i>新浪微博</a> </div>
                  </div>
                </div>
              </div>
              <!--成功消息-->
              <div class="register-success grid-c2 default">
                <p class="highlight">恭喜您，账户注册成功</p>
                <p>您的注册账号是: <strong class="account"></strong></p>
                <p class="jump-tip">系统将在 <span class="count-down">5</span> 秒后返回到登录页, 如果没有请 <a href="http://www.17car.cc/member/?md=ModifyInfo">点击手动跳转</a></p>
              </div>
              <!--邮件消息-->
              <div class="register-success grid-c2 email">
                <p class="highlight">还差一步，请激活您的账户</p>
                <p class="state-tip">系统已发送了一封邮件到您的邮箱</p>
                <p>请访问您的邮箱<a href="javascript:;" class="open-mailbox-btn user-name">maolion.j@gmail.com</a>, 点击邮件中的链接便可激活您的账户</p>
                <div class="tip">
                  <div class="wrap">
                    <p>如果没有收到激活邮件</p>
                    <ul>
                      <li>也许邮件被您的邮箱误认为是垃圾邮件而放到垃圾箱中，请检查一下</li>
                      <li>或者, 您可以<a class="resend-btn" href="javascript:;">点此重新发送激活邮件</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <!--短信消息-->
              <div class="register-success grid-c2 mobile">
                <p class="highlight">还差一步，请激活您的账户</p>
                <p>系统已发送了一条验证短信到您的手机，请输入您收到的验证码，XX秒内有效</p>
                <p>验证码：
                  <input type="text" name="AuthCode" class="input-text">
                </p>
                <p>
                  <button>确认提交</button>
                </p>
                <div class="tip">
                  <div class="wrap">
                    <p>如果没有收到激活短信</p>
                    <ul>
                      <li>也许信息被您的手机误认为是垃圾短信而放到垃圾箱中，请检查一下</li>
                      <li>或者, 您可以<a class="resend-btn" href="http://www.17car.cc/register/?ReturnUrl=http%3A%2F%2Fwww.17car.cc%2F#">点此重新发送激活信息</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
        

</div>
  </div>
</div>
 <!--脚部{-->
<div id="akd_footer">
 
      <div class="contact grid-c-r clearfix">
        <div class="grid-c-l weixin"> 
          <!--<fk:weixinqrcode>--> 
          <img src="/resources/image/together.jpg"><!--</fk:weixinqrcode>--> 
          <strong>关注一起咔微信账号</strong>
          <p> 第一时间看车源！<br>
            赶紧扫一下 </p>
          <div><a href="http://weibo.com/5472956244" target="_blank" class="weibo-entry" rel="nofollow"><i></i>一起咔新浪微博</a></div>
        </div>
        <div class="grid-c-l tel"> 
          <p>&nbsp;</p>
          <p><strong>购车热线</strong> <em><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18029784887</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0768-6530230</p></em> <span>营业时间:9：00-21:00</span></p>
        </div>
        
      </div>
</div>
  </div>
</div> 
<div class="car_foot">
<div class="footer-a">
  
    <div class="grid-c1 clearfix">
    
    
     
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>一起咔名车广场成立于2014年， 潮汕地区二手车行业第一家O2O电商平台！</p>
      <p>© 2014-2015 all right reserved <a href="http://www.17car.cc/">一起咔名车广场</a>(www.17car.cc) 版权所有 <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">粤ICP备15012141号</a></p>
</div>
<div class="footer-b">
  <div class="grid-c1">
    <div class="website-links">
      <div class="copyright"> </div>

    </div>
  </div>
</div>
</div>

<div id="imgBox" style="display: none">
						<img src="/resources/image/loading.gif" alt="" />
					</div>
<script type="text/javascript"
	src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/md5.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-form.js"></script>
<script type='text/javascript' src=' /resources/js/easydialog/easydialog.min.js'></script>
</div>
<!--}脚部--> 
<script type="text/javascript">
function nextImageCode() {
	$("#imageCode").attr("src", "/user/validataCode?time=" + new Date());
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
										url : '/user/register',
										type : "POST",
										dataType : "json",
										beforeSubmit : function() {
											openDialog();
										},
										success : function(data) {
											if(data==1){
												alert("保存成功");
												easyDialog.close();
												window.location.href ="/car/main"
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
											url : '/user/check/phone/'+phone,
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
										url : '/user/check/email',
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
							        url : '/user/check/checkValidateCode?code='+authCode,
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