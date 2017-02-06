<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="kopi6.min.css">
	</head>
	<body class="index">
		<div class="wrap-1000">
				<div class="_head fn-clear">
					<div class="htop fn-clear">
						<div class="scroll fn-left">
							<marquee direction="left" behavior="scroll" scrollamount="3">${website.topScrollText}</marquee>
						</div>
						<div class="txt fn-right icon-index_02">${website.topFixText}</div>
					</div>
					<div class="mid fn-clear"><a href="" class="logo"><img src="${website.logoUrl}" alt=""></a>
							<div class="_search">
								<input type="text" class="key"><a href="" class="submit">檢索</a>
							</div>
						<div class="cart fn-clear"><a href=""><img src="../img/index_06.png" alt=""></a><a href=""><img src="../img/index_08.png" alt=""></a></div>
					</div>
					<div class="author">
						<p align="center"><span>店長：${website.manager}&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><img src="../img/letter.png" alt=""><span>:</span><a href="">${website.email}</a>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 	<strong><span style="color:#e53333"> 營業時間：${website.businessHour}&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 注文受付：24小时受付</span></strong></p>
					</div>
						<div class="_nav"><a href="">ホーム</a><span></span><a href="">会社概要</a><span></span><a href="">注文方法</a><span></span><a href="">最新情報</a><span></span><a href="">重要事项</a><span></span><a href="">商品一覧</a><span></span><a href="">割引情报</a><span></span><a href="">FAQ</a></div>
				</div>
				<div class="_banner fn-clear">
					<div class="box"><a href="" class="active"><img src="../img/201638175611.jpg" alt=""></a><a href=""><img src="../img/201638175220.jpg" alt=""></a><a href=""><img src="../img/201638175892.jpg" alt=""></a></div>
					<div class="list fn-right"><span class="active"><img src="../img/201638175611.jpg" alt=""></span><span><img src="../img/201638175220.jpg" alt=""></span><span><img src="../img/201638175892.jpg" alt=""></span></div>
				</div>
					<script>
						function switchPic(_a,_b) {
							_a.each(function(ele,i) {
							var _this = $(this);
								if(_this.hasClass('active')) {
									var _index = _a.index(_this);
									var b_this = _b.eq(_index);
									b_this.addClass('active').siblings().removeClass('active');
								}
							})
						}
						
						function intv(_a,_b) {
							var c = _a.filter(function() {
								return $(this).hasClass('active');
							});
							if (_a.index(c) < _a.length - 1) {
								c.removeClass('active').next().addClass('active');
							} else {
								c.removeClass('active');
								_a.eq(0).addClass('active');
							}
							switchPic(_a,_b);
						}
						
						$(function() {
							var $b = $('._banner'),
								$b_l = $b.find('.box'),
								$b_l_i = $b_l.find('a'),
								$b_r = $b.find('.list'),
								$b_r_i = $b_r.find('span'),
								blank = 2500;//- 时间间隔
						
							var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
						
							$b_r_i.each(function() {
								var _this = $(this);
								_this.on('click',function(t) {
									clearInterval(t);
									_this.addClass(_this.hasClass('active') ? '' : 'active');
									_this.siblings().removeClass('active');
									switchPic($b_r_i,$b_l_i);
								});
								var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
							})
						});
					</script>
				<div class="_search-list border fn-clear">ブランド:
					<select class="brands">
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;分類：&nbsp;
					<select class="type">
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
						<option value="">選択します</option>
					</select>&nbsp;価格:&nbsp;
					<input type="text" value="0" class="price p1">&nbsp;-&nbsp;
					<input type="text" value="88000" class="price p2">
					<input type="button" value="检索" class="search-btn btn">
				</div>
			<div class="right top fn-clear">
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>一番新しいアップロード</span></div>
							<div class="content">
								<div class="box border _pro-new-txt fn-clear">
									<ul>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
										<li><i></i><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-292</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>売り上げランキング</span></div>
							<div class="content">
								<div class="_pro-sell fn-clear js-scroll-h">
									<div class="scroll-auto fn-clear">
										<div class="scroll1 fn-clear">
											<#list scrollGoods as good>
												<div class="item"><span>1</span>
													<div class="ibox">
														<div class="img"><a href=""><img src="${good.logoUrl}" alt=""></a></div>
													</div>
													<p class="t"><a href="">${good.title}</a></p>
													<p class="p">N品：${good.price}円 </p>
												</div>
											</#list>
										</div>
										<div class="scroll2 fn-clear"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>人気商品</span></div>
							<div class="content">
								<div class="_pro-hot fn-clear">
									<#list hotGoods as good>
										<div class="item">
											<div class="ibox">
												<div class="img"><a href=""><img src="${good.logoUrl}" alt=""></a></div>
											</div>
											<p class="t"><a href="">${good.title}</a></p>
											<p class="p">N品：${good.price}円   </p><a class="btn">購入商品</a>
										</div>
									</#list>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>一番新しいアップロード</span></div>
							<div class="content">
								<div class="_pro-new-pic">
									<div class="pro-tab top fn-clear"><span class="t-1 icon-tab_03 icon-tab_06">スーパーコピー時計</span><span class="t-2 icon-tab_03">スーパーコピーバッグ</span><span class="t-3 icon-tab_03">スーパーコピー財布</span><span class="t-4 icon-tab_03">その他商品</span></div>
									<div class="tab-pro-box fn-clear">
												<div class="box fn-clear">
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
												</div>
												<div class="box fn-clear">
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
												</div>
												<div class="box fn-clear">
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
												</div>
												<div class="box fn-clear">
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
																<div class="item">
																	<div class="ibox">
																		<div class="img"><a href=""><img src="../img/201651413453270101.jpg" alt=""></a></div>
																	</div>
																	<p class="t"><a href="">ブレゲ マリーン レプリカ ラージデイト 5817ST/12/5V8</a></p>
																	<p class="p">N品：23500円   </p><a class="btn">購入商品</a>
																</div>
												</div>
									</div>
								</div>
							</div>
						</div>
						<div class="_widget fn-clear">
							<div class="title"><i class="icon-index_31"></i><span>ご利用案内</span></div>
							<div class="content">
								<div class="_handbook">
									<div class="alone-left"><img src="../img/alone_04.png" alt="">
										<div class="cont"><span class="red">※ご注文</span>
											<p>営業時間9:00～24:00 ご注文受付、24時間受け付けております。 メールご注文は9:00～24:00の受け付けとなっております。</p><span class="green">※お問い合わせ</span>
											<p>ホームページ.メールのお問い合わせは、24時間受け付けております。 サーバメンテナンス等でお休みを頂く場合や、年末年始等の長期休暇の際にはサイト上にてご案内させて頂きます。</p><span class="green">返品について</span>
											<p>お客様の都合による商品の返品/交換、キャンセル等は承っておりません。お届けした商品に破損や品違いがございましたら、商品到着後3日以内にご連絡ください。</p><span class="green">受注発注について</span>
											<p>「受注発注」表記の仕様は、ご決済完了後にお取り寄せする商品です。在庫状況により5日から最大2週間程度お時間を頂く場合がございます。予め納期をご確認の上、ご購入いただきますようお願いいたします。</p>
										</div>
									</div>
									<div class="alone-right"><img src="../img/alone_05.png" alt="">
										<div class="cont">
											<p>ご注文いただいた商品は、ご決済完了後に発送手配を開始いたします。在庫のある商品は約1-2週間でのお届けとなります。配送状況、配送エリアによってさらにお時間がかかる場合があります。</p><span class="red">お支払い方法について</span>
											<p>1 銀行振り込み ご注文完了後に弊社より在庫の有無をメールにてお知らせいたします。メールをお受け取り頂いた後に、指定の口座に代金を振り込んでいただきます。弊社でご入金を確認後、発送手配をいたします。 </p>
											<p>2 送料は日本全国一律送料无料です。</p>
											<p>3 振込手数料振込手数料は、お振込み時にご確認下さい。振込手数料はお客様のご負担となりますのでご了承下さい。 </p>
											<p>4 商品発送手配完了後、E-mailにて配送日のご連絡をさせていただきます。</p>
											<p>※ ご注文が集中した場合や、土日祝日・弊社休業日による連休がある場合、弊社倉庫における棚卸し時期及びその前後の時期には、納品までに通常より長い時間がかかることがあります。予めご了承ください。</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					<div class="_brand top fn-clear">
						<div class="title"><span>ブランド專區 </span><a href="">もっと見る>></a></div>
						<div class="box"> <a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a><a href=""><img src="../img/20163102123892.jpg" alt=""></a>
						</div>
					</div>
			</div>
			<div class="left top fn-clear">
					<div class="_login border">
						<div class="title">会员登录を新入会員登録されていた</div>
						<div class="login-1">
							<ul class="login-1">
								<li><span>電子メール:</span>
									<input type="text" class="ipt mail">
								</li>
								<li><span>パスワード：</span>
									<input type="password" class="ipt password">
								</li>
								<li><span>画像認証：</span>
									<input type="text" class="validate"><img src="../img/validate.jpg" alt="" class="vali-img">
								</li>
								<li><a href="javascript:login()"><img src="../img/index_35.png" alt=""></a><a href="javascript:reg()"><img src="../img/index_38.png" alt=""></a></li>
								<li><a href="javascript:forget()"><img src="../img/index_43.png" alt=""></a></li>
							</ul>
							<ul class="login-2">
								<li><em class="user">xiongdiao</em></li>
								<li><a href="javascript:info()"><img src="../img/index_36.png" alt=""></a><a href="javascript:loginout()"><img src="../img/index_37.png" alt=""></a></li>
							</ul>
						</div>
					</div>
					<div class="_ems border">
						<div class="title"><img src="../img/index_49.png" alt=""></div>
						<div data-height="198" class="demo js-scroll-v">
							<ul class="demo1 js-scroll1">
								<#list orders as order>
									<li class="item"><a href="">•${order.deliveryName}&nbsp;番号：${order.emsNo}</a></li>
								</#list>
							</ul>
							<ul class="demo2 js-scroll2"></ul>
						</div>
					</div>
					<div class="_side-nav">
						<div class="title"><img src="../img/index_52.png" alt=""></div>
						
						<#list categorys as category>
							<div class="subtitle icon-index_57"><a href="">${category.title}</a></div>
					  		<ul>
						  		<#list category.items as item>
								  	<li class="item"><span><i></i></span><a>${item.title}</a>
							  			<ul class="the-box">
								  			<#list item.subItems as subItem>
												<li><span><i></i></span><a href="">${subItem.title}</a></li>
								  			</#list>
										</ul>
								  	</li>
						  		</#list>
						  	</ul>
						</#list>
					</div>
					<div class="_pro-new border">
						<div class="title"><img src="../img/index_64.png" alt=""></div>
						<div data-height="485" class="demo js-scroll-v">
							<ul class="demo1 js-scroll1">
												<li class="item">
													<div class="new-ibox">
														<div class="new-img"><a href=""><img src="../img/201612111295520101.jpg" alt=""></a></div>
													</div>
													<ul>
														<li><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-290</a></li>
														<li>N品：27800円</li>
													</ul>
												</li>
												<li class="item">
													<div class="new-ibox">
														<div class="new-img"><a href=""><img src="../img/201612111295520101.jpg" alt=""></a></div>
													</div>
													<ul>
														<li><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-290</a></li>
														<li>N品：27800円</li>
													</ul>
												</li>
												<li class="item">
													<div class="new-ibox">
														<div class="new-img"><a href=""><img src="../img/201612111295520101.jpg" alt=""></a></div>
													</div>
													<ul>
														<li><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-290</a></li>
														<li>N品：27800円</li>
													</ul>
												</li>
												<li class="item">
													<div class="new-ibox">
														<div class="new-img"><a href=""><img src="../img/201612111295520101.jpg" alt=""></a></div>
													</div>
													<ul>
														<li><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-290</a></li>
														<li>N品：27800円</li>
													</ul>
												</li>
												<li class="item">
													<div class="new-ibox">
														<div class="new-img"><a href=""><img src="../img/201612111295520101.jpg" alt=""></a></div>
													</div>
													<ul>
														<li><a href="">モンクレール☆MONCLER ダウンジャケット レディース moncler-290</a></li>
														<li>N品：27800円</li>
													</ul>
												</li>
							</ul>
							<ul class="demo2 js-scroll2"></ul>
						</div>
					</div>
			</div>
				<div class="_footer fn-clear">
						<div class="_nav"><a href="">ホーム</a><span></span><a href="">会社概要</a><span></span><a href="">注文方法</a><span></span><a href="">最新情報</a><span></span><a href="">重要事项</a><span></span><a href="">商品一覧</a><span></span><a href="">割引情报</a><span></span><a href="">FAQ</a></div>
					<div class="box">
						<p>
							 
							注文受付連絡先：<a href="">kopi6jp@yeah.net </a>|店長：藤原 香子|営業時間：09：00～24：00(24时间受付中 ) <br>当HPに掲載されている画像・テキストなどの無断複製、無断転載を禁じます。
						</p>
					</div>
					<div class="code">
						<p>网站流量统计系统</p>
					</div>
				</div>
		</div>
	</body>
	<script src="../plugins/jquery-1.12.4/jquery.1.12.4.min.js"></script>
		<script>
			function switchPic(_a,_b) {
				_a.each(function(ele,i) {
				var _this = $(this);
					if(_this.hasClass('active')) {
						var _index = _a.index(_this);
						var b_this = _b.eq(_index);
						b_this.addClass('active').siblings().removeClass('active');
					}
				})
			}
			
			function intv(_a,_b) {
				var c = _a.filter(function() {
					return $(this).hasClass('active');
				});
				if (_a.index(c) < _a.length - 1) {
					c.removeClass('active').next().addClass('active');
				} else {
					c.removeClass('active');
					_a.eq(0).addClass('active');
				}
				switchPic(_a,_b);
			}
			
			$(function() {
				var $b = $('._banner'),
					$b_l = $b.find('.box'),
					$b_l_i = $b_l.find('a'),
					$b_r = $b.find('.list'),
					$b_r_i = $b_r.find('span'),
					blank = 2500;//- 时间间隔
			
				var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
			
				$b_r_i.each(function() {
					var _this = $(this);
					_this.on('click',function(t) {
						clearInterval(t);
						_this.addClass(_this.hasClass('active') ? '' : 'active');
						_this.siblings().removeClass('active');
						switchPic($b_r_i,$b_l_i);
					});
					var t = setInterval(function() {intv($b_r_i,$b_l_i)},blank);
				})
			});
		</script>
		<script>
			function scroll_v(_a,_b) {
				var a = _a.get(0),
					b = _b.get(0);
				a.scrollTop++;
				var r_h = b.offsetHeight - parseInt(_b.css('paddingTop')) * 2;
				if (a.scrollTop >= r_h) {
					a.scrollTop=0;   
				}
			}
			
			$(function() {
				var $d = $('.js-scroll-v');
				$d.each(function(index,element) {
					var _this = $(this),
						$d_f = _this.find('.js-scroll1'),
						$d_s = _this.find('.js-scroll2'),
						$d_f_i = $d_f.find('.item'),
						d_h = _this.height();
			
					_this.css({
						"height":d_h,
						"overflow":"hidden"
					});	
					$d_f_i.clone().appendTo($d_s);
					var t = setInterval(function() {
						scroll_v(_this,$d_f);
					},50);
					_this.on({
						mouseover:function() {
							clearInterval(t);
						},
						mouseout:function() {
							t = setInterval(function() {
								scroll_v(_this,$d_f);
							},50);
						}
					});
				})
			});
		</script>
		<script>
			function scroll_h(_a,_b) {
				var b = _b.get(0),
					l = parseInt(_a.css('marginLeft'));
				var r_w = b.offsetWidth - parseInt(_b.css('paddingLeft')) * 2;
				console.log(Math.abs(l),r_w);
				_a.css('marginLeft',l-1);
				if (Math.abs(l) >= r_w) {
					_a.css('marginLeft',0);
				}
			}
			
			$(function() {
				var $d = $('.js-scroll-h');
				$d.each(function(index,element) {
					var _this = $(this),
						$d_b = _this.find('.scroll-auto'),
						$d_f = _this.find('.scroll1'),
						$d_s = _this.find('.scroll2'),
						$d_f_i = $d_f.find('.item'),
						d_w = _this.width();
			
					$d_f_i.clone().appendTo($d_s);
					var t = setInterval(function() {
						scroll_h($d_b,$d_f);
					},50);
					_this.on({
						mouseover:function() {
							clearInterval(t);
						},
						mouseout:function() {
							t = setInterval(function() {
								scroll_h($d_b,$d_f);
							},50);
						}
					});
				});
			});
		</script>
		<script>
			$(function() {
				var $t = $('.pro-tab'),
					$t_i = $t.find('span'),
					$c = $('.tab-pro-box'),
					$c_i = $c.find('.box');
				$t_i.each(function(index,element) {
					var _this = $(this);
					_this.on('mouseover',function(e) {
						$c.css({
							marginLeft: -778 * ($t_i.index(_this)) + 'px'
						});
						_this.addClass('icon-tab_06').siblings().removeClass('icon-tab_06');
					})
				})
			});
		</script>
</html>