<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <title>Bootstrap 实例 - 悬停表格</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../resources/layui-v2.0.1/layui/css/layui.css" media="all">
</head>
<body>
<table class="table table-hover" id="table1">

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    邮件
                </h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>发件人:</td>
                        <td id="persoId"></td>
                    </tr>
                    <tr>
                        <td>收件人:</td>
                        <td id="toid2"></td>
                    </tr>
                    <tr>
                        <td>主题:</td>
                        <td id="subject"></td>
                    </tr>
                    <tr>
                        <td>内容:</td>
                        <td id="content"></td>
                    </tr>
                    <tr>
                        <td>时间:</td>
                        <td id="sendTime"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script>
    function query2() {
        $.ajax({
            url: "/mailQuery",
            data: "",
            type: "post",
            dataType: "json",
            success: function (data) {
                var a = "";
                a += "<tr><td>邮件编号</td>"
                a += "<td>发件人</td>"
                a += "<td>主题</td>"
                a += "<td>时间</td>"
                a += "<td>状态</td>"
                a += "<td>操作</td>"
                a += "</tr>"
                for (i = 0; i < data.length; i++) {
                    var b = data[i];
                    a += "<tr><td>" + b.emailId + "</td>"
                    a += "<td>" + b.m2.persoId + "</td>"
                    a += "<td>" + b.m2.subject + "</td>"
                    a += "<td>" + b.m2.sendTime + "</td>"
                    a += "<td>" + b.readFlag + "</td>"
                    a += "<td><button class='cx layui-btn layui-btn-sm layui-btn-normal' data-toggle='modal' data-target='#myModal' onclick='a(this)' value='" + b.bodyId + "'>查看</button><button class='layui-btn layui-btn-sm layui-btn-normal' onclick='b(this)' value='" + b.emailId + "'><i class=\"layui-icon\"></i></button></td>"
                    a += "</tr>";
                }
                $("#table1").html(a);
            }
        })
    }

    function a(u) {
        var bodyId = $(u).val();
        var posiId = 1;
        $.ajax({
            url: "/mailXq",
            type: "post",
            data: {
                "bodyId": bodyId,
                "posiId": posiId
            },
            dataType: "json",
            success: function (data) {
                $("#persoId").html(data[0].persoId);
                $("#toid2").html(data[0].TO_ID2);
                $("#subject").html(data[0].SUBJECT);
                $("#content").html(data[0].CONTENT);
                $("#sendTime").html(data[0].SEND_TIME);
            }
        }).always(function () {
            $(query2());
        });
    }

    function b(f) {
        var emailId = $(f).val();
        alert("确定删除吗")
        $.ajax({
            url: "/mailUpdate",
            type: "post",
            data: {
                "emailId": emailId
            },
            dataType: "json",
            success: function (data) {
                alert(data.message);
            }
        }).always(function () {
            $(query2());
        });
    }

    $(query2());
</script>
