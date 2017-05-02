<!DOCTYPE html>
<html lang="en">
<head>
    <title>广告列表</title>
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
    <div class="editDiv easyui-panel">
        <form id="ff" enctype="multipart/form-data" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
            <input type="text" name="id" hidden="hidden">
            <tr>
                <td>排序</td>
                <td>
                	<input type="text" name="order">
            	</td>
            </tr>
            <tr>
                <td>广告链接</td>
                <td>
                	<input type="text" name="url">
            	</td>
            </tr>
            <tr>
	            <td>广告图片</td>
	            <td>
                	<input type="text" name="logoRealUrl" hidden="hidden">
	            	<img id="logoImg" style="width:277px;height:68px;">
	            	<input id="selector" name="file" type="file" />
	            </td>
	        </tr>
           	<tr>
                <td colspan="2">
                	<a id="btn" href="javascript:closeEditDiv()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
                	<a id="btn" href="javascript:submitForm()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
                </td>
            </tr>
        </table>
        </form>
    </div>
    
    <div class="listDiv">
		<div id="result"></div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		getData();
    	});
        
        function getData(){
        	$("#result").datagrid({
				url : 'listAllAds.action',
				method : 'get',
				loadMsg : "数据装载中....",
				striped : true,
				singleSelect : true,
				rownumbers: true,
				fitColumns: true,
			    columns:[[
			        {field:'order',title:'排序',width:200},
			        {field:'url',title:'广告链接',width:200},
			        {field:'operator', title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return '<a href="javascript:void(0)" onclick="editObj(' + row.id + ')">修改</a>' 
			        			+ '&nbsp;&nbsp;|&nbsp;&nbsp;' 
			        			+ '<a href="javascript:void(0)" onclick="removeObj(' + row.id + ')">删除</a>';
			        	}
			        }
			    ]],
			    toolbar: [{
			    	text: "增加",
			    	iconCls: "icon-add",
			    	handler: function(){openEditDiv()}
			    }]
			});
        }
        
        function editObj(id){
        	$.ajax({
                url: "getAdById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (obj) {
					if(obj != undefined && obj != null){
						$("input[name='id']").val(obj.id);
						$("input[name='order']").val(obj.order);
						$("input[name='url']").val(obj.url);
					
						// 防止logoUrl为null导致图片路径不变
						$("#logoImg").attr("src", obj.logoUrl == undefined ? "" : obj.logoUrl);
						$("input[name='logoRealUrl']").val(obj.logoRealUrl);
						
						openEditDiv();
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function removeObj(id){
        	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                url: "removeAdById.action",
	                // dataType: "json",
	                data: {
	                    'id':id
	                },
	                success: function (line) {
						if(line > 0){
	                    	$("#result").datagrid("reload");
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
        
        function submitForm(){
        	var url;
        	if($("input[name='id']").val() == ""){
        		url = "saveAd.action";
        	} else {
        		url = "updateAd.action";
        	}
			$('#ff').form('submit', {   
				url: url, 
				onSubmit: function(){   
					// 做某些检查   
					// 返回 false 来阻止提交   
				},   
      			success:function(line){ 
      				// 返回的一个字符串
          			line = parseInt(line);
          			if(line > 0){
	                    closeEditDiv();
	                    $("#result").datagrid("reload");
          			} else{
	                    $.messager.alert("提示", "操作失败！");
  					}
     			},
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
     		}); 
        }
        
        function openEditDiv(){
        	$(".editDiv").css("display", "block");
			$(".listDiv").css("display", "none");
        }
        
        function closeEditDiv(){
        	$(".editDiv").css("display", "none");
			$(".listDiv").css("display", "block");
        	clearForm();
        	
        	// 防止clear后预览图片失效
        	previewImg();
        }
        
        function clearForm(){
        	$('#ff').form("clear");
			$("#logoImg").attr("src", "");
        }
    </script>
</body>
</html>