<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购车攻略</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery-form.js"></script>
</head>
<body>
	<form id="strategyForm" onsubmit="return false;">
	
	   <div style="margin-top:20px;margin-left:40px;">
        <span >标题：</span><textarea cols="100" rows="2" id="titile"></textarea>
        </div>
		<p>
			<textarea cols="80" name="strategy" rows="10" id="strategy"></textarea>
		</p>
		<p>
			<input type="submit" onclick="javascript:submitStategy();" value="保存">
		</p>
	</form>
	<script type="text/javascript">
	var editor = CKEDITOR.replace('strategy', {
		uiColor : '#14B8C4',
		allowedContent : {
			'b i ul ol big small' : true,
			'h1 h2 h3 p blockquote li' : {
				styles : 'text-align'
			},
			a : {
				attributes : '!href,target'
			},
			img : {
				attributes : '!src,alt',
				styles : 'width,height',
				classes : 'left,right'
			}
		}

	});


	function submitStategy() {
		var content = editor.getData();
		var title = $('#titile').val();
		$('#strategyForm').ajaxSubmit({
			url : '/strategy/save',
			type : "POST",
			data:{titile:title,content:content},
			dataType : "json",
			success : function(data) {
				if (data == '1') {
					alert("保存成功");
				} else {
					alert("保存失败");
				}
			}
		});
	}
	
	/* window.onload = function(){
		 jQuery.ajax({  
		        type : 'GET',  
		        contentType : 'application/json',  
		        url : '/strategy/show',
		        dataType : 'json',  
		        success : function(data) 
		        { 
		          if(data!=null && data.id!=null){
		        	  var editor2 = CKEDITOR.instances.strategy;
		        	 // editor2.insertText(data.value);
		        	  editor2.setData(data.value);
		          }
		            
		        }
		   } );
		
	} */
	</script>
</body>
</html>
