<!DOCTYPE html>
<html>
	<head>
		<title>FAQ</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
		<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
	</head>
	<body class="about">
		<div class="wrap-1000">
			<#include "${component}/header.ftl">
			<div class="right top fn-clear">
				<div class="_widget fn-clear">
					<div class="title"><i class="icon-index_31"></i><span>当面の位置：ホーム &gt;&gt; FAQ</span></div>
					<div class="content">
						<div class="_FAQ fn-clear">
							<div class="form fn-clear">
								<ul>
									<li><span>ご質問がある場合はこちらでお問い合わせする事も可能です。</span></li>
									<li>
										email:
										<input type="text" name="mail" id="mail" title="メールボックスを入力してください"><span class="red">*</span>
									</li>
									<li>名&nbsp;&nbsp;前:
										<input type="text" name="name" id="name"><span class="red">*</span>
									</li>
									<li>
										<textarea name="contents" cols="20" rows="2" id="contents" class="area"></textarea><span class="red">*</span>
									</li>
									<li>
										<div class="mun">
											<ul>
												<li>数字认证：</li>
												<li> 
													<input type="text" name="validate" id="validate">
												</li>
												<li><img src="${img}/validate.png" alt=""></li>
											</ul>
										</div>
									</li>
									<li class="submit">
										<input type="image" name="image" id="image" src="${img}/kf_06.png">
									</li>
								</ul>
							</div>
							<div class="img"><img src="${img}/hf_03.png" alt=""></div>
						</div>
					</div>
				</div>
			</div>
			<div class="left fn-clear">
				<#-- <#include "${component}/login.ftl" /> -->
				<#-- <#include "${component}/ems.ftl" /> -->
				<#include "${component}/category.ftl" />
				<#include "${component}/introduction.ftl" />
				<#-- <#include "${component}/lastest.ftl" /> -->
			</div>
			<#include "${component}/footer.ftl" />
		</div>
		<#include "${component}/sidebar.ftl" />
	</body>
	<script src="${plugins}/common.js"></script>
</html>