<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课时管理</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css//style.css"
	type="text/css">
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class=" C_content" >
		<div class="C_layout C_kclist  C_kslist">
        	<h2><span>课时列表</span> <button class="C_bj">添加课时</button></h2>
        	<ul>
            	<li>
                	<div class="C_div" >
                   <p> <span>免费</span><b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b><small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                <li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i>第一课：Zookeeper+Spring跨机房容跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布跨机房容灾系统以及灰度发布灾系统以及灰度发布</b> <small>20:00</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="#" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
            </ul>
            <div class="C_fy" >
             <dl>
                	<dt><a href="#"> <上一页 </a></dt>
                	<dd><a  href="#"> 1 </a></dd>
                    <dd><a  href="#"> 2 </a></dd>
                    <dd><a  href="#"> 3 </a></dd>
                    <dd><a  href="#"> 4 </a></dd>
                    <dd><a  href="#"> 5 </a></dd>
                    <dd style="margin:0px 5px;">...</dd>
                    <dt ><a href="#"> 下一页> </a></dt>
                    <dd></dd>
                </dl>
             </div>  
        </div>
    </div>
  
    <!-- 弹出框-->
    <div class="C_box2 C_box3">
      <div class="C_box ">
      		<h3>课时编辑</h3>
            <ul>
            
            	<li ><span>课时标题：</span><input type="text"  name="name"/></li>
                <li ><span>简介：</span><textarea ></textarea></li>
                <li><span>是否免费试看：</span>
                	 <div>
                   	<span><input type="radio" name="radio" checked="checked" />是</span>
                    <span><input type="radio"  name="radio"/>否</span>
                    </div>
                </li>
                <li ><span>视频：</span>
                   <input type="file" style=" width:70%; margin-left:120px; border:none; " />
                </li>
                 <li ><span>视频时长：</span>
                   <input type="text"/> 分<input type="text"/> 秒 
                    <p>时长为整数</p>
                </li>
                 
                 <li> <button>取消</button> <button>确定</button></li>
            </ul>
      </div>
     </div> 
     
       <%@ include file="footer.jsp" %> 
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.jslides.js"></script>
   
	<script >
    
			$(function(){
			  $(".C_qc").click(function(){
			  	$(this).parents("li").hide();
			  
			  });
			  $(".C_kslist li").hover(function(){
			  	$(".C_kslist li .C_div2").hide();
				$(this).children(".C_div2").show();
			  
			  },function(){$(this).children(".C_div2").hide();});
			   
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
		
		
    </script>
</body>
</html>