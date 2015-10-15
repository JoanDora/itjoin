<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" % --%>>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频播放</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">

<%-- <script type="text/javascript" src="<%=path%>/resources/js/html5media.min.js"></script> --%>
<%-- <link href="<%=path%>/resources/css/video/video-js.css" rel="stylesheet"> --%>
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
  <!-- If you'd like to support IE8 -->
<%--   <script src="<%=path%>/resources/js/video/videojs-ie8.min.js"></script>
  <script src="<%=path%>/resources/js/video/video.js"></script> --%>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script type="text/javascript"   src="<%=path %>/dwr/engine.js"> </script>
  <script type="text/javascript"  src="<%=path %>/dwr/interface/encryptService.js"> </script>
<style type="text/css">
/* .C_sp_nr2{
float:left;
} */
</style>
</head>

<body>
	<%@ include file="header.jsp" %> 
	<div class=" C_content" >
		<div class=" C_layout C_sp" style="overflow:hidden;">
            <h2>${video.name } </h2>
            <div class="C_sp_nr">
            <div  id="videoSrcId">
           </div>
                <div class="C_sp_nr2">
               	  <div class="C_sp_nr2a">
                    	<ul>
                    	 <c:forEach var="item" items="${videos}" varStatus="status"> 
                        	<li>
                            <a href="<%=path%>/video/find/${course.id}?serial=${item.serial}">
                            	<img src="<%=path%>/image/show?fileName=${course.imageUrl}" />
                                <p><span>第${item.serial }集：</span>${item.name }</p>
                            </a>
                            </li>
                            </c:forEach>
                        </ul>
                   </div>
                     <div class="C_bq">
                     	<dl>
                        	<dd class="C_tab1"><i class="glyphicon glyphicon-menu-up" ></i></dd>
                            <dd class="C_tab2"><i class="glyphicon glyphicon-menu-down"></i></dd>
                        </dl>
                     </div>
                </div>
            </div>
            <div class="C_ly">
            	<div class="C_ly_l">
                	<div class="C_lyq">
                	<textarea id="comment"  ></textarea>
                    <button onclick="submitComment('${video.id}')"> 提交评论</button>
                   </div>
                   <div class="C_lyq_nr">
                    	<h2> 全部评论</h2>
                        <ul  id="comments" >
                         <c:forEach var="comment" items="${comments}" varStatus="status"> 
                        	<li>
                            	<span><fmt:formatDate value="${comment.createTime}"  pattern="yyyy-MM-dd HH:mm:ss"/></span>	
                                <p>${comment.content }</p>
                            </li>
                            </c:forEach>
                        </ul>
                        
                   </div>
                </div>
            	<div class="C_ly_r">
                	<img src="<%=path%>/resources/images/C_gbg.jpg" />
                </div>
            </div>
        </div>
    </div>
     <%@ include file="footer.jsp" %> 
	<div id="imgBox" style="display: none">
	     <img src="<%=path%>/resources/images/loading.gif" alt="" />
	</div>
	<script type='text/javascript' src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>
	<script type="text/javascript" src="<%=path%>/resources/js/datefmt.js"></script>
    <script type="text/javascript">
    	$(function(){
		  var len=$(".C_sp_nr2a li").length;/*判断li的个数*/
		  var cs=0;/*计算点击的次数*/
		  $(".C_tab1").click(function(){
		  	if(len>6&&cs<len-6)
			{    cs++;
			   	 $(".C_sp_nr2a ul").animate({top: -88*cs+"px"}, "slow");
			   
			}
		  
		  });
		$(".C_tab2").click(function(){
		  	if(len>6&&cs>0)
			{    cs--;
			   	 $(".C_sp_nr2a ul").animate({top: -88*cs+"px"}, "slow");
			   
			}
		  
		  });
		
		
		});
    	
    	function openDialog() {
			easyDialog.open({
				container : 'imgBox',
				fixed : false
			});
		}
    	
    	
    	
    	function submitComment(id){
    		var content = $("#comment").val();
    		openDialog();
    		jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/comment/save',
				dataType : 'json',
				data:{
				  "content":content,
				   "videoId":id
				},
				success : function(data) {
					 if (data == '1') {
						alert("保存成功");
					}else{
						alert("保存失败");
					}
					 var htmlSrc=[];
					 htmlSrc.push('<li><span>'+formatDatebox(new Date())+'</span>	');
					htmlSrc.push('<p>'+content+'</p></li>');
					$("#comments").append(htmlSrc.join(''));
					easyDialog.close();
				}
			});
    	}
    	
    	function formatDatebox(value) {
    	    if (value == null || value == '') {
    	        return '';
    	    }
    	    var dt;
    	    if (value instanceof Date) {
    	        dt = value;
    	    } else {

    	        dt = new Date(value);

    	    }
    	    return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)
    	}
    	
    	
    	   url =' ${video.url}';
    	   console.log(url)
    	    encryptService.encrypt(url, {
    	    	  callback:function(url) { 
    	    		  var videoSrc = [];
    	    		  videoSrc.push('<video id="my-video" class="video-js" width="915"  height="649"   controls preload loop="loop" data-setup="{}">');
    	    		  videoSrc.push('<source src='+spath+'/file/getByName?fileName='+url+'  id="videoSrcId"  type="video/mp4"  >');
    	    		  videoSrc.push('</video>');
    	    		  $("#videoSrcId").append(videoSrc.join(''));
    	    	  }
    	    	});
    </script>
   
</body>
</html>
