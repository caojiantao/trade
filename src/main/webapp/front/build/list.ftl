<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
    <script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
</head>
<body class="about">
<div class="wrap-1000">
    <#include "${component}/header.ftl"/>
    <div class="right top fn-clear">
        <div class="_widget fn-clear">
            <div class="title">
                <i class="icon-index_31"></i>
                <#include "${component}/navigation.ftl"/>
            </div>
            <div class="content">
                <div class="_pro-search fn-clear">

                </div>
            </div>
        </div>
        <div class="_paging clearfix">
            <span>その結果<span id="cur_page"></span>, 合計ページ <span id="goods_total"></span></span>
        </div>
    </div>
    <div class="left fn-clear">
    <#-- <#include "${component}/login.ftl" /> -->
    <#-- <#include "${component}/ems.ftl" /> -->
    <#include "${component}/category.ftl" />
    <#-- <#include "${component}/lastest.ftl" /> -->
    </div>
			<#include "${component}/footer.ftl" />
</div>
</body>
<script src="${plugins}/common.js"></script>
<script src="${plugins}/paging.js"></script>
<script>
    $(function () {
        var apiUrl = "/api/listLatestGoods.action";
        $.setPages({
            url: apiUrl,
            data: {
                limit: 24,
                tradeId: ${dto.tradeId},
                brandId: ${dto.brandId},
                productId: ${dto.productId},
                lowestPrice: ${dto.lowestPrice?c},
                highestPrice: ${dto.highestPrice?c},
                keyword: "${dto.keyword}"
            },
            className: '_paging',
            onClick: function (index, pageNum, total, rows) {
                initGoodsEle(index, pageNum, total, rows, "._pro-search.fn-clear");
            },
            maxPage: 8,
            edge: 1,
            showSide: true
        });
    });
</script>
</html>