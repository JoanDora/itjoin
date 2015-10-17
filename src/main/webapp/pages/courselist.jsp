<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程列表</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
 <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
</head>

<body>
<div style="height:100%">
	<%@ include file="header.jsp" %> 
	<div class=" C_content" >
		<div class=" C_layout" style="overflow:hidden;">
        	<div class="C_wz">您当前所在位置：<a href="<%=path %>/course/findLatest">首页</a>&gt;<a href="<%=path %>/course/find">课程列表</a></div>
            <div class="C_content_l">
            	<div class="C_content_l_a">
                	<h2><i class="glyphicon glyphicon-menu-hamburger"></i>课程分类</h2>
                    <ul id="categorys">
                    </ul>
                </div>
                <img src="<%=path%>/resources/images/C_gbg.jpg" />
            </div>
            <div class="C_content_r">
            	<ul>
            	 <c:forEach var="course" items="${courses}" varStatus="status"> 
                	<li>
                    	<a href="<%=path%>/video/find/${course.id}">
                        		<img src="<%=path%>/image/show?fileName=${course.imageUrl}"   onerror="this.src='<%=path %>/resources/images/default_video.jpg'"/>
                            <div>
                            	<h2>${course.name }</h2>
                                <p>${course.description }</p>
                                <span>主讲: ${course.teacherName }</span>
                                <span>浏览次数：${course.browseCount }</span>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
                 <c:if test="${courses!= null && fn:length(courses) > 0}">
               <div class="C_fy"  style="margin-top:30px;">
                	  <dl id="paginationId">
                       </dl>
                </div>
                </c:if>
            </div>
            
        </div>
    </div>
    <%@ include file="footer.jsp" %> 
   </div>
 
   <script>
   var totalPage = '${totalPage}';
	var pageNum =parseInt('${pageNum}')+1;
	var paginationSrc = [];
	if(pageNum<2){
		paginationSrc.push('<dt><a href="javascript:void(0)"> <上一页 </a></dt>')
		
	}else{
		paginationSrc.push('<dt><a href="javascript:getData('+(pageNum-2)+')"> <上一页 </a></dt>')
	}
	for(var i=0;i<totalPage;i++){
		if(i>5){
			paginationSrc.push('<dd style="margin:0px 5px;">...</dd>');
			break;
		}
		if(i !=(pageNum-1)){
			paginationSrc.push('<dd><a  href="javascript:getData('+i+')"> '+(i+1)+'</a></dd>');
		}else{
			paginationSrc.push('<dd><a  href="javascript:void(0)" style="color:red"> '+(i+1)+'</a></dd>');
		}
	
	}
	if(pageNum<totalPage){
		paginationSrc.push('  <dt ><a href="javascript:getData('+(pageNum)+')"> 下一页> </a></dt>')
	}else{
		paginationSrc.push('  <dt ><a href="javascript:void(0)"> 下一页> </a></dt>')
	}
	$("#paginationId").append(paginationSrc.join(''));
          
	var categoryId ='${categoryId}';
	function getData(page){
		location.href=spath+"/course/find?page="+page+"&categoryId="+categoryId;
	}
	
	$(function(){
		var path = spath+"/course/find?categoryId=";
		$.ajax({
			type : "GET",
			dataType : "json",
			url : spath + "/courseCategory/getAll",
			success : function(data) {
				var htmlSrc = [];
				for(var i in data){
					var realPath =path+ data[i].id+""
					htmlSrc.push('<li><a href="'+realPath+'">'+data[i].name+'</a></li>')
				}
				$("#categorys").append(htmlSrc.join(''));
			},
			error : function(err) {
			}
		});
	})
   </script>
</body>
</html>
