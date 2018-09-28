<div class="_pro-new border">
	<div class="title"><img src="${img}/index_64.png" alt=""></div>
	<div data-height="485" class="demo js-scroll-v">
		<ul class="demo1 js-scroll1">
			<#list newGoods as goods>
				<li class="item">
					<div class="new-ibox">
						<div class="new-img"><a href="/goods.action?id=${goods.id?c}"><img src="${goods.logoUrl}" alt=""></a></div>
					</div>
					<ul>
						<li><a href="">${goods.title}</a></li>
						<li>N品：${goods.price}円</li>
					</ul>
				</li>
			</#list>
		</ul>
		<ul class="demo2 js-scroll2"></ul>
	</div>
</div>