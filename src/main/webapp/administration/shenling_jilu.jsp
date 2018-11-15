<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/11/2
  Time: 8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申领记录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%-- 申领记录查询--%>
<div class="container">
    <center>
        <p><h3>申领记录</h3></p>
    </center>


    <table class="table">
        <thead>
        <tr class="info">
            <th>申领编号</th>
            <th>用品名称</th>
            <th>用品库</th>
            <th>用品类别</th>
            <th>审批人</th>
            <th>登记类型</th>
            <th>单价</th>
            <th>申请数量</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>备注</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="llist">
        </tbody>
    </table>
</div>
</body>

<script>
    //申请查询
    function getqueryapply(){
        $.ajax({
            url:"/worksurface/query_apply",
            type:"post",
            dataType:"json",
            success:function(data){
                var a=data;
                var b="";
                for(var i=0;i<a.length;i++){
                    b+="<tr><td>"+a[i].apply_id+
                         "</td><td>"+a[i].work_name+
                        "</td><td>"+a[i].b_bankname+
                        "</td><td>"+a[i].sort_style+
                        "</td><td>"+a[i].userid+
                        "</td><td>"+a[i].apply_style+
                        "</td><td>"+(a[i].apply_price/a[i].apply_number)+
                        "</td><td>"+a[i].apply_number+
                        "</td><td>"+a[i].apply_time+
                        "</td><td>"+a[i].apply_people+
                        "</td>";
                        b+="<td>";
                            if(a[i].apply_comment==""){
                                b+="无";
                            }else{
                                b+=a[i].apply_comment;
                            }
                        "</td>";
                    b+="<td>";
                    if (a[i].apply_state==1){
                        b+="已审核";
                    } else if (a[i].apply_state==0) {
                        b+="未审核";
                    }else if (a[i].apply_state==2) {
                        b+="未通过审核";
                    }
                    b+="</td>";
                    b+="<td>" +
                        /*"<button class='update_work' data-toggle='modal' data-target='#myModal2' id='"+a[i].apply_id+"'>编辑</button>" +*/
                        /*"<button class='btn btn-primary btn-5g' data-toggle='modal' data-target='#myModal'>详情</button>"+*/
                        "<input type='button' class='delete' value='删除'></td></tr>";
                }
                 $("#llist").html(b);
            }
        });
    }
    $(function(){
        getqueryapply();
        /*getquerysort();*/
        /*getquerysort1();*/
    });
//删除
    $(function(){
        var a="";
        $("#llist").on("click",".delete",function () {
            a=$(this);
            var dele=a.parent().parent().children().eq(0).html();
            $.ajax({
                url:"/worksurface/delete_apply",
                type:"post",
                data:{
                    applyId:dele
                },
                dataType:"json",
                success:function (data) {
                    if(data.message=="删除成功"){
                        alert(data.message);
                        a.parent().parent().remove();
                    }else{
                        alert(data.message);
                        getqueryapply();
                    }
                }
            });
        });
    });



</script>


</html>
