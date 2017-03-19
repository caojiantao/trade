<!DOCTYPE html>
<html>
	<head>
		<title>${brand.title}</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
	</head>
	<body class="about">
		<div class="wrap-1000">
			<#include "${component}/header.ftl"/>
			<div class="right top fn-clear">
				<div class="_widget fn-clear">
					<div class="title">
						<i class="icon-index_31"></i>
						<#include "${component}/navigation.ftl"/>
					</div>
				</div>
				<div class="_widget fn-clear">
					<div class="content">
						<div class="_pro-search fn-clear">
							
						</div>
					</div>
				</div>
				<div class="_paging clearfix">
					<span>その結果<span id="cur_page"></span>, 合計ページ <span id="goods_total"></span></span>
				</div>
			</div>
			<div class="left top fn-clear">
				<#include "${component}/login.ftl" />
				<#include "${component}/ems.ftl" />
				<#include "${component}/category.ftl" />
				<#include "${component}/newest.ftl" />
			</div>
			<#include "${component}/footer.ftl" />
		</div>
	</body>
	<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
	<script src="${plugins}/common.js"></script>
	<script src="${plugins}/paging.js"></script>
	<script>
		$(function(){
			var apiUrl = "/api/getNewGoods.action";
			if(${tradeId}!=undefined){
				apiUrl += "?type=1&id=${tradeId}";
			}
			$.setPages({
				url: apiUrl,
				limit: 1,
				className: '_paging',
				onClick: function(index, pageNum, total, rows) {
					initGoodsEle(index, pageNum, total, rows);
				},
				maxPage: 8,
				edge: 1,
				showSide: true
			});
		});
		
		function initGoodsEle(index, pageNum, total, rows){
			// 循环添加商品
			var itemsDiv = $("._pro-search.fn-clear");
			itemsDiv.empty();
			for(var i in rows){
				var goods = rows[i];
				var ele = "<div class=\"item\">" +
							"<div class=\"ibox\">" +
								"<div class=\"img\"><a href=\"/goods.action?id=" + goods.id + "\"><img src=\"" + goods.logoUrl + "\" alt=\"\"></a></div>" +
							"</div>" +
							"<p class=\"t\"><a href=\"\">" + goods.title + "</a></p>" +
							"<p class=\"p\">N品：" + goods.price + "円   </p><a href=\"javascript:saveGoods(" + goods.id + ")\" class=\"btn\">購入商品</a>" +
						   "</div>";
				itemsDiv.append(ele);
			}
			// 改变左侧当前页码和总数提示
			$("#cur_page").text(index + "/" + pageNum);
			$("#goods_total").text(total);
		}
		
		function saveGoods(id){
			$.ajax({
				url:"/api/saveCart.action",
				data:{
					goodsId:id,
					count:1
				},
				success:function(){
					window.location.href="/cart.action";
				}
			});
		}
	</script>
</html>