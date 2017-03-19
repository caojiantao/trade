<!DOCTYPE html>
<html>
	<head>
		<title>填写个人信息</title>
		<meta http-equiv="Content-Type" content="charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
	</head>
	<body class="info">
		<div class="wrap-1000">
			<#include "${component}/header.ftl"/>
				<div class="_info fn-clear">
					<div class="menu fn-left">
						<ul>
							<li class="d t">メニュー</li>
							<li class="d current"><a>ユーザ情報 >></a></li>
							<li><a>ユーザオーダー</a></li>
						</ul>
					</div>
					<div class="content i-h fn-left">
						<table>
							<tbody>
								<tr>
									<td class="td_top">お名前</td>
									<td class="td_right"> 
										<input name="name" type="text" title="空ではありません">
									</td>
								</tr>
								<tr>
									<td class="td_top">フリガナ</td>
									<td class="td_right"> 
										<input name="nickName" name="nickName" type="text" title="空ではありません">
									</td>
								</tr>
								<tr>
									<td class="td_top">郵便番号</td>
									<td class="td_right">
										<input name="postCode" type="text" title="空ではありません">
									</td>
								</tr>
								<tr>
									<td class="td_top">都道府県</td>
									<td class="td_right"> 
										<select name="county">
											<#list counties as county>
												<option value=${county.key}>
													${county.value}
												</option>
											</#list>
										</select>
									</td>
								</tr>
								<tr>
									<td class="td_top">詳しい住所</td>
									<td class="td_right"> 
										<input name="address" type="text" title="空ではありません">
									</td>
								</tr>
								<tr>
									<td class="td_top">電話番号</td>
									<td class="td_right"> 
										<input name="phoneNumber" type="text" title="空ではありません">
									</td>
								</tr>
								<tr>
									<td class="td_top">メールアドレス</td>
									<td class="td_right"> 
										<input name="email" type="text" title="空ではありません" value="xiongdiao" readonly>
									</td>
								</tr>
								<tr>
									<td class="td_top">お客様掲示板</td>
									<td class="td_right"> 
										<textarea name="remark" cols="20" rows="2"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<p>
							<input type="submit" value="修正情報" onclick="updateUser()">
						</p>
					</div>
				</div>
			<#include "${component}/footer.ftl"/>
		</div>
	</body>
	<script src="${plugins}/jquery-1.12.4/jquery.1.12.4.min.js"></script>
	<script src="${plugins}/common.js"></script>
	<script>
		$(function(){
			initUserInfo();
		});
	
		function initUserInfo(){
			<#if user != null>
				$("input[name='name']").val("${user.name}");
				$("input[name='nickName']").val("${user.nickName}");
				$("input[name='postCode']").val("${user.postCode}");
				$("select[name='county']").val("${user.county}");
				$("input[name='address']").val("${user.address}");
				$("input[name='phoneNumber']").val("${user.phoneNumber}");
				$("input[name='email']").val("${user.email}");
				$("textarea[name='remark']").val("${user.remark}");
			</#if>
		}
		
		function updateUser(){
			$.ajax({
				url:"/api/updateUser.action",
				data:{
					name: $("input[name='name']").val(),
					nickName: $("input[name='nickName']").val(),
					postCode: $("input[name='postCode']").val(),
					county: $("select[name='county']").val(),
					address: $("input[name='address']").val(),
					phoneNumber: $("input[name='phoneNumber']").val(),
					email: $("input[name='email']").val(),
					remark: $("textarea[name='remark']").val()
				},
				success:function(status){
					if(status > 0){
						alert("更新成功！！");
					}
				}
			});
		}
	</script>
</html>