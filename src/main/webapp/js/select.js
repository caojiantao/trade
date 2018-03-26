$(function () {
    getTrade();
    $('#tradeId').change(function () {
        getBrandByTradeId($(this).val());
    });
    $('#brandId').change(function () {
        getProductByBrandId($(this).val());
    });
});

/**
 * 获取商品行业下拉框并赋值
 */
function getTrade() {
    var tradeSel = $('#tradeId');
    if (tradeSel.length === 0) return;
    $.ajax({
        type: "get",
        url: "/backend/listTradesOpt.action",
        async: false,
        dataType: "json",
        success: function (opts) {
            if (opts) {
                $.each(opts, function (index, opt) {
                    var option = $('<option></option>');
                    option.val(opt.key);
                    option.html(opt.value);
                    tradeSel.append(option);
                });
            }
        },
        error: function (data) {
            $.messager.alert("警告", "网络异常！");
        }
    });
}

/**
 * 获取品牌类型下拉框并赋值
 */
function getBrandByTradeId(parentId) {
    var brandSel = $('#brandId');
    if (brandSel.length === 0) return;
    $.ajax({
        type: "get",
        url: "/backend/listBrandsOpt.action",
        async: false,
        dataType: "json",
        data: {
            'parentId': parentId
        },
        success: function (opts) {
            brandSel.find("option:gt(0)").remove();
            var productSel = $('#productId');
            if (productSel.length > 0) {
                productSel.find("option:gt(0)").remove();
            }
            if (opts) {
                $.each(opts, function (index, opt) {
                    var option = $('<option></option>');
                    option.val(opt.key);
                    option.html(opt.value);
                    brandSel.append(option);
                });
            }
        },
        error: function (data) {
            $.messager.alert("警告", "网络异常！");
        }
    });
}

/**
 * 获取产品类型下拉框并赋值
 */
function getProductByBrandId(parentId) {
    var productSel = $('#productId');
    if (productSel.length === 0) return;
    $.ajax({
        type: "get",
        url: "/backend/listProductsOpt.action",
        async: false,
        dataType: "json",
        data: {
            'parentId': parentId
        },
        success: function (opts) {
            productSel.find("option:gt(0)").remove();
            if (opts) {
                $.each(opts, function (index, opt) {
                    var option = $('<option></option>');
                    option.val(opt.key);
                    option.html(opt.value);
                    $('#productId').append(option);
                });
            }
        },
        error: function (data) {
            $.messager.alert("警告", "网络异常！");
        }
    });
}