<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class=" C_content" >
		<div class="C_layout C_kclist  C_kslist">
        	<h2><span>课时列表</span> <button class="add_bj"  >添加课时</button></h2>
        	<ul>
        	 <c:forEach var="video" items="${videos}" varStatus="status"> 
            	<li>
                	<div class="C_div" >
                   <p> 
                   <span>免费</span>
                   <b><i class="glyphicon glyphicon-film"></i>${video.name }</b>
                   <small>${video.timeLen }</small></br>
                    </div>
                    <div class="C_div2">
                     <a href="#" ><i class="glyphicon glyphicon-search"></i>预览</a>
                     <a href="JavaScript:updateCourse('${video.id}');" class="C_bj"><i class="glyphicon glyphicon-pencil"></i>编辑</a>
                     <a href="JavaScript:deleteVideo('${video.id }',this)" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div>
                </li>
                </c:forEach>
            </ul>
             <c:if test="${videos!= null && fn:length(videos) > 0}">
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
                 <li ><span>价格：</span><input id="price"  name="price"/></li>
           <!--      <li><span>是否免费试看：</span>
                	 <div>
                   	<span><input type="radio" name="radio" checked="checked" />是</span>
                    <span><input type="radio"  name="radio"/>否</span>
                    </div>
                </li> -->
                <li ><span>视频：</span>
                  <div id="container">
		                <button id="pickfiles"  onclick="selectFile();">选择文件</button> 
		               <button id="uploadfiles">上传</button>
                  </div>
                   <div id="filelist">您的浏览器没有 Flash, Silverlight 并且不支持HTML5 </div>
                </li>
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
   <script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script type="text/javascript" src="/resources/plupload/plupload.full.min.js"></script>
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
			  $(".C_kslist li").hover(function(){
			  	$(".C_kslist li .C_div2").hide();
				$(this).children(".C_div2").show();
			  
			  },function(){$(this).children(".C_div2").hide();});
			   
 			   $(".add_bj").click(function(){
			    $(".C_box2").show();
				 var height=$(".C_box").outerHeight(true);
			    var height_pm=$(window).height();
				$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
			    
			   }); 
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
					url : spath+'/video/get/'+id,
					dataType : 'json',
					success : function(data) {
						$("#name").val(data.name);
						$("#id").val(data.id);
						$("#courseId").val(data.courseId);
						$("#description").text(data.description);
						$("#orgFileName").html(data.fileName);
						$("#price").html(data.price);
					}
				});
				
				
		}
			
		function deleteVideo(id,object){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url :spath+ '/video/delete/'+id,
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
			
			var uploader = new plupload.Uploader({
				runtimes : 'html5,flash,silverlight,html4',
				browse_button : 'pickfiles', // you can pass an id...
				container: document.getElementById('container'), // ... or DOM Element itself
				url :spath+ '/file/upload',
				flash_swf_url : '/resources/plupload/Moxie.swf',
				silverlight_xap_url : '/resources/plupload/Moxie.xap',
				
				filters : {
					max_file_size : '1100mb',
					mime_types: [
						{title : "video", extensions : "mp4"}
					]
				},

				init: {
					PostInit: function() {
						document.getElementById('filelist').innerHTML = '';

						document.getElementById('uploadfiles').onclick = function() {
							uploader.start();
							return false;
						};
					},

					FilesAdded: function(up, files) {
						plupload.each(files, function(file) {
							document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
						});
					},

					UploadProgress: function(up, file) {
						console.log(file.id)
						document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
					},

					Error: function(up, err) {
						document.getElementById('filelist').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
					}
				}
			});

			uploader.init();
			
			function selectFile(){
				document.getElementById('filelist').innerHTML = '';
			}
    </script>
</body>
</html>
