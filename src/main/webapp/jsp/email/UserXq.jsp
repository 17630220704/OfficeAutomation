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
    <script type="text/javascript" src="../../resources/js_lcy/jquery-3.3.1.min.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../resources/js_lcy/layui-v2.4.5/layui/css/layui.css" media="all">
    <script src="../../resources/js_lcy/layui-v2.4.5/layui/layui.js"></script>
</head>
<body>
<div style="width: 100%">

    <table class="layui-table" style="width: 500px">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr style="display: none">
            <th style="width: 20%">id</th>
            <th style="width: 80%"><input type="text" id="persoId" name="username" lay-verify="required"
                                          placeholder="请输入"
                                          autocomplete="off" class="layui-input">
            </th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>姓名</th>
            <th><input type="text" id="personName" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input" readonly="readonly"></th>
        </tr>
        <tr>
            <th>生日</th>
            <th><%--<input type="text" id="personBirth" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input">--%>
                <input type="text" class="layui-input" id="test1">
            </th>
        </tr>
        <tr>
            <th>手机号</th>
            <th><input type="text" id="telephone" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input" onblur="phone()"></th>
        </tr>
        <tr>
            <th>办公电话</th>
            <th><input type="text" id="officePhone" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input" onblur="phone1()"></th>
        </tr>
        <tr>
            <th>邮箱</th>
            <th><input type="text" id="email" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" onblur="eemail()"></th>
        </tr>
        <tr>
            <th>现住址</th>
            <th><input type="text" id="nowAddress" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></th>
        </tr>
        <tr>
            <th>备注</th>
            <th><input type="text" id="remark" name="username" lay-verify="required" placeholder="请输入"
                       autocomplete="off" class="layui-input"></th>
        </tr>
        <tr>
            <th></th>
            <th>
                <button class="layui-btn" id="btnadd">编辑</button>
            </th>
        </tr>
        </thead>
    </table>

</div>
</body>
</html>
<script src="/static/build/layui.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>
<script>
    function query2() {
        var persoId = ${userid};
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
                $("#test1").val(data[0].personBirth);
                $("#telephone").val(data[0].telephone);
                $("#officePhone").val(data[0].officePhone);
                $("#email").val(data[0].Email);
                $("#nowAddress").val(data[0].NowAddress);
            }
        })
    }

    $(function () {
        $("#btnadd").click(function () {
            var persoId = $("#persoId").val();
            var personName = $("#personName").val();
            var personBirth = $("#test1").val();
            var telephone = $("#telephone").val();
            var officePhone = $("#officePhone").val();
            var email = $("#email").val();
            var nowAddress = $("#nowAddress").val();
            var rem = $("#remark").val();
            if (rem == null || rem == '') {
                var remark = 1;
            } else {
                var remark = rem;
            }
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
                    window.location.reload();
                }
            })
        });
    });

    query2();

    function phone() {
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (!myreg.test($("#telephone").val())) {
            alert('请输入有效的手机号码！');
            $("#btnadd").attr('disabled', true).addClass('layui-btn layui-btn-disabled');
            return false;
        } else {
            $("#btnadd").removeAttr("disabled");
            $("#btnadd").removeClass('layui-btn layui-btn-disabled');
            $("#btnadd").addClass('layui-btn layui-btn-normal');
        }
    }

    function phone1() {
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (!myreg.test($("#officePhone").val())) {
            alert('请输入有效的号码！');
            $("#btnadd").attr('disabled', true).addClass('layui-btn layui-btn-disabled');
            return false;
        } else {
            $("#btnadd").removeAttr("disabled");
            $("#btnadd").removeClass('layui-btn layui-btn-disabled');
            $("#btnadd").addClass('layui-btn layui-btn-normal');
        }
    }

    function eemail() {
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        var obj = document.getElementById("email"); //要验证的对象
        if (obj.value === "") { //输入不能为空
            alert("输入不能为空!");
            return false;
        } else if (!reg.test(obj.value)) { //正则验证不通过，格式不对
            alert("验证不通过!");
            return false;
        } else {
            return true;
        }
    }
</script>
