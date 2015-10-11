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
<title>课时管理</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css"
	type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/upload/style.css" type="text/css" >
<style type="text/css">
.C_box3 ul li div span {
  /* width: 10%; */
}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script src="<%=path%>/resources/js/ajaxfileupload.js" type="text/javascript"></script>
<basePath value ="<%=path%>"  id ="basePath"></basePath>
<script type="text/javascript">
var spath =$('#basePath').attr("value");
</script
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class=" C_content" >
		<div class="C_layout C_kclist  C_kslist">
        	<h2><span>课时列表</span> <button class="C_bj">添加课时</button></h2>
        	<ul>
        	 <c:forEach var="video" items="${videos}" varStatus="status"> 
            	<li>
                	<div class="C_div" >
                   <p> <b><i class="glyphicon glyphicon-film"></i></b>
                   ${video.name }
                   <small>${video.timeLen }</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="JavaScript:updateCourse('${video.id}');" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="JavaScript:deleteVideo('${video.id }',this)" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                </c:forEach>
            </ul>
             <c:if test="${videos!= null || fn:length(videos) > 0}">
            <div class="C_fy"  style="margin-top:30px;">
             <dl id="paginationId">
                </dl>
             </div>  
        </div>
        </c:if>
        </div>
    </div>
  
    <!-- 弹出框-->
    <div class="C_box2 C_box3">
    <form name="uploadForm" id="upload_form"  action="<%=path %>/video/save"  method="post" >
      <div class="C_box ">
      		<h3>课时编辑</h3>
            <ul>
            	<li ><span>课时标题：</span><input type="text"  name="name" id="name"/></li>
                <li ><span>简介：</span><textarea id="description"  name="description"></textarea></li>
             <!--    <li><span>是否免费试看：</span>
                	 <div>
                   	<span><input type="radio" name="radio" checked="checked" />是</span>
                    <span><input type="radio"  name="radio"/>否</span>
                    </div>
                </li> -->
                <li ><span>视频：</span>
                   <input type="file"   name="file"  id="fileToUpload"   style=" width:70%; margin-left:120px; border:none;  " onchange="fSubmit();" />
                </li>
              <div class="br"  style="display:none;" id="progress_all"  style="height:100px">
            	<h1><a href="javascript:closeCont();" class="fr" id="cancel"  >取消</a></h1>
                	<div class="process clearfix" id="process">
						<span class="progress-box">
							<span class="progress-bar" style="width: 0%;" id="progress_bar"></span>
						</span>
                        <span id="progress_percent">0%</span>
                    </div>
                    <div class="info" id="info"><span>已上传：</span><span id="has_upload">0</span><span>MB  速度：</span><span id="upload_speed">0</span>KB/s</div>
                    <div class="info" id="success_info" style="display: none;"></div>
           </div>
           <!--       <li ><span>视频时长：</span>
                   <input type="text"/> 分<input type="text"/> 秒 
                    <p>时长为整数</p>
                </li> -->
                   <input type="hidden" name="id" id="id"/>
                    <input type="hidden" name="courseId" id="courseId" value="${courseId }" />
             <li> <input type="button" onclick="cancel();" class="btn-sm"  style="width: 15%;margin-right:30px" value="取消"> 
             <input type="submit" class="btn-sm"  style="width: 15%;margin-right:30px" value="确定"></li>
            </ul>
      </div>
      </form>
     </div> 
       <%@ include file="footer.jsp" %> 
	<script >
	var totalPage = '${totalPage}';
	var courseId = '${courseId}';
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
                  
	function getData(page){
		location.href=spath+"/video/list/"+courseId+"?page="+page
	}
	
			$(function(){
			/*   $(".C_qc").click(function(){
			  	$(this).parents("li").hide();
			  
			  }); */
			  $(".C_kslist li").hover(function(){
			  	$(".C_kslist li .C_div2").hide();
				$(this).children(".C_div2").show();
			  
			  },function(){$(this).children(".C_div2").hide();});
			   
/* 			   $(".C_bj").click(function(){
			    $(".C_box2").show();
				 var height=$(".C_box").outerHeight(true);
			    var height_pm=$(window).height();
				$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
			    
			   }); */
			});	
		
			function cancel(){
				$(".C_box2").hide();
			}
			
			function updateCourse(id){
			    $(".C_box2").show();
				 var height=$(".C_box").outerHeight(true);
			    var height_pm=$(window).height();
				$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
				jQuery.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : '/video/get/'+id,
					dataType : 'json',
					success : function(data) {
						$("#name").val(data.name);
						$("#id").val(data.id);
						$("#courseId").val(data.courseId);
						$("#description").text(data.description);
					}
				});
				
				
		}
			
		function deleteVideo(id,object){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/video/delete/'+id,
				dataType : 'json',
				success : function(data) {
					if(data=='1'){
						alert('删除成功');
						//$(object).parents("li").hide();
						window.location.reload(true);
					}else{
						alert('删除失败');
					}
				}
			});
		}	
			
			
			
			
			
			var fileName = "";
			var oTimer = null;

			$(document).ready(function(){ 
				window.document.getElementById("fileToUpload").disabled = false;
			});

			function getProgress() {
				var now = new Date();
				$.ajax({
					type : "GET",
					dataType : "json",
					url : spath + "/fileStatus/upload/progress?new="+ Math.random(),
					success : function(data) {
			        	$("#progress_percent").text(data.percent);
			            $("#progress_bar").width(data.percent);
			            $("#has_upload").text(data.mbRead);
			            $("#upload_speed").text(data.speed);
			            if(data.percent=="100%"){
			            	clearInterval(oTimer)
			            }
					},
					error : function(err) {
						$("#progress_percent").text("Error");
						clearInterval(oTimer)
					}
				});
			    
			}

			/**
			 * 提交上传文件
			 */
			function fSubmit() {
				$("#process").show();
				$("#cancel").show();
				$("#info").show();
				$("#success_info").hide();

			    //文件名
			   	fileName = $("#fileToUpload").val().split('/').pop().split('\\').pop();
			    //进度和百分比
			    $("#progress_percent").text("0%");
			    $("#progress_bar").width("0%");
			    $("#progress_all").show();
			    oTimer = setInterval("getProgress()", 1000);
			    ajaxFileUpload();
			    //document.getElementById("upload_form").submit();
			    window.document.getElementById("fileToUpload").disabled = true;
			}

			/**
			 * 上传文件
			 */
			function ajaxFileUpload() {
			    $.ajaxFileUpload({
			        url: spath + '/file/upload',
			        fileElementId: 'fileToUpload',
			        dataType: 'text',
			        success: function(data, status) {
			        	 data = data.replace(/<pre.*">/, '');
			             data = data.replace("<PRE>", ''); //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
			             data = data.replace("</PRE>", '');
			             data = data.replace("<pre>", '');
			             data = data.replace("</pre>", '');
			             var result = eval("(" +data+ ")");
			            if (typeof(result.status) != 'undefined') {
			            	/* if(easyDialog!=null){
			            		 easyDialog.close();
			            	} */
			            	window.clearInterval(oTimer);
			            	//easyDialog.close();
			                if (result.status== '1') {
			                	$("#info").hide();
			                	$("#success_info").show();
			                	$("#success_info").text(fileName + "\t" +result.msg);
			                	$("#process").hide();
			                	$("#cancel").hide();
			                	$("#fileToUpload").val("");
			                	window.document.getElementById("fileToUpload").disabled = false;
			                	//上传进度和上传速度清0
			                	$("#has_upload").text("0");
			                    $("#upload_speed").text("0");
			                    $("#progress_percent").text("0%");
			                    $("#progress_bar").width("0%");
			                } else{
			                	$("#progress_all").hide();
			                	$("#fileToUpload").val("");
			                	if (typeof(result.msg) != 'undefined') {
			                		alert(result.msg);
			               	   }
			                	alert("上传错误！");
			                }
			            }
			        },
			        error: function(data, status, e) {
			            alert(e);
			        }
			    })
			    return false;
			}
			
			
			
			//显示弹框 
			function showCont(){
				$("#TB_overlayBG").css({
					display:"block",height:$(document).height()
				});
				$(".yxbox").css({
					left:($("body").width()-$(".yxbox").width())/2-20+"px",
					top:($(window).height()-$(".yxbox").height())/2+$(window).scrollTop()+"px",
					display:"block"
				});
			}
			// 关闭弹框 
			function closeCont(){
				/* $("#TB_overlayBG").hide();
				$(".yxbox").hide(); */
				window.location.reload(true);
			}
			function resetNavHeight() {
			    var documentHeight;
			    if (document.compatMode == 'BackCompat') {
			        documentHeight = Math.max(document.body.clientHeight,
			       	document.body.scrollHeight);
			    } else {
			        documentHeight = Math.max(document.documentElement.clientHeight,
			        document.documentElement.scrollHeight);
			    }
			    $('.left').height(documentHeight - 48);
			}

			resetNavHeight();
			$(window).resize(resetNavHeight);
    </script>
</body>
</html>