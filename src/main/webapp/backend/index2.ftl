<#import "/macro/public.ftl" as public>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${base}/plugins/jquery-easyui-1.2.6/themes/icon.css">
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>

    <style type="text/css">
        .backend-title, .backend-titlebar .right-href{
            font-size: 16px;
            font-family: Microsoft Yahei, serif;
        }
        .backend-titlebar{
            background-color: #1E458A;
            display: flex;
            padding:10px;
            align-items: center
        }
        .backend-titlebar .right-href{
            margin-left: auto;
        }
        .backend-title{
            padding-left: 10px;
            color: white;
            font-weight: bold;
        }
        a{
            margin-left: auto;
            color: white;
            text-decoration: none;
        }
        a:hover{
            text-decoration: underline;
        }
        .copyright{
            display: block;
            text-align: center;
        }
        
        li a{
        	color: black;
        }
    </style>
</head>
<body class="easyui-layout">
  <div region="north" class="backend-titlebar" style="overflow: hidden;">
    <img src="../imgs/backend-logo.png" />
    <span class="backend-title">欢迎登入后台系统：${Session["account"]}</span>
    <div class="right-href">
        <a href="#">注销登录</a>
        <a href="/" target="_blank">网站前台</a>
    </div>
  </div>
  <div region="west" split="true" style="width:200px;overflow:hidden;">
    <div class="easyui-accordion" fit="true" border="false">
    <#list menus as menu>
      <div title="${menu.name}">
        <#list menu.children as child>
          <ul class="easyui-tree">
            <@public.menu children = child/>
          </ul>
        </#list>
      </div>
    </#list>
    </div>
  </div>
  <div region="center" style="overflow:hidden;">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
      <div title="首页" style="padding:20px;overflow:hidden;">
        <h2>欢迎来到网站后台管理首页！</h2>
      </div>
    </div>
  </div>

  <script type="text/javascript">

    /* 点击左侧菜单 */
    function clickItem(title, url){
      var $tabs = $('#tabs');
      if ($tabs.tabs('exists', title)){
          $tabs.tabs('select', title);
      } else {
        var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
        $tabs.tabs('add', {
          title: title,
          content: content,
          closable: true
        });
        $tabs.tabs('getTab', title).css({
          "overflow": "hidden"
        });
      }
    }
  </script>
</body>
</html>