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
        <form action="addGoods.action" enctype="multipart/form-data" method="post">
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
                <td>商品编号</td>
                <td>
                	<input type="text" name="number">
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
                <td>价格</td>
                <td>
                	<input type="text" name="price">
            	</td>
            </tr>
            <tr>
                <td>推荐</td>
                <td>
                	<label><input type="checkbox" name="scroll" value="1" />滚动展示</label>
                	<label><input type="checkbox" name="hot" value="1" />人气商品</label>
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
                cssData: 'body {font-size:14px;}',
                afterCreate : function() {
                    this.loadPlugin('autoheight');
                }
            });
        });
    </script>
</body>
</html>