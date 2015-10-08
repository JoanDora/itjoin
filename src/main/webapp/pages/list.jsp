<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
</head>

<body>
	<header  class="C_header">
    	<div class="C_layout">
        	<a href="#"><img src="<%=path%>/resources/images/C_logo.jpg" /></a>
            <ul class="C_nav">
            	<li><a href="index.jsp">首页</a></li>
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
                        <a href="#">安卓</a>                    </div>
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
		<div class=" C_layout" style="overflow:hidden;">
        	<div class="C_wz">您当前所在位置：<a href="#">首页</a>&gt;<a href="#">课程列表</a>&gt;<a href="#">手机开发</a></div>
            <div class="C_content_l">
            	<div class="C_content_l_a">
                	<h2><i class="glyphicon glyphicon-menu-hamburger"></i>课程列表</h2>
                    <ul>
                    	<li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                        <li><a href="#">手机开发</a></li>
                    </ul>
                </div>
                <img src="<%=path%>/resources/images/C_gbg.jpg" />
            </div>
            <div class="C_content_r">
            	<ul>
                	<li>
                    	<a href="#">
                        	<img src="<%=path%>/resources/images/C_img2.jpg" />
                            <div>
                            	<h2>Zookeeper+Spring跨机房容灾系统以及灰度发布 </h2>
                                <p>本课程系北风产品总监风舞烟老师的又一力作。系统全面深入的介绍了BootStrap企业级开发应用所需的全
                                部技能。共三季，近百讲。 第一季：基础篇，侧重于BootStrap 相关 API 详解。主要...</p>
                                <span>主讲: 夜行侠</span>
                                <span>浏览次数：20</span>
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="<%=path%>/resources/images/C_img2.jpg" />
                            <div>
                            	<h2>Zookeeper+Spring跨机房容灾系统以及灰度发布 </h2>
                                <p>本课程系北风产品总监风舞烟老师的又一力作。系统全面深入的介绍了BootStrap企业级开发应用所需的全
                                部技能。共三季，近百讲。 第一季：基础篇，侧重于BootStrap 相关 API 详解。主要...</p>
                                <span>主讲: 夜行侠</span>
                                <span>浏览次数：20</span>
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="<%=path%>/resources/images/C_img2.jpg" />
                            <div>
                            	<h2>Zookeeper+Spring跨机房容灾系统以及灰度发布 </h2>
                                <p>本课程系北风产品总监风舞烟老师的又一力作。系统全面深入的介绍了BootStrap企业级开发应用所需的全
                                部技能。共三季，近百讲。 第一季：基础篇，侧重于BootStrap 相关 API 详解。主要...</p>
                                <span>主讲: 夜行侠</span>
                                <span>浏览次数：20</span>
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="<%=path%>/resources/images/C_img2.jpg" />
                            <div>
                            	<h2>Zookeeper+Spring跨机房容灾系统以及灰度发布 </h2>
                                <p>本课程系北风产品总监风舞烟老师的又一力作。系统全面深入的介绍了BootStrap企业级开发应用所需的全
                                部技能。共三季，近百讲。 第一季：基础篇，侧重于BootStrap 相关 API 详解。主要...</p>
                                <span>主讲: 夜行侠</span>
                                <span>浏览次数：20</span>
                            </div>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<img src="<%=path%>/resources/images/C_img2.jpg" />
                            <div>
                            	<h2>Zookeeper+Spring跨机房容灾系统以及灰度发布 </h2>
                                <p>本课程系北风产品总监风舞烟老师的又一力作。系统全面深入的介绍了BootStrap企业级开发应用所需的全
                                部技能。共三季，近百讲。 第一季：基础篇，侧重于BootStrap 相关 API 详解。主要...</p>
                                <span>主讲: 夜行侠</span>
                                <span>浏览次数：20</span>
                            </div>
                        </a>
                    </li>
                </ul>
                <dl class="fy">
                	<dt><a href="#"> <上一页 </a></dt>
                	<dd><a  href="#"> 1 </a></dd>
                    <dd><a  href="#"> 2 </a></dd>
                    <dd><a  href="#"> 3 </a></dd>
                    <dd><a  href="#"> 4 </a></dd>
                    <dd><a  href="#"> 5 </a></dd>
                    <dd style="margin:0px 5px;">...</dd>
                    <dt ><a href="#"> 下一页> </a></dt>
                </dl>
            </div>
        </div>
    </div>
    <footer>
    	Copytright 2008-2013  课程内容版权均归学ii分享联盟网所有 桂ICP备15004246号
    </footer>
   
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
   
</body>
</html>
