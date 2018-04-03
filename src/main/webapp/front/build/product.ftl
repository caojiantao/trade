<!DOCTYPE html>
<html>
	<head>
		<title>${product.title}</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
		<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
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
					<div class="content">
						<div class="_brand fn-clear">
							<#--<div class="img fn-left"><img src="${product.logoUrl}" alt=""></div>-->
							<div class="txt fn-right" style="width: auto;">
								${product.content}
							</div>
						</div>
					</div>
				</div>
				<div class="_pro-type">
					<p>產品分類</p>
					<ul>
						<#list maps as map>
							<li><a href="/product.action?id=${map.key}">${map.value}</a></li>
						</#list>
					</ul>
				</div>
				<div class="_search-list brand border fn-clear">ブランド:
					<select class="brands">
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;分類：&nbsp;
					<select class="type">
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;価格:&nbsp;
					<input type="text" value="0" class="price p1">&nbsp;-&nbsp;
					<input type="text" value="88000" class="price p2">
					<input type="button" value="检索" class="search-btn btn">
				</div>
				<div class="_widget fn-clear">
					<div class="content">
						<div class="_pro-search fn-clear" id="js-goods">
							
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
				<#-- <#include "${component}/lastest.ftl" /> -->
			</div>
			<#include "${component}/footer.ftl" />
		</div>
	</body>
	<script src="${plugins}/common.js"></script>
	<script src="${plugins}/paging.js"></script>
	<script>
		$(function(){
          	var apiUrl = "/api/listLatestGoods.action";
			$.setPages({
				url: apiUrl,
			  	data: {
                  limit: 24,
                  productId: ${product.id}
				},
				className: '_paging',
				onClick: function(index, pageNum, total, rows) {
					initGoodsEle(index, pageNum, total, rows, "#js-goods");
				},
				maxPage: 8,
				edge: 1,
				showSide: true
			});
		});
	</script>
</html>