<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    
    <style type="text/css">
        *{
            font-size: 14px;
            font-family: Microsoft Yahei;
        }

        #win{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        td{
            padding: 10px;
        }
    </style>
</head>
<body class="easyui-layout">
    <div id="win">
        <table>
            <tr>
                <td>账号：<input id="account" type="text" /></td>
            </tr>
            <tr>
                <td>密码：<input id="pwd" type="password" /></td>
            </tr>
            <tr>
                <td colspan=2 align="center"><a href="#" iconcls="icon-ok" onclick="login()" class="easyui-linkbutton">登录</a></td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        $("#win").window({
            title: "登录",
            width: 400,
            height: 300,
            collapsible: false,
            minimizable: false,
            maximizable: false,
            closable: false,
            closed: false,
            draggable: false,
            resizable: false,
            modal: true //遮罩效果
        });

        function login(){
            $.ajax({
                type: "post",
                url: "loginIn.action",
                // contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: {
                    account:$("#account").val(), 
                    pwd:$("#pwd").val()
                },
                success: function (status) {
                	if(status == "true"){
                   		window.location.href="backend.action";
                	}else{
                   		$.messager.alert("提示", "密码有误!");
                	}
                },
                error: function (data) {
                    $.messager.alert("警告", "登录异常!");
                }
            });
        }
    </script>
</body>
</html>