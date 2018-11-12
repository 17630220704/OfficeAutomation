<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/23
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤排版查询</title>
    <link rel="stylesheet" href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
    }
    input{
        width: 110px;
    }
</style>
<body>
    <div id="tdquery"></div>
</body>
    <script>
        $(Td_sQuery());
        function Td_sQuery(){
            $.ajax({
                url:"/TdScheduleController/td_squery.do",
                type:"post",
                dataType:"json",
                success:function(data){
                    var a = "<table class='table table-striped' style='text-align: center;font-size: 12px;'><tr style='font-weight:800;'><td>编号</td><td>排班名称</td> " +
                        "<td>考勤类型</td><td>应用人员</td><td>状态</td><td>操作</td> </tr>";
                    for(var i=0;i<data.length;i++){
                        a+="<tr><td id='DUTY_TYPE"+i+"'>"+data[i].ScheduleId
                            +"</td><td id='DUTY_TIME3"+i+"'>"+data[i].ScheduleName
                            +"</td><td id='DUTY_NAME"+i+"'>"+data[i].PosiId,data[i].DeptId,data[i].persoId
                            +"</td><td id='DUTY_TIME3"+i+"'>"+data[i].ScheduleType
                            +"</td><td id='DUTY_TIME3"+i+"'>"+data[i].ScheduleState
                            +"</td><td><button onclick='send("+i+")' type='button'>编辑</button>"
                            +"</td><td><button onclick='tdConfigDelete(this)' type='button' value='"+data[i].DUTY_TYPE+"'>删除</button>"
                            +"</td></tr>"
                    }
                    $("#tdquery").html(a+="</table>");
                }
            })
    }
    </script>
</html>
