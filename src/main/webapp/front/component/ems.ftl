<div class="title"><img src="${img}/index_49.png" alt=""></div>
<div class="_ems border">
    <div data-height="198" class="demo js-scroll-v">
        <ul class="demo1 js-scroll1">
		<#list emsList as ems>
            <li class="item" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                <a href="/ems.action?id=${ems.id}">•${ems.name}&nbsp;番号：${ems.emsNo}</a>
            </li>
		</#list>
        </ul>
        <ul class="demo2 js-scroll2"></ul>
    </div>
</div>