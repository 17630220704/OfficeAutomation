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
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../resources/js_lcy/layui-v2.4.5/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/js_lcy/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<table class="layui-table" style="width: 500px">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th style="width: 20%">昵称</th>
        <th style="width: 80%"><input type="text" class="form-control" style="width: 100%; Float:left;display: none"
                                      id="uId">
            <input type="text" class="form-control" disabled="disabled" style="width: 100%; Float:left" id="uloginName">
        </th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th>原始密码</th>
        <th><input type="text" class="form-control" style="width: 100%; Float:left;display: none" id="userpass">
            <input type="password" class="form-control" style="width: 100%; Float:left" id="uloginPassword"
                   onblur="password()"></th>
    </tr>
    <tr>
        <th>新密码</th>
        <th><input type="password" class="form-control" style="width: 100%; Float:left" id="uloginPassword1"></th>
    </tr>
    <tr>
        <th>确认密码</th>
        <th><input type="password" class="form-control" style="width: 100%; Float:left" id="uloginPassword2"
                   onblur="pass()"></th>
    </tr>
    <tr>
        <th></th>
        <th><input type="button" class="layui-btn layui-btn-normal" value="保存" id="btnadd"></th>
    </tr>
    </thead>
</table>
</body>
</html>
<script>
    function query2() {
        var persoId = ${userid};
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
                $("#userpass").val(data[0].u_loginPassword);
            }
        })
    }

    $("#btnadd").click(function () {
        if ($("#uloginPassword") == null || $("#uloginPassword").val() == '') {
            alert("原始密码为空")
        } else if ($("#uloginPassword1") == null || $("#uloginPassword1").val() == '') {
            alert("新密码为空")
        } else if ($("#uloginPassword2") == null || $("#uloginPassword2").val() == '') {
            alert("确认密码为空")
        } else {
            var uId = $("#uId").val();
            var uloginPassword = $("#uloginPassword1").val();
            alert("确定修改吗");
            $.ajax({
                url: "/TbuserUP",
                type: "post",
                data: {
                    "uId": uId,
                    "uloginPassword": uloginPassword,
                }
            }).always(function () {
                alert("修改成功");
               window.location.reload();
            });
        }
    });

    $(query2());

    function pass() {
        var a = $("#uloginPassword1").val();
        var b = $("#uloginPassword2").val();
        if (a != b || a == '' || b == '') {
            alert("错误");
            $("#btnadd").attr('disabled', true).addClass('layui-btn layui-btn-disabled');
        } else {
            $("#btnadd").removeAttr("disabled");
            $("#btnadd").removeClass('layui-btn layui-btn-disabled');
            $("#btnadd").addClass('layui-btn layui-btn-normal');
        }
    }

    function password() {
        var a = $("#userpass").val();
        var b = $("#uloginPassword").val();
        if (a != b || a == '' || b == '') {
            alert("原始密码错误");
            $("#btnadd").attr('disabled', true).addClass('layui-btn layui-btn-disabled');
        } else {
            $("#btnadd").removeAttr("disabled");
            $("#btnadd").removeClass('layui-btn layui-btn-disabled');
            $("#btnadd").addClass('layui-btn layui-btn-normal');
        }
    }
</script>