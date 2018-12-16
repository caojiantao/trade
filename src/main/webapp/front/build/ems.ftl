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
            <div class="title"><i class="icon-index_31"></i><span>当面の位置：ホーム &gt;&gt; EMS追踪 番号:${ems.emsNo!''}</span></div>
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
<script>
    function scroll_v(_a,_b) {
        var a = _a.get(0),
                b = _b.get(0);
        a.scrollTop++;
        var r_h = b.offsetHeight - parseInt(_b.css('paddingTop')) * 2;
        if (a.scrollTop >= r_h) {
            a.scrollTop=0;
        }
    }

    $(function() {
        var $d = $('.js-scroll-v');
        $d.each(function(index,element) {
            var _this = $(this),
                    $d_f = _this.find('.js-scroll1'),
                    $d_s = _this.find('.js-scroll2'),
                    $d_f_i = $d_f.find('.item'),
                    d_h = _this.height();

            _this.css({
                "height":d_h,
                "overflow":"hidden"
            });
            $d_f_i.clone().appendTo($d_s);
            var t = setInterval(function() {
                scroll_v(_this,$d_f);
            },50);
            _this.on({
                mouseover:function() {
                    clearInterval(t);
                },
                mouseout:function() {
                    t = setInterval(function() {
                        scroll_v(_this,$d_f);
                    },50);
                }
            });
        })
    });
</script>
</html>