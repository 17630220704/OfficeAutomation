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
    <script type="text/javascript" src="../../resources/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../../resources/jquery.serialize.js"></script>
    <script src="../../resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <link href="../../resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../resources/bootstrap-3.3.7/css/now-ui-dashboard.css?v=1.0.1" rel="stylesheet"/>
    <link href="../../resources/bootstrap-3.3.7/demo/demo.css" rel="stylesheet"/>
    <script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
    <style>
        .nav-item{
            border: 1px solid #f2f2f2;
            width: 10%;
            height: 5%;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a style="color: #f96332;" class="nav-link" href="/jsp/permit/permitRole.jsp" target="permit"><i class="now-ui-icons media-2_sound-wave"></i>角色权限管理</a><br/>
        </li>
        <li class="nav-item">
            <a style="color: #f96332;" class="nav-link" href="/jsp/permit/permitRoleUser.jsp" target="permit"><i class="now-ui-icons media-2_sound-wave"></i>角色用户管理</a><br/>
        </li>
    </ul>
</div>
<div>
    <iframe name="permit" frameborder="0" ></iframe>
</div>
</body>
<!--   Core JS Files   -->
<script src="../../resources/bootstrap-3.3.7/js/core/jquery.min.js"></script>
<script src="../../resources/bootstrap-3.3.7/js/core/popper.min.js"></script>
<script src="../../resources/bootstrap-3.3.7/js/core/bootstrap.min.js"></script>
<script src="../../resources/bootstrap-3.3.7/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Chart JS -->
<script src="../../resources/bootstrap-3.3.7/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../../resources/bootstrap-3.3.7/js/plugins/bootstrap-notify.js"></script>
<script src="../../resources/bootstrap-3.3.7/js/now-ui-dashboard.js?v=1.0.1"></script>
<script src="../../resources/bootstrap-3.3.7/demo/demo.js"></script>
</html>
