<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/27 0027
  Time: 上午 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/js-lqp/layUI/css/layui.css">
<script type="text/javascript" src="/resources/js-lqp/layUI/layui.js"></script>
<html>
<head>
    <title>Title</title>
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
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
    }

</style>
<body>
<input type="hidden" id="myuser" value="${username}">
<legend><center>招聘计划操作</center></legend>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    详情信息
                </h4>
            </div>
            <div class="modal-body">
                <div style="border: 1px solid #9c9c9c;">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">编号</td>
                            <td class="td2 xq0"></td>

                        </tr><tr>
                        <td class="td1">招聘名称</td>
                        <td class="td2 xq1"></td>
                        <td class="td1">招聘渠道</td>
                        <td class="td2 xq2"></td>
                    </tr>
                        <tr>
                            <td class="td1">开始时间</td>
                            <td class="td2 xq3"></td>
                            <td class="td1">结束时间</td>
                            <td class="td2 xq4"></td>
                        </tr><tr>
                        <td class="td1">预算费用</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">招聘说明</td>
                        <td class="td2 xq6"></td>
                    </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<button class="btn btn-primary" data-toggle="modal" id="myuser1" data-target="#myModa2">新建计划录入</button>
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
                        新建计划
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                           <td class="td1">计划名称：</td>
                            <td class="td2"><input type="text" class="form-control" name="planName" placeholder="请输入计划名称"></td>
                        </tr>
                        <tr>
                            <td class="td1">招聘渠道：</td>
                            <td class="td2">
                                <select class="form-control" name="dictionaryId">
                                    <option value="">---请选择---</option>
                                    <option value="招聘市场">招聘市场</option>
                                    <option value="自招">自招</option>
                                    <option value="人员介绍">人员介绍</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                            <td class="td1">开始时间：</td>
                            <td class="td2"><input type="date" class="form-control" name="startTime"  placeholder="请输入合同编号"></td>
                        </tr>
                        <tr>
                            <td class="td1">结束时间：</td>
                            <td class="td2"><input type="date" class="form-control" name="endTime"  id="endTimeplan"></td>
                            <td class="td1">预算费用：</td>
                            <td class="td2"><input type="text" class="form-control" name="budget"  id="budgetplan" onclick="dateooo()"></td>
                        </tr>
                        <tr>
                            <td class="td1">招聘说明：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="planInstructions"  rows="3"></textarea>
                            </td>
                        </tr>

                        <tr>
                            <td class="td1">审批状态：</td>
                            <td class="td2">

                                <select class="form-control" name="approvalStatus">
                                    <option value="0">待审批</option>

                                </select>
                            </td>
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
                        修改计划
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">编号：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="planId" disabled="disabled" placeholder="请选择雇员"></td>
                             </tr>
                        <tr>
                            <td class="td1">计划名称：</td>
                            <td class="td2"><input type="text" class="form-control xg1" name="planName" placeholder="请输入公司名"></td>
                            <td class="td1">招聘渠道：</td>
                            <td class="td2"><input type="text" class="form-control xg2" name="dictionaryId" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">开始时间：</td>
                            <td class="td2"><input type="text" class="form-control xg3" name="startTime" placeholder="请输入公司名"></td>
                            <td class="td1">结束时间：</td>
                            <td class="td2"><input type="text" class="form-control xg4" name="endTime" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">预算费用：</td>
                            <td class="td2"><input type="text" class="form-control xg5" name="budget" placeholder="请输入公司名"></td>
                            <td class="td1">招聘说明：</td>
                            <td class="td2"><input type="text" class="form-control xg6" name="planInstructions" placeholder="合同类型"></td>
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
</body>
<script>
    $(TdStaffQuery());
    function TdStaffQuery(){
        $.ajax({
            url:"/Plan/selectThem",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>计划名称</td>" +
                    "<td>招聘渠道（字典）</td>" +
                    "<td>开始时间</td>" +
                    "<td>结束时间</td>" +
                    "<td>预算费用</td>" +
                    "<td>招聘说明</td>" +
                    "<td colspan='3'>操作</td></tr>";
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].PlanID//编号
                        +"</td><td>"+data.list[i].planName//计划名称
                        +"</td><td>"+data.list[i].dictionaryID//招聘渠道
                        +"</td><td>"+data.list[i].startTime//开始时间
                        +"</td><td>"+data.list[i].endTime//结束时间
                        +"</td><td>"+data.list[i].budget//预算费用
                        +"</td><td>"+data.list[i].PlanInstructions//招聘说明
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>修改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdConfigDelete(this)'class='btn btn-primary'  ' type='button' value='"+data.list[i].PlanID+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $(function(){
        $.ajax({
            url:"/Plan/selectPlan",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select").html("");
                $("#select1").html("");
                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].empId+"'>"+data[i].empName+"</option>"
                }
                $("#select").append(a);
                $("#select1").append(a);
            }
        })
    });
    $('body').on('click','.xiangqing',function () {
        /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<12;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    });
    $('body').on('click','.xiugai',function () {
        for(i=0;i<12;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }


    });
    function tdConfigDelete(obj){
        if(confirm("确定删除数据")) {

            $.ajax({
                url: "/Plan/deletePlan",
                type: "post",
                data: {planId: $(obj).val()},
                dataType: "json"
            }).always(function () {
                TdStaffQuery();
            })
        }
    }
    function TSetaffAdd(){
        alert($("#test_from").serialize());
        $.ajax({
            url:"/Plan/insertPlanAdd",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    $(function () {
        // 绑定单击事件
        $('#myuser1').click(function () {
            // 获取文本框的值
            var value = $('#myuser').val();
            // 设置文本框的值
            $('#myuser2').val(value+":");
        });
    });
    function TSetaffUpdate(){
        alert($("#xiugai_from").serialize());
        $.ajax({
            url:"/Plan/updatepeopleAdd",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }

</script>
<script>
   /* function dateooo() {
        var time_1 = document.getElementById('endTimeplan').value;
        var time_2 = document.getElementById('budgetplan').value;
       if (time_1>time_2) {
           alert("时间输入错误！！！")
           return false;
       }else {
           return true;
       }
    }*/

</script>
</html>
