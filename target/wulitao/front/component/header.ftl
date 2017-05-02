<div class="_head fn-clear">
	<div class="htop fn-clear">
		<div class="scroll fn-left">
			<marquee direction="left" behavior="scroll" scrollamount="3">${website.topScrollText}</marquee>
		</div>
		<#-- <div class="txt fn-right icon-index_02">${website.topFixText}</div> -->
		<div class="txt fn-right icon-index_02"> 
			<div class="fn-clear">
				<div class="fn-right">
					<#if user==null>
						<a href="javascript:toLogin();" class="mr-5">登录</a>
						<a href="/register.action" class="mr-5">注册</a>
					<#else>
						<a href="/user.action" class="mr-5">${user.email}</a>
						<a href="javascript:logout();" class="mr-5">退出</a>
					</#if>
				</div>
				<script>
					var toLogin = function() {
						var _pop = document.querySelector('._pop');
						_pop.style.display = "block";
					};
				</script>
			</div>
		</div>
	</div>
	<div class="mid fn-clear"><a href="/" class="logo"><img src="${website.logoUrl}" alt=""></a>
		<div class="_search">
			<input id="keyword" type="text" class="key">
			<a href="javascript:search()" class="submit">檢索</a>
		</div>
		<#-- <div class="cart fn-clear"><a href="/cart.action"><img src="${img}/index_06.png" alt=""></a><a href=""><img src="${img}/index_08.png" alt=""></a></div> -->
	</div>
	<div class="author">
		<p align="center">
			<span>店長：${website.manager}&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>
			<i class="icon-mail_small"></i><span class="ml-2">:</span><a href="">${website.email}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong><span style="color:#e53333"> 營業時間：${website.businessHour}&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 注文受付：24小时受付</span></strong>
		</p>
	</div>
	<div class="_nav">
		<a href="/">ホーム</a>
		<a href="/pageInfo.action?type=0">会社概要</a>
		<a href="/pageInfo.action?type=1">注文方法</a>
		<a href="">最新情報</a>
		<a href="/pageInfo.action?type=2">重要事项</a>
		<a href="/list.action">商品一覧</a>
		<a href="/pageInfo.action?type=3">割引情报</a>
		<a href="/faq.action">FAQ</a>
	</div>
	
	<#-- 登陆弹出框 -->
	<div class="pop-box">
		<div style="display:none" class="_pop">
			<div class="_login-box">
				<div class="_pop-close icon-close js-pop-close"></div>
				<div class="_login border">
					<div class="title">会员登录を新入会員登録されていた</div>
					<div class="login-1">
						<ul class="login-1">
							<li><span>電子メール:</span>
								<input id="email" type="text" class="ipt mail">
							</li>
							<li><span>パスワード：</span>
								<input id="password" type="password" class="ipt password">
							</li>
							<li><span>画像認証：</span>
								<input type="text" class="validate"><img src="${img}/validate.jpg" alt="" class="vali-img">
							</li>
							<li class="ta-c"><a href="javascript:login()"><img src="${img}/index_35.png" alt=""></a><a href="javascript:reg()"><img src="${img}/index_38.png" alt=""></a></li>
							<li class="ta-c"><a href="javascript:forget()"><img src="${img}/index_43.png" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script>
			(function(win, doc, con, undefined) {
				var pop_c = document.querySelector('.js-pop-close');
				pop_c.addEventListener('click', function() {
					var target = document.querySelector('._pop');
					target.style.display = "none";
				});
			}(window, document, console));
		</script>
	</div>
</div>

<script>
	function search(){
		var keyword = $("#keyword").val();
		window.location.href = "/list.action?keyword=" + keyword;
	}

	function login(){
		$.ajax({
			url:"/api/login.action",
			data:{
				email:$("#email").val(),
				password:$("#password").val()
			},
			success:function(user){
				if(user != null && user != ""){
					window.location.href="/user.action";
				} else {
					alert("密码错误！");
				}
			}
		});
	}
	
	function logout(){
		$.ajax({
			url:"/api/logout.action",
			data:{
				email:$("em.user").val()
			},
			success:function(user){
				window.location.reload();
			}
		});
	}
</script>