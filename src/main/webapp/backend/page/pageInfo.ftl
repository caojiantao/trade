<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<form id="ff">
    <input type="text" name="id" value="${pageInfo.id}" hidden>
    <input type="text" name="type" value="${pageInfo.type}" hidden>
    <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">标题：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" name="title"
                                                                           value="${pageInfo.title}"
                                                                           style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">关键字：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" name="keyword"
                                                                           value="${pageInfo.keyword}"
                                                                           style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">描述：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" name="description"
                                                                           value="${pageInfo.description}"
                                                                           data-options="multiline:true"
                                                                           style="width:100%;height:60px;"></div>
    </div>
    <div style="margin-bottom:15px;">
        <div style="display:inline-block;width:80px;">内容：</div>
        <div style="display:inline-block;width:calc(100% - 100px);"><textarea id="content"
                                                                              name="content">${pageInfo.content}</textarea>
        </div>
    </div>
    <div>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'"
           onclick="submitForm()">保存</a>
    </div>
</form>

<script type="text/javascript">
    $(function () {
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
    });

    function submitForm() {
        // 提交钱刷新editor到area（基于KindEditor）
        editor.sync();

        var $form = $('#ff'),
                $id = $('[name="id"]');
        // 当id字段严格为空字符串时执行保存操作
        var url = ($id.val() === '') ? '/backend/savePageInfo.action' : '/backend/updatePageInfo.action';

        $form.ajaxSubmit({
            url: url,
            type: 'post',
            dataType: 'json',
            success: function (result) {
                if (result.code === 200) {
                    // 如果是更新成功，隐藏id重新赋值
                    $id.val(result.data.id);
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