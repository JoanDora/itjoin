<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传视频</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
</head>

<body>
	<header  class="C_header">
    	<div class="C_layout">
        	<a href="index.jsp"><img src="<%=path%>/resources/images/C_logo.jpg" /></a>
            <ul class="C_nav">
            	<li><a href="#">首页</a></li>
                <li><a href="#">课程<i class="glyphicon glyphicon-triangle-bottom"></i></a>
                	<div class="C_nav2">
                    	<a href="#">DIV+CSS</a>
                        <a href="#">ET</a>
                         <a href="#">JAVA</a>
                        <a href="#">前端技术 </a>
                        <a href="#">JAVA</a>
                        <a href="#">asp</a>
                        <a href="#">.NET</a>
                        <a href="#">网页设计</a>
                        <a href="#">安卓</a>                    
                     </div>
                </li>
                  <li><a href="uploadvideo.jsp">上传视频</a></li>
                <li><a href="about.jsp">关于我们</a></li>
            </ul>
            <div class="C_top_right">
            	<div class="C_search">
                	<input type="text" class="C_text" value="关键字查找"/>
                    <i class="glyphicon glyphicon-search"></i>                </div>
                <div class="C_dl">
                	<a href="#">登录</a><span>|</span>
                    <a href="#">注册</a>                </div>
            </div>
        </div>
</header>
	<div class=" C_content" >
		<div class="C_layout C_scsp">
        	<ul>
            	<li><span>课程分类:</span><input  type="text"/>
                	<dl>
                    	<dd>4444</dd>
                        <dd>77777</dd>
                        <dd>4444</dd>
                    </dl>
                </li>
                <li><span>课程标题:</span><input  type="text"/></li>
                <li><span>课时:</span><input  type="text"/></li>
                <li><span>录制人:</span><input  type="text"/></li>
                <li><span>视频:</span>
                <div style=" width:80%; float:left;">
                <form method="post" name="f1">
                <input type="text" name="predent" id="puf"  style=" width:80%; float:left;"/>
                <input type="button" value="浏览..." onclick="mc()" style=" width:20%; float:left;" />
                <input type="file" name="uf" id="uploadfile" style="display:none" onchange="mm()" />
                </form>
                </div>
              
               </li>
                <li><span>简介:</span><textarea></textarea> </li>
                <li><button>提交</button></li>
                </ul>
        </div>
    </div>
    <footer>
    	Copytright 2008-2013  课程内容版权均归学ii分享联盟网所有 桂ICP备15004246号
    </footer>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/fileinput.js"></script>
   <script type="text/javascript" src="<%=path%>/resources/js/fileinput_locale_zh.js"></script>
    <script type="text/javascript">
    	$(function(){
			$(".C_scsp li:first-child input").click(function(){
			  if($(".C_scsp li:first-child dl").is(":hidden"))
			  { $(this).next("dl").show();}
			  else{$(this).next("dl").hide();}
			
			});
			$(".C_scsp li:first-child dl dd").click(function(){
				var zhi=$(this).html();
				$(".C_scsp li:first-child input").val(zhi);
				$(".C_scsp li:first-child dl ").hide();
			
			});		
		
		});
    </script>
    <script>
	$=function(id){return document.getElementById(id);}
	function mc(){var _i=$("uploadfile");_i.click();}
	function mm(){$("puf").value=(document.f1.uf.value);}
	window.onload=function(){
	}
	</script>	
    
</body>
</html>
