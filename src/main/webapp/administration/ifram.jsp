<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/11/5
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/layui/layui.js"></script>
    <script src="/resources/layui/lay/modules/form.js"></script>
</head>
<script>
    layui.use(['form','table','laydate',], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery;
    });
</script>
<body>
<%--<div>
    <div class="layui-row">
        <div class="layui-col-xs1">
            <div class="grid-demo grid-demo-bg1" style="border-right:1px solid #f2f2f2; height: 100%; ">
                <a href="/administration/worksurface.jsp" target="myifram"data-type="auto" >查询</a>

            </div>
        </div>
        <div class="layui-col-xs11">
            <div class="grid-demo">
                <iframe name="myifram" width="100%" height="100%" frameborder="0" data-type="auto"></iframe>
            </div>
        </div>
    </div>
</div>--%>


<div>
    <div class="layui-row">
        <div class="layui-col-xs1">
            <div class="grid-demo grid-demo-bg1" style="border-right:1px solid #f2f2f2; height: 100%; ">
                <p><a href="/administration/bank.jsp" target="myifram"data-type="auto" >办公用品库</a></p>
                <p><a href="/administration/daishenqing.jsp" target="myifram" data-type="auto" >待批申请</a></p>
                <p><a href="/administration/shenling_jilu.jsp" target="myifram"data-type="auto" >申领记录</a></p>
                <p><a href="/administration/sort.jsp" target="myifram" data-type="auto" >办公用品类别</a></p>
                <p><a href="/administration/worksurface.jsp" target="myifram"data-type="auto" >办公用品</a></p>
                <p><a href="/administration/worksurface_shenling.jsp" target="myifram" data-type="auto" >办公用品申领</a></p>
            </div>
        </div>
        <div class="layui-col-xs11">
            <div class="grid-demo">
                <iframe name="myifram" width="100%" height="100%" frameborder="0" data-type="auto"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>
