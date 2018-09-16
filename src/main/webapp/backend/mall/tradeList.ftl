<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<div class="editDiv">
    <form id="ff">
        <input type="text" name="id" hidden>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">类型名：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="name"
                                                                               name="name" style="width:100%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">排序：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="order"
                                                                               name="order" style="width:100%;"
                                                                               prompt="请输入数字，数值越大，越靠前"></div>
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
    $(function () {
        getData();
        $('.editDiv').css('display', 'none');
    });

    function getData() {
        $("#result").datagrid({
            url: '/backend/getAllTrades.action',
            method: 'get',
            loadMsg: "数据装载中....",
            pagination: true,
            striped: true,
            pageSize: 20,
            pageList: [10, 20, 50],
            singleSelect: true,
            rownumbers: true,
            columns: [[
                {field: 'name', title: '类型', width: 200},
                {field: 'order', title: '排序', width: 200},
                {
                    field: 'operator', title: '操作', width: 200,
                    formatter: function (value, row, index) {
                        return '<a href="javascript:void(0)" onclick="editTrade(' + row.id + ')">修改</a>' + '&nbsp;&nbsp;|&nbsp;&nbsp;'
                                + '<a href="javascript:void(0)" onclick="deleteTrade(' + row.id + ')">删除</a>';
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

    function openEditDiv(data) {
        if (data) {
            $("input[name='id']").val(data.id);
            $("#name").textbox('setValue', data.name);
            $("#order").textbox('setValue', data.order);
        }
        $(".editDiv").css("display", "block");
        $(".listDiv").css("display", "none");
    }

    function editTrade(id) {
        $.ajax({
            type: "get",
            url: "/backend/getTradeById.action",
            dataType: "json",
            data: {
                'id': id
            },
            success: function (trade) {
                if (trade) {
                    openEditDiv(trade);
                } else {
                    $.messager.alert("警告", "网络异常！");
                }
            },
            error: function (data) {
                $.messager.alert("警告", "网络异常！");
            }
        });
    }

    function deleteTrade(id) {
        if (confirm('确定要删除这条记录吗？')) {
            $.ajax({
                type: "post",
                url: "/backend/deleteTradeById.action",
                data: {
                    'id': id
                },
                success: function (status) {
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
    }

    function submitForm() {
        var $form = $('#ff'),
                $id = $('[name="id"]');
        // 当id字段严格为空字符串时执行保存操作
        var url = ($id.val() === '') ? '/backend/addTrade.action' : '/backend/updateTrade.action';

        $form.ajaxSubmit({
            url: url,
            type: 'post',
            dataType: 'json',
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