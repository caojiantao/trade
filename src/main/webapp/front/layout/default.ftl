<#-- 网站前台模板， -->
<#macro layout>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>${title}</title>
  <link rel="stylesheet" href="/plugins/editor/themes/default/default.css"/>
  <link rel="stylesheet" href="/plugins/jquery-easyui-1.2.6/themes/default/easyui.css"/>
  <link rel="stylesheet" href="/plugins/jquery-easyui-1.2.6/themes/icon.css"/>
  <link rel="stylesheet" href="${css}/kopi6.min.css">
</head>
<body>
  <div class="wrap-1000">
    <#include "${component}/header.ftl">
    <#-- 嵌套的内容 -->
    <#nested>
    <#include "${component}/footer.ftl" />
  </div>
  <#include "${component}/sidebar.ftl" />
  <script type="text/javascript" src="/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="/plugins/jquery.form.min.js"></script>
  <script type="text/javascript" src="/plugins/editor/kindeditor-min.js"></script>
  <script type="text/javascript" src="/plugins/editor/lang/zh_CN.js"></script>
  <script type="text/javascript" src="/js/pre-img.js"></script>
  <script type="text/javascript" src="/js/common.js"></script>
</body>
</html>
</#macro>