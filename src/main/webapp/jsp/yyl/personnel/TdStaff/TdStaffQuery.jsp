<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/23
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合同查询</title>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    详情信息
                </h4>
            </div>
            <div class="modal-body">
                <table cellspacing="0"cellpadding="0">
                    <tr>
                        <td class="td1">姓名</td>
                        <td class="td2 xq0"></td>
                        <td class="td1">角色</td>
                        <td class="td2 xq2"></td>
                    </tr><tr>
                        <td class="td1">合同类型</td>
                        <td class="td2 xq3"></td>
                        <td class="td1">签署公司</td>
                        <td class="td2 xq4"></td>
                    </tr><tr>
                        <td class="td1">合同生效日期</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">合同到期日期</td>
                        <td class="td2 xq6"></td>
                    </tr><tr>
                        <td class="td1">登记时间</td>
                        <td class="td2 xq7"></td>
                        <td class="td1">合同编号</td>
                        <td class="td2 xq8"></td>
                    </tr><tr>
                        <td class="td1">合同期限：</td>
                        <td class="td2 xq9"></td>
                    </tr><tr>
                        <td class="td1">备注</td>
                        <td class="td2 xq10" colspan="3"></td>
                    </tr><tr>
                        <td class="td1">合同签订日期</td>
                        <td class="td2 xq11"></td>
                        <td class="td1">最后修改时间</td>
                        <td class="td2 xq12"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<button class="btn btn-primary" data-toggle="modal" data-target="#myModa2">新建合同</button>
<%--<form id="tj_tdquery"><input type="text" name="persoId"><button onclick="TdStaffQuery()">查询</button></form>--%>
<%--查询合同--%>
<div id="tdquery"></div>
<%--新建合同--%>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    新建合同
                </h4>
            </div>
            <div class="modal-body">

                        <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                            <tr>
                                <td class="td1">雇员：</td><td class="display_none"><input class="persoId" name="persoId"></td>
                                <td class="td2"><input type="text" class="form-control tbPersoninfoQuery persName" name="" placeholder="请选择雇员"></td>
                                <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa5' style="cursor:pointer;" onclick="diosn()">+选择</a></td>
                                <td class="td1">合同编号：</td>
                                <td class="td2"><input type="text" class="form-control" name="staffContractNo" placeholder="请输入合同编号"></td>
                            </tr>
                            <tr>
                                <td class="td1">合同签约公司：</td>
                                <td class="td2" colspan="2">
                                    <select class="form-control" name="contractEnterpries">
                                        <option value="蓝天集团">蓝天集团</option>
                                    </select>
                                </td>
                                <td class="td1">合同类型：</td>
                                <td class="td2">
                                    <select class="form-control" name="conTractType">
                                        <option value="固定合同">固定合同</option>
                                        <option value="临时合同">临时合同</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="td1">合同签订日期：</td>
                                <td class="td2" colspan="2"><input type="date" class="form-control" name="makeContract"></td>
                                <td class="td1">合同生效日期：</td>
                                <td class="td2"><input type="date" class="form-control" id="probationEffectiveDate1" name="probationEffectiveDate"></td>
                            </tr>
                            <tr>
                                <td class="td1">合同终止日期：</td>
                                <td class="td2" colspan="2"><input type="date" class="form-control" onblur="dateap1()" id="contractEndTime1" name="contractEndTime" placeholder="请输入名称"></td>
                                <td class="td1">合同期限</td>
                                <td class="td2"><input type="text" class="form-control" id="activePeriod1" name="activePeriod" value=""></td>
                            </tr>
                            <tr>
                                <td class="td1">提醒人员：</td>
                                <td class="td2" colspan="2"><input type="text" class="form-control" name="remindUser" placeholder="请输入名称"></td>
                                <td class="td1">登记时间：</td>
                                <td class="td2"><input type="text" class="form-control date" name="addTime" value=""></td>
                            </tr>
                            <tr>
                                <td class="td1">附件：</td>
                                <td class="td2" colspan="5"><textarea class="form-control"name="adjunct"></textarea></td>
                            </tr>
                            <tr>
                                <td class="td1">备注：</td>
                                <td class="td2" colspan="5"><textarea class="form-control"name="remark"></textarea></td>
                                <td class="td1 display_none"><input type="text" class="form-control date" name="lastUpdateTime" value=""></td>
                            </tr>
                        </table>

                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffAdd()">保存
                </button>
            </div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="xiugai_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        修改合同
                    </h4>
                </div>
                <div class="modal-body">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr><td class="display_none"><input type="text" class="xg16 " name="contractId"></td>
                            <td class="td1">雇员：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="persoId" placeholder="请选择雇员"></td>
                            <td class="td1">合同编号：</td>
                            <td class="td2"><input type="text" class="form-control xg8" name="staffContractNo" placeholder="请输入合同编号"></td>
                        </tr>
                        <tr>
                            <td class="td1">合同签约公司：</td>
                            <td class="td2"><input type="text" class="form-control xg4" name="contractEnterpries" placeholder="请输入公司名"></td>
                            <td class="td1">合同类型：</td>
                            <td class="td2"><input type="text" class="form-control xg3" name="conTractType" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">合同签订日期：</td>
                            <td class="td2"><input type="date" class="form-control xg11" name="makeContract"></td>
                            <td class="td1">合同生效日期：</td>
                            <td class="td2"><input type="date" class="form-control xg5" id="probationEffectiveDate2" name="probationEffectiveDate"></td>
                        </tr>
                        <tr>
                            <td class="td1">合同终止日期：</td>
                            <td class="td2"><input type="date" class="form-control xg13" onblur="dateap2()" id="contractEndTime2" name="contractEndTime" placeholder="请输入名称"></td>
                            <td class="td1">合同期限</td>
                            <td class="td2"><input type="text" class="form-control xg9" id="activePeriod2" name="activePeriod" value=""></td>
                        </tr>
                        <tr>
                            <td class="td1">提醒人员：</td>
                            <td class="td2"><input type="text" class="form-control xg14" name="remindUser" placeholder="请输入名称"></td>
                            <td class="td1">登记时间：</td>
                            <td class="td2"><input type="text" class="form-control xg7 date" name="addTime" value=""></td>
                        </tr>
                        <tr>
                            <td class="td1">附件：</td>
                            <td class="td2" colspan="4"><input type="text" class="form-control xg15"name="adjunct"></td>
                        </tr>
                        <tr>
                            <td class="td1">备注：</td>
                            <td class="td2" colspan="4"><input type="text" class="form-control xg10"name="remark"></td>
                            <td class="td1 display_none"><input type="text" class="form-control date" name="lastUpdateTime" value=""></td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffUpdate()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<!-- 人员选择模态框（Modal） -->
