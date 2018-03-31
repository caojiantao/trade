<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
    <script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
    <style type="text/css">
        .post {
            margin-bottom: 5px;
            padding: 0 20px;
        }

        .post:first-child {
            margin-top: 10px;
        }

        .post-title {
            margin-left: 10px;
        }

        .post-date {
            float: right;
        }
    </style>
</head>
<body class="about">
<div class="wrap-1000">
    <#include "${component}/header.ftl"/>
    <div class="right top fn-clear">
        <div class="_widget fn-clear">
            <div class="title">
                <i class="icon-item"></i>
                <#include "${component}/navigation.ftl"/>
            </div>
            <div class="content">
                <div id="content-newest" class="_pro-search fn-clear">
                <#--待填充 -->
                </div>
            </div>
        </div>
        <div class="_paging clearfix">
            <span>その結果<span id="cur_page"></span>, 合計ページ <span id="goods_total"></span></span>
        </div>
    </div>
    <div class="left fn-clear">
    <#include "${component}/category.ftl" />
    </div>
    <#include "${component}/footer.ftl" />
</div>
</body>
<script src="${plugins}/common.js"></script>
<script src="${plugins}/paging.js"></script>
<script>
    $(function () {
        var apiUrl = "/newest/listNewest.action";
        $.setPages({
            url: apiUrl,
            className: '_paging',
            data: {
                limit: 24
            },
            onClick: function (index, pageNum, total, rows) {
                initNewest(rows);
                // 改变左侧当前页码和总数提示
                $("#cur_page").text(index + "/" + pageNum);
                $("#goods_total").text(total);
            },
            maxPage: 8,
            edge: 1,
            showSide: true
        });
    });

    function initNewest(rows) {
        var $content = $('#content-newest');
        $content.empty();
        var resultStr = '';
        for (var i = 0; i < rows.length; i++) {
            var item = rows[i];
            resultStr += '<div class="post">' +
                    '<img src="/front/img/btandtype.png" alt="">' +
                    '<a class="post-title" href="/pageInfo.action?type=0&id=' + item.id + '">' + item.title + '</a>' +
                    '<span class="post-date">' + item.updateTime + '</span>' +
                    '</div>';
        }
        $content.append(resultStr);
    }
</script>
</html>