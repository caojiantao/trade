<span>当面の位置：
	<a href="/index.action">ホーム</a>&nbsp;&gt;&gt;&nbsp;
	<#list navs as nav>
		<#if nav_has_next>
			<a href="${nav.url}">${nav.name}</a>&nbsp;&gt;&gt;&nbsp;
		<#else>
			${nav.name}
		</#if>
	</#list>
</span>