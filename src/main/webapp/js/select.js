$(function(){
	getTrade();
	$("select[name='tradeId']").change(function(){
		getBrandByTradeId($("select[name='tradeId']").val());
	});
	$("select[name='brandId']").change(function(){
		getProductByBrandId($("select[name='brandId']").val());
	});
});

/**
 * 获取商品行业下拉框并赋值
 */
function getTrade(){
	var tradeSel = $("select[name='tradeId']");
	if(tradeSel == undefined) return;
	$.ajax({
	    type: "get",
	    url: "getAllTradesOpt.action",
	    async: false,
	    dataType: "json",
	    success: function (opts) {
			if(opts != undefined && opts != null){
				for(index in opts){
					var opt = opts[index];
					var option = $(tradeSel.find("option").get(0)).clone();
					option.val(opt.key);
					option.html(opt.value);
					tradeSel.append(option);
				}
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
function getBrandByTradeId(tradeId){
	var brandSel = $("select[name='brandId']");
	if(brandSel == undefined) return;
	$.ajax({
	    type: "get",
	    url: "getAllBrandsOptByTradeId.action",
	    async: false,
	    dataType: "json",
	    data:{
	    	'tradeId': tradeId
	    },
	    success: function (opts) {
	    	brandSel.find("option:gt(0)").remove();
	    	
			if(opts != undefined && opts != null){
				for(index in opts){
					var opt = opts[index];
					var option = $(brandSel.find("option").get(0)).clone();
					option.val(opt.key);
					option.html(opt.value);
					brandSel.append(option);
				}
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
function getProductByBrandId(brandId){
	$.ajax({
	    type: "get",
	    url: "getAllProductsOptByBrandId.action",
	    async: false,
	    dataType: "json",
	    data:{
	    	'brandId': brandId
	    },
	    success: function (opts) {
	    	var productSel = $("productId");
	    	if(productSel != undefined) productSel.find("option:gt(0)").remove();
	    	
			if(opts != undefined && opts != null){
				for(index in opts){
					var opt = opts[index];
					var option = $($("select[name='productId']").find("option").get(0)).clone();
					option.val(opt.key);
					option.html(opt.value);
					$("select[name='productId']").append(option);
				}
			}
	    },
	    error: function (data) {
	        $.messager.alert("警告", "网络异常！");
	    }
	});
}