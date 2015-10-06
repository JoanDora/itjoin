<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购车攻略</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/easyui/easyui.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript" src="/resources/js/escar/util.js"></script>
<script type="text/javascript" src="/resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resources/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<form id="strategyForm" onsubmit="return false;">

		<div style="margin-top: 20px; margin-left: 40px;" id="strategys">
			<div style="padding-top: 30px;">
				<span>标题：</span><span></span>
			</div>
		</div>
	</form>
	
	
	<div id="win" class="easyui-window" title=""
		style="width: 800px; height: 500px"
		data-options="iconCls:'icon-save',modal:true">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'">
				<form id="strategySaveForm" onsubmit="return false;">
					<input type="hidden" name="id" id="strategyId" />
					<div style="margin-top: 20px; margin-left: 40px;">
						<span>标题：</span>
						<textarea cols="100" rows="2" id="titile"></textarea>
					</div>
					<p>
						<textarea cols="80" name="strategy" rows="10" id="strategy"></textarea>
					</p>
					<p>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:submitStategy();">保存</a>
							<a href="javascript:void(0)"
								class="easyui-linkbutton" onclick="clearForm()">取消</a>
					</p>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			jQuery
					.ajax({
						type : 'GET',
						contentType : 'application/json',
						url : '/strategy/list',
						dataType : 'json',
						success : function(data) {
							$("#strategys").empty();
							console.log(data)
							var htmlSrc = [];
							for ( var i in data) {
								if (data[i].titile == null) {
									data[i].titile = '无'
								}
								var createTime = getMyDate(new Date(
										data[i].createTime));
								var updateTime = getMyDate(new Date(
										data[i].updateTime));
								htmlSrc
										.push(' <div style="padding-top: 30px;">');
								htmlSrc
										.push('<div><span >标题：</span><a href="strategyshow.html?id='+data[i].id+'">'
												+ data[i].titile + '</a></div>');
								htmlSrc.push('<div><span>创建时间：</span><span>'
										+ createTime + '</span></div>')
								htmlSrc.push('<div><span>更新时间：</span><span>'
										+ updateTime + '</span></div>')
								htmlSrc
										.push('<div><input style="cursor:pointer"  type="button"  onclick="addStrategy();" value="增加">')
												
									htmlSrc
										.push('<input style="margin-left:20px;cursor:pointer"  type="button"  onclick="editStrategy(\''
												+ data[i].id
												+ '\');" value="编辑">')
								htmlSrc
										.push('<input type="button" style="margin-left:20px;cursor:pointer" onclick="deleteStrategy(\''
												+ data[i].id
												+ '\');"  value="删除"></div>');
								htmlSrc.push('</div>');

							}
							$("#strategys").append(htmlSrc.join(""));

						}
					});

		}
		
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
		
		
		function addStrategy(){
			$('#win').window('open');
		}
		
		function deleteStrategy(id){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/strategy/delete/' + id,
				dataType : 'json',
				success : function(data) {
					if (data == '1') {
						alert("删除成功");
						locationUrl();
					} else {
						alert("删除失败");
					}
				}
			});
		}
		
		
		function editStrategy(id) {
			$("#strategyId").val(id);
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '/strategy/show/' + id,
				dataType : 'json',
				success : function(data) {
					if (data != null && data.id != null) {
						var editor2 = CKEDITOR.instances.strategy;
						editor2.setData(data.content);
						if (data.titile == null) {
							data.titile = '无'
						}
						$('#titile').val(data.titile);
					}

				}
			});
			$('#win').window('open');
		}
		$(function() {
			$('#win').window('close');
		})

		function submitStategy() {
			var content = editor.getData();
			var titile = $('#titile').val();
			
			
			$('#strategySaveForm').ajaxSubmit({
				url : '/strategy/save',
				type : "POST",
				data:{titile:titile,content:content},
				dataType : "json",
				success : function(data) {
					if (data == '1') {
						alert("保存成功");
					} else {
						alert("保存失败");
					}
					
					clearForm();
					locationUrl();
				}
			});
		}
		
		function clearForm(){
			$('#win').window('close');
		}
		
		function locationUrl(){
			location.href="strategylist.html"
		}
	</script>

	
</body>
</html>
