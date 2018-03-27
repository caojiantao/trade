<!DOCTYPE html>
<html>
<head>
  <title>${pageInfo.title}</title>
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
      <div class="title">
        <i class="icon-index_31"></i>
        <#include "${component}/navigation.ftl"/>
      </div>
      <div class="content" style="padding: 10px;">
        <p>${pageInfo.content}</p>
      </div>
    </div>
  </div>
  <div class="left fn-clear">
  <#-- <#include "${component}/login.ftl" /> -->
  <#-- <#include "${component}/ems.ftl" /> -->
  <#include "${component}/category.ftl" />
  <#include "${component}/introduction.ftl" />
  <#-- <#include "${component}/lastest.ftl" /> -->
  </div>
  <#include "${component}/footer.ftl" />
</div>
<#include "${component}/sidebar.ftl" />
</body>
<script src="${plugins}/common.js"></script>
</html>