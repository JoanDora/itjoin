<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<header  class="C_header">
    	<div class="C_layout">
        	<a href="#"><img src="<%=path%>/resources/images/C_logo.jpg" /></a>
            <ul class="C_nav">
            	<li><a href="<%=path %>/pages/index.jsp">首页</a></li>
                <li><a href="<%=path %>/pages/list.jsp">课程<i class="glyphicon glyphicon-triangle-bottom"></i></a>
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
                    <li><a href="<%=path %>/pages/uploadvideo.jsp">上传视频</a></li>
                <li><a href="<%=path %>/webinfo/show">关于我们</a></li>
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
</body>
</html>
