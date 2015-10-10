<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传系统</title>
<link rel="stylesheet" href="<%=path%>/resources/css/upload/style.css" type="text/css" >
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/css/easyui/easyui.css">
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/easyui-lang-zh_CN.js"></script>
<script src="<%=path%>/resources/js/ajaxfileupload.js" type="text/javascript"></script>
<basePath value ="<%=path%>"  id ="basePath"></basePath>
<script>
var spath =$('#basePath').attr("value");
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
            	console.log("已经上传完毕")
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
 * 查询文件列表
 */
function search(){
	document.getElementById("search_form").submit();
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
            	window.clearInterval(oTimer);
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

</script>
</head>
<body>
<div class="right">
        	<div class=""><a href="#" onclick="showCont()" class="update"  id="upload_button">上传</a></div>
            <div class="pd15">
        <div class="pagerBar">
    	<div class="pageBarbox clearfix">
    		<ul class="otherInfo">
                <li><label>共&nbsp;${lst_file.records}&nbsp;条&nbsp;&nbsp;每页&nbsp;${lst_file.rows}&nbsp;条&nbsp;&nbsp;当前第&nbsp;${lst_file.page}&nbsp;页</label></li>
            </ul>
            <!-- epages -->
            <div class="epages clearfix">
            	<c:if test="${lst_file.page == 1 || lst_file.total == 0}"><span>首页</span><span>上一页</span></c:if>
            	<c:if test="${lst_file.page != 1 && lst_file.total > 1}">
            	<a href="#" onclick="javascript:window.location.href='${pageContext.request.contextPath}/userFile/indexPage?page=1&uploadType=${uploadType}&fileName=${fileName}'">首页</a>
            	<a href="#" onclick="javascript:window.location.href='${pageContext.request.contextPath}/userFile/indexPage?page=${lst_file.page-1}&uploadType=${uploadType}&fileName=${fileName}'">上一页</a>
            	</c:if>
            	<c:if test="${lst_file.page == lst_file.total || lst_file.total == 0}"><span>下一页</span><span>尾页</span></c:if>
            	<c:if test="${lst_file.page != lst_file.total && lst_file.total != 0}">
            	<a href="#" onclick="javascript:window.location.href='${pageContext.request.contextPath}/userFile/indexPage?page=${lst_file.page+1}&uploadType=${uploadType}&fileName=${fileName}'">下一页</a>
            	<a href="#" onclick="javascript:window.location.href='${pageContext.request.contextPath}/userFile/indexPage?page=${lst_file.total}&uploadType=${uploadType}&fileName=${fileName}'">尾页</a>
            	</c:if>
            </div>
            <!-- epages -->
        </div>
    </div>
            </div>
        </div>
        

<div class="yxbox">
    <h2><a href="#" class="fr" onclick="closeCont();">关闭</a>上传文件(超过1G文件上传同步较慢)</h2>
    <div class="pd15">
    	<form name="uploadForm" id="upload_form"  action="#" method="post" enctype="multipart/form-data">
    	<p class="mb20"><input type="file"  name="file" id="fileToUpload" title="请选择要上传的文件" onchange="fSubmit();"></p>
        <div class="br"  style="display:none;" id="progress_all">
        	<ul>
            	<li><h1><a href="#" class="fr" id="cancel">取消</a></h1>
                	<div class="process clearfix" id="process">
						<span class="progress-box">
							<span class="progress-bar" style="width: 0%;" id="progress_bar"></span>
						</span>
                        <span id="progress_percent">0%</span>
                    </div>
                    <div class="info" id="info">已上传：<span id="has_upload">0</span>MB  速度：<span id="upload_speed">0</span>KB/s</div>
                    <div class="info" id="success_info" style="display: none;"></div>
                </li>
            </ul>
        </div>
        </form>
    </div>
</div>
<div id="TB_overlayBG">&nbsp;</div>
<script type="text/javascript">
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
	$("#TB_overlayBG").hide();
	$(".yxbox").hide();
	window.location.reload();
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