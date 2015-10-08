<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/md5.js"></script>

<script>
var adminRole='0';
	$(function() {
		
		
		jQuery.ajax({  
		    type : 'POST',  
		    contentType : 'application/json',  
		    url : '/admin/getSessionUser',
		    dataType : 'json',  
		    success : function(data) 
		    { 
		      if(data!=null && data.id!=null){
		    	  $("#adminPhone").html(data.phone);
		    	  adminRole = data.role;
		      }
		      datagrid();
		    }
		} );
		
		

	});
	
	function datagrid(){
		$('#tt').datagrid(
				{
					title : '用户列表',
					iconCls : 'icon-edit',
					pagination : true,//分页控件 
					singleSelect : true,
					rownumbers : true,
					//width : 700,
					height : 'auto',
					url : "/admin/getAll?page=0&rows=0",
					columns : [ [
							{
								field : 'userName',
								title : '用户名',
								width : 100,
								editor : 'text'
							},
							{
								field : 'phone',
								title : '手机号码',
								width : 100,
								editor : 'text'
							},
							{
								field : 'email',
								title : '电子邮件',
								width : 160,
								editor : {
									type : 'validatebox',
									options : {
										validType : 'email'
									}
								}
							},
							{
								field : 'sex',
								title : '性别',
								width : 80,
								editor : 'datebox'
							},
							{
								field : 'action',
								title : '操作',
								width : 170,
								align : 'center',
								formatter : function(value, row, index) {
									/* 	if (row.editing) {
											var s = '<a href="#" onclick="saverow('
													+ index + ')">保存</a> ';
											var c = '<a href="#" onclick="deleterow('
													+ index + ')">删除</a>';
											return s + c;
										} else { */

											
											
									var data = row;
									var e = '<a href="#" onclick=editrow('
											+ index + ',"' + data.id + '","'
											+ data.userName + '","'
											+ data.phone + '","' + data.email
											+ '","' + data.sex + '")>编辑</a> ';
									/* var d = '<a href="#" onclick="deleterow('
											+ index + ')">删除</a>'; */
									/* return e + d; */
									if(adminRole=='1'){
										/*  var d = '<a href="#" style="margin-left:10px;margin-right:10px"onclick=editrow('
												+ index + ',"","","","","")>添加</a>';  */
												
										var c = '<a href="#" onclick=deleterow('
													+ index + ',"'+ data.id+'")>删除</a>';
										 return e +c;
									}
									return e;
									//}
								}
							} ] ],
						
				/*	toolbar : [ {
						text : '增加',
						iconCls : 'icon-add',
						handler : addrow
					}
					
					, {
						text : '保存',
						iconCls : 'icon-save',
						handler : saveall
					}, {
						text : '取消',
						iconCls : 'icon-cancel',
						handler : cancelall
					} 
					], */
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

	function find(pageNumber, pageSize) {
		$("#tt").datagrid('getPager').pagination({
			pageSize : pageSize,
			pageNumber : pageNumber
		});//重置
		$("#tt").datagrid("loading"); //加屏蔽
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "/admin/getAll",
			data : {
				'page' : pageNumber,
				'rows' : pageSize
			},
			success : function(data) {
				$("#tt").datagrid('loadData', pageData(data.rows, data.total));//这里的pageData是我自己创建的一个对象，用来封装获取的总条数，和数据，data.rows是我在控制器里面添加的一个map集合的键的名称
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

	var editcount = 0;
	function editrow(index, id, userName, phone, email, sex) {

		$('#win').window('open');
		$("#adminid").val(id);
		if(userName!='null'){
			$("#adminuserName").val(userName);
		}
		if(phone!='null'){
			$("#adminphone").val(phone);
		}
		if(email!='null'){
			$("#adminemail").val(email);
		}
		if(sex!='null'){
			//$("#adminsex").val(sex);
			 $('#adminsex').combobox('select', sex);
		}
		

		//	$('#tt').datagrid('beginEdit', index);
	}
	function deleterow(index,id) {
		$.messager.confirm('确认', '是否真的删除?', function(r) {
			if (r) {
				$.ajax({
					type : "GET",
					dataType : "json",
					url : "/admin/delete/"+id+"?new="+ Math.random(),
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
	function saverow(index) {
		$('#tt').datagrid('endEdit', index);
	}
	function cancelrow(index) {
		$('#tt').datagrid('cancelEdit', index);
	}
	function addrow() {
		editrow(' ',"","","","","");
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
	
	function clearForm(){
		$('#win').window('close');
	}

	function submitForm(){
		var pwd = $("#loginPwd").val().trim();
		if(pwd!=''){
			$("#loginPwd").val(hex_md5(pwd));
		}
		$('#ff').ajaxSubmit({
		    url:'/admin/update',  
			type : "POST",
			dataType: "json",
	        success:function(data){  
                if(data=='1'){
                	alert("操作成功");
                }else{
                	alert("操作失败");
                }
                $('#win').window('close');
//               parent.location.reload();
	        }  
	    });   
	}
	
	//$('#win').window('close'); // close a window
</script>
</head>
<body>
	<div id="win" class="easyui-window" title=""
		style="width: 400px; height: 400px"
		data-options="iconCls:'icon-save',modal:true">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'">
				<div class="easyui-panel" title=" 编辑用户信息" style="width: 100%;height:100%">
					<div style="padding: 10px 60px 20px 60px">
						<form id="ff" method="post">
							<table cellpadding="5">
								<tr>
									<td>用戶名：</td>
									<td>
									<span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="userName" id="adminuserName">
										</span>
									
									<input type="hidden" name="id" id="adminid" /> 
									</td>
								</tr>
								<tr>
								
									<td>手机号码:</td>
									<td>
									<span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="phone" id="adminphone">
										</span>
									</td>
								</tr>

								<tr>
									<td>邮箱：</td>
									<td>
									
									<span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="email" id="adminemail">
										</span>
									</td>
								</tr>

								<tr>
									<td>性别:</td>
									<td>
									
									<input class="easyui-combobox" name="sex"   style="cursor:pointer" id="adminsex" data-options="valueField:'value',textField:'text',data:[{'value':'男','text':'男'},{'value':'女','text':'女'}]"/>  
									
										<!-- <span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="sex" id="adminsex">
										</span> -->
									</td>
								</tr>
								
									<tr>
								
									<td>密码:</td>
									<td>
									<span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="loginPwd" id="loginPwd">
										</span>
									</td>
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
	
	
	<table id="tt"></table>


</body>
</html>
