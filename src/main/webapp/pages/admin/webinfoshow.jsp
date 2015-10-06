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
	
<!-- 	   <div style="margin-top:20px;margin-left:40px;">
        <span >标题：</span><span id="titile"></span>
        </div> -->
		<p>
			<span id="strategy"></span>
		</p>
	</form>
	<script type="text/javascript">
	  var url = location.href;
	     var id = url.split('id=')[1]
	window.onload = function(){
		 jQuery.ajax({  
		        type : 'GET',  
		        contentType : 'application/json',  
		        url : '/strategy/show/'+id,
		        dataType : 'json',  
		        success : function(data) 
		        { 
// 		        	  $("#titile").html(data.titile);
		        	  $("#strategy").html(data.content);
		        }
		   } );
		
	} 
	</script>
</body>
</html>
