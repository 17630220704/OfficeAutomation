<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/1
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<table border="1px" style="width: 50%">
    <caption>修改密码</caption>
    <thead>
    <tr>
        <td>用户名：</td>
        <td><input type="text" class="form-control" style="width: 70%; Float:left" id="uId">
            <input type="text" class="form-control" style="width: 70%; Float:left" id="uloginName"></td>
    </tr>
    <tr>
        <td>原密码：</td>
        <td><input type="text" class="form-control" style="width: 70%; Float:left" id="uloginPassword"></td>
    </tr>
    <tr>
        <td>新密码：</td>
        <td><input type="text" class="form-control" style="width: 70%; Float:left" id="uloginPassword1"></td>
    </tr>
    <tr>
        <td>确认密码：</td>
        <td><input type="text" class="form-control" style="width: 70%; Float:left" id="uloginPassword2"></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="button" value="保存" id="btnadd"></td>
    </tr>
    </thead>
</table>

</body>
</html>
<script>
    function query2() {
        var persoId = $("#persoId").val();
        $.ajax({
            url: "/Tbuser",
            data: {
                "persoId": persoId,
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#uId").val(data[0].u_id);
                $("#uloginName").val(data[0].u_loginName);
            }
        })
    }

    $(function () {
        $("#btnadd").click(function () {
            alert($("#uloginPassword1").val())
            var uId = $("#uId").val();
            var uloginPassword = $("#uloginPassword1").val();
            $.ajax({
                url: "/TbuserUP",
                type: "post",
                data: {
                    "uId": uId,
                    "uloginPassword": uloginPassword,
                },
                dataType: "json",
                success: function (data) {
                    alert("aaa");
                }
            }).always(function () {
                $(query2());
            });
        });
    });
    $(query2());
</script>