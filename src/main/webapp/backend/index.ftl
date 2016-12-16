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
            font-family: Microsoft Yahei;
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
<script>
        $(function(){
            $('#tt2').datagrid({
                title:'My Title',
                iconCls:'icon-save',
                width:600,
                height:350,
                nowrap: false,
                striped: true,
                fit: true,
                url:'datagrid_data.json',
                sortName: 'code',
                sortOrder: 'desc',
                idField:'code',
                frozenColumns:[[
                    {field:'ck',checkbox:true},
                    {title:'code',field:'code',width:80,sortable:true}
                ]],
                columns:[[
                    {title:'Base Information',colspan:3},
                    {field:'opt',title:'Operation',width:100,align:'center', rowspan:2,
                        formatter:function(value,rec){
                            return '<span style="color:red">Edit Delete</span>';
                        }
                    }
                ],[
                    {field:'name',title:'Name',width:120},
                    {field:'addr',title:'Address',width:120,rowspan:2,sortable:true},
                    {field:'col4',title:'Col41',width:150,rowspan:2}
                ]],
                pagination:true,
                rownumbers:true
            });
        });
    </script>
</head>
<body class="easyui-layout">
    <div region="north" class="backend-titlebar" style="overflow: hidden;">
        <img src="../imgs/backend-logo.png" />
        <span class="backend-title">欢迎登入后台系统：${Session["account"]}</span>
        <div class="right-href">
            <a href="#">注销登录</a>
            <a href="#">网站前台</a>
        </div>
    </div>
    <div region="south" style="padding:5px;background:#EAEEF5;">
        <span class="copyright">Copyright © 2016 wulitaotao. All Rights Reserved</span>
    </div>
    <div region="west" split="true" style="width:200px;overflow:hidden;">
        <div class="easyui-accordion" fit="true" border="false">
            <div title="功能列表" selected="true" style="padding:10px;overflow:auto;">
                <ul class="easyui-tree">
                    <li state='closed'>
                        <span>信息单页</span>
                        <ul>
                    		<li><a href="javascript:addTab('会社概要','pageInfo.action?type=0')">会社概要</a></li>
                    		<li><a href="javascript:addTab('注文方法','pageInfo.action?type=1')">注文方法</a></li>
                    		<li><a href="javascript:addTab('重要事项','pageInfo.action?type=2')">重要事项</a></li>
                    		<li><a href="javascript:addTab('割引情报','pageInfo.action?type=3')">割引情报</a></li>
                    		<li><a href="javascript:addTab('注意事项','pageInfo.action?type=4')">注意事项</a></li>
                    		<li><a href="javascript:addTab('返品返金','pageInfo.action?type=5')">返品返金</a></li>
                    		<li><a href="javascript:addTab('营业时间','pageInfo.action?type=6')">营业时间</a></li>
                    		<li><a href="javascript:addTab('配送方式','pageInfo.action?type=7')">配送方式</a></li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>文章管理</span>
                        <ul>
                    		<li><a href="javascript:addTab('文章列表','pageInfo.action?type=8')">文章列表</a></li>
                    		<li><a href="javascript:addTab('文章添加','pageInfo.action?type=8')">文章添加</a></li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>广告管理</span>
                        <ul>
                            <li>广告列表</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div title="商城管理" style="padding:10px;">
                <ul class="easyui-tree">
                    <li state='closed'>
                        <span>商品类型</span>
                        <ul>
                            <li state='closed'>
                                <span>商品行业</span>
                                <ul>
                            		<li><a href="javascript:addTab('行业列表','tradeList.action')">行业列表</a></li>
                                    <li><a href="javascript:addTab('行业添加','tradeAdd.action')">行业添加</a></li>
                                </ul>
                            </li>

                            <li state='closed'>
                                <span>品牌类型</span>
                                <ul>
                            		<li><a href="javascript:addTab('品牌列表','brandList.action')">品牌列表</a></li>
                                    <li><a href="javascript:addTab('品牌添加','brandAdd.action')">品牌添加</a></li>
                                </ul>
                            </li>

                            <li state='closed'>
                                <span>产品类型</span>
                                <ul>
                            		<li><a href="javascript:addTab('产品列表','productList.action')">产品列表</a></li>
                                    <li><a href="javascript:addTab('产品添加','productAdd.action')">产品添加</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>商品管理</span>
                        <ul>
                    		<li><a href="javascript:addTab('商品列表','goodsList.action')">商品列表</a></li>
                            <li><a href="javascript:addTab('商品添加','goodsAdd.action')">商品添加</a></li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>订单管理</span>
                        <ul>
                            <li>订单列表</li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>用户管理</span>
                        <ul>
                            <li>用户列表</li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>EMS管理</span>
                        <ul>
                            <li><a href="javascript:addTab('追踪列表','orderList.action')">追踪列表</a></li>
                            <li><a href="javascript:addTab('追踪添加','orderAdd.action')">追踪添加</a></li>
                        </ul>
                    </li>
            </div>
            <div title="系统设置" style="padding:10px">
                <ul class="easyui-tree">
                    <li state='closed'>
                        <span>管理员管理</span>
                        <ul>
                            <li><a href="javascript:addTab('管理员列表','admin.action')">管理员列表</a></li>
                        </ul>
                    </li>
                    <li state='closed'>
                        <span>网站信息</span>
                        <ul>
                            <li><a href="javascript:addTab('基本信息','website.action')">基本信息</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div region="center" style="overflow:hidden;">
        <div id="tt" class="easyui-tabs" fit="true" border="false">
            <div title="首页" style="padding:20px;overflow:hidden;"> 
                <h2>欢迎来到网站后台管理首页！</h2>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function addTab(title, url){
            if ($('#tt').tabs('exists', title)){
                $('#tt').tabs('select', title);
            } else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
                $('#tt').tabs('add',{
                    title:title,
                    content:content,
                    closable:true
                });
                $('#tt').tabs('getTab', title).css({
                    "overflow": "hidden"
                });
            }
        }
    </script>
</body>
</html>