<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/21 0021
  Time: 下午 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <a href="HireJSP.jsp">返回</a>
    <title>招聘录用</title>
</head>
<body>
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
            url:"hire/selectTbRecruitmentemployed",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#table").html("");
                var a ="";
                a+="<tr><td>编号</td>"
                a+="<td>所属部门</td>"
                a+="<td>操作人</td>"
                a+="<td>录用日期</td>"
                a+="<td>正式入职时间</td>"
                a+="<td>正式起薪时间</td>"
                a+="<td>备注</td></tr>"
                for(i=0;i<data.list.length;i++){
                    var b = data.list[i]
                    a+="<tr class='id'><td>"+b.headid+"</td>"
                    a+="<td>"+b.deptId+"</td>"
                    a+="<td>"+b.hireDate+"</td>"
                    a+="<td>"+b.workEndTime+"</td>"
                    a+="<td>"+b.officialSalary+"</td>"
                    a+="<td>"+b.remark+"</td>"
                }
                $("#table").append(a);
            }
        })
    }
    //执行查询函数
    $(a());
</script>
</html>
