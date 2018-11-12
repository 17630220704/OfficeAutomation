<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/21
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询排班类型</title>
    <link rel="stylesheet" href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    .display_none{
        display: none;
    }
    .td1{
        padding: 10px;
        width: 100px;
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
    input{
        width: 110px;
    }
</style>
<body>
<%--新建班次--%>
<button class="btn btn-primary" data-toggle="modal" data-target="#myModa2">新建班次</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 630px">
            <div class="modal-header">
                <h4 class="modal-title">
                    新建班次
                </h4>
            </div>
            <div class="modal-body">
                <div style="width: 610px;">
                    <form id="test_form">
                        <table cellspacing="0"cellpadding="0">
                            <tr>
                                <td class="td1">班次说明：</td>
                                <td class="td2" colspan="3"><input class="form-control" name="dutyName"></td>
                            </tr>
                            <tr>
                                <td class="td1">早退</td>
                                <td class="td2"><input name="timeLate">分钟正常</td>
                                <td class="td1">迟到</td>
                                <td class="td2"><input name="timeEarly">分钟正常</td>
                            </tr>
                            <tr>
                                <td class="td1">提前</td>
                                <td class="td2"><input name="dutyBefore">分钟准许登记</td>
                                <td class="td1">延后</td>
                                <td class="td2"><input name="dutyAfter">分钟准许登记</td>
                            </tr>
                        </table>
                            <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                <tr>
                                    <td class="td1">签到时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime1"></td>
                                    <td class="td1">签退时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime2"></td>
                                </tr>
                            </table>
                            <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                <tr>
                                    <td class="td1">签到时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime3"></td>
                                    <td class="td1">签退时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime4"></td>
                                </tr>
                            </table>
                            <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                <tr>
                                    <td class="td1">签到时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime5"></td>
                                    <td class="td1">签退时间：</td>
                                    <td class="td2"><input type="time" name="dutyTime6"></td>
                                </tr>
                            </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button class="btn btn-primary" data-dismiss="modal" onclick="tdConfigAdd()" >确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--查询班次--%>
    <div id="tdquery"></div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 730px">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">
                        修改班次
                    </h4>
                </div>
                <div class="modal-body">
                    <div style="width: 710px;">
                        <form id="form">
                            <table cellspacing="0"cellpadding="0">
                                <tr><td class="display_none"><input id="dutyType" name="dutyType"></td>
                                    <td class="td1">班次说明：</td>
                                    <td class="td2" colspan="3"><input class="form-control" id="dutyName" name="dutyName"></td>
                                </tr>
                                <tr>
                                    <td class="td1">早退</td>
                                    <td class="td2"><input id="timeLate" name="timeLate">分钟正常</td>
                                    <td class="td1">迟到</td>
                                    <td class="td2"><input id="timeEarly" name="timeEarly">分钟正常</td>
                                </tr>
                                <tr>
                                    <td class="td1">提前</td>
                                    <td class="td2"><input id="dutyBefore" name="dutyBefore">分钟准许登记</td>
                                    <td class="td1">延后</td>
                                    <td class="td2"><input id="dutyAfter" name="dutyAfter">分钟准许登记</td>
                                </tr>
                            </table>
                            <div>
                                <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                    <tr>
                                        <td class="td1">签到时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime1" name="dutyTime1"></td>
                                        <td class="td1">签退时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime2" name="dutyTime2" id=""></td>
                                    </tr>
                                </table>
                                <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                    <tr>
                                        <td class="td1">签到时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime3" name="dutyTime3"></td>
                                        <td class="td1">签退时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime4" name="dutyTime4"></td>
                                    </tr>
                                </table>
                                <table style="margin-top: 10px;" cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                    <tr>
                                        <td class="td1">签到时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime5" name="dutyTime5"></td>
                                        <td class="td1">签退时间：</td>
                                        <td class="td2"><input type="time" id="dutyTime6" name="dutyTime6"></td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button class="btn btn-primary" data-dismiss="modal" onclick="tdConfigUpdate()" >确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
<script>
    $(Td_cQuery());
    //查询排班类型
    function Td_cQuery() {
        $.ajax({
            url:"/TdConfigController/tdquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px;'><tr style='font-weight:800;'><td>编号</td><td>班次说明</td> " +
                    "<td>第一次签到</td><td>第一次签退</td><td>第二次签到</td><td>第二次签退</td><td>第三次签到</td><td>第三次签退</td>" +
                    "<td colspan='2'>操作</td> </tr>";
                for(var i=0;i<data.length;i++){
                    a+="<tr><td id='DUTY_TYPE"+i+"'>"+data[i].DUTY_TYPE
                    +"</td><td id='DUTY_NAME"+i+"'>"+data[i].DUTY_NAME
                    +"</td><td id='DUTY_TIME1"+i+"'>"+data[i].DUTY_TIME1
                    +"</td><td id='DUTY_TIME2"+i+"'>"+data[i].DUTY_TIME2
                    +"</td><td id='DUTY_TIME3"+i+"'>"+data[i].DUTY_TIME3
                    +"</td><td id='DUTY_TIME4"+i+"'>"+data[i].DUTY_TIME4
                    +"</td><td id='DUTY_TIME5"+i+"'>"+data[i].DUTY_TIME5
                    +"</td><td id='DUTY_TIME6"+i+"'>"+data[i].DUTY_TIME6
                    +"</td><td><button class='btn btn-primary' data-toggle='modal' data-target='#myModal' style='cursor:pointer;' onclick='send("+i+")' type='button'>编辑</button>"
                    +"</td><td><button class='btn btn-primary' onclick='tdConfigDelete(this)' type='button' value='"+data[i].DUTY_TYPE+"'>删除</button>"
                    +"</td></tr>"
                    +"<tr class='display_none'><td id='DUTY_BEFORE"+i+"'>"+data[i].DUTY_BEFORE
                        +"</td><td id='DUTY_AFTER"+i+"'>"+data[i].DUTY_AFTER
                        +"</td><td id='TIME_LATE"+i+"'>"+data[i].TIME_LATE
                        +"</td><td id='TIME_EARLY"+i+"'>"+data[i].TIME_EARLY
                        +"</tr>"
                }
                $("#tdquery").html(a+="</table>");
            }
        })
    }
    function send(i) {
        $("#dutyType").val($("#DUTY_TYPE"+i).html());
        $("#dutyName").val($("#DUTY_NAME"+i).html());
        $("#dutyTime1").val($("#DUTY_TIME1"+i).html());
        $("#dutyTime2").val($("#DUTY_TIME2"+i).html());
        $("#dutyTime3").val($("#DUTY_TIME3"+i).html());
        $("#dutyTime4").val($("#DUTY_TIME4"+i).html());
        $("#dutyTime5").val($("#DUTY_TIME5"+i).html());
        $("#dutyTime6").val($("#DUTY_TIME6"+i).html());
        $("#dutyBefore").val($("#DUTY_BEFORE"+i).html());
        $("#dutyAfter").val($("#DUTY_AFTER"+i).html());
        $("#timeLate").val($("#TIME_LATE"+i).html());
        $("#timeEarly").val($("#TIME_EARLY"+i).html())
    }
    function tdConfigUpdate() {
        $.ajax({
            url:"/TdConfigController/tdupdate.do",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json"
        }).always(function(){
            Td_cQuery();
        })
    }
    function tdConfigDelete(i) {
        $.ajax({
            url:"/TdConfigController/tddelete.do",
            type:"post",
            data:{tc_id:$(i).val()},
            dataType:"json"
        }).always(function(){
            Td_cQuery();
        })
    }
    function tdConfigAdd() {
        $.ajax({
            url:"/TdConfigController/tdadd.do",
            type:"post",
            data:$("#test_form").serialize(),
            dataType:"json"
        }).always(function(){
            Td_cQuery();
        })
    }
</script>
</html>
