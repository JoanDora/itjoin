<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频播放</title>
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/resources/css/style.css" type="text/css" >
<link rel="stylesheet"  href="<%=path %>/resources/flowplayer/skin/functional.css">
<link rel="stylesheet" href="<%=path %>/resources/css/easydialog/easydialog.css" />

  <!-- If you'd like to support IE8 -->
<%--   <script src="<%=path%>/resources/js/video/videojs-ie8.min.js"></script>
  <script src="<%=path%>/resources/js/video/video.js"></script> --%>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.jslides.js"></script>
<script type="text/javascript"   src="<%=path %>/highjs/engine.js"> </script>
  <script type="text/javascript"  src="<%=path %>/highjs/interface/encryptService.js"> </script>
  <script  src="<%=path %>/resources/flowplayer/flowplayer.min.js" />
<style type="text/css">
.flowplayer .fp-timeline {
  margin-right: 270px; /* originally: 225px */
}
.no-volume.no-mute.flowplayer .fp-timeline {
  margin-right: 165px; /* originally: 120px */
}
.flowplayer .fp-remaining, .flowplayer .fp-duration {
  right: 225px; /* orginally: 180px */
}
.no-mute.no-volume.flowplayer .fp-remaining, .no-mute.no-volume.flowplayer .fp-duration {
  right: 120px; /* originally: 75px */
}
.flowplayer .fp-brand {
  right: 160px; /* originally 115px */
}
.no-volume.no-mute.flowplayer .fp-brand {
  right: 55px; /* originally 10px */
}
 
.flowplayer .fp-volume {
  right: 55px; /* originally 10px; */
}
.flowplayer .fp-embed {
  right: 10px; /* originally 50px */
}
.flowplayer .fp-embed-code {
  right: 47px; /* originally 67px */
}
 
/* position new fullscreen button */
.flowplayer .fp-fullscreen {
  top: 0;
}
</style>
</head>

<body>
	<%@ include file="header.jsp" %> 
	<div class=" C_content" >
		<div class=" C_layout C_sp" style="overflow:hidden;">
            <h2>${video.name } </h2>
            <div class="C_sp_nr">
            <div  id="videoSrcId "  style="width: 915px; height: 400px; float:left;">
            <div id="player" class="fixed-controls  videoDiv"  style=" height: 400px;"></div>
           </div>
                <div class="C_sp_nr2 videoDiv"  style=" height: 400px;">
               	  <div class="C_sp_nr2a">
                    	<ul>
                    	 <c:forEach var="item" items="${videos}" varStatus="status"> 
                        	<li>
                            <a href="<%=path%>/video/find/${course.id}?serial=${item.serial}">
                            	<img src="<%=path%>/image/show?fileName=${course.imageUrl} "  onerror="this.src='<%=path %>/resources/images/default_video.jpg'"/>
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
    
    <div id="loginDiv" style="display:none">
    <div class="head">
          登录大象分享
          <span>还没有大象分享账号？<a href="/register" class="register-page-erynt" style="color:#fff; text-decoration:underline;">30秒注册</a></span> </div>
        <form id="login_form"  method="post" onSubmit="return false" style="padding:0 50px;">
          <div class="tip error"></div>
          <div class="input-text left user"> 
            <input type="text" name="phone"   test="must" label="登录账号" placeholder="请输入您的注册手机">
          </div></br>
          <div class="input-text left pwd"> 
            <input type="password" name="loginPwd"  id="loginPwd"  test="must" label="登录密码" maxlength="20" placeholder="请输入您的登录密码">
          </div>
          <div class="tools clearfix">
            <span> <a href="/register" class="register-page-entry">免费注册</a> <a href="javascript:forgotPwd();">忘记密码？</a> </span> </div>
          <div class="btn-bar">
            <button type="button"  onclick="javascript:onSubmit();">登 录</button>  <span style="margin-left:30px;" id="qqLoginBtn"></span>
          </div>
        </form>
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
				container : 'loginDiv',
				fixed : false
			});
		}
    	openDialog();
    	
    	function submitComment(id){
    		var content = $("#comment").val();
    		openDialog();
    		jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : spath+'/comment/save',
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
    	
    </script>
     <script type="text/javascript">
     flowplayer(function (api, root) {
    	  var fsbutton = document.createElement("a"),
    	      anchors = root.getElementsByTagName("a"),
    	      divs = root.getElementsByTagName("div"),
    	      i, elem;
    	 
    	  fsbutton.className = "fp-fullscreen";
    	 
    	  for (i = 0; i < anchors.length; i += 1) {
    	      elem = anchors[i];
    	      if (elem.className == "fp-fullscreen") {
    	          elem.parentNode.removeChild(elem);
    	          break;
    	      }
    	  }
    	 
    	  for (i = 0; i < divs.length; i += 1) {
    	      elem = divs[i];
    	      if (elem.className == "fp-controls") {
    	          elem.appendChild(fsbutton);
    	          break;
    	      }
    	  }
    	});
    	 
     
     
window.onload = function () {
	   var url =' ${video.url}';
	    encryptService.encrypt(url, {
	    	  callback:function(url) { 
	    		  url = spath+'/file/getByName?fileName='+url;
	    		  var feature = {
	    			        cuepoints: [4],
	    			        title: "it分享联盟",
	    			        sources: [
	    			          { type: "video/mp4",   src: url+"&v="+Math.random()}
	    			        ]
	    			      },
	    			      midroll = {
	    			        cuepoints: [5],
	    			        title: "it分享联盟广告",
	    			        sources: [
	    			          { type: "video/mp4",   src:url+"&v="+Math.random() }
	    			        ]
	    			      },
	    			      container = document.getElementById("player"),
	    			    //  info = document.getElementById("info"),
	    			      toggleUiElement = function (klass, show) {
	    			        var divs = container.getElementsByTagName("div"),
	    			            klasspat = new RegExp('(^| )' + klass + '( |$)'),
	    			            i;
	    			 
	    			        for (i = 0; i < divs.length; i += 1) {
	    			          if (klasspat.test(divs[i].className)) {
	    			            divs[i].style.display = show ? "block" : "none";
	    			            return;
	    			          }
	    			        }
	    			      };
	    			 

	    			  flowplayer(container, {
	    			    ratio: 5/12,
	    			//    rtmp: "rtmp://s3b78u0kbtx79q.cloudfront.net/cfx/st",
	    			    clip: feature
	    			 
	    			  }).on("cuepoint", function (e, api, cuepoint) {
	    			    if (cuepoint.time === feature.cuepoints[0]) {
	    			      toggleUiElement("fp-controls");
	    			      toggleUiElement("fp-time");
	    			     // info.innerHTML = "playing 5 second midroll at " + cuepoint.time + " seconds";
	    			      api.load(midroll, function (e, api) {
	    			        api.disable(true);
	    			      });
	    			 
	    			    } else if (cuepoint.time === midroll.cuepoints[0]) {
	    			      api.disable(false).load(feature, function (e, api) {
	    			        api.seek(feature.cuepoints[0] + 0.2);
	    			        toggleUiElement("fp-controls", true);
	    			        toggleUiElement("fp-time", true);
	    			    //    info.innerHTML = "feature resumed at " + (feature.cuepoints[0] + 0.2) + " seconds";
	    			      });
	    			 
	    			    }
	    			  });	    	  
	    	  }
	    	});
	
	
	
	 
	};
</script>
</body>
</html>
