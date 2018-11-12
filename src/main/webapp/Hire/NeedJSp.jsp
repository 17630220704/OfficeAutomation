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
	<title>招聘需求</title>
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
            url:"hire/selectTbRecruitmentneed",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#table").html("");
                var a ="";
                a+="<tr><td>id</td>"
               /* a+="<td>岗位</td>"*/
                a+="<td>日期</td>"
                a+="<td>人数</td>"
                a+="<td>岗位要求</td>"
                a+="<td>提醒</td>"
                a+="<td>备注</td></tr>"
                for(i=0;i<data.list.length;i++){
                    var b = data.list[i]
                    a+="<tr class='id'><td>"+b.needID+"</td>"
                    a+="<td>"+b.needDate+"</td>"
                    a+="<td>"+b.budget+"</td>"
                    a+="<td>"+b.needRequirements+"</td>"
                    a+="<td>"+b.remind+"</td>"
                    a+="<td>"+b.remark+"</td></tr>"
                }
                $("#table").append(a);
            }
        })
    }
    //执行查询函数
	$(a());
</script>
</html>
