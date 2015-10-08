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
<title>网站简介</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css//style.css" type="text/css" >
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
		<div class=" C_layout C_about_us" style="overflow:hidden;">
           	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
            	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
                	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
        </div>
    </div>
    <footer>
    	Copytright 2008-2013  课程内容版权均归学ii分享联盟网所有 桂ICP备15004246号
    </footer>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
    
   
</body>
</html>
