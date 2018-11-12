<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 下午 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title> 招聘需求</title>
</head>
<body>
<div class="container">
<!--异步查询出的数据  -->
<table id="table" class="table table-hover">

</table>

<form id="form" method="post">
    <table>
        <tr>
            <td>岗位</td>
            <td><input type="text" name="jods" value=""/></td>
        </tr>
        <tr>
            <td>时间</td>
            <td><input type="date" name="needDate" value=""/></td>
        </tr>
        <tr>
            <td>部门</td>
            <td><select id="select" name="deptId"></select></td>
        </tr>
        <tr>
            <td><button id="tianjia" class="tianjia">添加</button></td>
        </tr>
    </table>
</form>

<!--更改数据  -->
<form id="form1" method="post">
    <table id="table1" style="display: none;">
        <tr>
            <td>id</td>
            <td><input type="text" name="needId" value=""/></td>
        </tr>
        <tr>
            <td>部门</td>
            <td><select id="select1" name="deptId"></select></td>
        </tr>
        <tr>
            <td>岗位</td>
            <td><input type="text" name="jods" value="1"/></td>
        </tr>
        <tr>
            <td>时间</td>
            <td><input type="date" name="needDate" value="1"/></td>
        </tr>

        <tr>
            <td><button id="geng" class="geng">更改</button></td>
        </tr>
    </table>
</form>
</div>
</body>
<script type="text/javascript">
    //查询
    function a(){
        $.ajax({
            url:"/select",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#table").html("");
                var a ="";
                a+="<thead><tr><td>id</td>"
                a+="<td>部门</td>"
                a+="<td>岗位</td>"
                a+="<td>时间</td></tr></thead>"
                for(i=0;i<data.list.length;i++){
                    var b = data.list[i]
                    a+="<tbody><tr class='id'><td>"+b.needID+"</td>"
                    a+="<td>"+b.DeptName+"</td>"
                    a+="<td>"+b.jods+"</td>"
                    a+="<td>"+b.needDate+"</td>"
                    a+="<td><button needId='"+b.needID+"' class='shanchu'>删除</button></td>"
                   a+="<td><button id='"+b.DeptId+"' class='genggai'>更改</button></td></tr></tbody>"
                }
                $("#table").append(a);
            }
        })
    }
    //执行查询函数
    $(function(){
        a();
    });
    //商品类型
    $(function(){
        $.ajax({
            url:"/select2",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select").html("");
                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].DeptId+"'>"+data[i].DeptName+"</option>"
                }
                $("#select").append(a);
                $("#select1").append(a);
            }
        })
    })
    //添加
    $(".tianjia").click(function(){
        $.ajax({
            url:"/insert1",
            data:$("#form").serialize(),
            type:"post",
            dataType:"json",
            success:function(data){
                a();
            }
        })
    })
    //删除
    $("body").on("click",".shanchu",function(){
        if(confirm("确定删除数据")){
            var b="";
            b=$(this);
            var needId = b.attr("needId");
            $.ajax({
                url:"/delete1",
                type:"post",
                data:{"needId":needId},
                dataType:"json",
                success:function(data){

                    a();
                    /* b.parent().parent().remove();
                    alert("111"); */
                }
            })
        }
    })
    //更改
    $("body").on("click",".genggai",function(){
        $("#table1").css("display","block");

        for(i=0;i<4;i++){
            var html = $(this).parent().parent().children().eq(i).html();
            $("#table1").find("tr").eq(i).find("td").eq(1).children().val(html);
        }
        var html1 = $(this).attr("id");

        $("#select1 option[value='"+html1+"']").attr("selected","selected");

    })
    $(".geng").click(function(){
        $.ajax({
            url:"/update1",
            type:"post",
            data:$("#form1").serialize(),
            dataType:"json",
            success:function(data){
                alert($("#form1").serialize());
                alert("SUCCESS");
            }
        })
    })

</script>
</body>
</html>
