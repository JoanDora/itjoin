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
<title>上传视频</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
</head>

<body>
	<%@ include file="header.jsp" %> 
<div class=" C_content" >
      <form action="<%= path%>/course/save"  >
      
		<div class="C_layout C_scsp">
		<input type="hidden" name="categoryId" id="categoryId">
        	<ul >
            	<li><span>课程分类:</span>
            	<input  type="text"  id="categoryIdSelect" />
                	<dl >
                    	<dd value="1">java</dd>
                        <dd value="2">c#</dd>
                        <dd value="3">android</dd>
                         <dd value="4">ios</dd>
                    </dl>
                </li>
                <li><span>课程标题:</span><input  type="text"  name="name"/></li>
                 <li><span>视频封面:</span>
                  <input type="file"  style="  height:35px; border:none;"  name="image" />
                 <li><span>价格:</span><input  type="text" name="price"/></li>
                <li><span>状态:</span>
                   <div>
                   	<span><input type="radio" name="radio" checked="checked"  value="0"/>更新中</span>
                    <span><input type="radio"  name="radio" value="1"/>更新完毕</span>
                     <input type="hidden" name="status" id="status" value="0">
                    </div>
                    
                   </li>
               </li>
                <li><span>简介:</span><textarea></textarea> </li>
                <li><span>课时列表:</span>
                	<div>
                       <p><button class="C_clear">删除全部</button> <button class="C_bj">添加课时</button></p>
                    	<dl class="C_ks">
                        	<!-- <dd><b>第一课:程内容版权均归学ii分享</b><a href="#" class="C_bj">编辑</a> <a href="#" class="C_clear2"> 删除</a>
                            <dd><b>第二课:程内容版权均归学ii分享</b><a href="#" class="C_bj">编辑</a> <a href="#" class="C_clear2"> 删除</a>	
                            </dd> -->
                        </dl>
                    </div>
                </li>
                <li><input type="submit"  value="提交"></li>
                </ul>
        </div>
    </div>
</form>
    <!-- 弹出框-->
    <div class="C_box2">
      <div class="C_box">
      		<h3>课时编辑</h3>
            <ul>
            	<li><span>课时名字：</span><input type="text" name="video.name" /></li>
                <li><span>节数：</span><input type="text"  name="video.order"/></li>
                <li ><span>视频地址：</span>
                <input type="file"  style="height:35px; border:none;" name="videoFile"/>
                </li>
                 <li> <button>取消</button> <button>确定</button></li>
            </ul>
      </div>
     </div> 
     <%@ include file="footer.jsp" %> 
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
   
	<script >
    	$(function(){
			$(".C_scsp li:first-child input").click(function(){
			  
			  if($(".C_scsp li:first-child dl").is(":hidden"))
			  { $(this).next("dl").show();}
			  else{$(this).next("dl").hide();}
			
			});
			$(".C_scsp li:first-child dl dd").click(function(){
				var zhi=$(this).html();
				$(".C_scsp li:first-child input").val(zhi);
				$(".C_scsp li:first-child dl ").hide();
			
			});	
			
			$(function(){
				$(".C_clear").click(function(){
					$(this).parents("div").children("dl").hide();
				});
				
			   $(".C_ks dd a.C_clear2").click(function(){
			    $(this).parents("dd").hide();
			   
			   });	
			   
			   $(".C_bj").click(function(){
			    $(".C_box2").show();
				 var height=$(".C_box").outerHeight(true);
			    var height_pm=$(window).height();
				$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
			    
			   });
			   $(".C_box button:first-child").click(function(){
			   		$(".C_box2").hide();
			   	
			   });
			
			});	
		
		});
    </script>
</body>
</html>
