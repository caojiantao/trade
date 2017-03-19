function scroll_v(_a, _b) {
	var a = _a.get(0), b = _b.get(0);
	a.scrollTop++;
	var r_h = b.offsetHeight - parseInt(_b.css('paddingTop')) * 2;
	if (a.scrollTop >= r_h) {
		a.scrollTop = 0;
	}
}

$(function() {
	var $d = $('.js-scroll-v');
	$d.each(function(index, element) {
		var _this = $(this), $d_f = _this.find('.js-scroll1'), $d_s = _this
				.find('.js-scroll2'), $d_f_i = $d_f.find('.item'), d_h = _this
				.height();

		_this.css({
			"height" : d_h,
			"overflow" : "hidden"
		});
		$d_f_i.clone().appendTo($d_s);
		var t = setInterval(function() {
			scroll_v(_this, $d_f);
		}, 50);
		_this.on({
			mouseover : function() {
				clearInterval(t);
			},
			mouseout : function() {
				t = setInterval(function() {
					scroll_v(_this, $d_f);
				}, 50);
			}
		});
	});
});
function scroll_h(_a, _b) {
	var b = _b.get(0), l = parseInt(_a.css('marginLeft'));
	var r_w = b.offsetWidth - parseInt(_b.css('paddingLeft')) * 2;
	_a.css('marginLeft', l - 1);
	if (Math.abs(l) >= r_w) {
		_a.css('marginLeft', 0);
	}
}

$(function() {
	var $d = $('.js-scroll-h');
	$d.each(function(index, element) {
		var _this = $(this), $d_b = _this.find('.scroll-auto'), $d_f = _this
				.find('.scroll1'), $d_s = _this.find('.scroll2'), $d_f_i = $d_f
				.find('.item');

		$d_f_i.clone().appendTo($d_s);
		var t = setInterval(function() {
			scroll_h($d_b, $d_f);
		}, 50);
		_this.on({
			mouseover : function() {
				clearInterval(t);
			},
			mouseout : function() {
				t = setInterval(function() {
					scroll_h($d_b, $d_f);
				}, 50);
			}
		});
	});
});

/**
 * 购买商品
 * @param id
 */
function saveGoods(id, count){
	if(count == undefined) count = 1;
	$.ajax({
		url:"/api/saveCart.action",
		data:{
			goodsId:id,
			count:count
		},
		success:function(){
			window.location.href="/cart.action";
		}
	});
}

/**
 * 动态添加商品
 * @param index
 * @param pageNum
 * @param total
 * @param rows
 */
function initGoodsEle(index, pageNum, total, rows, className){
	// 循环添加商品
	var itemsDiv = $(className);
	itemsDiv.empty();
	for(var i in rows){
		var goods = rows[i];
		var ele = "<div class=\"item\">" +
					"<div class=\"ibox\">" +
						"<div class=\"img\"><a href=\"/goods.action?id=" + goods.id + "\"><img src=\"" + goods.logoUrl + "\" alt=\"\"></a></div>" +
					"</div>" +
					"<p class=\"t\"><a href=\"\">" + goods.title + "</a></p>" +
					"<p class=\"p\">N品：" + goods.price + "円   </p><a href=\"javascript:saveGoods(" + goods.id + ")\" class=\"btn\">購入商品</a>" +
				   "</div>";
		itemsDiv.append(ele);
	}
	// 改变左侧当前页码和总数提示
	$("#cur_page").text(index + "/" + pageNum);
	$("#goods_total").text(total);
}