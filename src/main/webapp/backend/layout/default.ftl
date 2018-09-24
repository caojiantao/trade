<#-- 网站前台模板， -->
<#macro layout>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" href="${base}/plugins/jquery-easyui-1.5.3/themes/icon.css">
    <link rel="stylesheet" href="${base}/plugins/editor/themes/default/default.css"/>
    <script charset="utf-8" src="${base}/plugins/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery.form.min.js"></script>
    <script type="text/javascript" src="${base}/js/pre-img.js"></script>
    <script type="text/javascript" src="${base}/js/common.js"></script>
    <script type="text/javascript" src="${base}/js/select.js"></script>

</head>
<body>
<#-- 嵌套的内容 -->
  <#nested>
</body>
</html>
</#macro>