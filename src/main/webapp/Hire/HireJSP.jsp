<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/21 0021
  Time: 下午 6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事档案</title>
</head>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<%--<script>
    $(function () {
        alert("111");
    })
</script>--%>
<body>
<a href="EmployJSp.jsp">招聘录用</a>
<a href="NeedJSp.jsp">招聘需求</a>
<a href="PlanJSp.jsp">招聘计划</a>
<!--异步查询出的数据  -->
<table id="table" border="1px"></table>
<!--/异步查询出的数据  -->
<button class="tianjia1">添加</button>
<!--添加数据  -->
<table id="table1" style="display: none;">
    <tr>
        <td>账号</td>
    </tr>
    <tr>
        <td><input type="text" id="empName" name="empName" value=""></td>
        <td><input type="button" class="tianjia" value="添加"></td>
    </tr>
</table>
</body>
<script type="text/javascript">
    $(".tianjia1").click(function(){
        $("#table1").css("display","block");
    })
    //查询函数
    function a(){
        $.ajax({
            url:"hire/selectTbHirefile",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#table").html("");
                var a ="";
                a+="<tr><td>人才库编号</td>"
                a+="<td>姓名</td>"
                a+="<td>性别</td>"
                a+="<td>出生日期</td>"
                a+="<td>籍贯</td>"
                a+="<td>政治面貌</td>"
                a+="<td>身份证</td>"
                a+="<td>手机号</td>"
                a+="<td>毕业学校</td>"
                a+="<td>专业</td>"
                a+="<td>学历</td>"
                a+="<td>毕业日期</td>"
                a+="<td>现住址</td>"
                a+="<td>应聘岗位</td>"
                a+="<td>期待从事行业</td>"
                a+="<td>期待从事职业</td>"
                a+="<td>期待工作城市</td>"
                a+="<td>期待薪水（税前）</td>"
                a+="<td>到岗时间</td>"
                a+="<td>招聘渠道</td>"
                a+="<td>特长</td>"
                a+="<td>职业技能</td>"
                a+="<td>项目经验</td>"
                a+="<td>工作经验</td>"
                a+="<td>备注</td>"
                a+="<td>录入人</td></tr>"
                for(i=0;i<data.list.length;i++){
                    var b = data.list[i]
                    a+="<tr ><td>"+b.empID+"</td>"
                    a+="<td>"+b.empName+"</td>"
                    a+="<td>"+b.enpSex+"</td>"
                    a+="<td>"+b.birthTime+"</td>"
                    a+="<td>"+b.homePlase+"</td>"
                   /* a+="<td>"+b.nation+"</td>"*/
                    a+="<td>"+b.politics+"</td>"
                    a+="<td>"+b.nodyId+"</td>"
                    a+="<td>"+b.telephone+"</td>"
                    a+="<td>"+b.graduateSchool+"</td>"
                    a+="<td>"+b.speciality+"</td>"
                    a+="<td>"+b.scientificName+"</td>"
                    a+="<td>"+b.graduateTime+"</td>"
                    a+="<td>"+b.homeAddress+"</td>"
                    a+="<td>"+b.post+"</td>"
                    a+="<td>"+b.ministration+"</td>"
                    a+="<td>"+b.expectedIndustry+"</td>"
                    a+="<td>"+b.expectedOccupation+"</td>"
                    a+="<td>"+b.expectedCity+"</td>"
                    a+="<td>"+b.expectedSalary+"</td>"
                    a+="<td>"+b.workTime+"</td>"
                    a+="<td>"+b.recruitment+"</td>"
                    a+="<td>"+b.specialty+"</td>"
                    a+="<td>"+b.skill+"</td>"
                    a+="<td>"+b.projectExperience+"</td>"
                    a+="<td>"+b.workExperience+"</td>"
                    a+="<td>"+b.remark+"</td>"
                    a+="<td>"+b.hireName+"</td></tr>"
                }
                $("#table").append(a);
            }
        })
    }
    //执行查询函数
    $(a());
    //添加提交按钮函数
    $(".tianjia").click(function(){
        var empName=$("#empName").val();
        $.ajax({
            url:"hire/save",
            data:{
                "empName":empName,
            },
            type:"post",
            dataType:"json",
            success:function(data){
                if(data.a==1){
                    $("#table1").css("display","none");
                    alert("成功");
                    a();
                }else{
                    alert("失败");
                }
            }
        })
    })
</script>
</html>
