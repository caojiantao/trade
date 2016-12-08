/**
 * 当选择图片文件的能够预览，选择文件id指定为"#selector"
 * 预览控件id指定为"#logoImg"
 */
$(function() {
	$("#selector").change(function() {
		var $file = $(this);
		var fileObj = $file[0];
		var windowURL = window.URL || window.webkitURL;
		var dataURL;
		var $img = $("#logoImg");
		 
		if(fileObj && fileObj.files && fileObj.files[0]){
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			$img.attr('src',dataURL);
		}else{
			dataURL = $file.val();
			var imgObj = document.getElementById("logoImg");
			// 两个坑:
			// 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
			// 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
			imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		}
	});
	// 强制刷新图片内容
	var logoUrl = $("#logoImg").attr("src");
	$("#logoImg").attr("src", logoUrl + "?t=" + Math.random());
});