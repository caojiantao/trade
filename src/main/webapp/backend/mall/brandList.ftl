<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<div class="editDiv">
    <form id="ff" enctype="multipart/form-data">
        <input type="text" id="id" name="id" hidden>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">行业名称：</div>
            <div style="display:inline-block;width:calc(100% - 100px);">
                <select id="tradeId" name="tradeId">
                    <option value="0">---请选择---</option>
                </select>
            </div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">品牌名称：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="name"
                                                                               name="name" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">推荐：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><label><input type="checkbox" id="show"
                                                                                      name="show" checked/>首页展示</label>
            </div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">排序：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="order"
                                                                               name="order" style="width:100%;"
                                                                               prompt="请输入数字，数值越大，越靠前"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">标题：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="title"
                                                                               name="title" style="width:100%;"></div>
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
            url: '/backend/getAllBrands.action',
            method: 'get',
            loadMsg: "数据装载中....",
            pagination: true,
            striped: true,
            pageSize: 20,
            pageList: [10, 20, 50],
            singleSelect: true,
            rownumbers: true,
            columns: [[
                {field: 'tradeName', title: '行业类型', width: 200},
                {field: 'name', title: '品牌类型', width: 200},
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
                handler: function () {
                    openEditDiv()
                }
            }]
        });
    }

    function openEditDiv() {
        $(".editDiv").css("display", "block");
        $(".listDiv").css("display", "none");
    }

    function editObj(id) {
        $.ajax({
            type: "get",
            url: "/backend/getBrandById.action",
            dataType: "json",
            data: {
                'id': id
            },
            success: function (brand) {
                if (brand) {
                    $("#id").val(brand.id);
                    $("#tradeId").val(brand.tradeId);
                    $("#name").textbox('setValue', brand.name);
                    $("#show")[0].checked = brand.show;
                    $("#order").textbox('setValue', brand.order);
                    $("#title").textbox('setValue', brand.title);
                    $("#keyword").textbox('setValue', brand.keyword);
                    $("#description").textbox('setValue', brand.description);
                    // 防止logoUrl为null导致图片路径不变
                    $("#logoImg").attr("src", brand.logoUrl ? brand.logoUrl : "");
                    $("#logoRealUrl").val(brand.logoRealUrl);
                    window.editor.html(brand.content ? brand.content : "");

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
                url: "/backend/deleteBrandById.action",
                dataType: "json",
                data: {
                    'id': id
                },
                success: function (result) {
                    if (result.code === 200) {
                        getData();
                    } else {
                        $.messager.alert("提示", result.message);
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
    }

    function submitForm() {
        window.editor.sync();
        var $form = $('#ff'),
                $id = $('#id');
        // 当id字段严格为空字符串时执行保存操作
        var url = ($id.val() === '') ? '/backend/addBrand.action' : '/backend/updateBrand.action';
        $form.ajaxSubmit({
            url: url,
            type: 'post',
            dataType: 'json',
            beforeSubmit: function (datas) {
                var tradeIdItem = getItem(datas, 'name', 'tradeId');
                if (!tradeIdItem || tradeIdItem.value === '0') {
                    $.messager.alert('提示', '行业名称不能为空');
                    return false;
                }
                return true;
            },
            success: function (result) {
                if (result.code === 200) {
                    cancel();
                    getData();
                } else {
                    $.messager.alert("提示", result.message);
                }
            },
            error: function () {
                $.messager.alert('提示', '服务器异常');
            }
        });
    }
</script>
</@default.layout>