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
        .addTrade td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="addTrade">
        <form action="addTrade.action" enctype="multipart/form-data" method="post">
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
                	<input type="submit" value="保存" style="width:100px;">
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>