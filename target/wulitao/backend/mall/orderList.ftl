<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css" />
    <script type="text/javascript" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>

    <style type="text/css">
    	.addOrder{
            display: none;
    	}
    
        .addOrder td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }

        input, textarea{
            width: 750px;
            max-width: 750px;
        }
        
        .operator{
        	margin-bottom: 10px;
        }
    </style>
</head>
<body>
	<div class="operator">
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="getAllOrders()">刷新</a>
	</div>

    <div class="addOrder">
        <form action="addOrder.action" enctype="multipart/form-data" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <input type="text" name="id" hidden="hidden">
                <td>名字</td>
                <td><input type="text" name="deliveryName"></td>
            </tr>
            <tr>
                <td>EMS号</td>
                <td><input type="text" name="emsNo"></td>
            </tr>
            <tr>
                <td>标题</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>关键字</td>
                <td><input type="text" name="keyword"></td>
            </tr>
            <tr>
                <td>摘要</td>
                <td><textarea type="text" name="description"></textarea></td>
            </tr>
            <tr>
                <td>内容</td>
                <td><textarea name="content" style="visibility:hidden;"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                	<input type="button" value="取消" onclick="cancel()" style="width:100px;">
                	<input type="submit" value="保存" style="width:100px;">
                </td>
            </tr>
        </table>
        </form>
    </div>
    
    <div class="orderList">
		<div id="result"></div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		getAllOrders();
    	});
    
    	var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                width : '750px',
                autoHeightMode : true,
                cssData: 'body {font-size:14px;}',
                afterCreate : function() {
                    this.loadPlugin('autoheight');
                }
            });
        });
        
        function getAllOrders(){
        	$("#result").datagrid({
				url : 'getAllOrders.action',
				method : 'get',
				//height : '514',
				loadMsg : "数据装载中....",
				//pagination : true,
				striped : true,
				//pageSize : 50,
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'deliveryName',title:'姓名',width:200},
			        {field:'emsNo',title:'ems单号',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="editOrder(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="deleteOrder(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
        }
        
        function editOrder(id){
        	$.ajax({
                type: "post",
                url: "getOrderById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (order) {
					if(order != undefined && order != null){
						$("input[name='id']").val(order.id);
						$("input[name='deliveryName']").val(order.deliveryName);
						$("input[name='emsNo']").val(order.emsNo);
						$("input[name='title']").val(order.title);
						$("input[name='keyword']").val(order.keyword);
						$("textarea[name='description']").html(order.description);
						editor.html(order.content);
						
						$(".addOrder").css("display", "block");
						$(".orderList").css("display", "none");
						$(".operator").css("display", "none");
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function deleteOrder(id){
        	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                type: "post",
	                url: "deleteOrderById.action",
	                // dataType: "json",
	                data: {
	                    'id':id
	                },
	                success: function (status) {
						if(status){
	                    	getAllOrders();
	                	}else{
	                   		$.messager.alert("提示", "删除失败!");
	                	}
	                },
	                error: function (data) {
	                    $.messager.alert("警告", "网络异常！");
	                }
	            });
			}
        }
        
        function cancel(){
        	$(".addOrder").css("display", "none");
			$(".orderList").css("display", "block");
			$(".operator").css("display", "block");
			clearForm();
        }
        
        function clearForm(){
        	$("input[name='id']").val('');
        	$("input[name='deliveryName']").val('');
        	$("input[name='emsNo']").val('');
        	$("input[name='title']").val('');
        	$("input[name='keyword']").val('');
        	$("textarea[name='description']").html('');
        	editor.html('');
        }
    </script>
</body>
</html>