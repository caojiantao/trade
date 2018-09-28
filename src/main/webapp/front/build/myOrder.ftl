<!DOCTYPE html>
<html>
<head>
    <title>${goods.title}</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
    <script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
</head>
<body class="detail">

    <div>
        <div class="myorder-table">
            <div style="width:50%" class="table-title">商品</div>
            <div style="width:20%" class="table-title">价格</div>
            <div style="width:10%" class="table-title">数量</div>
            <div style="width:20%" class="table-title">小记</div>
        </div>
        <#if orders?? && orders?size gt 0>
            <#list orders as order>
                <div class="myorder-table table-line">订单号：${order.no!''}</div>

                <#list order.goodsList as good>
                    <div class="myorder-table-item">
                        <div style="width:50%;" class="table-body">
                            <a href="/goods.action?id=" + ${good.goodsId?c}>
                                <img src="${good.logUrl!''}" width="70px" height="70px"></img>
                                <span>${good.productName!''}<br>${good.description!''}</span>
                            </a>
                        </div>
                        <div style="width:20%;" class="table-body">${good.price!''}</div>
                        <div style="width:10%;" class="table-body">${good.count!''}</div>

                        <div style="width:20%;" class="table-body">${good.totalPrice}</div>
                    </div>
                </#list>

                <div class="myorder-table table-line"><span class="item-right">合计 : ${order.totalPrice!''}</span></div>
            </#list>
            <#include "${component}/page.ftl"/>
        <#else>
            <div class="myorder-table table-line">暂无数据</div>
        </#if>
    </div>
</body>

</html>