<#import "/backend/layout/default.ftl" as default>

<@default.layout>
  <div class="editDiv">
    <form id="ff">
      <input type="text" name="id" value="${pageInfo.id}" hidden>
      <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">标题：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="title" name="title" style="width:100%;"></div>
      </div>
      <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">关键字：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="keyword" name="keyword" style="width:100%;"></div>
      </div>
      <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">描述：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="description" name="description" data-options="multiline:true" style="width:100%;height:60px;"></div>
      </div>
      <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">内容：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><textarea id="content" name="content"></textarea></div>
      </div>
      <div>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="cancel()">取消</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitForm()">保存</a>
      </div>
    </form>
  </div>

  <div class="listDiv">
    <div id="result"></div>
  </div>

<script type="text/javascript">
  KindEditor.ready(function (K) {
    window.editor = K.create('#content', {
      width : '100%',
      autoHeightMode: true,
      afterCreate: function () {
        this.loadPlugin('autoheight');
      }
    });
  });

  $(function(){
    getData();
    $('.editDiv').css('display', 'none');
  });

  function getData(){
    $("#result").datagrid({
      url : '/backend/getAllArticles.action',
      method : 'get',
      loadMsg : "数据装载中....",
      pagination : true,
      striped : true,
      pageSize : 20,
      pageList : [10, 20, 50],
      singleSelect : true,
      rownumbers: true,
      columns:[[
        {field:'title',title:'标题',width:200},
        {field:'updateTime',title:'更新时间',width:200},
        {field:'operator', title:'操作',width:200,
          formatter: function(value,row,index){
            return '<a href="javascript:void(0)" onclick="editObj(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;'
                    + '<a href="javascript:void(0)" onclick="deleteObj(' + row.id + ')">删除</a>';
          }
        }
      ]],
      toolbar: [{
        text: "增加",
        iconCls: "icon-add",
        handler: function(){openEditDiv()}
      }]
    });
  }

  function openEditDiv(){
    $(".editDiv").css("display", "block");
    $(".listDiv").css("display", "none");
  }

  function editObj(id){
    $.ajax({
      type: "get",
      url: "/backend/getArticle.action",
      dataType: "json",
      data: {
        'id':id
      },
      success: function (pageInfo) {
        if(pageInfo){
          $("input[name='id']").val(pageInfo.id);
          $('#title').textbox('setValue', pageInfo.title);
          $('#keyword').textbox('setValue', pageInfo.keyword);
          $('#description').textbox('setValue', pageInfo.description);
          editor.html(pageInfo.content);

          $(".editDiv").css("display", "block");
          $(".listDiv").css("display", "none");
        }
      },
      error: function (data) {
        $.messager.alert("警告", "网络异常！");
      }
    });
  }

  function deleteObj(id){
    if(confirm('确定要删除这条记录吗？')){
      $.ajax({
        type: "post",
        url: "/backend/deleteArticle.action",
        // dataType: "json",
        data: {
          'id':id
        },
        success: function (status) {
          if(status){
            getData();
          }else{
            $.messager.alert("提示", "删除失败!");
          }
        },
        error: function (data) {
          $.messager.alert("警告", "网络异常！");
        }
      });
    }
  }

  function cancel(){
    $(".editDiv").css("display", "none");
    $(".listDiv").css("display", "block");
    $('#ff').form('clear');
    window.editor.html('');
  }

  function submitForm() {
    // 提交钱刷新editor到area（基于KindEditor）
    editor.sync();

    var $form = $('#ff'),
            $id = $('[name="id"]');
    // 当id字段严格为空字符串时执行保存操作
    var url = ($id.val() === '') ? '/backend/addArticle.action' : '/backend/updateArticle.action';

    $form.ajaxSubmit({
      url: url,
      type: 'post',
      dataType: 'json',
      success: function (result) {
        cancel();
        getData();
        $.messager.alert('提示', result.message);
      },
      error: function () {
        $.messager.alert('提示', '服务器异常');
      }
    });
  }
</script>
</@default.layout>