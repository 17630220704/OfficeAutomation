<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/2
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>薪酬项目</title>
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
    .body{
        text-align:center;
        margin:0 auto;
        width: 100%;
    }
</style>
<body>
<div class="body">
    <form id="tpp_Add">
        <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
            <tr>
                <th colspan="2" style="text-align: center;">添加薪酬项目</th>
            </tr><tr>
                <td class="td1">项目名称:</td>
                <td class="td2 xq1"><input class="form-control" name="paymentName"></td>
            </tr><tr>
                <td class="td1">项目类型:</td>
                <td class="td2 xq1">
                    <select name="paymentType">
                        <option value="财务录入项">财务录入项</option>
                        <option value="部门上报项">部门上报项</option>
                    </select>
                </td>
            </tr><tr>
                <td colspan="2" style="text-align: center;"><button class='btn btn-primary' onclick="TpPaymentadd()">添加</button></td>
            </tr>
        </table>
    </form>
</div>
<%--薪酬项目查询--%>
<div id="tdquery" class="body"></div>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    修改薪酬项目
                </h4>
            </div>
            <div class="modal-body">
                <form id="tpp_Update">
                    <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
                        <tr>
                            <th colspan="2" style="text-align: center;">添加薪酬项目</th>
                        </tr><tr>
                        <td class="td1">项目名称:</td><input class="display_none xq0" name="paymentId">
                        <td class="td2 xq1"><input class="form-control xq1" name="paymentName"></td>
                    </tr><tr>
                        <td class="td1">项目类型:</td>
                        <td class="td2 xq1">
                            <select id="w" name="paymentType">
                                <option value="财务录入项">财务录入项</option>
                                <option value="部门上报项">部门上报项</option>
                            </select>
                        </td>
                    </tr><tr>
                        <td colspan="2" style="text-align: center;"><button class='btn btn-primary' onclick="TpPaymentupdate()">修改</button></td>
                    </tr>
                    </table>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(TpPaymentQuery());
    $(date1());
    function date1(){
        a = new Date();
        $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
    }
    function TpPaymentQuery(){
        $.ajax({
            url:"/TpPaymentController/tp_pquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;width: 600px'>" +
                    "<tr><td colspan='5'style='font-size: 16px'>已定义薪酬项目</td></tr>"+
                    "<tr style='font-weight:800;'><td>项目ID</td><td>项目名称</td><td>项目类型</td><td colspan='2'>操作</td></tr>";
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].paymentId//ID自增
                        +"</td><td>"+parseInt(i+1)//项目序号
                        +"</td><td>"+data[i].paymentName//项目名称
                        +"</td><td>"+data[i].paymentType//项目类别
                        +"</td><td><button class='btn btn-primary' style='text-align:right;' value='"+i+"' onclick='update(this)' data-toggle='modal' data-target='#myModa2'>修改</buuton>"
                        +"</td><td style='text-align: left;'><button onclick='TpPaymentDelete(this)'class='btn btn-primary' type='button' value='"+data[i].paymentId+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    function TpPaymentadd(){
        $.ajax({
            url: "/TpPaymentController/tp_padd.do",
            type: "post",
            data:$("#tpp_Add").serialize(),
            dataType: "json"
        }).always(function(){
            TpPaymentQuery();
        })
    }
    function update(u){
        for(i=0;i<3;i++){
            $(".xq"+i).val($(u).parent().parent().parent().children().eq((parseInt($(u).val())+2)).children().eq(i).html());
        }
        var a = $(u).parent().parent().parent().children().eq((parseInt($(u).val())+2)).children().eq(2).html();
        $("#w option[value='"+a+"']").attr("selected","selected");
    }
    function TpPaymentupdate(){
        $.ajax({
            url: "/TpPaymentController/tp_pupdate.do",
            type: "post",
            data:$("#tpp_Update").serialize(),
            dataType: "json"
        }).always(function(){
            TpPaymentQuery();
        })
    }
    function TpPaymentDelete(u){
        $.ajax({
            url: "/TpPaymentController/tp_pdelete.do",
            type: "post",
            data:{paymentId:$(u).val()},
            dataType: "json"
        }).always(function(){
            TpPaymentQuery();
        })
    }
</script>
</html>
