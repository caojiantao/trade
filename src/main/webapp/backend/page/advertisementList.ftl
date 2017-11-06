<#import "/backend/layout/default.ftl" as default>

<@default.layout>
<div class="editDiv">
  <form id="ff" enctype="multipart/form-data">
    <input type="text" name="id" value="${pageInfo.id}" hidden>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">排序：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="order" name="order" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">广告链接：</div>
      <div style="display:inline-block;width:calc(100% - 100px);"><input class="easyui-textbox" id="url" name="url" style="width:100%;"></div>
    </div>
    <div style="margin-bottom:15px;">
      <div style="display:inline-block;width:80px;">广告图片：</div>
      <div style="display:inline-block;width:calc(100% - 100px);">
        <input type="text" name="logoRealUrl" hidden="hidden">
        <img id="logoImg" style="width:277px;height:68px;">
        <input id="selector" name="file" type="file" />
	  </div>
    </div>
    <div>
      <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeEditDiv()">取消</a>
      <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitForm()">保存</a>
    </div>
  </form>
</div>

<div class="listDiv">
  <div id="result"></div>
</div>

<script type="text/javascript">
	$(function(){
		getData();
      $('.editDiv').css('display', 'none');
	});

	function getData(){
		$("#result").datagrid({
			url : '/backend/listAllAds.action',
			method : 'get',
			loadMsg : "数据装载中....",
			striped : true,
			singleSelect : true,
			rownumbers: true,
			fitColumns: true,
			columns:[[
				{field:'order',title:'排序',width:200},
				{field:'url',title:'广告链接',width:200},
				{field:'operator', title:'操作',width:200,
					formatter: function(value,row,index){
						return '<a href="javascript:void(0)" onclick="editObj(' + row.id + ')">修改</a>'
							+ '&nbsp;&nbsp;|&nbsp;&nbsp;'
							+ '<a href="javascript:void(0)" onclick="removeObj(' + row.id + ')">删除</a>';
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

	function editObj(id){
		$.ajax({
			url: "/backend/getAdById.action",
			dataType: "json",
			data: {
				'id':id
			},
			success: function (obj) {
				if(obj){
					$("input[name='id']").val(obj.id);
                  	$("input[name='logoRealUrl']").val(obj.logoRealUrl);
					$("#order").textbox('setValue', obj.order);
					$("#url").textbox('setValue', obj.url);

					// 防止logoUrl为null导致图片路径不变
					$("#logoImg").attr("src", obj.logoUrl ? obj.logoUrl : '');

					openEditDiv();
				}
			},
			error: function (data) {
				$.messager.alert("警告", "网络异常！");
			}
		});
	}

	function removeObj(id){
		if(confirm('确定要删除这条记录吗？')){
			$.ajax({
				url: "/backend/removeAdById.action",
				// dataType: "json",
				data: {
					'id':id
				},
				success: function (line) {
					if(line > 0){
						$("#result").datagrid("reload");
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

	function submitForm(){
		var url;
		if($("input[name='id']").val() === ""){
			url = "/backend/saveAd.action";
		} else {
			url = "/backend/updateAd.action";
		}

      	$('#ff').ajaxSubmit({
        url: url,
        type: 'post',
        dataType: 'json',
        success: function (result) {
          closeEditDiv();
          getData();
          $.messager.alert('提示', result.message);
        },
        error: function () {
          $.messager.alert('提示', '服务器异常');
        }
      });
	}

	function openEditDiv(){
		$(".editDiv").css("display", "block");
		$(".listDiv").css("display", "none");
	}

	function closeEditDiv(){
		$(".editDiv").css("display", "none");
		$(".listDiv").css("display", "block");
		clearForm();

		// 防止clear后预览图片失效
		previewImg();
	}

	function clearForm(){
		$('#ff').form("clear");
		$("#logoImg").attr("src", "");
	}
</script>

</@default.layout>