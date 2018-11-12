<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/21 0021
  Time: 下午 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>招聘计划</title>
</head>
<body>
<a href="HireJSP.jsp">返回</a>
<!--异步查询出的数据  -->
<table id="table" border="1px"></table>
</body>
<script type="text/javascript">
    $(".tianjia1").click(function(){
        $("#table1").css("display","block");
    })
    //查询函数
    function a(){
        $.ajax({
            url:"hire/selectTbRecruitmentplan",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#table").html("");
                var a ="";
                a+="<tr><td>id</td>"
                a+="<td>计划名称</td>"
                a+="<td>招聘渠道</td>"
                a+="<td>开始时间</td>"
                a+="<td>结束时间</td>"
                a+="<td>预算费用</td>"
                a+="<td>招聘说明</td>"
                a+="<td>招聘备注</td>"
                a+="<td>备注提醒</td>"
                a+="<td>审批状态</td></tr>"
                for(i=0;i<data.list.length;i++){
                    var b = data.list[i]
                    a+="<tr class='id'><td>"+b.planId+"</td>"
                    a+="<td>"+b.planName+"</td>"
                    a+="<td>"+b.dictionaryId+"</td>"
                    a+="<td>"+b.startTime+"</td>"
                    a+="<td>"+b.endTime+"</td>"
                    a+="<td>"+b.budget+"</td>"
                    a+="<td>"+b.planInstructions+"</td>"
                    a+="<td>"+b.planNote+"</td>"
                    a+="<td>"+b.noteRemind+"</td>"
                    a+="<td>"+b.approvalStatus+"</td></tr>"
                }
                $("#table").append(a);
            }
        })
    }
    //执行查询函数
    $(a());
</script>
</html>
