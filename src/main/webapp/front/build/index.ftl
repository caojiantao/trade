<!DOCTYPE html>
<html>
	<head>
		<title>${website.name}</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
	</head>
	<body class="index">
		<div class="wrap-1000">
				<#include "${component}/header.ftl">
				<div class="_banner fn-clear">
					<div class="box"><a href="" class="active"><img src="${img}/201638175611.jpg" alt=""></a><a href=""><img src="${img}/201638175220.jpg" alt=""></a><a href=""><img src="${img}/201638175892.jpg" alt=""></a></div>
					<div class="list fn-right"><span class="active"><img src="${img}/201638175611.jpg" alt=""></span><span><img src="${img}/201638175220.jpg" alt=""></span><span><img src="${img}/201638175892.jpg" alt=""></span></div>
				</div>
				<script>
					function switchPic(_a,_b) {
						_a.each(function(ele,i) {
						var _this = $(this);
							if(_this.hasClass('active')) {
								var _index = _a.index(_this);
								var b_this = _b.eq(_index);
								b_this.addClass('active').siblings().removeClass('active');
							}
						})
					}
					
					function intv(_a,_b) {
						var c = _a.filter(function() {
							return $(this).hasClass('active');
						});
						if (_a.index(c) < _a.length - 1) {
							c.removeClass('active').next().addClass('active');
						} else {
							c.removeClass('active');
							_a.eq(0).addClass('active');
						}
						switchPic(_a,_b);
					}
				</script>
				<div class="_search-list border fn-clear">ブランド:
					<select class="brands">
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;分類：&nbsp;
					<select class="type">
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;価格:&nbsp;
					<input type="text" value="0" class="price p1">&nbsp;-&nbsp;
					<input type="text" value="88000" class="price p2">
					<input type="button" value="检索" class="search-btn btn">
				</div>
			<div class="right top fn-clear">
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>一番新しいアップロード</span></div>
							<div class="content">
								<div class="box border _pro-new-txt fn-clear">
									<ul>
										<#list newGoods as goods>
											<li><i></i><a href="/goods.action?id=${goods.id}">${goods.title}</a></li>
										</#list>
									</ul>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>売り上げランキング</span></div>
							<div class="content">
								<div class="_pro-sell fn-clear js-scroll-h">
									<div class="scroll-auto fn-clear">
										<div class="scroll1 fn-clear">
											<#list scrollGoods as goods>
												<div class="item"><span>${goods_index+1}</span>
													<div class="ibox">
														<div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a></div>
													</div>
													<p class="t"><a href="">${goods.title}</a></p>
													<p class="p">N品：${goods.price}円 </p>
												</div>
											</#list>
										</div>
										<div class="scroll2 fn-clear"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>人気商品</span></div>
							<div class="content">
								<div class="_pro-hot fn-clear">
									<#list hotGoods as goods>
										<div class="item">
											<div class="ibox">
												<div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a></div>
											</div>
											<p class="t"><a href="">${goods.title}</a></p>
											<p class="p">N品：${goods.price}円   </p><a href="javascript:saveGoods(${goods.id})" class="btn">購入商品</a>
										</div>
									</#list>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>一番新しいアップロード</span></div>
							<div class="content">
								<div class="_pro-new-pic">
									<div class="pro-tab top fn-clear">
										<#list tradeNameTabs as name>
											<span class="t-${name_index+1} icon-tab_03 <#if name_index==0>icon-tab_06</#if>">${name}</span>
										</#list>
									</div>
									<div class="tab-pro-box fn-clear">
										<#list newGoodsList as goodsList>
											<div class="box fn-clear">
												<#list goodsList as goods>
													<div class="item">
														<div class="ibox">
															<div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a></div>
														</div>
														<p class="t"><a href="">${goods.title}</a></p>
														<p class="p">N品：${goods.price}円   </p><a href="javascript:saveGoods(${goods.id})" class="btn">購入商品</a>
													</div>
												</#list>
											</div>
										</#list>
									</div>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>ご利用案内</span></div>
							<div class="content">
								<div class="_handbook">
									<div class="alone-left"><img src="${img}/alone_04.png" alt="">
										${businessInfo.content}
									</div>
									
									<div class="alone-right"><img src="${img}/alone_05.png" alt="">
										${deliveryInfo.content}
									</div>
								</div>
							</div>
						</div>
					<div class="_brand top fn-clear">
						<div class="title"><span>ブランド專區 </span><a href="">もっと見る>></a></div>
						<div class="box"> <a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a><a href=""><img src="${img}/20163102123892.jpg" alt=""></a>
						</div>
					</div>
			</div>
			<div class="left top fn-clear">
				<#include "${component}/login.ftl" />
				<#include "${component}/ems.ftl" />
				<#include "${component}/category.ftl" />
				<#include "${component}/newest.ftl" />
			</div>
			<#include "${component}/footer.ftl" />
		</div>
	</body>
	<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
	<script src="${plugins}/common.js"></script>
		<script>
			function switchPic(_a,_b) {
				_a.each(function(ele,i) {
				var _this = $(this);
					if(_this.hasClass('active')) {
						var _index = _a.index(_this);
						var b_this = _b.eq(_index);
						b_this.addClass('active').siblings().removeClass('active');
					}
				})
			}
			
			function intv(_a,_b) {
				var c = _a.filter(function() {
					return $(this).hasClass('active');
				});
				if (_a.index(c) < _a.length - 1) {
					c.removeClass('active').next().addClass('active');
				} else {
					c.removeClass('active');
					_a.eq(0).addClass('active');
				}
				switchPic(_a,_b);
			}
			
			$(function() {
				var $b = $('._banner'),
					$b_l = $b.find('.box'),
					$b_l_i = $b_l.find('a'),
					$b_r = $b.find('.list'),
					$b_r_i = $b_r.find('span'),
					blank = 2500;//- 时间间隔
			
				var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
			
				$b_r_i.each(function() {
					var _this = $(this);
					_this.on('click',function(t) {
						clearInterval(t);
						_this.addClass(_this.hasClass('active') ? '' : 'active');
						_this.siblings().removeClass('active');
						switchPic($b_r_i,$b_l_i);
					});
					var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
				})
			});
		</script>
		<script>
			$(function() {
				var $t = $('.pro-tab'),
					$t_i = $t.find('span'),
					$c = $('.tab-pro-box'),
					$c_i = $c.find('.box');
				$t_i.each(function(index,element) {
					var _this = $(this);
					_this.on('mouseover',function(e) {
						$c.css({
							marginLeft: -778 * ($t_i.index(_this)) + 'px'
						});
						_this.addClass('icon-tab_06').siblings().removeClass('icon-tab_06');
					})
				})
			});
			
			$(function() {
				var $b = $('._banner'),
					$b_l = $b.find('.box'),
					$b_l_i = $b_l.find('a'),
					$b_r = $b.find('.list'),
					$b_r_i = $b_r.find('span'),
					blank = 2500;//- 时间间隔
			
				var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
			
				$b_r_i.each(function() {
					var _this = $(this);
					_this.on('click',function(t) {
						clearInterval(t);
						_this.addClass(_this.hasClass('active') ? '' : 'active');
						_this.siblings().removeClass('active');
						switchPic($b_r_i,$b_l_i);
					});
					var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
				})
			});
			
			function saveGoods(id){
				$.ajax({
					url:"/api/saveCart.action",
					data:{
						goodsId:id,
						count:1
					},
					success:function(){
						window.location.href="/cart.action";
					}
				});
			}
		</script>
</html>