<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户反馈</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css"/>
    <script charset="utf-8" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="${base}/js/pre-img.js"></script>
</head>
<body>

<div class="listDiv">
    <div id="result"></div>
</div>

<script type="text/javascript">
    $(function () {
        function getData() {
            $("#result").datagrid({
                url: 'listAllFeedbacks.action',
                method: 'get',
                loadMsg: "数据装载中....",
                striped: true,
                singleSelect: true,
                rownumbers: true,
                fitColumns: true,
                columns: [[
                    {field: 'email', title: '邮箱', width: 200},
                    {field: 'nickName', title: '昵称', width: 200},
                    {field: 'content', title: '内容', width: 200}
                ]]
            });
        }
    });
</script>
</body>
</html>