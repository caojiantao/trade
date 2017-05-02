/**
 *  @module 轮播组件
 *  @dependence jQuery1.x
 *  @author Rufer <547719886@qq.com>
 *  @structure xxx>ul.items>li> img
 *  @license GPL-3.0+
 *  @copyright © 2017 https://github.com/Miller547719886
 */

!(function($) {
	/**
	 *  @params method: 需要进行函数防抖的函数;
	 *	@params delay: 需要等待的时间, 单位为毫秒;
	 *	@params immediate: 如果为true, 则debounce会在调用时立刻执行一次fn,而不需要等到wait结束后.
	 *  @type {[type]}
	 */
	
	function debounce(method, delay, context) {
	    clearTimeout(method.timer);
	    method.timer = setTimeout(function () {
	        method.call(context);
	    },delay);
	}

	$.fn.setCarousel = function(options) {
		var defaults = {
				switchType : 'left',//left,top,gradient
				duration : 0.6,//unit:seconds
				easing : 'swing',//swing,linear
				delay : 5,//unit:seconds
				hideClickBar : false,
				hideBottomBar : false,
				width : null,
				height : null,
				bottomBarType: 'square'//dot,long-dot,square,Rectangle
			},
			//定义滚动顺序:ASC/DESC.ADD.JENA.201208081718
			order_by = 'ASC',
			$this = $(this),
			$ul = $this.children('ul.items'),
			$lis = $ul.children('li'),
			$li_first = $lis.first(),
			$firstImg = $li_first.find('img'),
			li_num = $lis.length,
			li_width = $li_first.width(),
			li_height = $li_first.height(),
			animatable = true,
			opts = $.extend({}, defaults, options || {}),	
			init = function() {
				// 是否按标准编写插件基础DOM结构
				if(!$this.length) {
					console.error('CAROUSEL NO CONTENT!');
					return false;
				}

				li_height = opts.height ? opts.height : $lis.first().height();
				li_width = opts.width ? opts.width : $lis.first().width();
				$this.css({
					width: li_width + 'px', 
					height: li_height + 'px'
				});
				$lis.css({
					width: li_width + 'px',
					height: li_height + 'px'
				});
				// 上下张切换模式
				switch (opts.switchType) {
					case 'left': 
						$ul.css('width', li_num * li_width + 'px');
						break;
					case 'top': 
						$ul.css('height', li_num * li_height + 'px');
						break;
					default:
						console.error('WRONG CAROUSEL DIRECTION');
				}
				$ul.find('li:eq(0)').addClass($li_first.hasClass('active') ? 'active' : '');
				// 是否显示底部导航条
				if(!opts.hideBottomBar){
					var $tips = $('<div class="tips"></div>').css('opacity', 0.6).appendTo($this);
					var $title = $('<div class="title"></div>').html(function(){
						var $active = $ul.find('li.active').find('a'), 
							text = $active.attr('title'), 
							href = $active.attr('href');
						return $('<span>').attr('href', href).text(text);
					}).appendTo($tips);
					var $nums = $('<div class="nums"></div>').hide().appendTo($tips);
					$lis.each(function(i, n) {
						var a = $(n).find('a'), 
							text = a.attr('title'), 
							href = /*a.attr('href')*/'javascript:;', 
							css = opts.bottomBarType;
						(i == 0) && (css += ' active');
						$('<a>').attr('href', href)
							.text(text)
							.addClass(css)
							// TODO 导航条样式
							.on('click', function(e) {
								if (animatable) {
									animatable = false;
									e.preventDefault();
									stop();
									$(this).addClass('active')
										.siblings()
										.removeClass('active');
									$ul.find('li:eq('+$(this).index()+')').addClass('active')
										.siblings()
										.removeClass('active');
									start(); 
								}
								// debounce(function() {
								// 	_e.preventDefault();
								// 	console.log(123);
								// 	stop();
								// 	$(this).addClass('active')
								// 		.siblings()
								// 		.removeClass('active');
								// 	$ul.find('li:eq('+$(this).index()+')').addClass('active')
								// 		.siblings()
								// 		.removeClass('active');
								// 	start(); 
								// }, opts.duration);
							}).appendTo($nums);
					});
					// 是否隐藏导航条
					if (opts.hideClickBar) {
						$this.hover(function() {
							$nums.animate({top: '0px'}, 'fast');
						}, function(){
							$nums.animate({top: $tips.height() + 'px'}, 'fast');
						});
						$nums.show().delay(2000).animate({
							top: $tips.height() + 'px'
						}, 'fast');
					} else {
						$nums.show();
					}
				}
				(li_num > 1) && start();
			},
			stop = function() {
				window.clearTimeout($this.data('timeid'));
			},
			start = function() {
				var $active = $ul.find('li.active'), 
					$active_a = $active.find('a');
				var index = $active.index(),
					offset = 0,
					param = {};
				// TODO 切换模式
				if (opts.switchType == 'left') {
					offset = index * li_width * -1;
					param = {
						'left': offset + 'px' 
					};
				} else {
					offset = index * li_height * -1;
					param = {
						'top': offset + 'px' 
					};
				}
				
				$this.find('.nums').find('a:eq(' + index + ')').addClass('active')
					.siblings()
					.removeClass('active');
				$this.find('.title').find('a').attr('href', $active_a.attr('href'))
					.text($active_a.attr('title'));

				$ul.stop().animate(param, opts.duration * 1000, opts.easing, function() {
					$active.removeClass('active');
					if ($active.next().length) {
						$active.next().addClass('active');
					} else {
						$lis.first().addClass('active');
					}
					animatable = true;
				});
				$this.data('timeid', window.setTimeout(start, opts.delay * 1000));
			};
		// $this.hover(function() {
		// 	stop();
		// }, function() {
		// 	$this.data('timeid', window.setTimeout(start, opts.delay * 1000));
		// });
		//首张图片加载完毕后执行初始化
		var imgLoader = new Image();
		imgLoader.onload = function(){
			imgLoader.onload = null;
			init();
		};
		imgLoader.src = $firstImg.attr('src');
	};
}(jQuery));
