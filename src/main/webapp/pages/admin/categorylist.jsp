<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/css/easyui/easyui.css">
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/datefmt.js"></script>
<basePath value="<%=path%>" id="basePath"></basePath>
<script>
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
	
	function editrow( id, name) {
        $("#id").val(id);
        $("#name").val(name)
		$('#win').window('open');
	}
	
	var spath = $('#basePath').attr("value");
	var adminRole = '0';
	$(function() {
		jQuery.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : '/admin/getSessionUser',
			dataType : 'json',
			success : function(data) {
				if (data != null && data.id != null) {
					adminRole = data.role;
				}
				datagrid();
			}
		});
	});

	function datagrid() {
		$('#tt').datagrid(
						{
							title : '视频分类列表',
							iconCls : 'icon-edit',
							pagination : true,//分页控件 
							singleSelect : true,
							rownumbers : true,
							//width : 700,
							height : 'auto',
							url : spath + "/courseCategory/list?page=0&rows=0",
							columns : [ [
									{
										field : 'name',
										title : '分类名',
										width : 100,
										editor : 'text'
									},
									{
										field : 'action',
										title : '操作',
										width : 170,
										align : 'center',
										formatter : function(value, row, index) {
											var data = row;
											var e = '<a href="#" onclick=editrow('
													+'"'+ data.id
													+ '","'
													+ data.name
													+ '")>编辑</a> ';
											if (adminRole == '1') {
												var c = '<a href="#" onclick=deleterow('
														+ index
														+ ',"'
														+ data.id + '")>删除</a>';
												return e + c;
											}
											return e;
										}
									} ] ],

							onBeforeEdit : function(index, row) {
								row.editing = true;
								$('#tt').datagrid('refreshRow', index);
								editcount++;
							},
							onAfterEdit : function(index, row) {
								row.editing = false;
								$('#tt').datagrid('refreshRow', index);
								editcount--;
							},
							onCancelEdit : function(index, row) {
								row.editing = false;
								$('#tt').datagrid('refreshRow', index);
								editcount--;
							},
							loadMsg : '数据加载中,请稍候......'
						});
		
		if(adminRole=='1'){
			$('#tt').datagrid({
				toolbar:[ {
					text : '增加',
					iconCls : 'icon-add',
					handler : addrow
				}]
			});
		}
		//分页
		var pager = $('#tt').datagrid('getPager');
		pager.pagination({
			total : 0,
			rows : 0,
			pageNumber : 1,
			pageList : [ 10, 20, 30 ],// 可以设置每页记录条数的列表
			onBeforeRefresh : function() {
			},
			onSelectPage : function(pageNumber, pageSize) {//分页触发  
				//	pageNumber--;
				find(pageNumber, pageSize);
			}
		});
		
		}
		var editcount = 0;
		

		function find(pageNumber, pageSize) {
			$("#tt").datagrid('getPager').pagination({
				pageSize : pageSize,
				pageNumber : pageNumber
			});//重置
			$("#tt").datagrid("loading"); //加屏蔽
			$.ajax({
				type : "POST",
				dataType : "json",
				url : spath + "/courseCategory/list",
				data : {
					'page' : pageNumber,
					'rows' : pageSize
				},
				success : function(data) {
					$("#tt").datagrid('loadData',
							pageData(data.rows, data.total));//这里的pageData是我自己创建的一个对象，用来封装获取的总条数，和数据，data.rows是我在控制器里面添加的一个map集合的键的名称
					var total = data.total;
					$("#tt").datagrid("loaded"); //移除屏蔽
				},
				error : function(err) {
					$.messager.alert('操作提示', '获取信息失败...请联系管理员!', 'error');
					$("#tt").datagrid("loaded"); //移除屏蔽
				}
			});
		}

	

	function pageData(list, total) {
		var obj = new Object();
		obj.total = total;
		obj.rows = list;
		return obj;
	}

	function saverow(index) {
		$('#tt').datagrid('endEdit', index);
	}
	function cancelrow(index) {
		$('#tt').datagrid('cancelEdit', index);
	}
	function addrow() {
		editrow( "", "");
	}
	function saveall() {
		$('#tt').datagrid('acceptChanges');
	}
	function cancelall() {
		$('#tt').datagrid('rejectChanges');
	}

	$(function() {
		$('#win').window('close');
		//	$('#win').window('open'); // open a window
	});

	function clearForm() {
		$('#win').window('close');
	}

	function submitForm() {
		$('#ff').ajaxSubmit({
			url : spath + '/courseCategory/save',
			type : "POST",
			dataType : "json",
			success : function(data) {
				if (data == '1') {
					alert("操作成功");
				} else {
					alert("操作失败");
				}
				$('#win').window('close');
				//               parent.location.reload();
			}
		});
	}
	
	function deleterow(index,id) {
		$.messager.confirm('确认', '是否真的删除?', function(r) {
			if (r) {
				$.ajax({
					type : "GET",
					dataType : "json",
					url : "/courseCategory/delete/"+id+"?new="+ Math.random(),
					success : function(data) {
						if(data=='1'){
							alert("删除成功");
							$('#tt').datagrid('deleteRow', index);
						}else{
							alert("删除失败");
						}
				
					},
					error : function(err) {
						$.messager.alert('操作提示', '获取信息失败...请联系管理员!', 'error');
					}
				});
				
			}
		});
	}
</script>
</head>
<body>
	<table id="tt"></table>
	<div id="win" class="easyui-window" title=""
		style="width: 400px; height: 130px;"
		data-options="iconCls:'icon-save',modal:true">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'">
				<div class="easyui-panel" title=" 分类信息编辑"
					style="width: 100%; height: 100%">
					<div style="padding: 10px 60px 20px 60px">
						<form id="ff" method="post">
						    <input type="hidden" id="id" name="id">
							<table cellpadding="5">
								<tr>
									<td>分类名称:<input type="text" name="name" id="name" ></td>
								</tr>
							</table>
						</form>
						<div style="text-align: center; padding: 5px">
							<a href="javascript:void(0)" class="easyui-linkbutton"
								onclick="submitForm()">保存</a> <a href="javascript:void(0)"
								class="easyui-linkbutton" onclick="clearForm()">取消</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>