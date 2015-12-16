<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的课程列表</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/detail/details.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/detail/base.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/detail/reset.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/detail/course-list.css" type="text/css">
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/image.js"></script>
<script type="text/javascript">
	function skip(id) {
		location.href = spath + "/video/find/" + id;
	}
</script>
<style>

</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<!-- Start mainNav -->
	<div class="mainNav mb20 bc"></div>
	<!-- Start content -->
    <div class="content cf">
	<!-- Start 课程banner信息 -->
    <div class="details-topcon">
    	<a href="javascript:;" class="fl details-topcon-play">
                           	<span class="play a_lkst" style="width:164px">立刻试听</span>
                   			<img src="<%=path%>/image/show?fileName=${course.imageUrl}" alt="" >
            				<span class="mask"></span>
       	</a>
       	<div class="fr details-topcon-info">
            <h3 class="title">${course.name}</h3>
            <ul class="summary">
                <li class="price">
                    <span class="fl text">价　　格</span>
                    <span class="fl num"><em class="money">¥</em>${course.price}</span>
                    <span id="coupon_list"></span>
                </li>
                <li class="purchase">
                    <span class="text">累计购买</span>
                    <em class="c-333">${course.buyCount}</em>
                    <i>|</i>
                    <span class="text">学生满意度</span>
                    <em class="c-333">xxx%</em>(<a href="javascript:;" id="comment_tab_switch" class="c-666">查看评价xxx条</a>)
                </li>
                <li class="total">
                    <span class="text">总课时</span>
                    <em>${course.period}</em>课时
                </li>
                <!-- <li class="validity">
                    <span class="text">有效期</span>
                    <em>1100</em>天
                    <div class="validity-help">
                        <i class="ico-validity-help"></i>
                        <span class="arrow-b"> 自购买之日起可以使用课程的期限
                        	<i class="top"></i>
                        	<i class="bot"></i>
                        </span>
                    </div>
                </li> -->
            </ul>
             <div class="apply">
                <!-- 开始学习加上类名  ck-btn2  人以报满 加上类 ck-btn-gray -->
                <span id="btnList">
                    <a href="javascript:;" class="buyBtn fl ck-btn ck-btn1" onclick="courseBuy('${course.id}');">立刻购买</a>
                    <a href="javascript:;" class="fl cart" id="addToCart"><i class="ico-cart ti">加入购物车</i></a>
                </span>
            </div>
        </div>
      </div>
      <!-- End 课程banner信息 -->
   
        <!-- End content -->
    
     <!-- Start 课程套餐-->
    <span id="coursepackage"></span>
    <!-- End 课程套餐-->
    
     <!-- Start 左列 -->
    <div class="fl main details-info">
    	<!-- 导航  滚动的时候加上类名  fixed-->
        <div class="m-nav" id="tabs">
            <ul id="tab_switch">
                <li tab="brief" class="c-jj "><a href="javascript:;" class="link curr">课程简介</a></li>
                <li tab="dirBrief" class="c-ml"><a href="javascript:;" class="link">课程目录</a></li>
                <li tab="comment" id="comment" class="c-pj"><a href="javascript:;" class="link">课程评价 <em class="c-orange">xx</em> </a></li>
            </ul>
        </div>
    
    	<!-- =S 课程简介 -->
    	<div class="m-content" id="box_content">            
            <div class="con-intro-change">
            	<div class="con-intro-bd">
            	<p>
					<span style="font-family:&#39;Microsoft YaHei&#39;;font-size:18px;">&nbsp; &nbsp; &nbsp;<span style="font-size:24px;color:#337FE5;"> 深圳市大象在线分享科技有限公司</span></span><span style="font-family:&#39;Microsoft YaHei&#39;;"><span style="color:#337FE5;"></span><span style="font-size:16px;">（简称“大象分享”）公司位于深圳南山区，是一家专注于最新IT技术分享的科技公司。</span></span> 
				</p>
				<p>
					<br>
				</p>
				<p>
					<span style="font-family:" font-size:16px;"="">&nbsp; <span style="font-size:16px;">公司致力于为程序员提供最新技术视
				频分享，立志把公司打造成为中国最具影响力IT在线分享平台，大象分享将秉承与时俱进不断创新的互联网技术分享精神，注重服务与广大IT界人士，为互联网培养一
				批技术牛人。
					</span></span> 
				</p>
				<span style="font-size:18px;"></span> 
				<p>
					<br>
				</p>
				<p>
					<c:choose>  
					    <c:when test="${fn:length(course.description) > 70}">  
					        <c:out value="${fn:substring(course.description, 0, 70)}......" />  
					    </c:when>  
					   <c:otherwise>  
					      <c:out value=" ${course.description}" />  
					    </c:otherwise>  
					</c:choose>  
				</p>
				</div>
                
            </div>
           <!-- =E 课程简介 -->
           <div class="m-catalog">
            	<div class="header"><h2 class="title">课程目录</h2></div>
                <h3 class="chapter-title"><em>第1章</em>xxxx</h3>
                <ul class="m-catalog-list">
                	<li class="bg-cor">
	                    <div class="chapter">
	                    <span class="num">1</span>
	                    <h4 class="fl title">xxxx</h4>
							<div class="fl complete">可试听整节</div>
								<a href="" class="fr listen ck-btn ck-btn4" target="_blank">试听</a>
							</div>
					</li>
				</ul>
				</div>
    </div>
    
    
    
    
      </div></div>
    <!-- End mainNav -->
</body>
<script>
function courseBuy(id){
	location.href=spath+"/pay/goPayPage/"+id;
}
</script>
</html>
