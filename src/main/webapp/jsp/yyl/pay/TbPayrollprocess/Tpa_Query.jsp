<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/13
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>薪资上报管理</title>
    <link rel="stylesheet" href="/resources/js_yyl/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/js_yyl/jquery-3.1.1.min.js"></script>
    <script src="/resources/js_yyl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
        border: 1px solid #9d9d9d;
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
        border: 1px solid #9d9d9d;
    }
    .div{
        width: 30%;
        height:100%;
        float: left;
        border: 1px solid #9d9d9d;
        margin-right: 10px;
        overflow-y:scroll;
    }
</style>
<body>
<%--查询--%>
<div id="tpsquery"></div>
</body>
    <script>
        $(TbPayrollprocessQuery());
        function TbPayrollprocessQuery() {
            $.ajax({
                url: "/TbPayrollprocessController/tpl_query.do",
                type: "post",
                success: function (data) {
                    var a = "<form id='tpsadd'><table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;'>" +
                        "<tr style='font-weight:800;'>" +
                        "<td>流程创建时间</td><td>流程创建人</td><td>起始日期</td><td>截止日期</td><td>工资月份</td><td>备注</td><td>状态</td><td>操作</td></tr>";
                    for (var i = 0; i < data.length; i++) {
                        if(data[i].state==0){
                            var state = "薪资上报";
                            var statename = "<span style='color: #20ff15;'>执行中</span>"
                        }else if(data[i].state==1){
                            var state = "查看薪资";
                            var statename = "<span style='color: red;'>已终止</span>"
                        }
                        a+="<tr><td class='display_none'>"+data[i].processId
                            +"</td><td id='seet"+i+"'>"+data[i].seet//流程创建时间
                            +"</td><td class='display_none'>"+data[i].operator//流程创建人ID
                            +"</td><td>"+data[i].PersonName//流程创建人
                            +"</td><td>"+data[i].startdate//起始日期
                            +"</td><td>"+data[i].abortdate//截止日期
                            +"</td><td>"+data[i].year+"年&nbsp"+data[i].month+"月"//工资月份
                            +"</td><td>"+data[i].remark//备注
                            +"</td><td class='display_none'>"+data[i].state//状态
                            +"</td><td class='display_none'>"+data[i].year//年
                            +"</td><td class='display_none'>"+data[i].month//月
                            +"</td><td>"+statename//状态Name
                            +"</td><td>" +
                            "<a href='/jsp/yyl/pay/TpSalarySheet/Tp_sQuery.jsp?month="+data[i].seet+"&state="+data[i].state+"'>"+state+"</a>&nbsp;"
                            +"<a href='/jsp/yyl/pay/TbPayrollprocess/Tpp_Query.jsp?month="+data[i].seet+"'>打印</a>"
                            +"</td></tr>"
                    }
                    $("#tpsquery").html(a+"</form></table>")
                }
            })
        }
    </script>
</html>
