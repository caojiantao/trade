<!DOCTYPE html>
<html>
	<head>
		<title>${goods.title}</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
	</head>
	<body class="detail">
		<div class="wrap-1000">
			<#include "${component}/header.ftl">
			<div class="right top fn-clear">
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>当面の位置：ホーム &gt;&gt; スーパーコピー時計 &gt;&gt; カルティエ &gt;&gt; サントス</span></div>
							<div class="content">
								<div class="_pro-detail fn-clear">
									<div class="pro-logo">
										<div class="pro-ibox">
											<div class="pro-img"><img src="${goods.logoUrl}" alt=""></div>
										</div>
										<p> <a href="" class="prev"><img src="${img}/pro_18.png" alt=""></a><a href="" class="next"><img src="${img}/pro_15.png" alt=""></a></p>
										<div style="border:none;" class="txt"><span class="pro-info">${website.goodsDetailBottom}</span></div>
									</div>
									<div class="txt fn-clear">
										<h1>${goods.name}</h1>
										<table>
											<tbody>
												<tr>
													<td>商品型番:${goods.getNumber()}</td>
													<td>商品評価:<img src="${img}/pro_11.png" alt=""></td>
												</tr>
												<tr>
													<td>在庫状況:</td>
													<td>在庫あり</td>
												</tr>
												<tr>
													<td>販売価格: ${goods.price}円</td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div class="msg">
											<p>${website.goodsDetailRight}</p>
										</div>
										<table>
											<tbody>
												<tr>
													<td>
														 
														数 量：
														<select class="countSel">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
														</select>
													</td>
													<td>全国一律送料無料</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td><a href="javascript:saveGoods(${goods.id})"><img src="${img}/index_3_15.png" alt=""></a></td>
													<td><a href=""><img src="${img}/index_3_17.png" alt=""></a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					<div class="_box border fn-clear top">
						<div class="tab-title"><span class="icon-tab_06">商品詳細</span></div>
						<div class="tab-box">${goods.content}</div>
					</div>
					<div class="_box border fn-clear top">
						<div class="tab-title"><span class="icon-tab_06">注意事项</span></div>
						<div class="tab-box">${attention.content}</div>
					</div>
					<div class="_box border fn-clear top">
						<div class="tab-title"><span class="icon-tab_06">返品返金</span></div>
						<div class="tab-box">${award.content}</div>
					</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>相關產品</span></div>
							<div class="content">
								<div class="_pro-relate fn-clear">
										<div class="item">
											<div class="ibox">
												<div class="img"><a href=""><img src="${img}/201651413453270101.jpg" alt=""></a></div>
											</div>
											<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
											<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
										</div>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>ご利用案内</span></div>
							<div class="content">
								<div class="_handbook">
									<div class="alone-left"><img src="${img}/alone_04.png" alt="">
										${businessInfo.content}
									</div>
									
									<div class="alone-right"><img src="${img}/alone_05.png" alt="">
										${deliveryInfo.content}
									</div>
								</div>
							</div>
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
	<script>
		function saveGoods(id){
			$.ajax({
				url:"/api/saveCart.action",
				data:{
					goodsId:id,
					count:$(".countSel").val()
				},
				success:function(){
					window.location.href="/cart.action";
				}
			});
		}
	</script>
</html>