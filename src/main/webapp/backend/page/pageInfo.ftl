<#import "/backend/layout/default.ftl" as default>

<@default.layout>
  <form action="updatePageInfo.action" method="post">
    <input type="text" name="id" hidden="hidden" value="${pageInfo.id}">
    <input type="text" name="type" hidden="hidden" value="${pageInfo.type}">
    <div class="form-row">
      <div class="left">标题：</div>
      <div class="right"><input class="easyui-textbox" name="title" value="${pageInfo.title}" style="width:100%;"></div>
    </div>
    <div class="form-row">
      <div class="left">关键字：</div>
      <div class="right"><input class="easyui-textbox" name="keyword" value="${pageInfo.keyword}" style="width:100%;"></div>
    </div>
    <div class="form-row">
      <div class="left">描述：</div>
      <div class="right"><input class="easyui-textbox" name="description" value="${pageInfo.description}" data-options="multiline:true" style="width:100%;height:60px;"></div>
    </div>
    <div>
      <div style="display:inline-block;width:80px;">描述：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><textarea name="content">${pageInfo.content}</textarea></div>
    </div>
  </form>

<script type="text/javascript">
  var editor;
  KindEditor.ready(function(K) {
    editor = K.create('[name="content"]', {
      width : '100%',
      autoHeightMode : true,
      cssData: 'body {font-size:14px;}',
      afterCreate : function() {
          this.loadPlugin('autoheight');
      }
    });
  });
</script>
</@default.layout>