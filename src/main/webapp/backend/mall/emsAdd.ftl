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
        .addEms td{
            background-color: #E7E7E7;
            padding: 5px 10px;
        }

        input, textarea{
            width: 750px;
            max-width: 750px;
        }
    </style>
</head>
<body>
    <div class="addEms">
        <form action="addEms.action" method="post">
        <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
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
                <td colspan="2"><input type="submit" value="保存" style="width:100px;"></td>
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
    </script>
</body>
</html>