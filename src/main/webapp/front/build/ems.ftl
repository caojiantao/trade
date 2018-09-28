<!DOCTYPE html>
<html>
<head>
    <title>${ems.title}</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
    <script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
</head>
<body class="about">
<div class="wrap-1000">
<#include "${component}/header.ftl">
    <div class="right top fn-clear">
        <div class="_widget fn-clear">
            <div class="title"><i class="icon-index_31"></i><span>当面の位置：ホーム &gt;&gt; EMS追踪</span></div>
            <div class="content">
                <p>${ems.content}</p>
            </div>
        </div>
    </div>
    <div class="left top fn-clear">
    <#--
        <#include "${component}/login.ftl" />
    -->
    <#include "${component}/ems.ftl" />
    <#include "${component}/category.ftl" />
    <#-- <#include "${component}/lastest.ftl" /> -->
    </div>
<#include "${component}/footer.ftl" />
</div>
</body>
<script src="${plugins}/common.js"></script>
</html>