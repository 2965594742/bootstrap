<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-17
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">

    <div class="row">
        <form>
            <fieldset class="col-md-6 col-md-offset-3">
                <legend>登录</legend>

                <div class="form-group">
                    <label class="control-label" for="username">用户名：</label>
                    <input class="form-control" type="text" name="username" id="username" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="pwd">密码：</label>
                    <input class="form-control" type="password" name="pwd" id="pwd" />
                </div>

                <br>
                <div class="row">
                    <input type="button" value="登录" class="btn btn-primary col-md-3 col-md-offset-2" id="denglv"/>
                    <input type="button" value="注册" class="btn btn-warning col-md-3 col-md-offset-2" id="zhuce"/>
                </div>


            </fieldset>
        </form>
    </div>

</div>
<script type="text/javascript">
    $("#denglv").click(function () {
        var user = {
            'username':$("#username").val(),
            'pwd':$("#pwd").val()
        }
        $.post("login.action",user,function (data) {
            if(data=="登录失败"){
                alert(data);
                return;
            }
            window.location = "User.jsp"
        },"text");
    });

</script>
</body>
</html>
