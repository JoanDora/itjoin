<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
html, body {
    height: 100%;
    margin: 0px;
    padding: 0px;
}
</style>
</head>

<body>
	<%@ include file="header.jsp" %> 
	<div class=" C_content" >
		<div class="C_layout" style="padding:40px 10px; border-bottom:1px dotted #ddd; overflow:hidden; ">
        	<button style="background:#58a210; line-height:40px; color:#fff; padding:0 20px; border-radius:8px; border:none;">下载视频录制工具</button>
        </div>
		<div class=" C_layout C_about_us" style="overflow:hidden;">
		     <span>
		        ${webinfo.content }
		     </span>
         <!--   	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
            	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
                	<p>故事发生在北京，一群从小一起长大的年轻人满怀信心和梦想步入社会。北京大 妞大猫儿，立志要成为一名顶尖广告创意人。她放弃了收入丰厚的销售工作，以实习生身份进入创意部。刚报到，女上司就给大猫儿安排了一次相亲，对象裴格是个“高帅富”。大猫儿的生活就像坐上了过山车。大猫儿的闺蜜们同样面临情感问题：小乔与男友齐江相恋10年，却得知他的母亲不喜欢自己，同时青年企业家何乙也热烈追求自己；樱子与男友宽哥分手后，无意间与老板老范相识，引出一段奇情...[查看详情]</p>
 -->        </div>
    </div>
     <%@ include file="footer.jsp" %> 
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
</body>
</html>