<div class="modal fade" id="myModa5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    选择
                </h4>
            </div>
            <div class="modal-body">
                <div style="height: 400px;width: 100%">
                    <div id="bumen_left1" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>选择</td></tr>
                        </table>
                    </div>
                    <div id="danwei_body1" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>部门</td></tr>
                        </table>
                    </div>
                    <div id="danwei_reght1" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>人员</td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(TdStaffQuery())
    $(date1())
    function date1(){
            a = new Date();
            $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
        }

    function TdStaffQuery(){
        $.ajax({
            url:"/TdStaffController/td_squery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td>姓名</td><td>部门</td><td>岗位</td><td>合同类型</td><td>签署公司</td>" +
                    "<td>合同生效日期</td><td>合同到期日期</td><td colspan='3'>操作</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    var c = new Date(data[i].contractEndTime).valueOf()
                    var d = new Date().valueOf()
                    var e = "&nbsp;"
                        if(d>c){
                            var e = "<b style='color: red;'>已到期</b>"
                            var xu = "<button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>修改</buuton>";
                            var san = "<button onclick='tdConfigDelete(this)'class='btn btn-primary' type='button' value='"+data[i].contractId+"'>删除</button>";
                        }else{
                            var xu = "";
                            var san = "";
                        }
                    a+="<tr><td>"+data[i].PersonName//姓名
                        +"</td><td>"+data[i].DeptName//部门
                        +"</td><td>"+data[i].POSIName//岗位
                        +"</td><td>"+data[i].conTractType//合同类型
                        +"</td><td>"+data[i].contractEnterpries//签署公司
                        +"</td><td>"+data[i].probationEffectiveDate//合同生效日期
                        +"</td><td>"+data[i].contractEndTime+e//合同到期日期
                        +"</td>"
                        +"<td class='display_none'>"+data[i].addTime//登记时间
                        +"</td><td class='display_none'>"+data[i].staffContractNo//合同编号
                        +"</td><td class='display_none'>"+data[i].probationEffectiveDate//合同期限
                        +"</td><td class='display_none'>"+data[i].remark//备注
                        +"</td><td class='display_none'>"+data[i].makeContract//合同签订日期
                        +"</td><td class='display_none'>"+data[i].lastUpdateTime//最后修改时间
                        +"</td><td class='display_none'>"+data[i].contractEndTime//合同终止日期
                        +"</td><td class='display_none'>"+data[i].remindUser//提醒人员
                        +"</td><td class='display_none'>"+data[i].adjunct//附件
                        +"</td><td class='display_none'>"+data[i].contractId//ID
                        +"</td><td style='text-align: right'><button class='btn btn-primary xiangqing' value='"+i+"' data-toggle='modal' data-target='#myModal'>详细信息</buuton>"
                        +"</td><td>"+xu
                        +"</td><td style='text-align: left'>"+san
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $('body').on('click','.xiangqing',function () {
        for(i=0;i<15;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    })
    $('body').on('click','.xiugai',function () {
        for(i=0;i<17;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

    })
    function tdConfigDelete(obj){
        $.ajax({
            url:"/TdStaffController/td_delete.do",
            type:"post",
            data:{contractId:$(obj).val()},
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffAdd(){
        $.ajax({
            url:"/TdStaffController/td_sadd.do",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffUpdate(){
        $.ajax({
            url:"/TdStaffController/td_update.do",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function dateap1(){
        var a = new Date($("#probationEffectiveDate1").val());
        var b = new Date($("#contractEndTime1").val());
        var c = b.getFullYear()*365-a.getFullYear()*365+(b.getMonth()+1)*30-(a.getMonth()+1)*30+b.getDate()-a.getDate();
        var d;
        if(c>=365){
             d = Math.round(c/365)+"年"
            $("#activePeriod1").val(d)
        }else if(365>c&&c>=30){
            d = Math.round(c/30)+"月"
            $("#activePeriod1").val(d)
        }else if (30>c&&c>0){
             d = c+"天"
            $("#activePeriod1").val(d)
        }
    }
    function dateap2(){
        var a = new Date($("#probationEffectiveDate2").val());
        var b = new Date($("#contractEndTime2").val());
        var c = b.getFullYear()*365-a.getFullYear()*365+(b.getMonth()+1)*30-(a.getMonth()+1)*30+b.getDate()-a.getDate();
        var d;
        if(c>=365){
            d = Math.round(c/365)+"年"
            $("#activePeriod2").val(d)
        }else if(365>c&&c>=30){
            d = Math.round(c/30)+"月"
            $("#activePeriod2").val(d)
        }else if (30>c&&c>0){
            d = c+"天"
            $("#activePeriod2").val(d)
        }
    }
    /*-------------------*/
    function diosn(){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:1},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>选择</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].DeptId+"</td>"
                        +"<td class='diosn' onclick='choice2(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#bumen_left1").html(a+="</tablel>")
            }
        })
    }
    function choice2(u,y){
        $(".diosn").css("background-color","#fff");
        $(u).css("background-color","#9acfea");
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:y},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>部门</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].DeptId+"</td>"
                        +"<td class='choice2' onclick='shoh2(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#danwei_body1").html(a+="</tablel>")
            }
        }).always(function(){
            $.ajax({
                url:"/TbDeparmentController/tbSPquery.do",
                type:"post",
                data:{deptNumber : y},
                dataType:"json",
                success:function(data){
                    var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                        "<tr style='font-weight:800;'><td style='background-color: #efefef;'>人员</td></tr>"
                    for (var i = 0; i < data.length ; i++) {
                        a+="<tr><td class='display_none'>"+data[i].persoId+"</td>"
                            +"<td><button type='button' onclick='han2(this,"+data[i].persoId+")' value='"+1+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].PersonName+"</button></td></tr>"
                    }
                    $("#danwei_reght1").html(a+="</tablel>")
                }
            })
        })
    }
    function shoh2(u,d){
        $(".choice2").css("background-color","#fff");
        $(u).css("background-color","#9acfea");
        $.ajax({
            url:"/TbDeparmentController/tbSPquery2.do",
            type:"post",
            data:{deptId : d},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>人员</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].persoId+"</td>"
                        +"<td><button type='button' onclick='han2(this,"+data[i].persoId+")' value='"+1+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].PersonName+"</button></td></tr>"
                }
                $("#danwei_reght1").html(a+="</tablel>")
            }
        })
    }
    function han2(u,a){
        $(".persName").val($(u).html())
        $(".persoId").val(a)
    }
</script>
</html>
