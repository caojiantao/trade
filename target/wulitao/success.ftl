<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${base}/plugins/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<title>hello</title>
<style type="text/css">
    @keyframes anim-loading{
        0%{
            transform: scale(1) rotate(0deg);
        }
        50%{
            transform: scale(.7) rotate(720deg);
        }
        100%{
            transform: scale(1) rotate(0deg);
        }
    }

    *{
        margin: 0;
        padding: 0;
        font-family: Microsoft YaHei;
        font-size: 16px;
    }

    html{
        width: 100%;
        height: 100%;
    }
    body{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .loading{
        margin: 20px;
        border-radius: 50%;
        border: 30px solid red;
        border-left-color: transparent;
        border-right-color: transparent;
        animation: anim-loading 1.2s infinite;
    }
</style>
</head>
<body>
    <div class="loading"></div>
    <div>
        操作成功，还有<span class="leave_second"></span>秒返回，你也可以<a href="${returnUrl}">点击这里</a>立即返回！
    </div>

    <script type="text/javascript">
        var leaveSecond = 3;

        $(function(){
            $(".leave_second").html(leaveSecond);
            setInterval("calLeaveSecond()", 1000);
        });

        function calLeaveSecond(){
            leaveSecond -= 1;
            if (leaveSecond == 0) {
                window.location.href = "${returnUrl}";
            }
            $(".leave_second").html(leaveSecond);
        }
    </script>
</body>
</html>