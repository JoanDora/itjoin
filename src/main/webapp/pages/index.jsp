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
<title>it分享联盟主页</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
</head>

<body>
	<header  class="C_header">
    	<div class="C_layout">
        	<a href="#"><img src="<%=path%>/resources/images/C_logo.jpg" /></a>
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
            </ul>
            <div class="C_top_right">
            	<div class="C_search">
                	<input type="text" class="C_text" value="关键字查找"/>
                    <i class="glyphicon glyphicon-search"></i>
                </div>
                <div class="C_dl">
                	<a href="#">登录</a><span>|</span>
                    <a href="#">注册</a>
                </div>
            </div>
        </div>
    </header>
	<div class="C_banner">
       <div id="full-screen-slider">
            <ul id="slides">
                <li style="background:url(<%=path%>/resources/images/C_banner.jpg) no-repeat center top" ></li>
                <li style="background:url(<%=path%>/resources/images/C_banner2.jpg) no-repeat center top" ></li>
            </ul>
        </div>
        		
    </div>
    <div class=" C_content" >
		<div class="C_tab">
        	<div class="C_layout" >
            	<ul>
                	<li class="active"><i class="glyphicon glyphicon-fire">
                    </i>最新课程<span class="glyphicon glyphicon-triangle-bottom"></span></li>
                    
                </ul>
                <a href="#">MORE>></a> 
            </div>
           
      </div>    	
        <div class="C_layout C_content_a" >
        	<ul>
            	<li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
                <li>
                	<a href="#">
                    	<img src="<%=path%>/resources/images/C_img2.jpg" />
                        <div>
                        	<h2>Zookeeper+Spring跨机房容</h2>
                            <p>C语言作为一门经典的编程语言，是很多软件的基础，在计算机领</p>
                            <span>主讲: 夜行侠</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
		<div class="C_link C_layout">
        	<span>友情链接: </span>
            <div>
            	<a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
                <a href="#">资源下载</a>
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
