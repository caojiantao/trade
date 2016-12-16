<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css" />
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
    	.addTrade{
            display: none;
    	}
    
        .addTrade td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="addTrade">
        <form action="updateTrade.action" enctype="multipart/form-data" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <input type="text" name="id" hidden="hidden">
                <td>类型名</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>排序</td>
                <td>
                	<input type="text" name="order">
            		<span>(请输入数字，数值越大，越靠前)</span>
            	</td>
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
    
    <div class="tradeList">
		<div id="result"></div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		getAllTrades();
    	});
        
        function getAllTrades(){
        	$("#result").datagrid({
				url : 'getAllTrades.action',
				method : 'get',
				//height : '560',
				loadMsg : "数据装载中....",
				pagination : true,
				striped : true,
				pageSize : 20,
				pageList : [10, 20, 50],
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'name',title:'类型',width:200},
			        {field:'order',title:'排序',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="editTrade(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="deleteTrade(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
        }
        
        function editTrade(id){
        	$.ajax({
                type: "get",
                url: "getTradeById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (trade) {
					if(trade != undefined && trade != null){
						$("input[name='id']").val(trade.id);
						$("input[name='name']").val(trade.name);
						$("input[name='order']").val(trade.order);
						
						$(".addTrade").css("display", "block");
						$(".tradeList").css("display", "none");
						$(".operator").css("display", "none");
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function deleteTrade(id){
        	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                type: "post",
	                url: "deleteTradeById.action",
	                // dataType: "json",
	                data: {
	                    'id':id
	                },
	                success: function (status) {
						if(status){
	                    	getAllTrades();
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
        	$(".addTrade").css("display", "none");
			$(".tradeList").css("display", "block");
			$(".operator").css("display", "block");
        }
    </script>
</body>
</html>