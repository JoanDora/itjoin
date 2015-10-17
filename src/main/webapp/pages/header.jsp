<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<basePath value ="<%=path%>"  id ="basePath"></basePath>
<script type="text/javascript">
var spath =$('#basePath').attr("value");
</script>
</head>
<body>
<header  class="C_header">
    	<div class="C_layout">
        	<a href="#"><img src="<%=path%>/resources/images/C_logo.jpg" /></a>
            <ul class="C_nav">
            	<li><a href="<%=path %>/course/findLatest">首页</a></li>
                <li><a href="<%=path %>/course/find">课程<i class="glyphicon glyphicon-triangle-bottom"></i></a>
                	<div class="C_nav2"  id="headCategorys">
                    </div>
                </li>
                    <li><a href="<%=path %>/course/list">我的课程</a></li>
                <li><a href="<%=path %>/webinfo/show">关于我们</a></li>
            </ul>
            <div class="C_top_right">
            	<div class="C_search">
                	<input type="text" class="C_text" id="keyword"  placeholder="关键字查找"/>
                    <i class="glyphicon glyphicon-search"  style="cursor:pointer;"  onclick="javascript:searchByKey();"></i>
                </div>
                
                <c:if test="${sessionScope.user == null}">
                <div class="C_dl">
                	<a href="<%=path %>/login">登录</a><span>|</span>
                    <a href="<%=path %>/register">注册</a>
                </div>
                </c:if>
                 <c:if test="${sessionScope.user !=null}">
                <div class="C_dl">
                	<a href="javascript:void(0)">${sessionScope.user.userName }</a><span>|</span>
                	 <a href="<%=path %>/exit">退出</a>
                </div>
                </c:if>
            </div>
        </div>
    </header>
    <script type="text/javascript">
	$(function(){
		var path = spath+"/course/find?categoryId=";
		$.ajax({
			type : "GET",
			dataType : "json",
			url : spath + "/courseCategory/getAll",
			success : function(data) {
				$("#headCategorys").empty();
				var htmlSrc = [];
				for(var i in data){
					var realPath =path+ data[i].id+""
					htmlSrc.push('<a href="'+realPath+'">'+data[i].name+'</a>');
				}
				$("#headCategorys").append(htmlSrc.join(''));
			},
			error : function(err) {
			}
		});
	})
	
	function searchByKey(){
		var keyword = $("#keyword").val();
		location.href=spath+"/course/find?keyword="+keyword;
	}
	
    </script>
</body>
</html>
