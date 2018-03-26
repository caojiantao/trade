<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<div class="editDiv">
  <form id="ff" enctype="multipart/form-data">
    <input type="text" id="id" name="id" hidden>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">产品类型：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <select id="tradeId" name="tradeId">
          <option value="0">---请选择---</option>
        </select>
        <select id="brandId" name="brandId">
          <option value="0">---请选择---</option>
        </select>
      </div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">类型名称：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="name" name="name" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">排序：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="order" name="order" style="width:100%;" prompt="请输入数字，数值越大，越靠前"></div>
    </div>
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
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="description" name="description" style="width:100%;" data-options="multiline:true"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">logo：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <input type="text" id="logoRealUrl" name="logoRealUrl" hidden="hidden">
        <img id="logoImg" style="width:277px;height:68px;">
        <input id="selector" name="file" type="file" />
      </div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">内容：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><textarea id="content" name="content">${pageInfo.content}</textarea></div>
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

  $(function () {
    getData();
    $('.editDiv').css('display', 'none');
  });

  function getData() {
    $("#result").datagrid({
      url: '/backend/getAllProducts.action',
      method: 'get',
      loadMsg: "数据装载中....",
      pagination: true,
      striped: true,
      pageSize: 20,
      pageList: [10, 20, 50],
      singleSelect: true,
      rownumbers: true,
      columns: [[
        {field: 'tradeName', title: '商品行业', width: 200},
        {field: 'brandName', title: '品牌类型', width: 200},
        {field: 'name', title: '产品类型', width: 200},
        {field: 'order', title: '排序', width: 200},
        {
          field: 'operator', title: '操作', width: 200,
          formatter: function (value, row, index) {
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

  function editObj(id) {
    $.ajax({
      type: "get",
      url: "/backend/getProductById.action",
      dataType: "json",
      data: {
        'id': id
      },
      success: function (product) {
        if (product) {
          $('#id').val(product.id);
          $('#tradeId').val(product.tradeId);
          // 手动触发select change事件，从而初始化二级菜单“品牌行业”
          $('#tradeId').change();
          $('#brandId').val(product.brandId);
          $('#name').textbox('setValue', product.name);
          $('#order').textbox('setValue', product.order);
          $('#title').textbox('setValue', product.title);
          $('#keyword').textbox('setValue', product.keyword);
          $('#description').textbox('setValue', product.description);
          // 防止logoUrl为null导致图片路径不变
          $("#logoImg").attr("src", product.logoUrl ? product.logoUrl : "");
          $("input[name='logoRealUrl']").val(product.logoRealUrl);
          editor.html(product.content?product.content:"");

          $(".editDiv").css("display", "block");
          $(".listDiv").css("display", "none");
        }
      },
      error: function (data) {
        $.messager.alert("警告", "网络异常！");
      }
    });
  }

  function deleteObj(id) {
    if (confirm('确定要删除这条记录吗？')) {
      $.ajax({
        type: "post",
        url: "/backend/deleteProductById.action",
        // dataType: "json",
        data: {
          'id': id
        },
        success: function (status) {
          if (status) {
            getData();
          } else {
            $.messager.alert("提示", "删除失败!");
          }
        },
        error: function (data) {
          $.messager.alert("警告", "网络异常！");
        }
      });
    }
  }

  function cancel() {
    $(".editDiv").css("display", "none");
    $(".listDiv").css("display", "block");
    $('#ff').form('clear');
    $("#logoImg").attr("src", "");
    // 防止clear后预览图片失效
    previewImg();
    editor.html("");
  }

  function submitForm() {
    window.editor.sync();
    var $form = $('#ff'),
            $id = $('#id');
    // 当id字段严格为空字符串时执行保存操作
    var url = ($id.val() === '') ? '/backend/addProduct.action' : '/backend/updateProduct.action';

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