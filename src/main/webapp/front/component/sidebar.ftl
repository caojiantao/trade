<div class="_sidebar">
	<div class="_side-item"><a href="/cart.action" title="" class="_side-btn icon-buy"></a></div>
	<div class="_side-item"><a href="mailto:${website.email}" title="" class="_side-btn icon-mail"></a></div>
	<div style="visibility:visible" class="_side-item js-up">
		<div title="" class="_side-btn icon-up"></div>
	</div>
</div>

<script>
	(function(win, doc, con, undefined) {
		var btn = doc.querySelector('.js-up'),
			btns = doc.querySelectorAll('._side-item'),
			i,
			len = btns.length;
		/** 
		* 回到页面顶部 
		* @param acceleration 加速度 
		* @param time 时间间隔 (毫秒) 
		**/
		var goTop = function(acceleration, time) {
			acceleration = acceleration || 0.1; 
			time = time || 1; 
			 
			var x1 = 0; 
			var y1 = 0; 
			var x2 = 0; 
			var y2 = 0; 
			var x3 = 0; 
			var y3 = 0; 
			 
			if (document.documentElement) { 
				x1 = document.documentElement.scrollLeft || 0; 
				y1 = document.documentElement.scrollTop || 0; 
			} 
			if (document.body) { 
				x2 = document.body.scrollLeft || 0; 
				y2 = document.body.scrollTop || 0; 
			} 
			var x3 = window.scrollX || 0; 
			var y3 = window.scrollY || 0; 
			 
			// 滚动条到页面顶部的水平距离 
			var x = Math.max(x1, Math.max(x2, x3)); 
			// 滚动条到页面顶部的垂直距离 
			var y = Math.max(y1, Math.max(y2, y3)); 
			 
			// 滚动距离 = 目前距离 / 速度, 因为距离原来越小, 速度是大于 1 的数, 所以滚动距离会越来越小 
			var speed = 1 + acceleration; 
			window.scrollTo(Math.floor(x / speed), Math.floor(y / speed)); 
			 
			// 如果距离不为零, 继续调用迭代本函数 
			if(x > 0 || y > 0) {
				window.addEventListener('mousewheel', function(e) {
					return false;
				});
				//- var invokeFunction = "goTop(" + acceleration + ", " + time + ")";
				window.setTimeout(goTop, time); 
			} else {
				window.removeEventListener('mousewheel', function(e) {
					return false;
				});
			}
		}
	
		var getTop = function() {
			if (document.documentElement) { 
				x1 = document.documentElement.scrollLeft || 0; 
			} 
			if (document.body) { 
				x2 = document.body.scrollLeft || 0; 
			}
			return Math.max(x1, x2);
		}
	
		if (getTop() != 0) {
			btn.style.visibility = 'visible';
		} else {
			btn.style.visibility = 'hidden';
		}
	
		for (i = 0; i < len; i++) {
			btns[i].addEventListener('mouseenter', function(e) {
				e.stopPropagation();
				var tg = this.querySelector('._side-btn'),
					clsName = tg.className.match(/icon-\w+/g).toString();
				tg.className = tg.className.replace(clsName, clsName + 'H');
			});
			btns[i].addEventListener('mouseleave', function(e) {
				e.stopPropagation();
				var tg = this.querySelector('._side-btn'),
					clsName = tg.className.match(/icon-\w+/g).toString();
				tg.className = tg.className.replace(clsName, clsName.slice(0, -1));
			});
		}
	
		win.addEventListener('scroll', function() {
			var scrollTop = win.pageYOffset || doc.documentElement.scrollTop || doc.body.scrollTop;
			if (scrollTop != 0) {
				btn.style.visibility = "visible";
			} else {
				btn.style.visibility = "hidden";
			}
		});
	
		btn.addEventListener('click', function(e) {
			e.preventDefault();
			//- doc.documentElement.scrollTop = doc.body.scrollTop = 0;
			goTop();
			btn.style.visibility = "hidden";
	
		});
	}(window, document, console));
</script>