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
        <form action="updateBrand.action" enctype="multipart/form-data" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <tr>
                <input type="text" name="id" hidden="hidden">
                <td>行业名称</td>
                <td>
                	<select name="tradeId" style="width:200px;">
                		<option value="0">---请选择---</option>
                	</select>
				</td>
            </tr>
            <tr>
                <td>品牌名</td>
                <td>
                	<input type="text" name="name">
            	</td>
            </tr>
            <tr>
                <td>排序</td>
                <td>
                	<input type="text" name="order">
            		<span>(请输入数字，数值越大，越靠前)</span>
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
                	<textarea name="subscription"></textarea>
            	</td>
            </tr>
	        <tr>
	            <td>logo</td>
	            <td>
	            	<img id="logoImg" style="width:277px;height:68px;">
	            	<input id="selector" name="file" type="file" />
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
        KindEditor.ready(function(K) {
            K.create('textarea[name="subscription"]', {
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
    		initSelect();
    	});
        
        function getData(){
        	$("#result").datagrid({
				url : 'getAllBrands.action',
				method : 'get',
				loadMsg : "数据装载中....",
				pagination : true,
				striped : true,
				pageSize : 20,
				pageList : [10, 20, 50],
				singleSelect : true,
				rownumbers: true,
			    columns:[[
			        {field:'id',title:'ID',width:200},
			        {field:'tradeName',title:'行业类型',width:200},
			        {field:'name',title:'品牌类型',width:200},
			        {field:'order',title:'排序',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="editObj(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="deleteObj(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]]
			});
        }
        
        function initSelect(){
        	$.ajax({
                type: "get",
                url: "getAllTradesOpt.action",
                dataType: "json",
                success: function (opts) {
					if(opts != undefined && opts != null){
						for(index in opts){
							var opt = opts[index];
							var option = $($("select[name='tradeId']").find("option").get(0)).clone();
							option.val(opt.key);
							option.html(opt.value);
							$("select[name='tradeId']").append(option);
						}
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function editObj(id){
        	$.ajax({
                type: "get",
                url: "getBrandById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (brand) {
					if(brand != undefined && brand != null){
						$("input[name='tradeId']").val(brand.id);
						$("input[name='name']").val(brand.name);
						$("input[name='order']").val(brand.order);
						
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
	                url: "deleteBrandById.action",
	                // dataType: "json",
	                data: {
	                    'id':id
	                },
	                success: function (status) {
						if(status){
	                    	getAllBrands();
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