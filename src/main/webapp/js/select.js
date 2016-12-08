/**
 * 获取商品行业下拉框并赋值
 */
function getTrade(){
	$.ajax({
	    type: "get",
	    url: "getAllTradesOpt.action",
	    dataType: "json",
	    success: function (opts) {
			if(opts != undefined && opts != null){
				for(index in opts){
					var opt = opts[index];
					var option = $($("select[name='tradeId']").find("option").get(0)).clone();
					option.val(opt.key);
					option.html(opt.value);
					$("select[name='tradeId']").append(option);
				}
			}
	    },
	    error: function (data) {
	        $.messager.alert("警告", "网络异常！");
	    }
	});
}