<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/18
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登陆</title>
    <script type="text/javascript" src="../../resources/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../../resources/jquery.serialize.js"></script>
    <script src="../../resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <link href="../../resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../resources/bootstrap-3.3.7/css/now-ui-dashboard.css?v=1.0.1" rel="stylesheet"/>
    <link href="../../resources/bootstrap-3.3.7/demo/demo.css" rel="stylesheet"/>
    <style>
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .form-control {
            color: #FFFFFF;
        }
    </style>

</head>
<body class="panel-header panel-header-lg row">
<div class="col-md-4 card-body col-center-block" style="margin-top: 10%">
    <form class="login_form">
        <div class="input-group no-border">
            <input type="text" name="uLoginName" placeholder="请输入账号" class="form-control uloginName" />
        </div>
        <div class="input-group no-border">
            <input type="password" name="uLoginPassword" placeholder="请输入密码" class="form-control uloginPassword"/>
        </div>
    </form>
        <div class="col-center-block">
            <button type="button" class="btn btn-danger login_button col-center-block">登陆</button>
        </div>
</div>
</body>
<script>
    $(".login_button").click(function () {
        var  uloginName = $(".uloginName").val();
        var  uloginPassword = $(".uloginPassword").val();
        if (uloginName==null && uloginName =="" && uloginPassword==null&&uloginPassword==""){

        }else {
            login();
        }
    })
</script>
<script>
    function login() {
        var user = $(".login_form").serialize();
        var result = 0;
        $.post("/permitLogin.do",user).done(function (data) {
            result= data.result;
            if (result==0) {
                window.location.replace("/jsp/permit/permit.jsp");
            }else if (result==1) {
                alert("账号或密码不正确");
            }else if (result==2){
                alert("您已被加入黑名单，请联系管理员");
            }else if (result==3) {
                alert("系统繁忙");
            }
        }).fail(function (xhr, status) {
            alert(xhr.status);
            alert(status);
        });
    }
</script>
</html>
