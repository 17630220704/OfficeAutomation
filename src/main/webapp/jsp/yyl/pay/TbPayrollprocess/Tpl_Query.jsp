<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/13
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>薪资流程管理</title>
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
</style>
<body>
<button class='btn btn-primary' data-toggle='modal' data-target='#myModa1'>新建流程</button>
<%--查询--%>
<div id="tpsquery"></div>
<%--新建薪资流程--%>
<div class="modal fade" id="myModa1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        新建薪资流程
                    </h4>
                </div>
                <center>
                    <div class="modal-body"style="padding-left:10%;">
                        <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                                <tr>
                                    <td class="td1">起始日期：</td>
                                    <td class="td2"><input type="date" class="form-control" name="startdate"></td>
                                </tr>
                                <tr>
                                    <td class="td1">截止日期：</td>
                                    <td class="td2"><input type="date" class="form-control" name="abortdate"></td>
                                </tr>
                                <tr>
                                    <td class="td1">工资月份：</td>
                                    <td class="td2">
                                        年度：
                                        <select id="year" name="year"></select>
                                        月份：
                                        <select id="month" name="month" onchange="select(this)"></select>
                                        <input class="display_none" id="seet" name="seet">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td1">备注</td>
                                    <td class="td2"><textarea class="form-control" id="remark" name="remark"></textarea></td>
                                </tr>
                        </table>
                    </div>
                </center>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TbPayrollprocessAdd()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<%--修改薪资流程--%>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="update_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        修改薪资流程
                    </h4>
                </div>
                <center>
                    <div class="modal-body"style="padding-left:10%;">
                        <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                            <tr><input class="form-control display_none xg0" name="processId">
                                <td class="td1">起始日期：</td>
                                <td class="td2"><input type="date" class="form-control xg4" name="startdate"></td>
                            </tr>
                            <tr>
                                <td class="td1">截止日期：</td>
                                <td class="td2"><input type="date" class="form-control xg5" name="abortdate"></td>
                            </tr>
                            <tr>
                                <td class="td1">工资月份：</td>
                                <td class="td2">
                                    年度：
                                    <select id="year1" name="year"></select>
                                    月份：
                                    <select id="month1" name="month" onchange="select1(this)">
                                    </select>
                                    <input class="display_none" id="seet1" name="seet">
                                </td>
                            </tr>
                            <tr>
                                <td class="td1">备注</td>
                                <td class="td2"><textarea class="form-control" id="remark1" name="remark"></textarea></td>
                            </tr>
                        </table>
                    </div>
                </center>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TbPayrollprocessUpdate()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>
    <script>
        $(TbPayrollprocessQuery());
        $(date1());
        function date1(){
            a = new Date();
            $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
            for (var i = a.getFullYear()-10; i < a.getFullYear()+10; i++) {
                var year = "<option value='"+i+"'>"+i+"</option>";
                $("#year").append(year)
            }
            for (var i = 1; i < 13; i++) {
                var month = "<option value='"+i+"'>"+i+"</option>";
                $("#month").append(month)
            }
            $("#year option[value='"+a.getFullYear()+"']").attr("selected","selected");
            $("#month option[value='"+(a.getMonth()+1)+"']").attr("selected","selected");
            $("#remark").html((a.getMonth()+1)+"月份工资");
        }
        function TbPayrollprocessQuery() {
            $.ajax({
                url: "/TbPayrollprocessController/tpl_query.do",
                type: "post",
                success: function (data) {
                    var a = "<form id='tpsadd'><table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;'>" +
                        "<tr style='font-weight:800;'>" +
                        "<td>流程创建时间</td><td>流程创建人</td><td>起始日期</td><td>截止日期</td><td>工资月份</td><td>备注</td><td>状态</td><td>操作</td></tr>";
                    for (var i = 0; i < data.length; i++) {
                        if(data[i].state==0){
                            var state1=1;
                            var state = "禁用";
                            var statename = "<span style='color: #20ff15;'>执行中</span>"
                        }else if(data[i].state==1){
                            var state1=0;
                            var state = "启用";
                            var statename = "<span style='color: red;'>已终止</span>"
                        }
                        a+="<tr><td class='display_none'>"+data[i].processId
                            +"</td><td id='seet"+i+"'>"+data[i].seet//流程创建时间
                            +"</td><td class='display_none'>"+data[i].operator//流程创建人ID
                            +"</td><td>"+data[i].PersonName//流程创建人
                            +"</td><td>"+data[i].startdate//起始日期
                            +"</td><td>"+data[i].abortdate//截止日期
                            +"</td><td>"+data[i].year+"年&nbsp"+data[i].month+"月"//工资月份
                            +"</td><td>"+data[i].remark//备注
                            +"</td><td class='display_none'>"+data[i].state//状态
                            +"</td><td class='display_none'>"+data[i].year//年
                            +"</td><td class='display_none'>"+data[i].month//月
                            +"</td><td>"+statename//状态Name
                            +"</td><td>" +
                            "<a style='cursor:pointer;' onclick='open1("+data[i].processId+","+state1+")'>"+state+"</a>&nbsp;" +
                            "<a style='cursor:pointer;' onclick='update(this,"+i+")' data-toggle='modal' data-target='#myModa2'>编辑</a>&nbsp;" +
                            "<a style='cursor:pointer;' onclick='Delete(this,"+i+")'>删除</a>"
                            +"</td></tr>"
                    }
                    $("#tpsquery").html(a+"</form></table>")
                }
            })
        }
        function open1(id,state) {
            if(state==1){
                if (confirm("是否要禁用？")) {
                    $.ajax({
                        url: "/TbPayrollprocessController/tpl_update.do",
                        type: "post",
                        data: {
                            processId: id,
                            state: state
                        }
                    }).always(function () {
                        TbPayrollprocessQuery();
                    })
                }
                else{}
            }else if(state==0){
                if (confirm("是否要启用？")) {
                    $.ajax({
                        url: "/TbPayrollprocessController/tpl_update.do",
                        type: "post",
                        data: {
                            processId: id,
                            state: state
                        }
                    }).always(function () {
                        TbPayrollprocessQuery();
                    })
                }
                else{}
            }
        }
        function update(o,u){
            $("#year1").html("");
            $("#month1").html("");
            var year1 = $(o).parent().parent().parent().children().eq((parseInt(u)+1)).children().eq(9).html();
            var month1 = $(o).parent().parent().parent().children().eq((parseInt(u)+1)).children().eq(10).html();
            var remark = $(o).parent().parent().parent().children().eq((parseInt(u)+1)).children().eq(7).html();
            for(i=0;i<11;i++){
                $(".xg"+i).val($(o).parent().parent().parent().children().eq((parseInt(u)+1)).children().eq(i).html());
            }
            $("#remark1").html(remark);
            a = new Date();
            b = a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate();
            $("#seet1").val(b+a.toLocaleTimeString());
            for (var i = a.getFullYear()-10; i < a.getFullYear()+10; i++) {
                var year = "<option value='"+i+"'>"+i+"</option>";
                $("#year1").append(year)
            }
            for (var i = 1; i < 13; i++) {
                var month = "<option value='"+i+"'>"+i+"</option>";
                $("#month1").append(month)
            }
            $("#year1 option[value='"+year1+"']").attr("selected","selected");
            $("#month1 option[value='"+month1+"']").attr("selected","selected");
        }
        function select1(u){
            var month = $(u).val();
            $("#remark1").html(month+"月份工资")
        }
        function select(u){
            var month = $(u).val();
            $("#remark").html(month+"月份工资");
        }
        /*添加薪资流程*/
        function TbPayrollprocessAdd(){
            a = new Date();
            b = a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate();
            $("#seet").val(b+a.toLocaleTimeString());
            $.ajax({
                url: "/TbPayrollprocessController/tpl_add.do",
                type: "post",
                data:$("#test_from").serialize()
            }).always(function(){
                    TbPayrollprocessQuery();
                })
        }
        /*修改薪资流程*/
        function TbPayrollprocessUpdate(){
            $.ajax({
                url: "/TbPayrollprocessController/tpl_update.do",
                type: "post",
                data:$("#update_from").serialize()
            }).always(function(){
                TbPayrollprocessQuery();
            })
        }
        /*删除薪资流程*/
        function Delete(u,i){
            var seet = $("#seet"+i).html();
            $.ajax({
                url: "/TbPayrollprocessController/tpl_delete.do",
                type: "post",
                data:{
                    seet:seet
                }
            }).always(function(){
                TbPayrollprocessQuery();
            })
        }
    </script>
</html>
