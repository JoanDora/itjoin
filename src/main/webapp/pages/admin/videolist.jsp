<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="it分享联盟" content="it分享联盟">
<title>it分享联盟视频列表管理</title>
<link rel="stylesheet" href="..<%=path%>/resources/css/itjoin/Cox.css?v=0.6.6" />
<link rel="stylesheet" href="..<%=path%>/resources/css/itjoin/base.css?v=0.6.6" />
<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap/bootstrap.min.css" />
<style type="text/css">
ul.ztree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: #f0f6e4;
	width: 220px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}
</style>
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div style="border-top-style: ridge;height:300px;">

		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th>序号</th>
					<th>品牌</th>
					<th>型号</th>
					<th>联系人</th>
					<th>发布时间</th>
					<th> 发布人</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody id="carBody">


			</tbody>
		</table>
		<div class="pagination" style="float: right; margin-right: 100px;">
			<ul id="pageUi">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<div id="imgBox" style="display: none">
		<img src="<%=path%>/resources/image/loading.gif" alt="" />
	</div>
	<script type="text/javascript"
		src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
	<script type='text/javascript'
		src=' <%=path%>/resources/js/easydialog/easydialog.min.js'></script>
	<script type="text/javascript" src="<%=path%>/resources/js/escar/util.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/escar/car.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/escar/page.js"></script>
	<script type="text/javascript">
		function skip(url) {
			location.href = "/" + url;
		}

		function deleteCar(id) {
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/car/delete/' + id,
				dataType : 'json',
				success : function(data) {
					if (data.flag == '0') {
						alert("请先登录");
					} else if (data.flag == '1') {
						alert("成功删除");
						window.location.reload();
					} else if (data.flag == '2') {
						alert("删除失败！");
					}
				}
			});
		}

		function updateCar(id) {
			skip('admin/update?id=' + id);
		}

		function loadListCar(data) {
			var objs = data;
			var htmlSrc = [];
			if (objs.content == null) {
				return;
			}
			var length = objs.content.length;
			var i = 0
			var marginTop = 50;
			var sq = 0;
			for (; i < length; i++) {
				htmlSrc.push('<tr>');
				var car = objs.content[i];
				var createTime = getMyDate(new Date(car.createTime));
				var carUrl = "/car/show?id=" + car.id;
				var imagSrc = "/image/show?fileName=" + car.imageUrl;
				var carName = car.name;

				htmlSrc.push(' <td>' + (i - sq + 1) + '</td>');
				if (car.brand == null) {
					htmlSrc.push(' <td></td>');
				} else {
					htmlSrc.push(' <td>' + car.brand.name + '</td>');
				}

				if (car.brandModel != null) {
					htmlSrc.push(' <td>' + car.brandModel.name + '</td>');
				} else {
					htmlSrc.push(' <td></td>');
				}
				if (car.contacts == null) {
					htmlSrc.push(' <td></td>');
				} else {
					htmlSrc.push(' <td>' + car.contacts + '</td>');
				}
				htmlSrc.push(' <td>' +createTime + '</td>');
				if(car.admin==null){
					htmlSrc.push(' <td></td>');
				}else{
					htmlSrc.push(' <td>' + car.admin.userName+ '</td>');
				}
				
				htmlSrc
						.push(' <td><a style="cursor:pointer" class="btn-sm" href="javascript:deleteCar(\''
								+ car.id
								+ '\')">删除</a> <a style="cursor:pointer" class="btn-sm"  target="rightFrame" href="javascript:updateCar(\'' 
								+ car.id + '\')">修改</a>'
								+'<span style="margin-left:30px">是否售尽</span>');
								
			  if(car.sellout!=null && car.sellout>0){
				  htmlSrc.push('<input type="checkbox" checked=true onclick="javascript:sellOut(this);" name="sellOut" value=\'' + car.id + '\')>')
			  }else{
				  htmlSrc.push('<input type="checkbox"  onclick="javascript:sellOut(this);" name="sellOut" value=\'' + car.id + '\')>')
			  }	   
							
			}

			$('#carBody').append(htmlSrc.join(""));
		}

		function listAllCar() {
			$('#carBody').empty();
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/car/list/' + pageNo,
				dataType : 'json',
				success : function(data) {
					if (data.flag == '0') {
						alert("请先登录");
					} else if (data.flag == '1') {
						pageNo = data.data.pageNo;
						totalPage = data.data.totalPage;
						pageSet();

						loadListCar(data.data);

					}
				}
			});
		}

		$(function() {

			listAllCar();
		});

		function openDialog() {
			easyDialog.open({
				container : 'imgBox',
				fixed : false
			});
		}
		function onSubmit() {
			var carName = $("#carName").val();
			$('#search_form').ajaxSubmit({
				url : '/car/list/' + pageNo,
				type : "POST",
				dataType : "json",
				beforeSubmit : function() {
					openDialog();

				},
				success : function(data) {
					easyDialog.close();
					if (data.flag == '0') {
						alert("请先登录");
					} else if (data.flag == '1') {
						$('#carBody').empty();
						loadListCar(data.data);
						pageNo = data.data.pageNo;
						totalPage = data.data.totalPage;
						pageSet();
					}

				}
			});

			//	}
			return false;
		}

		function getData(number) {
			pageNo = number;
			jQuery.ajax({
				//url : '/car/search?carName=' + $("#carName").val() + '&pageNo='
				url : '/car/list/'
						+ number,
				type : "POST",
				dataType : "json",
				success : function(data) {
					if (data.flag == '0') {
						alert("请先登录");
					} else if (data.flag == '1') {
						$('#carBody').empty();
						loadListCar(data.data);
						pageNo = data.data.pageNo;
						totalPage = data.data.totalPage;
						pageSet();
					}

				}
			});
		}

		function updateCar(id) {
			skip('admin/publishUpdate?id=' + id+"&new="+Math.random());
		}
		
		function sellOut(obj){
			
			var sellout = 0;
			var carId= $(obj).val();
			if($(obj)[0].checked){
				sellout=1;
			}
			
			jQuery.ajax({
				url : '/car/updateStatus/'
						+ carId,
				type : "POST",
				dataType : "json",
				data:{sellout:sellout},
				success : function(data) {
					if (data.flag == '0') {
						alert("请先登录");
					} else if (data.flag == '1') {
						$('#carBody').empty();
						loadListCar(data.data);
						pageNo = data.data.pageNo;
						totalPage = data.data.totalPage;
						pageSet();
					}

				}
			});
			
		}
	</script>
</body>
</html>