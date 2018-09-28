<!DOCTYPE html>
<html>
<head>
    <title>個人情報を記入する</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">

    <script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
    <script src="${plugins}/common.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery.form.min.js"></script>
</head>
<body class="info">
<div class="wrap-1000">
    <#include "${component}/header.ftl"/>
    <div class="_info fn-clear">
        <div class="menu fn-left">
            <ul>
                <li class="d t">メニュー</li>
                <li class="d"><a id="userManage" onclick="changeMenu(1)" title="ユーザ情報">ユーザ情報</a></li>
                <li class="d"><a id="myOrders" onclick="changeMenu(2)" title="ユーザオーダー">ユーザオーダー</a></li>
            </ul>
        </div>
        <iframe id="menuIframe" src="" width="75%" height="600px"></iframe>
    </div>
    <#include "${component}/footer.ftl"/>
</div>
</body>
<script>
    $(function () {
        $("#menuIframe").attr("src", "/userMange.action");
        $("#userManage").text($("#userManage").attr("title") + " >>");
    });

    function changeMenu(type) {
        if(type == 1){
            $("#menuIframe").attr("src", "/userMange.action");
            $("#userManage").text($("#userManage").attr("title") + " >>");
            $("#myOrders").text($("#myOrders").attr("title"));

        }else if(type == 2){
            $("#menuIframe").attr("src", "/myOrder.action");
            $("#userManage").text($("#userManage").attr("title"));
            $("#myOrders").text($("#myOrders").attr("title")  + " >>");
        }
    }

</script>
</html>