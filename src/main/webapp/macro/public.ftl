<#macro menu children>
  <#list children as m>
  <#if m.children?size gt 0>
    <li state='closed'>
      <span>${m.name}</span>
      <ul>
        <@menu children = m.children/>
      </ul>
    </li>
  <#else>
    <li><a href="javascript:addTab('${m.name}', '${m.href}')">${m.name}</a></li>
  </#if>
  </#list>
</#macro>