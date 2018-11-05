<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../resources/layui-v2.0.1/layui/css/layui.css" media="all">
</head>
<body>
<div style="width: 100%">
    <table border="1px">
        <tr>
            <td>id</td>
            <td><input type="text" id="persoId" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" id="personName" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input type="text" id="personBirth" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>手机号</td>
            <td><input type="text" id="telephone" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>办公电话</td>
            <td><input type="text" id="officePhone" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input type="text" id="email" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input"></td>
        </tr>
        <tr>
            <td>现住址</td>
            <td><input type="text" id="nowAddress" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td>备注</td>
            <td><input type="text" id="remark" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button class="layui-btn" id="btnadd">编辑</button>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
<script>
    function query2() {
        var persoId = 1;
        $.ajax({
            url: "/TbuserXq",
            data: {
                "persoId": persoId
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#persoId").val(data[0].persoId);
                $("#personName").val(data[0].PersonName);
                $("#personBirth").val(data[0].personBirth);
                $("#telephone").val(data[0].telephone);
                $("#officePhone").val(data[0].officePhone);
                $("#email").val(data[0].Email);
                $("#nowAddress").val(data[0].NowAddress);
                $("#remark").val(data[0].remark);
            }
        })
    }

    $(function () {
        $("#btnadd").click(function () {
            var persoId = $("#persoId").val();
            var personName = $("#personName").val();
            var personBirth = $("#personBirth").val();
            var telephone = $("#telephone").val();
            var officePhone = $("#officePhone").val();
            var email = $("#email").val();
            var nowAddress = $("#nowAddress").val();
            var remark = $("#remark").val();
            $.ajax({
                url: "/Tbuserupp",
                type: "post",
                data: {
                    "persoId": persoId,
                    "personName": personName,
                    "personBirth": personBirth,
                    "telephone": telephone,
                    "officePhone": officePhone,
                    "email": email,
                    "nowAddress": nowAddress,
                    "remark": remark
                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                }
            }).always(function () {
                $(query2());
            });
        });
    });
    query2();
</script>
