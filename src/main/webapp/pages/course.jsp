<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的课程列表</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css//style.css"
	type="text/css">
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/image.js"></script>
<basePath value ="<%=path%>"  id ="basePath"></basePath>
<script type="text/javascript">
var spath =$('#basePath').attr("value");
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class=" C_content" >
		<div class="C_layout C_kclist ">
        	<h2><span>课程列表</span> <button class="C_bj">创建课程</button></h2>
        	<ul>
        	  <c:forEach var="course" items="${courses}" varStatus="status"> 
            	<li>
                	<div class="C_div">
                    	<img src="<%=path%>/image/show?fileName=${course.imageUrl}" />
                        <div>
                        	<b>${course.name }</b></br>
                            <p>${course.description }</p>
                            </div>
                    </div>
                    <div class="C_div2">
                     <a href="JavaScript:updateCourse('${course.id}');" ><i class="glyphicon glyphicon-search"></i>修改</a>
                     <a href="<%=path%>/video/list/${course.id}"><i class="glyphicon glyphicon-pencil"></i>课时管理</a>
                     <!-- <a href="#" class="C_qc"><i class="glyphicon glyphicon-trash"></i>删除</a></div> -->
                </li>
                </c:forEach>
            </ul>
            <c:if test="${courses!= null && fn:length(courses) > 0}">
            <div class="C_fy"  style="margin-top:30px;">
             <dl id="paginationId">
                </dl>
             </div>  
        </div>
        </c:if>
    </div>
      <%@ include file="footer.jsp" %> 
    <!-- 弹出框-->
    <div class="C_box2">
    <form action="<%=path %>/course/save"  method="post" enctype="multipart/form-data">
      <div class="C_box">
      		<h3>课程编辑</h3>
            <ul>
            	<li><span>课程分类：</span>
            	   <select id="categorySelectId"  onchange="javascript:categorySelect();"></select>
            	</li>
            	<li><span>课程标题：</span><input type="text"  name="name"  id="name"/></li>
                 <li><span>讲师名字：</span><input type="text"  name="teacherName"  id="teacherName"/></li>
                <li><span>简介：</span><textarea  name="description"  id="description"></textarea></li>
                <li><span>连载状态：</span>
                	 <div>
                   	<span><input type="radio" name="statusSelect" checked="checked"  onclick="getStatus();" value="0" />更新中</span>
                    <span><input type="radio"  name="statusSelect"  onclick="getStatus();" value="1" />更新完毕</span>
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="status" id="status">
                    <input type="hidden" name="verifyStatus" value="0"/>
                      <input type="hidden" name="imageUrl"  id="imageUrl"/>
                      <input type="hidden" name="categoryId" id="categoryId">
                     </div>
                </li>
                <li ><span>课程封面：</span>
                   <input type="file" id="mainImag" style="width:70%; margin-left:90px; border:none;" name="image"    onchange="javascript:setImagePreview('mainImag','preview','300','100');"/>
							<div id="localImag">
								<img id="preview" style="diplay: none; " width=-1 height=-1 />
							</div>
                </li>
                 <li> <input type="button" onclick="cancel();" class="btn-sm"  style="width: 15%;margin-right:30px" value="取消"> <input type="submit" class="btn-sm"  style="width: 15%;margin-right:30px" value="确定"></li>
            </ul>
      </div>
      </form>
     </div> 
	<script >
	function categorySelect(){
		var categorySelectId=$("#categorySelectId").val(); 
		$("#categoryId").val(categorySelectId);
	}
	
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
                  
	function getData(page){
		location.href=spath+"/course/list?page="+page
	}
	
	$(function(){
		getStatus();
	})
	function getStatus(){
		var status = $("input[name='statusSelect']:checked").val();
		$("#status").val(status);
	}
	
	function updateCourse(id){
		    $(".C_box2").show();
			 var height=$(".C_box").outerHeight(true);
		    var height_pm=$(window).height();
			$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
			
			
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/course/get/'+id,
				dataType : 'json',
				success : function(data) {
					$("#name").val(data.name);
					$("#id").val(data.id);
					$("#teacherName").val(data.teacherName);
					$("#description").text(data.description);
					$("#verifyStatus").text(data.verifyStatus);
					$("#status").text(data.status);
					$("#imageUrl").val(data.imageUrl);
					$("#preview").attr("src",spath+"/image/show?fileName="+data.imageUrl)
					$("#preview").attr("width","300px;");
					$("#preview").attr("height","100px;");
					$("input[name='statusSelect']").each(function(index,domEle){
		        		if($(this).val()==data.status){
		        			$(this).attr("checked", 'true');
		        		}
		        	});
				}
			});
			
			
	}
	
			$(function(){
			  $(".C_qc").click(function(){
			  	$(this).parents("li").hide();
			  
			  });
			   
			   $(".C_bj").click(function(){
			    $(".C_box2").show();
				 var height=$(".C_box").outerHeight(true);
			    var height_pm=$(window).height();
				$(".C_box").animate({top:(height_pm-height)/2+"px"},0);	
			   });
			});	
		
			
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/courseCategory/getAll',
				dataType : 'json',
				success : function(data) {
					var htmlSrc = [];
					for(var i in data){
						htmlSrc.push('<option value='+data[i].id+'>'+data[i].name+'</option>')
					}
					$("#categorySelectId").append(htmlSrc.join(''));
					categorySelect();
				}
			});
		
			function cancel(){
				$(".C_box2").hide();
			}
    </script>
</body>
</html>
