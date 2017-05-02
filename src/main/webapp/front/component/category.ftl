<div class="_side-nav">
	<div class="title"><i class="icon-item"></i><span>商品一览</span></div>
	<#list categorys as category>
		<div class="subtitle">
			<i class="icon-class"></i>
			<a href="/list.action?tradeId=${category.id}">${category.title}</a>
		</div>
  		<ul>
	  		<#list category.items as item>
			  	<li class="item">
			  		<a href="/brand.action?id=${item.id}">${item.title}</a>
		  			<ul class="the-box">
			  			<#list item.subItems as subItem>
							<li><a href="/product.action?id=${subItem.id}">${subItem.title}</a></li>
			  			</#list>
					</ul>
			  	</li>
	  		</#list>
	  	</ul>
	</#list>
</div>