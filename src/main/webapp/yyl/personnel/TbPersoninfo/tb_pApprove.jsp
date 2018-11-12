<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/31
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>离职审批</title>
    <link rel="stylesheet" href="../../../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../../resources/jquery-3.1.1.min.js"></script>
    <script src="../../../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
    #body{
        text-align:center;
        margin:0 auto;
        width: 100%;
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
<%--查询人事档案--%>
<div id="tp_query"></div>
</body>
<script>
    $(function(){
            a = new Date();
            var b = a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate();
        }
    )
    $(TbPersoninfoQuery())
    function TbPersoninfoQuery(){
        $.ajax({
            url:"/TbPersoninfoController/tpquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px;'>"
                    +"<tr style='font-weight:800;'><td>姓名</td><td>职位</td><td>手机号</td><td>办公电话</td><td>生日</td><td>邮箱</td>" +
                    "<td>现住址</td><td>备注</td><td colspan='3'>操作</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    var c = Math.round(data[i].NowState);
                    var d = "";
                    var f = ""
                    if(c==0){
                        continue;
                    }else if(c==2){
                        d = "<b style='color: #999;'>(待审批)</b>"
                    }else if(c==1){
                        continue;
                    }
                    a+="<tr><td class='display_none'>"+data[i].persoId//职员ID-主键
                        +"</td><td>"+data[i].PersonName+d//姓名+在职状态0.在职1.离职
                        +"</td><td>"+data[i].POSIName//职位
                        +"</td><td>"+data[i].telephone//手机号
                        +"</td><td>"+data[i].officePhone//办公电话
                        +"</td><td>"+data[i].personBirth//生日
                        +"</td><td>"+data[i].Email//邮箱
                        +"</td><td>"+data[i].NowAddress//现住址
                        +"</td><td>"+data[i].remark//备注
                        +"</td><td><button class='btn btn-primary' style='cursor:pointer;' onclick='approve1("+data[i].PosiId+","+data[i].persoId+",1)' value='"+1+"'>批准</button>"
                        +"</td><td><button class='btn btn-primary' style='cursor:pointer;' onclick='approve2("+data[i].PosiId+","+data[i].persoId+",0)' value='"+0+"'>不批准</button>"
                        +"</td></tr>"
                }
                $("#tp_query").html(a+="</table>")
            }
        })
    }
function approve1(u,a,y){
    if(confirm("确认要批准离职？")){
        $.ajax({
            url:"/TbPersoninfoController/tpupdate.do",
            type:"post",
            data:{
                persoId:a,
                posiId:u,
                nowState:y
            },
            dataType:"json"
        }).always(function(){
            TbPersoninfoQuery();
        })
    }else{

    }
}function approve2(u,a,y) {
        if (confirm("确认要拒绝离职？")) {
            $.ajax({
                url: "/TbPersoninfoController/tpupdate2.do",
                type: "post",
                data: {
                    persoId: a,
                    lId: a,
                    posiId: u,
                    nowState: y
                },
                dataType: "json"
            }).always(function () {
                TbPersoninfoQuery();
            })
        } else {

        }
    }
</script>
</html>
