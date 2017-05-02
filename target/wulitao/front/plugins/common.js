function scroll_v(_a, _b) {
	var a = _a.get(0), b = _b.get(0);
	a.scrollTop++;
	var r_h = b.offsetHeight - parseInt(_b.css('paddingTop')) * 2;
	if (a.scrollTop >= r_h) {
		a.scrollTop = 0;
	}
}

/*$(function() {
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
});*/

$(function() {
    var setScroll = function($ele, $node) {
        var marginL = parseInt($ele.css('marginLeft')),
            width = $ele.get(0).offsetWidth - parseInt($ele.css('paddingLeft')) * 2,
            itemEdge = $ele.find('.item').first().width() + parseInt($ele.find('.item').first().css('marginLeft')) + parseInt($ele.find('.item').first().css('marginRight'));
        $ele.css('marginLeft', marginL - 1 + 'px');
        if (Math.abs(marginL) >= itemEdge) {
            $ele.find('.item').first().appendTo($ele);
            $ele.css('marginLeft', 0);
        }
    };
    var interval = null;
    var stopScroll = function() {
        window.clearInterval(interval);
    };
    var scrollH = function($node, $scroll) {
        var width = $node.width(),
            $items = $scroll.find('.item'),
            scrollLength = $items.length * ($items.width() + parseInt($items.css('marginLeft')));
        $scroll.css('width', scrollLength);
        if (width >= scrollLength) {
            console.log("No Need To Scroll");
        } else {
            var items = $scroll.find('.item'),
                last = items.last();
            interval = setInterval(function() {
                setScroll($scroll, $node);
            }, 50);
            $node.hover(function() {
                stopScroll();
            }, function() {
                interval = setInterval(function() {
                    setScroll($scroll, $node);
                }, 50);
            });
        }
    };
    var $node = $('.js-scroll-h'),
        $scroll = $node.find('.scroll-auto');
    scrollH($node, $scroll);
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