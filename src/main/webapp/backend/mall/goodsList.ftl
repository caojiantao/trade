<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<div class="editDiv">
  <form id="ff" enctype="multipart/form-data">
    <input type="text" id="id" name="id" hidden>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">产品类型：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <select id="tradeId" name="tradeId">
          <option value="0" selected>---请选择---</option>
        </select>
        <select id="brandId" name="brandId">
          <option value="0" selected>---请选择---</option>
        </select>
        <select id="productId" name="productId">
          <option value="0" selected>---请选择---</option>
        </select>
      </div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">商品编号：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="number" name="number" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">商品名称：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="name" name="name" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">标题：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="title" name="title" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">价格：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="price" name="price" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">推荐：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <label><input type="checkbox" id="scroll" name="scroll"/>滚动展示</label>
        <label><input type="checkbox" id="hot" name="hot"/>人气商品</label>
      </div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">关键字：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="keyword" name="keyword" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">描述：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="description" name="description" style="width:100%;"
                                                                         data-options="multiline:true"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">logo：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <input type="text" id="logoRealUrl" name="logoRealUrl" hidden="hidden">
        <img id="logoImg" style="width:277px;height:68px;">
        <input id="selector" name="file" type="file"/>
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
      width: '100%',
      autoHeightMode: true,
      uploadJson: '/files.action',
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
      url: '/backend/getAllGoods.action',
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
        {field: 'productName', title: '产品类型', width: 200},
        {field: 'name', title: '商品名称', width: 200},
        {field: 'updateTime', title: '更新时间', width: 200},
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
        handler: function () {
          openEditDiv()
        }
      }]
    });
  }

  function editObj(id) {
    $.ajax({
      type: "get",
      url: "getGoodsById.action",
      dataType: "json",
      data: {
        'id': id
      },
      success: function (goods) {
        if (goods) {
          $('#id').val(goods.id);
          $('#tradeId').val(goods.tradeId);
          // 手动触发select change事件，从而初始化二级菜单“品牌行业”
          $('#tradeId').change();
          $('#brandId').val(goods.brandId);
          // 手动触发select change事件，从而初始化三级菜单“产品类型”
          $('#brandId').change();
          $('#productId').val(goods.productId);
          $('#name').textbox('setValue', goods.name);
          $('#title').textbox('setValue', goods.title);

          $('#number').textbox('setValue', goods.number);
          $('#price').textbox('setValue', goods.price);
          $('#scroll')[0].checked = goods.scroll;
          $('#hot')[0].checked = goods.hot;

          $('#keyword').textbox('setValue', goods.keyword);
          $('#description').textbox('setValue', goods.description);
          // 防止logoUrl为null导致图片路径不变
          $("#logoImg").attr("src", goods.logoUrl ? goods.logoUrl : "");
          $("input[name='logoRealUrl']").val(goods.logoRealUrl);
          editor.html(goods.content ? goods.content : "");

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
        url: "deleteGoodsById.action",
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

    $('#id').val('');
    $('#name').textbox('setValue', '');
    $('#title').textbox('setValue', '');
    $('#number').textbox('setValue', '');
    $('#price').textbox('setValue', '');
    $('#scroll')[0].checked = false;
    $('#hot')[0].checked = false;
    $('#keyword').textbox('setValue', '');
    $('#description').textbox('setValue', '');
    // 防止logoUrl为null导致图片路径不变
    $("#logoImg").removeAttr('src');
    $("input[name='logoRealUrl']").val('');
    // 防止clear后预览图片失效
    previewImg();
    editor.html("");
  }

  function openEditDiv() {
    $(".editDiv").css("display", "block");
    $(".listDiv").css("display", "none");
  }

  function submitForm() {
    window.editor.sync();
    var $form = $('#ff'),
            $id = $('#id');
    // 当id字段严格为空字符串时执行保存操作
    var url = ($id.val() === '') ? '/backend/addGoods.action' : '/backend/updateGoods.action';

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