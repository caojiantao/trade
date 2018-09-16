<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单列表</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css"/>
    <script type="text/javascript" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
        .userDetail {
            display: none;
        }

        .userDetail td {
            background-color: #E7E7E7;
            padding: 5px 10px;
        }

        .operator {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="userDetail">
    <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
        <tr>
            <td width="200px">名字</td>
            <td><span id="name"></span></td>
        </tr>
        <tr>
            <td width="200px">昵称</td>
            <td><span id="nickName"></span></td>
        </tr>
        <tr>
            <td>邮编</td>
            <td><span id="postCode"></span></td>
        </tr>
        <tr>
            <td>城市</td>
            <td>
                <select name="county">
						<#list counties as county>
                            <option value=${county.key}>
                              ${county.value}
                            </option>
                        </#list>
                </select>
            </td>
        </tr>
        <tr>
            <td>地址</td>
            <td><span id="address"></span></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><span id="phoneNumber"></span></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><span id="email"></span></td>
        </tr>
        <tr>
            <td>备注</td>
            <td><span id="remark"></span></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="返回" onclick="cancel()" style="width:100px;">
            </td>
        </tr>
    </table>
</div>

<div class="userList">
    <div id="result"></div>
</div>

<script type="text/javascript">
    $(function () {
        $("#result").datagrid({
            url: 'getAllUsers.action',
            method: 'post',
            //height : '514',
            loadMsg: "数据装载中....",
            pagination: true,
            striped: true,
            pageSize: 20,
            pageList: [5, 10, 20],
            singleSelect: true,
            rownumbers: true,
            columns: [[
                {field: 'email', title: '邮箱', width: 200},
                {field: 'nickName', title: '昵称', width: 200},
                {field: 'createTime', title: '时间', width: 200},
                {
                    field: 'operator', title: '操作', width: 200,
                    formatter: function (value, row, index) {
                        return "<a href=\"javascript:showDetail('" + row.email + "')\">查看</a>"
                                + "&nbsp;&nbsp;|&nbsp;&nbsp;"
                                + "<a href=\"javascript:deleteItem('" + row.email + "')\">删除</a>";
                    }
                }
            ]]
        });
    });

    function showDetail(email) {
        $.ajax({
            type: "post",
            url: "getUserByEmail.action",
            data: {
                'email': email
            },
            success: function (user) {
                $("#name").html(user.name);
                $("#nickName").html(user.nickName);
                $("#postCode").html(user.postCode);
                $("select[name='county']").val(user.county);
                $("#address").html(user.address);
                $("#phoneNumber").html(user.phoneNumber);
                $("#email").html(user.email);
                $("#remark").html(user.remark);

                $(".userDetail").css("display", "block");
                $(".userList").css("display", "none");
            },
            error: function (data) {
                $.messager.alert("警告", "网络异常！");
            }
        });
    }

    function deleteItem(email) {
        if (confirm('确定要删除这条记录吗？')) {
            $.ajax({
                type: "post",
                url: "deleteUserByEmail.action",
                dataType: "json",
                data: {
                    'email': email
                },
                success: function (result) {
                    if (result.code === 200) {
                        $("#result").datagrid("reload");
                    } else {
                        $.messager.alert("提示", result.message);
                    }
                },
                error: function (data) {
                    $.messager.alert("警告", "网络异常！");
                }
            });
        }
    }

    function cancel() {
        $(".userDetail").css("display", "none");
        $(".userList").css("display", "block");
    }
</script>
</body>
</html>