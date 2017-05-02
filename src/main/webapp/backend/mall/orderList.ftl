<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单列表</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css" />
    <script type="text/javascript" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
    	.orderDetail{
            display: none;
    	}
    
        .orderDetail td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
        
        .operator{
        	margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="orderDetail">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <td width="200px">名字</td>
                <td><span id="name"></span></td>
            </tr>
            <tr>
                <td width="200px">昵称</td>
                <td><span id="nickName"></span></td>
            </tr>
            <tr>
                <td>邮编</td>
                <td><span id="postCode"></span></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><span id="address"></span></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><span id="phoneNumber"></span></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><span id="email"></span></td>
            </tr>
            <tr>
                <td>EMS</td>
                <td><span id="emsNo"></span></td>
            </tr>
            <tr>
                <td>备注</td>
                <td><span id="remark"></span></td>
            </tr>
            <tr>
            	<td colspan="2">
            		<div id="detail" style="height:250px;"></div>
	            </td>
            </tr>
            <tr>
            	<td colspan="2">
            		<input type="button" value="返回" onclick="cancel()" style="width:100px;">
            	</td>
            </tr>
        </table>
    </div>
    
    <div class="orderList">
		<div id="result"></div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		getAllOrders();
    	});
        
        function getAllOrders(){
        	$("#result").datagrid({
				url : 'getAllOrders.action',
				method : 'post',
				//height : '514',
				loadMsg : "数据装载中....",
				pagination : true,
				striped : true,
				pageSize : 20,
				pageList:[5, 10, 20],
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'no', title:'订单号',width:100},
			        {field:'emsNo', title:'ems单号',width:100},
			        {field:'name', title:'姓名',width:100},
			        {field:'email', title:'邮箱',width:200},
			        {field:'totalPrice', title:'总金额',width:100},
			        {field:'createTime', title:'时间',width:200},
			        {field:'operator',  title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" class="easyui-linkbutton" onclick="showDetail('+row.id+')" >查看订单</a>'+ '&nbsp;&nbsp;|&nbsp;&nbsp;'
			        			+ '<a href="javascript:void(0)" onclick="deleteOrder(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
			
        }
        //显示商品详情
        function showDetail(id){
        	$.ajax({
                type: "post",
                url: "getOrderDetailById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (order) {
					if(order != undefined && order != null){
						formatData(order);
						
						$(".orderDetail").css("display", "block");
						$(".orderList").css("display", "none");
						$(".operator").css("display", "none");
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
        	});
        	
        }
		function formatData(order){
			$("#name").html(order.name);
			$("#nickName").html(order.nickName);
			$("#postCode").html(order.postCode);
			$("#address").html(order.address);
			$("#phoneNumber").html(order.phoneNumber);
			$("#emsNo").html(order.emsNo);
			$("#email").html(order.email);
			$("#remark").html(order.remark);
			
			$('#detail').datagrid({
				fitColumns : true,
			    columns:[[
			    	{field:'logoUrl',align:'center',title:'图片',width:200,height:60,
			    		formatter:function(value,row,index){
			    			return '<img src="'+value+'" width="60" height="60"></img>';
			    		}
			    	},
			        {field:'productName',align:'center',title:'名称',width:200,
			        	formatter:function(value,row,index){
			        		return '<a href="/goods.action?id='+row.id+'" target="_blank">'+value+'</a>'
			        	}
			        },
			        {field:'price',align:'center',title:'单价',width:200},
			        {field:'count',align:'center',title:'数量',width:200},
			        {field:'operator',align:'center', title:'总价',width:200,
			        	formatter: function(value,row,index){
			        		var price = row.price;
			        		var count = row.count;
			        		var totalPrice = price*count;
			        		return totalPrice;
			        	}
			        }
			    ]]
		    }); 
			var goods = order.goodsJson;
			var data = $.parseJSON(goods);
			$("#detail").datagrid("loadData",data);
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
        	$(".orderDetail").css("display", "none");
			$(".orderList").css("display", "block");
			$(".operator").css("display", "block");
			clearForm();
        }
        
        function clearForm(){
			$("#name").html("");
			$("#nickName").html("");
			$("#postCode").html("");
			$("#address").html("");
			$("#phoneNumber").html("");
			$("#emsNo").html("");
			$("#email").html("");
			$("#remark").html("");
        }
    </script>
</body>
</html>