<div class="_side-nav">
	<div class="title"><img src="${img}/index_52.png" alt=""></div>
	<#list categorys as category>
		<div class="subtitle icon-index_57"><a href="/list.action?id=${category.id}">${category.title}</a></div>
  		<ul>
	  		<#list category.items as item>
			  	<li class="item"><span><i></i></span><a href="/brand.action?id=${item.id}">${item.title}</a>
		  			<ul class="the-box">
			  			<#list item.subItems as subItem>
							<li><span><i></i></span><a href="/product.action?id=${subItem.id}">${subItem.title}</a></li>
			  			</#list>
					</ul>
			  	</li>
	  		</#list>
	  	</ul>
	</#list>
</div>