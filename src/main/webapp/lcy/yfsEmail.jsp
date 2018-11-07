<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/29
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Bootstrap 实例 - 悬停表格</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
</head>
<body>
<table class="table table-hover" id="table1">
    <div id="ccc"></div>
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
            url: "/YfsQuery",
            data: "",
            type: "post",
            dataType: "json",
            success: function (data) {
                var a = "<table  class='table table-striped'>"
                a += "<tr><td>发件人</td>"
                a += "<td>主题</td>"
                a += "<td>时间</td>"
                a += "<td>操作</td>"
                a += "</tr>"
                for (i = 0; i < data.length; i++) {
                    var b = data[i];
                    a += "<tr><td>" + b.m2.persoId + "</td>"
                    a += "<td>" + b.m2.subject + "</td>"
                    a += "<td>" + b.m2.sendTime + "</td>"
                    a += "<td><button class='cx' data-toggle='modal' data-target='#myModal' onclick='a(this)' value='" + b.bodyId + "'>查看</button><button onclick='b(this)' value='" + b.emailId + "'>删除</button></td>"
                    a += "</tr>";
                }
                $("#ccc").html(a += "</table>");
            }
        })
    }

    function a(u) {
        var bodyId = $(u).val();
        var posiId = 1;
        $.ajax({
            url: "/YfsXq",
            type: "post",
            data: {
                "bodyId": bodyId,
                "posiId": posiId
            },
            dataType: "json",
            success: function (data) {
                $("#persoId").html(data[0].persoId);
                $("#toid2").html(data[0].toidname);
                $("#subject").html(data[0].SUBJECT);
                $("#content").html(data[0].CONTENT);
                $("#sendTime").html(data[0].SEND_TIME);
            }
        }).always(function () {
            $(query2());
        });
    }

    $(query2());
</script>
