<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css" />
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
    	.editDiv{
    		display: none;
    	}
    
        .editDiv td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
	<div class="listDiv">
		<div id="result"></div>
    </div>

    <div class="editDiv">
        <form action="addEms.action" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
        	<input type="text" name="id" hidden="hidden">
            <tr>
                <td>名字</td>
                <td><input type="text" name="name"></td>
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
                <td><textarea type="text" name="summary"></textarea></td>
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
    
    <script type="text/javascript">
    	var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                width : '750px',
                autoHeightMode : true,
                uploadJson: '/files.action',
                cssData: 'body {font-size:14px;}',
                afterCreate : function() {
                    this.loadPlugin('autoheight');
                }
            });
        });
        
        $(function(){
        	$("#result").datagrid({
				url : 'getAllEms.action',
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
			        {field:'name', title:'姓名',width:100},
			        {field:'emsNo', title:'ems单号',width:100},
			        {field:'operator',  title:'操作',width:200,
			        	formatter: function(value,row,index){
			        		return "<a href=\"javascript:editItem(" + row.id + ")\">编辑</a>" 
			        			+ "&nbsp;&nbsp;|&nbsp;&nbsp;"
			        			+ "<a href=\"javascript:deleteItem(" + row.id + ")\">删除</a>";
			        	}
			        }
			    ]]
			});
        });
        
        function editItem(id){
        	$.ajax({
                type: "get",
                url: "getEmsById.action",
                dataType: "json",
                data: {
                    'id':id
                },
                success: function (ems) {
					if(ems != undefined && ems != null){
						$("input[name='id']").val(ems.id);
						$("input[name='name']").val(ems.name);
						$("input[name='emsNo']").val(ems.emsNo);
						$("input[name='title']").val(ems.title);
						$("input[name='keyword']").val(ems.keyword);
						$("textarea[name='summary']").val(ems.summary);
						editor.html(ems.content);
						
						$(".editDiv").css("display", "block");
						$(".listDiv").css("display", "none");
					}
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
        
        function deleteItem(id){
        	if(confirm('确定要删除这条记录吗？')){
	    		$.ajax({
	                type: "post",
	                url: "deleteEmsById.action",
	                data: {
	                    'id':id
	                },
	                success: function (status) {
						if(status){
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
        
        function cancel(){
			$(".editDiv").css("display", "none");
			$(".listDiv").css("display", "block");
        }
    </script>
</body>
</html>