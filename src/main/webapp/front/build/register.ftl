<!DOCTYPE html>
<html>
<head>
  <title>注册页</title>
  <meta http-equiv="Content-Type" content="charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" type="text/css" href="${css}/kopi6.min.css">
  <script type="text/javascript" src="${base}/plugins/jquery-easyui-1.5.3/jquery.min.js"></script>
</head>
<body class="signIn">
<div class="wrap-1000">
  <#include "${component}/header.ftl"/>
  <div class="_signIn">
    <fieldset>
      <legend>ユーザ登録</legend>
      <div>
        <ul>
          <li><span>電子メール：</span>
            <input id="register-email" type="text" class="ipt">
          </li>
          <li><span>パスワード：</span>
            <input id="register-password" type="password" class="ipt">
          </li>
          <li><span> </span>
            <input type="button" value="登録" onclick="register()">
          </li>
        </ul>
      </div>
    </fieldset>
  </div>
  <#include "${component}/footer.ftl"/>
</div>
</body>
<script src="${plugins}/common.js"></script>
<script src="${base}/js/regex.js"></script>
<script>
  function register() {
    var $email = $('#register-email'),
            $password = $('#register-password');
    if (!isEmail($email.val())) {
      alert("请输入正确的邮箱地址!");
      return;
    }
    if ($password.val() === "") {
      alert("密码不能为空！");
      return;
    }

    $.ajax({
      url: "/api/register.action",
      type: 'post',
      data: {
        email: $email.val(),
        password: $password.val()
      },
      dataType: 'json',
      success: function (result) {
        if (result.code === 200) {
            // 注册成功立即跳转用户页面
            $.ajax({
                url: "/api/login.action",
                data: {
                    email: $email.val(),
                    password: $password.val()
                },
                success: function (user) {
                    if (user == null) {
                        alert("密码错误！");
                    }
                    window.location.href = "/user.action";
                }
            });
        } else {
            alert(result.message);
        }
      }
    });
  }
</script>
</html>