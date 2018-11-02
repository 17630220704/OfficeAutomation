<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>添加角色</title>
    <link rel="stylesheet" href="/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/permit-trees/layui-v2.4.4/layui/css/layui.css" >
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/layui.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
    <script src="/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
</head>
<body>
<form class="layui-form addrole">
    <div class="layui-form-item">
        <label class="layui-form-label">角色名</label>
        <div class="layui-input-block">
            <input type="text" name="rname"  placeholder="请输入角色名" class="layui-input rname">
        </div>
    </div>
</form>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn subaddrole">立即提交</button>
        </div>
    </div>
</body>
<script>
    $(function () {
        addrole();
    });
    function addrole(){
        $(".subaddrole").click(function () {
            var rname = $(".rname").val();
            $.ajax({
                type: "Post",
                url: "/saveRole.do",
                dataType: "json",
                data:{
                    'rname':rname
                },
                success:function (data) {
                    if (data.result){
                        layer.msg("添加成功");
                        setTimeout(function () {
                            location.replace("/jsp/permit/permitRole.jsp");
                        },1000)
                    }else {
                        layer.msg("添加失败");
                    }
                }
            })

        });
    }
</script>
</html>
