<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/27 0027
  Time: 上午 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/js-lqp/layUI/css/layui.css">
<script type="text/javascript" src="/resources/js-lqp/layUI/layui.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .display_none{
        display: none;
    }
    .td1{
        padding: 10px;
        width: 190px;
        background-color: #f2f2f2;
        font-size: 10px;
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
    }

</style>
<body>
<legend><center>招聘计划人员报表</center></legend>
<div id="tdquery"></div>
</body>
<script>
    $(TdStaffQuery());
    function TdStaffQuery(){
        $.ajax({
            url:"/Plan/selecthirePlan",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>计划名称</td>" +
                    "<td>人员名称</td>" +
                    "<td>性别</td>" +
                    "<td>联系电话</td>" +
                    "<td>学历</td>" +
                    "<td>专业</td>" +
                    "<td>应聘岗位</td>" +
                    "<td>招聘渠道</td>" +
                    "<td>招聘小组成员</td>" +
                    "<td>待面试人员</td>" +
                   "</tr>";
                for (i = 0; i < data.length ; i++){
                    a+="<tr ><td>"+data[i].empID//编号
                        +"</td><td>"+data[i].planName//计划名称
                        +"</td><td>"+data[i].empName//名称
                        +"</td><td>"+data[i].enpSex
                        +"</td><td>"+data[i].telephone
                        +"</td><td>"+data[i].ExpectedIndustry
                        +"</td><td>"+data[i].speciality
                        +"</td><td>"+data[i].ministration
                        +"</td><td>"+data[i].dictionaryID//招聘渠道
                        +"</td><td>"+data[i].PlanNote//招聘备注
                        +"</td><td>"+data[i].NoteRemind//招聘提醒
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }


</script>
</html>
