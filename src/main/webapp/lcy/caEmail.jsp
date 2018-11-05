<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Bootstrap 实例 - 面板标题</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--引入ckeditor的网页上加入ckeditor.j--%>
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <%--Bootstrap 实例 - 面板标题--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
</head>
<body>
<table class="table table-hover" id="table1">

</table>
</body>
</html>
<script>
    function query2() {
        $.ajax({
            url: "/CGqueryList",
            data: "",
            type: "post",
            dataType: "json",
            success: function (data) {
                var a = "";
                a += "<tr><td>邮件编号</td>"
                a += "<td>主题</td>"
                a += "<td>时间</td>"
                a += "<td>操作</td>"
                a += "</tr>"
                for (i = 0; i < data.length; i++) {
                    var b = data[i];
                    a += "<tr><td>"+b.BODY_ID+"</td>"
                    a += "<td>" + b.SUBJECT+ "</td>"
                    a += "<td>" + b.SEND_TIME + "</td>"
                    a += "<td><a href='/CGQueryt?bodyId="+b.BODY_ID+"'>sss</a><button onclick='b(this)' value='" + b.BODY_ID + "'>删除</button></td>"
                    a += "</tr>";
                }
                $("#table1").html(a);
            }
        })
    }
    function b(f) {
        var bodyId = $(f).val();
        alert("确定删除吗")

        $.ajax({
            url: "/CGdEdelete",
            type: "post",
            data: {
                "bodyId": bodyId
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