<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/23
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新建排班</title>
    <link rel="stylesheet" href="../../../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../../resources/jquery-3.1.1.min.js"></script>
    <script src="../../../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    .display_none{
        display: none;
    }
    .td1{
        padding: 10px;
        width: 100px;
        background-color: #f2f2f2;
        font-size: 10px;
        border: 1px solid #9d9d9d;
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
        border: 1px solid #9d9d9d;
    }
    input{
        width: 110px;
    }
</style>
<body>
<form id="test_form">
    <table cellspacing="0"cellpadding="0">
        <tr>
            <td class="td1">排班名称</td>
            <td class="td2"><input class="form-control" name=""></td>
        </tr>
        <tr>
            <td class="td1">设置范围</td>
            <td class="td2"><textarea class="form-control" name=""></textarea></td>
        </tr>
        <tr>
            <td class="td1">排班名称</td>
            <td class="td2"><input class="form-control" name=""></td>
        </tr>
        <tr>
            <td class="td1">排班名称</td>
            <td class="td2"><input class="form-control" name=""></td>
        </tr>
    </table>
</form>
</body>
<script>
    function tdSchedule() {
        alert($("#test_form").serialize())
        $.ajax({
            url:"/TdScheduleController/td_sadd.do",
            type:"post",
            data:$("#test_form").serialize(),
            dataType:"json",
            success:function(data){

            }
        })
    }
</script>
</html>
