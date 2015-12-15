<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大象在线分享主页</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
<style>
.C_content_a li a img{ width:283px; height:185px;}
</style>
</head>
<script type="text/javascript"
 src="<%=path %>/resources/js/qq/qc_loader.js" charset="utf-8" data-callback="true"></script>
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
            	<li style="width:300px;height:323px;">
                  <a href="javascript:void(0)">
                    	<img onclick="javascript:showCourse('${course.id}')" src="<%=path%>/image/show?fileName=${course.imageUrl}"  onerror="this.src='<%=path %>/resources/images/default_video.jpg'"/>
                        <div>
                        	<b>${course.name }</b></br>
                        	<p>
                        	<c:choose>  
							    <c:when test="${fn:length(course.description) > 40}">  
							        <c:out value="${fn:substring(course.description, 0, 40)}......" />  
							    </c:when>  
							   <c:otherwise>  
							      <c:out value=" ${course.description }" />  
							    </c:otherwise>  
							</c:choose>  
                           </p>
                            <p style="color:red">${course.price }元</p>
                             <span>主讲: ${course.teacherName }</span> <span style="margin-left:30px;">
                             <input type="button"  onclick="buy('${course.id}');" style="background:#FFAA28;padding:0px 25px;line-height:30px;color:#FFF;font-family:'微软雅黑',Helvetica, Arial, Sans-Serif;font-size:16px;border:0" value="购买"/>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
		<!-- <div class="C_link C_layout">
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
        </div> -->
    </div>
     <%@ include file="footer.jsp" %> 
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
    <script>
       function showCourse(id){
    	   location.href=spath+"/video/find/"+id;
       }
       
       function buy(id){
    	   location.href=spath+"/pay/goPayPage/"+id;
       }
    </script>
</body>
</html>
