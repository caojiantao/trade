<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css" />
    <script charset="utf-8" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${base}/js/pre-img.js"></script>
    <script type="text/javascript" src="${base}/js/select.js"></script>

    <style type="text/css">
    	.editDiv{
            display: none;
    	}
    
        .editDiv td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
        
        .editDiv td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="editDiv">
        <form action="updateGoods.action" enctype="multipart/form-data" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <input type="text" name="id" hidden="hidden">
                <td>产品类型</td>
                <td>
                	<select name="tradeId" style="width:200px;">
                		<option value="0">---请选择---</option>
                	</select>
                	<select name="brandId" style="width:200px;">
                		<option value="0">---请选择---</option>
                	</select>
                	<select name="productId" style="width:200px;">
                		<option value="0">---请选择---</option>
                	</select>
				</td>
            </tr>
            <tr>
                <td>商品名称</td>
                <td>
                	<input type="text" name="name">
            	</td>
            </tr>
            <tr>
                <td>标题</td>
                <td>
                	<input type="text" name="title">
            	</td>
            </tr>
            <tr>
                <td>关键字</td>
                <td>
                	<input type="text" name="keyword">
            	</td>
            </tr>
            <tr>
                <td>描述</td>
                <td>
                	<textarea name="description"></textarea>
            	</td>
            </tr>
	        <tr>
	            <td>logo</td>
	            <td>
                	<input type="text" name="logoRealUrl" hidden="hidden">
	            	<img id="logoImg" style="width:277px;height:68px;">
	            	<input id="selector" name="file" type="file" />
	            </td>
	        </tr>
            <tr>
                <td>内容</td>
                <td>
                	<textarea name="content"></textarea>
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
    
    <div class="listDiv">
		<div id="result"></div>
    </div>
    
    <script type="text/javascript">
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
    
    	$(function(){
    		getData();
    	});
        
        function getData(){
        	$("#result").datagrid({
				url : 'getAllGoods.action',
				method : 'get',
				loadMsg : "数据装载中....",
				pagination : true,
				striped : true,
				pageSize : 20,
				pageList : [10, 20, 50],
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'tradeName',title:'商品行业',width:200},
			        {field:'brandName',title:'品牌类型',width:200},
			        {field:'productName',title:'产品类型',width:200},
			        {field:'name',title:'商品名称',width:200},
			        {field:'updateTime',title:'更新时间',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="editObj(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="deleteObj(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
        }
        
        function editObj(id){
        	$.ajax({
                type: "get",
                url: "getGoodsById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (goods) {
					if(goods != undefined && goods != null){
						$("input[name='id']").val(goods.id);
						$("select[name='tradeId']").val(goods.tradeId);
						// 手动触发select change事件，从而初始化二级菜单“品牌行业”
						$("select[name='tradeId']").change();
						$("select[name='brandId']").val(goods.brandId);
						// 手动触发select change事件，从而初始化三级菜单“产品类型”
						$("select[name='brandId']").change();
						$("select[name='productId']").val(goods.productId);
						$("input[name='name']").val(goods.name);
						$("input[name='title']").val(goods.title);
						$("input[name='keyword']").val(goods.keyword);
						$("textarea[name='description']").val(goods.description);
						// 防止logoUrl为null导致图片路径不变
						$("#logoImg").attr("src", goods.logoUrl == undefined ? "" : goods.logoUrl);
						$("input[name='logoRealUrl']").val(goods.logoRealUrl);
						editor.html(goods.content);
						
						$(".editDiv").css("display", "block");
						$(".listDiv").css("display", "none");
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function deleteObj(id){
        	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                type: "post",
	                url: "deleteGoodsById.action",
	                // dataType: "json",
	                data: {
	                    'id':id
	                },
	                success: function (status) {
						if(status){
	                    	getData();
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
			$(".editDiv").css("display", "none");
			$(".listDiv").css("display", "block");
        }
    </script>
</body>
</html>