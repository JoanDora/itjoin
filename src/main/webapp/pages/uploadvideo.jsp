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
		<div class="C_layout C_scsp">
        	<ul>
            	<li><span>课程分类:</span><input  type="text"/>
                	<dl >
                    	<dd>4444</dd>
                        <dd>77777</dd>
                        <dd>4444</dd>
                         <dd>4444</dd>
                          <dd>4444</dd>
                    </dl>
                </li>
                <li><span>课程标题:</span><input  type="text"/></li>
                 <li><span>视频封面:</span>
                  <input type="file"  style="  height:35px; border:none;" />
                 <li><span>价格:</span><input  type="text"/></li>
                <li><span>状态:</span>
                   <div>
                   	<span><input type="radio" name="radio" checked="checked" />更新中</span>
                    <span><input type="radio"  name="radio"/>更新完毕</span>
                    </div>
                    
                   </li>
               </li>
                <li><span>简介:</span><textarea></textarea> </li>
                <li><span>课时列表:</span>
                	<div>
                       <p><button class="C_clear">删除全部</button> <button class="C_bj">创建课时</button></p>
                    	<dl class="C_ks">
                        	<dd><b>第一课:程内容版权均归学ii分享</b><a href="#" class="C_bj">编辑</a> <a href="#" class="C_clear2"> 删除</a>
                            <dd><b>第二课:程内容版权均归学ii分享</b><a href="#" class="C_bj">编辑</a> <a href="#" class="C_clear2"> 删除</a>	
                            </dd>
                        </dl>
                    </div>
                </li>
                <li><button>提交</button></li>
                </ul>
        </div>
    </div>

    <!-- 弹出框-->
    <div class="C_box2">
      <div class="C_box">
      		<h3>课时编辑</h3>
            <ul>
            	<li><span>课时名字：</span><input type="text" /></li>
                <li><span>节数：</span><input type="text" /></li>
                <li ><span>视频地址：</span>
                <input type="file"  style="  height:35px; border:none;"/>
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
