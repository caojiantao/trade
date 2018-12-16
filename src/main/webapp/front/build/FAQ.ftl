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
										<input type="text" value="匿名ユーザー" name="name" id="name"><span class="red">*</span>
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
												<li><img id="valideImg" height="20px" width="90px" alt=""></li>
											</ul>
										</div>
									</li>
									<li class="submit">
										<input type="image" name="image" id="submit" src="${img}/kf_06.png">
									</li>
								</ul>
							</div>
							<div class="img"><img src="${img}/hf_03.png" alt=""></div>
						</div>
					</div>

				</div>
				<div class="online">
					<ul>
					</ul>
					<div class="page">
						<div class="num"><a href="javascript:;" class="prev">&lt;&lt; 次の</a><a class="current"></a><a href="javascript:;" class="next">次の &gt;&gt;</a></div>
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

	<script>
		$(function () {
            $("#valideImg").attr("src","/api/verification.action?t="+Math.random());
			toPage(1,10);
        })

		function toPage(page, rows) {
            $.ajax({
                url: "/feedback/queryFaqsPg.action",
                data:{
                    page: page,
                    rows : rows
                },
                success: function (result) {
                    if (result != "") {
                        result = eval("(" + result + ")")
                        if (result.code == 200) {
                            var online = $(".online").find("ul")
                            online.empty();
                            var feedList = result.data;
                            if (result.data.length > 0) {
                                for (var i = 0; i < feedList.length; i++) {
                                    online.append("<li class='onlineli_top'>" + feedList[i].nickName + " " + feedList[i].email + " </li>");
                                    online.append("<li>" + feedList[i].content + "</li>");
                                    online.append("<li class='onlineli_btm'><span>お返事：お客様:</span> " + (feedList[i].reply ? feedList[i].reply : '') + "</li>");
                                }
                                var total = result.attr.count;
                                var count = Math.floor(total / rows) + (total % rows == 0 ? 0 : 1);
                                $(".online").find(".prev").off("click");
                                $(".online").find(".next").off("click");
                                if (page > 1) {
                                    $(".online").find(".prev").on("click", function () {
                                        toPage(page - 1, rows)
                                    });
                                }
                                if (page < count) {
                                    $(".online").find(".next").on("click", function () {
                                        toPage(page + 1, rows)
                                    });
                                }
                                $(".online").find(".current").text(page);
                            } else {
                                $(".online").find(".page").css("display", "none")
                            }
                        }
                    }
                }
            });
        }

        $("#valideImg").click(function () {
            $("#valideImg").attr("src","/api/verification.action?t="+Math.random());
        })

		$("#submit").click(function () {
            $.ajax({
                url: "/feedback/saveFaq.action",
                data: {
					email: $("#mail").val(),
                    nickName : $("#name").val(),
                    content : $("#contents").val(),
                    verifyCode : $("#validate").val()
                },
                success: function (result) {
                    if(result != ""){
                        result = eval("("+result+")")
                        if(result.code != 200){
                            alert(result.message);
                            $("#valideImg").attr("src","/api/verification.action?t="+Math.random());
                        }else{
                            alert("成功!!");
                            window.location.reload();
                        }
					}
                }
            });
        });

	</script>
</html>