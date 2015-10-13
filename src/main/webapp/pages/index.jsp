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
<%-- <jsp:include page="header.jsp" /> --%>
<%@ include file="header.jsp" %> 
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
                <a href="<%=path %>/course/find">MORE>></a> 
            </div>
           
      </div>    	
        <div class="C_layout C_content_a" >
        	<ul>
        	  <c:forEach var="course" items="${courses}" varStatus="status"> 
            	<li>
                  <a href="<%=path%>/video/find/${course.id}">
                    	<img src="<%=path%>/image/show?fileName=${course.imageUrl}"  width=175px height:=114px;/>
                        <div>
                        	<b>${course.name }</b></br>
                            <p>${course.description }</p>
                             <span>主讲: ${course.teacherName }</span>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
		<div class="C_link C_layout">
        	<span>友情链接: </span>
            <div>
            	<a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
            <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
               <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
              <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
               <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
       <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
              <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
        <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
                <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
              <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
                <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
                <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
                <a href="http://www.xuetuwuyou.com/course/15">学途无忧</a>
            </div>
        </div>
    </div>
     <%@ include file="footer.jsp" %> 
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
</body>
</html>
