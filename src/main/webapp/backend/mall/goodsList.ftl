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
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="number"
                                                                               name="number" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">商品名称：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="name"
                                                                               name="name" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">标题：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="title"
                                                                               name="title" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">价格：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="price"
                                                                               name="price" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">推荐：</div>
            <div style="display:inline-block;width:calc(100% - 100px);">
                <label><input type="checkbox" id="scroll" name="scroll"/>滚动展示</label>
                <label><input type="checkbox" id="hot" name="hot"/>人气商品</label>
            <#--<label><input type="checkbox" id="recommend" name="recommend"/>店长推荐</label>-->
            </div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">关键字：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="keyword"
                                                                               name="keyword" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">描述：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="description"
                                                                               name="description" style="width:100%;"
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
            <div style="display:inline-block;width:calc(100% - 100px);"><textarea id="content"
                                                                                  name="content">${pageInfo.content}</textarea>
            </div>
        </div>
        <div>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="cancel()">取消</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'"
               onclick="submitForm()">保存</a>
        </div>
    </form>
</div>

<div class="listDiv">
    <div style="margin: 10px 0;">
        <label>
            商品名称
            <input id="goodsName" type="text" class="easyui-textbox">
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
               onclick="doSearch()">搜索</a>
        </label>

    </div>

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

    function doSearch() {
        $("#result").datagrid('load', {'name': $('#goodsName').val()});
    }

    function getData() {
        $("#result").datagrid({
            url: '/backend/getAllGoods.action',
            method: 'get',
            loadMsg: "数据装载中....",
            pagination: true,
            striped: true,
            pageSize: 20,
            pageList: [10, 20, 50],
            singleSelect: false,
            rownumbers: true,
            columns: [[
                {field: 'ck', checkbox: true},
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
            }, {
                text: "删除",
                iconCls: "icon-remove",
                handler: function () {
                    batchDelete();
                }
            }]
        });
    }

    function batchDelete() {
      if(confirm("确定删除这些商品吗？")){
          var rows = $('#result').datagrid('getSelections');
          if(rows && rows.length > 0){
              var ids = [];
              rows.forEach(item => ids.push(item.id));
              $.ajax({
                  type: "post",
                  url: "batchDeleteGoods.action",
                  dataType: "json",
                  data: {
                      'ids': ids.join(',')
                  },
                  success: function (result) {
                      if (result.code === 200) {
                          getData();
                      } else {
                          alert(result.message);
                      }
                  }
              });
          }
      }
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
                    // $('#recommend')[0].checked = goods.recommend;

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
                alert("网络异常！");
            }
        });
    }

    function deleteObj(id) {
        if (confirm('确定要删除这条记录吗？')) {
            $.ajax({
                type: "post",
                url: "deleteGoodsById.action",
                dataType: "json",
                data: {
                    'id': id
                },
                success: function (result) {
                    if (result.code === 200) {
                        getData();
                    } else {
                        alert(result.message);
                    }
                },
                error: function (data) {
                    alert("网络异常！");
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
//        $('#recommend')[0].checked = false;
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
            beforeSubmit: function (datas) {
                var productIdItem = getItem(datas, 'name', 'productId');
                if (!productIdItem || productIdItem.value === '0') {
                    alert('产品类型不能为空');
                    return false;
                }
                return true;
            },
            success: function (result) {
                if (result.code === 200) {
                    cancel();
                    getData();
                } else {
                    alert(result.message);
                }
            },
            error: function () {
                alert('服务器异常');
            }
        });
    }
</script>
</@default.layout>