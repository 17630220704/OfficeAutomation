<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/29
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事调动</title>
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
<button type="button" class="btn btn-primary" data-toggle="modal" data-target='#myModa3'>新建人事调动</button>
<%--查询人事调动--%>
<div id="tdquery"></div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    调动详情
                </h4>
            </div>
            <div class="modal-body">
                <table cellspacing="0"cellpadding="0">
                    <tr>
                        <td class="td1">姓名</td>
                        <td class="td2 xq1"></td>
                        <td class="td1">调动类型</td>
                        <td class="td2 xq2"></td>
                    </tr><tr>
                        <td class="td1">调动日期</td>
                        <td class="td2 xq3"></td>
                        <td class="td1">调动生效日期</td>
                        <td class="td2 xq4"></td>
                    </tr><tr>
                        <td class="td1">调动前单位</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">调动后单位</td>
                        <td class="td2 xq6"></td>
                    </tr><tr>
                        <td class="td1">调动前部门</td>
                        <td class="td2 xq7"></td>
                        <td class="td1">调动后部门</td>
                        <td class="td2 xq8"></td>
                    </tr><tr>
                        <td class="td1">经办人</td>
                        <td class="td2 xq10"></td>
                        <td class="td1">修改时间</td>
                        <td class="td2 xq11"></td>
                    </tr><tr>
                        <td class="td1">调动原因</td>
                        <td class="td2 xq9" colspan="3"></td>
                    </tr><tr>
                        <td class="td1">附件</td>
                        <td class="td2 xq12" colspan="3"></td>
                    </tr><tr>
                        <td class="td1">备注</td>
                        <td class="td2 xq13" colspan="3"></td>
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
<!-- 修改人事调动，模态框（Modal） -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="xiugai_from">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    修改人事调动
                </h4>
            </div>
            <div class="modal-body">
                <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                    <tr><td class="display_none"><input type="text" class="xg0" name="transferId"></td>
                        <td class="td1">调动人员：</td>
                        <td class="td2"><input type="text" class="form-control xg14" name="persoId" placeholder="请选择雇员"></td>
                        <td class="td1">调动类型：</td>
                        <td class="td2" colspan="2">
                            <select name="transferType" id="w">
                                <option value="平调">平调</option>
                                <option value="晋升">晋升</option>
                                <option value="降级">降级</option>
                                <option value="其他">其他</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">调动日期：</td>
                        <td class="td2"><input type="date" class="form-control xg3" name="transferDate" placeholder="请输入公司名"></td>
                        <td class="td1">调动生效日期：</td>
                        <td class="td2" colspan="2"><input type="date" class="form-control xg4" name="transferEffectiveDate" placeholder="合同类型"></td>
                    </tr>
                    <tr>
                        <td class="td1">调动前单位：</td>
                        <td class="td2"><input type="text" class="form-control xg5" name="tranCompanyBefore"></td>
                        <td class="td1">调动后单位：</td><input class="posiId display_none" name="posiId">
                        <td class="td2"><input type="text" class="form-control xg6 tranDeptBefore" name="tranDeptBefore"></td>
                        <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa4' style="cursor:pointer;" onclick="choice()">+选择</a></td>
                    </tr>
                    <tr>
                        <td class="td1">调动前部门：</td>
                        <td class="td2"><input type="text" class="form-control xg7" name="tranCompanyAfter" placeholder="请输入名称"></td>
                        <td class="td1">调动后部门</td>
                        <td class="td2" colspan="2"><input type="text" class="form-control xg8 tranDeptAfter" name="tranDeptAfter" value=""></td>
                    </tr>
                    <tr>
                        <td class="td1">修改时间：</td>
                        <td class="td2"><input type="text" class="form-control xg11"name="updateTime"></td>
                        <td class="td1">经办人：</td>
                        <td class="td2" colspan="2"><input type="text" class="form-control xg10" name="responsiblePerson" value=""></td>
                    </tr>
                    <tr>
                        <td class="td1">调动原因：</td>
                        <td class="td2" colspan="4"><input type="text" class="form-control xg9" name="tranReason" placeholder="请输入名称"></td>
                    </tr>
                    <tr>
                        <td class="td1">附件：</td>
                        <td class="td2" colspan="4"><input type="text" class="form-control xg12"name="attachmentName"></td>
                    </tr>
                    <tr>
                        <td class="td1">备注：</td>
                        <td class="td2" colspan="4"><input type="text" class="form-control xg13"name="remark"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TdTransfrUpdate()">提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<!-- 新建人事调动，模态框（Modal） -->
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px">
        <form id="ttadd_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        新建人事调动
                    </h4>
                </div>
                <div class="modal-body">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">调动人员：</td><td class="display_none"><input class="persoId" name="persoId"></td>
                            <td class="td2"><input type="text" class="form-control tbPersoninfoQuery persName" name="" placeholder="请选择雇员"></td>
                            <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa5' style="cursor:pointer;" onclick="diosn()">+选择</a></td>
                            <td class="td1">调动类型：</td>
                            <td class="td2" colspan="2">
                                <select name="transferType">
                                    <option value="平调">平调</option>
                                    <option value="晋升">晋升</option>
                                    <option value="降级">降级</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">调动日期：</td>
                            <td class="td2" colspan="2"><input type="date" class="form-control" name="transferDate" placeholder="请输入公司名"></td>
                            <td class="td1">调动生效日期：</td>
                            <td class="td2" colspan="2"><input type="date" class="form-control" name="transferEffectiveDate" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">调动前单位：</td>
                            <td class="td2" colspan="2"><input type="text" class="form-control tranCompanyBefore" name="tranCompanyBefore"></td>
                            <td class="td1">调动后单位：</td><input class="posiId display_none" name="posiId">
                            <td class="td2"><input type="text" class="form-control tranDeptBefore" name="tranDeptBefore" width="100px"></td>
                            <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa4' style="cursor:pointer;" onclick="choice()">+选择</a></td>
                        </tr>
                        <tr>
                            <td class="td1">调动前部门：</td>
                            <td class="td2" colspan="2"><input type="text" class="form-control tranCompanyAfter" name="tranCompanyAfter" placeholder="请输入名称"></td>
                            <td class="td1">调动后部门</td>
                            <td class="td2" colspan="2"><input type="text" class="form-control tranDeptAfter" name="tranDeptAfter" value=""></td>
                        </tr>
                        <tr>
                            <td class="td1">修改时间：</td>
                            <td class="td2" colspan="2"><input type="text" class="form-control date" name="updateTime"></td>
                            <td class="td1">经办人：</td>
                            <td class="td2" colspan="2"><input type="text" class="form-control" name="responsiblePerson" value=""></td>
                        </tr>
                        <tr>
                            <td class="td1">调动原因：</td>
                            <td class="td2" colspan="5"><input type="text" class="form-control" name="tranReason" placeholder="请输入名称"></td>
                        </tr>
                        <tr>
                            <td class="td1">附件：</td>
                            <td class="td2" colspan="5"><input type="text" class="form-control"name="attachmentName"></td>
                        </tr>
                        <tr>
                            <td class="td1">备注：</td>
                            <td class="td2" colspan="5"><input type="text" class="form-control"name="remark"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TdTransfrAdd()">提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModa4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    选择
                </h4>
            </div>
            <div class="modal-body">
                <div style="height: 400px;width: 100%">
                    <div id="bumen_left" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>部门</td></tr>
                        </table>
                    </div>
                    <div id="danwei_body" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>部门</td></tr>
                        </table>
                    </div>
                    <div id="danwei_reght" class="div">
                        <table class='table table-striped' style='text-align: center;font-size: 12px'>
                            <tr style='font-weight:800;'><td>单位</td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
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
                            <tr style='font-weight:800;'><td>部门</td></tr>
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
    $(TdTransferQuery())
    $(date1())
    function date1(){
        a = new Date();
        $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
    }
    function TdTransferQuery(){
        $.ajax({
            url:"/TdTransfrController/tt_query.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td>调动人员</td><td>调动类型</td><td>调动日期</td><td>生效日期</td><td colspan='3'>操作</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].TRANSFER_ID//ID自增
                        +"</td><td>"+data[i].PersonName//调动人员
                        +"</td><td>"+data[i].TRANSFER_TYPE//调动类别
                        +"</td><td>"+data[i].TRANSFER_DATE//调动日期
                        +"</td><td>"+data[i].TRANSFER_EFFECTIVE_DATE//生效日期
                        +"</td><td class='display_none'>"+data[i].TRAN_COMPANY_BEFORE//调前单位
                        +"</td><td class='display_none'>"+data[i].TRAN_DEPT_BEFORE//调前部门
                        +"</td><td class='display_none'>"+data[i].TRAN_COMPANY_AFTER//调后单位
                        +"</td><td class='display_none'>"+data[i].TRAN_DEPT_AFTER//调后部门
                        +"</td><td class='display_none'>"+data[i].TRAN_REASON//调动原因
                        +"</td><td class='display_none'>"+data[i].RESPONSIBLE_PERSON//经办人
                        +"</td><td class='display_none'>"+data[i].UPDATE_TIME//修改时间
                        +"</td><td class='display_none'>"+data[i].ATTACHMENT_NAME//附件
                        +"</td><td class='display_none'>"+data[i].REMARK//备注
                        +"</td><td class='display_none'>"+data[i].persoId//调动人员ID
                        +"</td><td style='text-align: right'><button class='btn btn-primary' value='"+i+"' onclick='xiangqing(this)' data-toggle='modal' data-target='#myModal'>详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' onclick='xiugai(this)' data-toggle='modal' data-target='#myModa2'>修改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdTransferDelete(this)'class='btn btn-primary' type='button' value='"+data[i].TRANSFER_ID+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    function xiangqing(u){
        for(i=0;i<15;i++){
            $(".xq"+i).html($(u).parent().parent().parent().children().eq((parseInt($(u).val())+1)).children().eq(i).html());
        }
    }
    function xiugai(u){
        for(i=0;i<15;i++){
            $(".xg"+i).val($(u).parent().parent().parent().children().eq((parseInt($(u).val()+1))).children().eq(i).html());
        }
        var a = $(u).parent().parent().parent().children().eq((parseInt($(u).val()+1))).children().eq(2).html();
        $("#w option[value='"+a+"']").attr("selected","selected");
    }
    function TdTransfrUpdate(){
        $.ajax({
            url:"/TdTransfrController/tt_update.do",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdTransferQuery();
        })
    }
    function TdTransfrAdd(){
        $.ajax({
            url:"/TdTransfrController/tt_add.do",
            type:"post",
            data:$("#ttadd_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdTransferQuery();
        })
    }
    function tdTransferDelete(u){
        if(confirm("确认要删除这条记录？")){
            $.ajax({
                url:"/TdTransfrController/tt_delete.do",
                type:"post",
                data:{transferId:$(u).val()},
                dataType:"json"
            }).always(function(){
                TdTransferQuery();
            })
        }else{

        }
    }
    /*----------------------------------*/
    function TbDeparmentquery(){
        $.ajax({
            url:"/TbPersoninfoController/tpquery.do",
            type:"post",
            data:{
                persoId:$(".persoId").val()
            },
            dataType:"json",
            success:function(data){
                $(".tranCompanyBefore").val(data[0].POSIName)
                $(".tranCompanyAfter").val(data[0].DeptName)
            }
        })
    }
    function choice(){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:1},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>部门</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].DeptId+"</td>"
                    +"<td class='choice' onclick='choice1(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#bumen_left").html(a+="</tablel>")
            }
        })
    }
    function choice1(u,y){
        $(".choice").css("background-color","#fff");
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
                        +"<td class='choice1' onclick='shoh(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#danwei_body").html(a+="</tablel>")
            }
        })
    }
    function shoh(u,d){
        $(".choice1").css("background-color","#fff");
        $(u).css("background-color","#9acfea");
        $.ajax({
            url:"/TbPositionController/tbPquery.do",
            type:"post",
            data:{deptId : d},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>单位</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].PosiId+"</td>"
                        +"<td><button type='button' onclick='han(this,"+data[i].PosiId+")' value='"+$(u).html()+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].POSIName+"</button></td></tr>"
                }
                $("#danwei_reght").html(a+="</tablel>")
            }
        })
    }
    function han(u,a){
        $(".tranDeptBefore").val($(u).html())
        $(".tranDeptAfter").val($(u).val())
        $(".posiId").val(a)
    }
    /*---------------------------*/
    function diosn(){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:1},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>部门</td></tr>"
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
                url:"/TbDeparmentController/tbDPquery.do",
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
            url:"/TbDeparmentController/tbDPquery2.do",
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
        TbDeparmentquery();
    }
</script>
</html>
