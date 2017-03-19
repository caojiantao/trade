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
			<li>
				<a href="javascript:login()"><img src="${img}/index_35.png" alt=""></a>
				<a href="/register.action"><img src="${img}/index_38.png" alt=""></a>
			</li>
			<li>
				<a href="javascript:forget()"><img src="${img}/index_43.png" alt=""></a>
			</li>
		</ul>
		<ul class="login-2">
			<li><em class="user">xiongdiao</em></li>
			<li>
				<a href="javascript:info()"><img src="${img}/index_36.png" alt=""></a>
				<a href="javascript:loginout()"><img src="${img}/index_37.png" alt=""></a>
			</li>
		</ul>
	</div>
</div>

<script>
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
</script>