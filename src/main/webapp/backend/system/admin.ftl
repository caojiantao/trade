<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    
    <style type="text/css">
    	.add_admin{
    		margin-bottom: 10px;
    	}
    	.add_admin td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div id="win">
        <table class="add_admin" width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <td>账号：<input id="account" type="text" /></td>
                <td>姓名：<input id="name" type="text" /></td>
                <td>密码：<input id="pwd" type="password" /></td>
            </tr>
            <tr>
                <td colspan=3 align="center"><a href="#" iconcls="icon-ok" onclick="addAdmin()" class="easyui-linkbutton">添加</a></td>
            </tr>
        </table>
        
        <div id="editWin" iconCls="icon-save" title="编辑管理员">
        	<form id="editForm" action="updateAdmin.action" method="post">
	        	<table class="add_admin" width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
		            <tr>
		                <td>账号：</td>
		                <td><input id="e_account" name="account" type="text" readOnly="true"/></td>
		            </tr>
		            <tr>
		                <td>姓名：</td>
		                <td><input id="e_name" name="name" type="text" /></td>
		            </tr>
		            <tr>
		                <td>密码：</td>
		                <td><input id="e_pwd" name="pwd" type="password" /></td>
		            </tr>
		            <tr>
		                <td colspan=2 align="center"><input type='submit' value='保存'></td>
		            </tr>
		        </table>
	        </form>
        </div>
    </div>
    
    <div id="result"></div>

    <script type="text/javascript">
    	$(function(){
			getAllAdmins();
			
			$("#editWin").window({
				//width: 400,
				//height: 300,
				collapsible: false,
				minimizable: false,
				maximizable: false,
				modal: true,
				draggable: false,
				closed: true
			});
    	});
    	
    	function getAllAdmins(){
    		$("#result").datagrid({
				url : 'getAllAdmins.action',
				method : 'get',
				//height : '514',
				loadMsg : "数据装载中....",
				//pagination : true,
				striped : true,
				//pageSize : 50,
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'account',title:'账号',width:200},
			        {field:'name',title:'姓名',width:200},
			        //{field:'pwd',title:'密码',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="showEdit(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="deleteAdmin(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
    	}
    	
    	function addAdmin(){
    		$.ajax({
                type: "post",
                url: "addAdmin.action",
                // contentType: "application/json; charset=utf-8",
                // dataType: "json",
                data: {
                    account:$("#account").val(), 
                    name:$("#name").val(), 
                    pwd:$("#pwd").val()
                },
                success: function (status) {
               		$("#account").val(""); 
                	$("#name").val("");
                	$("#pwd").val("");
                	if(status){
                    	getAllAdmins();
                	}else{
                   		$.messager.alert("提示", "该管理员已存在!");
                	}
                },
                error: function (data) {
                    $.messager.alert("警告", "添加管理员异常!");
                }
            });
    	}
    	
    	function showEdit(id){
    		$('#editWin').window('open');
    		$.ajax({
                type: "post",
                url: "getAdminById.action",
                // contentType: "application/json; charset=utf-8",
                // dataType: "json",
                data: {
                    'id': id
                },
                success: function (admin) {
					$("#e_account").val(admin.account); 
                	$("#e_name").val(admin.name);
                	$("#e_pwd").val(admin.pwd);
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！~~!");
                }
            });
    	}
    	
    	function deleteAdmin(id){
	    	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                type: "get",
	                url: "deleteAdmin.action",
	                // contentType: "application/json; charset=utf-8",
	                // dataType: "json",
	                data: {
	                    'id': id
	                },
	                success: function (status) {
	                	if(status){
	                    	getAllAdmins();
	                	}else{
	                   		$.messager.alert("提示", "删除管理员失败!");
	                	}
	                },
	                error: function (data) {
	                    $.messager.alert("警告", "删除管理员异常!");
	                }
	            });
			}
    	}
    </script>
</body>
</html>