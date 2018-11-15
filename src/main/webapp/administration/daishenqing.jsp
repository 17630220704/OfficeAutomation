<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/11/3
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>

<%--<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>待批申请</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

   <%-- <link rel="stylesheet" href="<%=basePath %>/resources/layui/css/layui.css">--%>
</head>
<body>

<div class="container">
    <center>
        <p><h3>待批申请</h3></p>
    </center>
    <table class="table">
        <thead>
        <tr class="info">
            <th>序号</th>
            <th>用品库</th>
            <th>用品名称</th>
            <th>登记类型</th>
            <th>申请人</th>
            <th>申请数量</th>
            <th>申请时间</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="list">
        </tbody>
    </table>
</div>

</body>
<script type="text/javascript">
    function getqueyapply1(){
        $.ajax({
            url:"/worksurface/query_apply1",
            type:"post",
            dataType:"json",
            success:function(data){
                var a=data;
                var b="";
                for(var i=0;i<a.length;i++){
                    b+="<tr><td>"+a[i].apply_id+
                        "</td><td>"+a[i].b_bankname+
                        "</td><td>"+a[i].work_name+
                        "</td><td>"+a[i].apply_style+
                        "</td><td>"+a[i].apply_people+
                        "</td><td>"+a[i].apply_number+
                        "</td><td>"+a[i].apply_time+
                    "</td>";
                    b+="<td>";
                     if(a[i].apply_comment==""){
                        b+="无";
                     }else{
                         b+=a[i].apply_comment;
                    }
                    "</td>";
                    b+="<td>" +
                        "<input type='button' class='update' value='批准' id='btn'> " +
                        "<input type='button' class='noup' value='不批准' id='no'>"+
                        "<a href='daishenqing.jsp'><input type='button' value='返回'></a>"+
                        "</td></tr>";
                }
                $("#list").html(b);
            }
        });
    }
    $(function(){
        getqueyapply1();
    });

    /*
    * 批准-修改状态,库存
    * */
    $(function () {
        var a="";
        $("#list").on("click",".update",function () {
            a=$(this);
            var upda=a.parent().parent().children().eq(0).html();
            alert(upda);
               $.ajax({
                   url: "/worksurface/update_kucun",
                   type: "post",
                   data:{
                       applyId:upda,
                   },
                   dataType: "json",
                   success:function (data) {
                       alert(data.message);
                       window.location.reload();
                   }
               })
        });
    });



    //修改状态(2)未通过审核
    $(function () {
        var a="";
        $("#list").on("click",".nop",function () {
            a=$(this);
            var upd=a.parent().parent().children().eq(0).html();
            $.ajax({
                url: "/worksurface/updateStat",
                type: "post",
                data:{
                    applyId:upd
                },
                dataType: "json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            })
        });
    });






</script>
</html>
