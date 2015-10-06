<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/easyui/easyui.css">
<script type="text/javascript"
	src="/resources/js/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-form.js"></script>
<script type="text/javascript" src="/resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/resources/js/escar/datefmt.js"></script>

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
	
	function datagrid(startTime,endTime,phone){
		$('#tt').datagrid(
				{
					title : '会员列表',
					iconCls : 'icon-edit',
					pagination : true,//分页控件 
					singleSelect : true,
					rownumbers : true,
					//width : 700,
					height : 'auto',
					url : "/user/getAll?page=0&rows=0&v="+Math.random(),
					queryParams: {
						startTime: startTime,
						endTime: endTime,
						phone:phone
					},
					columns : [ [
							{
								field : 'phone',
								title : '手机号码',
								width : 100,
								editor : 'text'
							},
							{
								field : 'userName',
								title : '用户名',
								width : 100,
								editor : 'text'
							},
							{
								field : 'email',
								title : '电子邮件',
								width : 160
								
							},
							{
								field : 'address',
								title : '地址',
								width : 200
								
							},
							{
								field : 'createTime',
								title : '创建时间',
								width : 200,
								editor : 'datebox',
								 formatter: formatDatebox
							},
							{
								field : 'createTime',
								title : '最后登录时间',
								width : 200,
								editor : 'datebox',
							   formatter: formatDatebox
							},
							{
								field : 'action',
								title : '操作',
								width : 170,
								align : 'center',
								formatter : function(value, row, index) {		
									var data = row;
									var e = '<a href="#" onclick=editrow('
										+ index + ',"' + data.id + '","'
										+ data.userName + '","'
										+ data.phone + '","' + data.email
										+ '","' + data.address + '")>编辑</a> ';
									if(adminRole=='1'){
										var c = '<a href="#" onclick=deleterow('
													+ index + ',"'+ data.id+'")>删除</a>';
										 return e+c;
									}else{
										return e;
									}
								
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
					toolbar:'#tb',
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
		var startTime =$("input[name='startTime']").val();
		var endTime=$("input[name='endTime']").val();
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "/user/getAll",
			data : {
				'page' : pageNumber,
				'rows' : pageSize,
				startTime: startTime,
				endTime: endTime
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
	function editrow(index, id, userName, phone, email, address) {

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
		if(address!='null'){
			//$("#adminsex").val(sex);
			 $('#adminaddress').combobox('select', address);
		}
		

		//	$('#tt').datagrid('beginEdit', index);
	}
	function deleterow(index,id) {
		$.messager.confirm('确认', '是否真的删除?', function(r) {
			if (r) {
				$.ajax({
					type : "GET",
					dataType : "json",
					url : "/user/delete/"+id+"?new="+ Math.random(),
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


function search(){
	
	var startTime =$("input[name='startTime']").val();
	var endTime=$("input[name='endTime']").val();
	var phone=$("input[name='userPhone']").val();
	datagrid(startTime,endTime,phone);
}
function clearForm(){
	$('#win').window('close');
}
$(function() {
	$('#win').window('close');
});

function submitForm(){
	$('#ff').ajaxSubmit({
	    url:'/user/update',  
		type : "POST",
		dataType: "json",
        success:function(data){  
            if(data=='1'){
            	alert("操作成功");
            }else{
            	alert("操作失败");
            }
            $('#win').window('close');
//           parent.location.reload();
        }  
    });   
}
	
</script>
</head>
<body>


	
	<table id="tt"></table>

<div id="tb" style="padding:5px;height:auto">
		<div>
			注册日期: <input class="easyui-datebox" style="width:80px" name="startTime">
			- <input class="easyui-datebox" style="width:80px"  name="endTime">
			<span>手机号码</span>
			<input class="easyui-textbox" style="width:80px"  name="userPhone">
			<a href="javascript:search();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	
		<div id="win" class="easyui-window" title="" style="width: 400px; height: 400px"
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
									<td>地址:</td>
									<td>
									<span class="textbox easyui-fluid" style="width: 171px; height: 30px;">
									     <input  class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 8px; padding-bottom: 8px; width: 163px;"
										style="width: 100%; height: 32px" name="address" id="adminaddress">
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
	<script type="text/javascript">
	
	//$('#win').window('close'); // close a window
	</script>
</body>
</html>
