<div class="page-black">
    <#assign requestUrl = "${request.requestUri}"/>

    <span>total:${page.total}</span>

    <#if page.page?? && page.page gt 4>
        <a href="${requestUrl}?page=1&rows=${page.rows!10}">1</a>
        <a href="#">...</a>
    </#if>

    <#if page.page?? && page.page == 4>
        <a href="${requestUrl}?page=1&rows=${page.rows!10}">1</a>
    </#if>

    <#if page.page?? && page.page gte 3>
        <a href="${requestUrl}?page=${((page.page)!3)-2}&rows=${page.rows!10}">${((page.page)!3)-2}</a>
        <a href="${requestUrl}?page=${((page.page)!3)-1}&rows=${page.rows!10}">${((page.page)!3)-1}</a>
    </#if>

    <#if page.page?? && page.page == 2>
        <a href="${requestUrl}?page=1&rows=${page.rows!10}">1</a>
    </#if>

    <a class="current" href="${requestUrl}?page=${((page.page)!3)}&rows=${page.rows!10}">${((page.page)!3)}</a>

    <#if page.page?? && page.page lte (page.count-1)>
        <a href="${requestUrl}?page=${((page.page)!3)+1}&rows=${page.rows!10}">${((page.page)!3)+1}</a>
    </#if>

    <#if page.page?? && page.page lte (page.count-2)>
        <a href="${requestUrl}?page=${((page.page)!3)+2}&rows=${page.rows!10}">${((page.page)!3)+2}</a>
    </#if>

    <#if page.page?? && page.count gt page.page+3>
        <a href="#">...</a>
    </#if>

    <#if page.page?? && page.count gt page.page+2>
        <a href="${requestUrl}?page=${((page.count)!6)}&rows=${page.rows!10}">${((page.count)!5)}</a>
    </#if>
</div>

