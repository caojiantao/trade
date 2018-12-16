<#import "/backend/layout/default.ftl" as default>
<@default.layout>

<div class="editDiv">
    <form id="ff">
        <input type="text" name="id" hidden>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">邮箱：</div>
            <div style="display:inline-block;width:calc(50% - 100px);">
                <input class="easyui-textbox" id="email" name="email" style="width:100%;">
            </div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">昵称：</div>
            <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="nickName" name="nickName" style="width:50%;"></div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">内容：</div>
            <div style="display:inline-block;width:calc(100% - 100px);">
                <input class="easyui-textbox" data-options="multiline:true" id="content" name="content" style="width:50%;">
            </div>
        </div>
        <div style="margin-bottom:15px;">
            <div style="display:inline-block;width:80px;">回复：</div>
            <div style="display:inline-block;width:calc(100% - 100px);">
                <input class="easyui-textbox" data-options="multiline:true" id="reply" name="reply" style="width:50%;">
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
    $(function () {
        getData();
        $('.editDiv').css('display', 'none');
    });

    function getData() {
        $("#result").datagrid({
            url: '/backend/listAllFeedbacks.action',
            method: 'get',
            loadMsg: "数据装载中....",
            pagination: true,
            striped: true,
            pageSize: 20,
            pageList: [10, 20, 50],
            singleSelect: true,
            rownumbers: true,
            columns: [[
                {field: 'email', title: '邮箱', width: 150},
                {field: 'nickName', title: '昵称', width: 150},
                {field: 'content', title: '内容', width: 600},
                {field: 'reply', title: '回复', width: 600},
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
            $("#email").textbox('setValue', data.email);
            $("#nickName").textbox('setValue', data.nickName);
            $("#content").textbox('setValue', data.content);
            $("#reply").textbox('setValue', data.reply);
        }
        $(".editDiv").css("display", "block");
        $(".listDiv").css("display", "none");
    }

    function editTrade(id) {
        $.ajax({
            type: "get",
            url: "/backend/queryFeedbackById.action",
            dataType: "json",
            data: {
                'id': id
            },
            success: function (result) {
                if (result) {
                    openEditDiv(result);
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
                url: "/backend/deleteFeedbackById.action",
                data: {
                    'id': id
                },
                success: function (result) {
                    result = eval("("+ result +")")
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
        var $form = $('#ff'), $id = $('[name="id"]');
        // 当id字段严格为空字符串时执行保存操作
        var url = ($id.val() === '') ? '/backend/saveFeedback.action' : '/backend/updateFeedback.action';

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