<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/plugins/editor/themes/default/default.css"/>
    <link rel="stylesheet" href="/plugins/jquery-easyui-1.2.6/themes/default/easyui.css"/>
    <link rel="stylesheet" href="/plugins/jquery-easyui-1.2.6/themes/icon.css"/>

    <style type="text/css">
        td {
            background-color: #E7E7E7;
            padding: 5px 10px;
        }

        .resizable {
            display: inline-block;
            width: 750px;
            max-width: 750px;
        }
    </style>
</head>
<body>
<form id="js-form" enctype="multipart/form-data" method="post">
    <table width="100%" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
        <tr>
            <input type="text" name="id" value="${website.id}" hidden>
            <td>网站名称</td>
            <td><input class="resizable" type="text" name="name" value="${website.name}"></td>
        </tr>
        <tr>
            <td>logo</td>
            <td>
                <img id="logoImg" style="width:277px;height:68px;" src="${website.logoUrl}">
                <input class="resizable" id="selector" name="file" type="file"/>
            </td>
        </tr>
        <tr>
            <td>店长</td>
            <td><input class="resizable" type="text" name="manager" value="${website.manager}"></td>
        </tr>
        <tr>
            <td>营业时间</td>
            <td><input class="resizable" type="text" name="businessHour" value="${website.businessHour}"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input class="resizable" type="email" name="email" value="${website.email}"></td>
        </tr>
        <tr>
            <td>邮箱密码</td>
            <td><input class="resizable" type="text" name="emailPwd" value="${website.emailPwd}"></td>
        </tr>
        <tr>
            <td>网站关键字</td>
            <td><input class="resizable" type="text" name="keyword" value="${website.keyword}"></td>
        </tr>
        <tr>
            <td>关键字描述</td>
            <td><textarea class="resizable" type="text" name="description">${website.description}</textarea></td>
        </tr>
        <tr>
            <td>顶部滚动文字</td>
            <td><input class="resizable" type="text" name="topScrollText" value="${website.topScrollText}"></td>
        </tr>
        <tr>
            <td>顶部固定文字</td>
            <td><input class="resizable" type="text" name="topFixText" value="${website.topFixText}"></td>
        </tr>
        <tr>
            <td>商品详情页logo下方</td>
            <td><textarea class="resizable" id="goodsDetailBottom" name="goodsDetailBottom"
                          style="visibility:hidden;">${website.goodsDetailBottom}</textarea></td>
        </tr>
        <tr>
            <td>商品详情页logo右侧</td>
            <td><textarea class="resizable" id="goodsDetailRight" name="goodsDetailRight"
                          style="visibility:hidden;">${website.goodsDetailRight}</textarea></td>
        </tr>
        <tr>
            <td>首页图文描述</td>
            <td><textarea class="resizable" id="introduction" name="introduction"
                          style="visibility:hidden;">${website.introduction}</textarea>
            </td>
        </tr>
        <tr>
            <td>底部固定文字</td>
            <td><textarea class="resizable" id="bottomFixText" name="bottomFixText"
                          style="visibility:hidden;">${website.bottomFixText}</textarea>
            </td>
        </tr>
        <tr>
            <td>自定义内容</td>
            <td><textarea class="resizable" id="customContent" name="customContent"
                          style="visibility:hidden;">${website.customContent}</textarea>
            </td>
        </tr>
        <tr>
            <td>统计代码</td>
            <td><textarea class="resizable" type="text" name="countScript">${website.countScript}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;"><input type="submit" value="确认修改" style="width:100px;"></td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/plugins/jquery.form.min.js"></script>
<script type="text/javascript" src="/plugins/editor/kindeditor-min.js"></script>
<script type="text/javascript" src="/plugins/editor/lang/zh_CN.js"></script>
<script type="text/javascript" src="/js/pre-img.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        $('#js-form').submit(function () {
            syncEditor();
            $(this).ajaxSubmit({
                url: '/backend/updateWebsite.action',
                type: 'post',
                dataType: 'json',
                success: function (result) {
                    $.messager.alert('提示', (result.code === 200) ? '更新成功！' : result.message, 'info');
                }
            });
            return false;
        });
    });

    var editorIds = ['goodsDetailBottom', 'goodsDetailRight', 'introduction', 'bottomFixText', 'customContent'];
    createEditor(editorIds);
</script>
</body>
</html>