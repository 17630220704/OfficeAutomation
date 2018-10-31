<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>权限管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../../resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <style>
        .breadcrumb li a{
            color: #f96332;

        }
    </style>
</head>
<body style="margin: 0px;padding: 0;width: 100%;height: 100%;">
<div class="container">
        <ul class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="" href="/jsp/permit/permitRole.jsp" target="permit">角色权限管理</a>
            </li>
            <li class="breadcrumb-item">
                <a class="" href="/jsp/permit/permitRoleUser.jsp" target="permit">角色用户管理</a>
            </li>
        </ul>
</div>
<div style="border-top: 1px solid #e2e2e2;height: 100%;width: 100%;">
    <iframe class="main" name="permit" id="iframe" scrolling="0" frameborder="0"  width="100%" ></iframe>
</div>
</body>
<script type="text/javascript">
    $(function(){
        function iframeLoad()
        {
            document.getElementById("iframe").height=0;
            document.getElementById("iframe").height=document.getElementById("iframe").contentWindow.document.body.scrollHeight;
        }
    });
</script>
</html>
