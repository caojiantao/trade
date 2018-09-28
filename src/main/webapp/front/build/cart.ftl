<!DOCTYPE html>
<html>
<head>
    <title>買い物かご</title>
    <meta http-equiv="Content-Type" content="charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
</head>
<#assign sumMoney = 0 />
<body class="shopTrolley">
<div class="wrap-1000">
    <#include "${component}/header.ftl"/>
    <div class="_shopTrolley">
        <table>
            <tbody>
            <tr>
                <td class="td_btm td_btm_r">商品</td>
                <td class="td_btm td_btm_r">価格</td>
                <td class="td_btm td_btm_r">数量</td>
                <td class="td_btm td_btm_r">小計</td>
                <td class="td_btm td_btm_r">削除</td>
            </tr>
            <#list data as cart>
                <tr>
                    <td class="td_pro td_btm_r">
                        `
                        <div class="td_img">
                            <ul class="fn-clear">
                                <li class="img"><a href="/goods.action?id=${cart.goods.id?c}"><img
                                        src="${cart.goods.logoUrl}" alt=""></a></li>
                                <li class="txt"><a
                                        href="/goods.action?id=${cart.goods.id?c}">${cart.goods.name}</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td class="td_pro td_btm_r js-unit-price">
                        価格:${cart.goods.price}円
                    </td>
                    <td class="td_pro td_btm_r js-count">
                        <select id="${cart.goods.id}" data-count="${cart.count}">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </td>
                    <td class="td_pro td_btm_r js-part-price">
                      ${cart.goods.price * cart.count}円
                    </td>
                    <td class="td_pro td_btm_r">
                        <input type="button" onclick="removeGoods(${cart.goods.id}, this)" value="削除">
                    </td>
                </tr>
              <#assign sumMoney = sumMoney + cart.goods.price * cart.count />
            </#list>
            <tr>
                <td colspan="5" class="sum">合計:<span>${sumMoney}</span>円</td>
            </tr>
            </tbody>
        </table>
        <div class="end">
            <ul>
                <li class="ta-r"><a href="javascript:decide();"><img src="${img}/b_03.png" alt=""></a></li>
            </ul>
        </div>
    </div>

    <div class="vip">
        <table>
            <tbody>
            <tr>
                <td class="td_top">お名前<span>*</span></td>
                <td class="td_right">
                    <input name="name" type="text" class="len n-need">（例:田中太郎）
                </td>
            </tr>
            <tr>
                <td class="td_top">フリガナ<span>*</span>（カタカナ）</td>
                <td class="td_right">
                    <input name="xing" type="text" class="len x-need">（例:タナカタロウ）
                </td>
            </tr>
            <tr>
                <td class="td_top">郵便番号<span>*</span>（半角数字、ハイフンなし）</td>
                <td class="td_right">
                    <input name="postcart" type="text" class="len p-need">（例:1430001）
                </td>
            </tr>
            <tr>
                <td class="td_top">都道府県</td>
                <td class="td_right">
                    <select name="county">
                    <#list countiesMap?keys as key>
                        <option value="${key}">
                          ${countiesMap[key]}
                        </option>
                    </#list>
                    </select>
                </td>
            </tr>
            <tr style="display:none">
                <td class="td_top">市区町村<span>*</span></td>
                <td class="td_right">
                    <input name="city" type="text" class="len c-need">（例:港区南麻布）
                </td>
            </tr>
            <tr>
                <td class="td_top">詳しい住所<span>*</span></td>
                <td class="td_right">
                    <input name="address" type="text" class="len a-need">（例:1-1-1 AAビル202）
                </td>
            </tr>
            <tr>
                <td class="td_top">電話番号<span>*</span>（半角数字、ハイフンなし）</td>
                <td class="td_right">
                    <input name="tel" type="number" class="len t-need">（例:0120123456）
                </td>
            </tr>
            <tr>
                <td class="td_top">メールアドレス<span>*</span>（半角英数字）</td>
                <td class="td_right" style="display: flex;align-items: center;">
                    <input name="mail" type="text" class="len m-need" style="flex-shrink: 0;">
                    <label>（例:info@gmail.com ）ご注文後、ご注文日の12時間以内。万一，メールが届かない場合、 当社まで御一報お願いします。@docomoの外のメールアドレスを使 ってください。ありがとうございます！</label>
                </td>
            </tr>
            <tr>
                <td class="td_top">お客様掲示板</td>
                <td class="td_right">
                    <textarea name="remark" rows="2" cols="20"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="end">
            <input type="image" src="${img}/index_39.png" onclick="pay()">
        </div>
    </div>
    <#include "${component}/footer.ftl" />
</div>
</body>
<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
<script src="${plugins}/common.js"></script>
<script>
    $(function () {
        // 初始化购物车商品数量加载
        var $count = $('.js-count'),
                $st = $('._shopTrolley'),
                $sel = $count.find("select");
        $sel.each(function (i, e) {
            var _this = $(this),
                    count_d = _this.data('count'),
                    option = _this.children('option');
            option.filter(function () {
                return $(this).val() == count_d;
            })
                    .attr('selected', true);
        });

        // 设置select选择onchange事件
        $sel.change(function () {
            // 修改当前价格
            var _this = $(this),
                    count_d = _this.data('count'),
                    option = _this.children('option'),
                    source = _this.parents('tr').find('.js-unit-price'),
                    target = _this.parents('tr').find('.js-part-price'),
                    unitPrice = source.text().getNum(),
                    val = _this.val();
            var tempTotal = unitPrice * val;
            target.text(tempTotal.toString().numDot() + '円');
            // 修改总价
            updateTotal();
            // 后台更新
            $.ajax({
                url: "/api/updateCart.action",
                data: {
                    goodsId: _this.attr("id"),
                    count: val
                }
            });
        });

        initUserInfo();

        $(".vip").css("display", "none");
    });

    //字符串取数字
    String.prototype.getNum = function () {
        return parseInt(this.replace(/[^0-9]/ig, ""));
    }

    // 价格位数3位添加逗号
    String.prototype.numDot = function () {
        return this.split('').reverse().join('').replace(/(\d{3})/g, '$1,').replace(/\,$/, '').split('').reverse().join('');
    }

    // 根据一个商品的小计汇总出购物车的总价
    function updateTotal() {
        var sum = 0;
        $('._shopTrolley').find('.js-part-price').each(function () {
            var _this = $(this);
            sum += _this.text().getNum();
        });
        var total = $('._shopTrolley').find('.sum span');
        total.text(sum.toString().numDot());
    }

    // 移除商品tr列
    function removeGoods(id, ele) {
        if (confirm("确定要删除吗？")) {
            $(ele).parents('tr').remove();
            updateTotal();
            $.ajax({
                url: "/api/updateCart.action",
                data: {
                    goodsId: id
                }
            });
        }
    }

    function decide() {
        $(".vip").css("display", "block");
    }

    function initUserInfo() {
        <#if user != null>
            $("input[name='name']").val("${user.name}");
            $("input[name='xing']").val("${user.nickName}");
            $("input[name='postcart']").val("${user.postCode}");
            $("select[name='county']").val("${user.county}");
            $("input[name='address']").val("${user.address}");
            $("input[name='tel']").val("${user.phoneNumber}");
            $("input[name='mail']").val("${user.email}");
            $("textarea[name='remark']").val("${user.remark}");
        </#if>
    }

    function pay() {
        $.ajax({
            url: "/api/pay.action",
            data: {
                name: $("input[name='name']").val(),
                nickName: $("input[name='xing']").val(),
                postCode: $("input[name='postcart']").val(),
                county: $("select[name='county']").val(),
                address: $("input[name='address']").val(),
                phoneNumber: $("input[name='tel']").val(),
                email: $("input[name='mail']").val(),
                remark: $("textarea[name='remark']").val(),
                totalPrice: $(".sum span").html().getNum()
            },
            success: function () {
                alert("成功!!");
                window.onload.href = "/index.action";
            }
        });
    }
</script>
</html>