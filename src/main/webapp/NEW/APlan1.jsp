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
<link rel="stylesheet" href="../layUI/css/layui.css">
<script type="text/javascript" src="../layUI/layui.js"></script>
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
<STYLE>
    #table input {
        text-align: right;
    }
</STYLE>
<body>
<a href="../Html.jsp">首页</a>
<input type="text" id="myuser" value="小路">
<legend><center>招聘计划小组团队录入</center></legend>
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
                            <td class="td1">人才</td>
                            <td class="td2 xq1"></td>
                        </tr><tr>
                        <td class="td1">招聘名称</td>
                        <td class="td2 xq2"></td>
                        <td class="td1">招聘渠道</td>
                        <td class="td2 xq3"></td>
                    </tr>
                        <tr>
                            <td class="td1">开始时间</td>
                            <td class="td2 xq4"></td>
                            <td class="td1">结束时间</td>
                            <td class="td2 xq5"></td>
                        </tr><tr>
                        <td class="td1">预算费用</td>
                        <td class="td2 xq6"></td>
                        <td class="td1">招聘说明</td>
                        <td class="td2 xq7"></td>
                    </tr><tr>
                        <td class="td1">招聘备注</td>
                        <td class="td2 xq8"></td>
                        <td class="td1">招聘提醒</td>
                        <td class="td2 xq9"></td>
                    </tr><tr>
                        <td class="td1">审批状态</td>
                        <td class="td2 xq10"></td>
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

<div id="tdquery"></div>
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

                    <table cellspacing="0"cellpadding="0" border="0xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">编号：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="planId" placeholder="请选择雇员"></td>
                            </tr>
                        <tr>
                            <td class="td1">招聘备注：</td>
                            <td >
                                <div style="margin-left: 30%; width: 50%; float: left;">

                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button type="button" class="layui-btn layui-btn-warm tjry">添加人员</button>
                                            <input type="text" name="planNote" lay-verify="required" readonly="readonly" autocomplete="off"  placeholder="人员"
                                                   class="layui-input userId"    style="width:200px">
                                            <%--  <input type="text" class="userIds b12" value="" style="display:none;">--%>
                                            <!--触发模态框按钮-->

                                        </div>
                                    </div>
                                </div>
                              </td>
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
<!-- 模态框（Modal） -->
<div id="mtk3" style="display: none;" class="modal-content">
    <div class="modal-body">
        <div class="col-xs-2" >
            <select name="from1" id="from1" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-3" >
            <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-2">
            <button type="button" id="addAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
            <button type="button" id="addOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
            <button type="button" id="removeOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
            <button type="button" id="removeAll" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>
        </div>
        <div class="col-xs-5">
            <select name="to" id="to" multiple="multiple" class="form-control" size="8" style="height:150px"></select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default mtk3-gb" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary mtk3-qr">确认选择</button>
    </div>
</div><!-- /.modal-content -->
</body>
<script>
    $(TdStaffQuery())
    function TdStaffQuery(){
        $.ajax({
            url:"/Plan/selectAll",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>人才</td>" +
                    "<td>计划名称</td>" +
                    "<td>招聘渠道（字典）</td>" +
                    "<td>开始时间</td>" +
                    "<td>结束时间</td>" +
                    "<td>预算费用</td>" +
                    "<td>招聘说明</td>" +
                    "<td>招聘备注</td>" +
                    "<td>招聘提醒</td>" +
                    "<td>招聘状态</td>" +
                    "<td colspan='3'>操作</td></tr>"
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].PlanID//编号
                        +"</td><td>"+data.list[i].empName//人才
                        +"</td><td>"+data.list[i].planName//计划名称
                        +"</td><td>"+data.list[i].dictionaryID//招聘渠道
                        +"</td><td>"+data.list[i].startTime//开始时间
                        +"</td><td>"+data.list[i].endTime//结束时间
                        +"</td><td>"+data.list[i].budget//预算费用
                        +"</td><td>"+data.list[i].PlanInstructions//招聘说明
                        +"</td><td>"+data.list[i].PlanNote//招聘备注
                        +"</td><td>"+data.list[i].NoteRemind//招聘提醒
                        +"</td><td>"+data.list[i].approvalStatus//招聘状态
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>小组录入</buuton>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $('body').on('click','.xiangqing',function () {
        /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<12;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    })
    $('body').on('click','.xiugai',function () {
        for(i=0;i<12;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }


    })
    function TSetaffUpdate(){
        alert($("#xiugai_from").serialize())
        $.ajax({
            url:"/Plan/updatepeople",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    /*mtk3 模态框3的一些事件  */
    $(".tjry").click(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['50%', '38%'],//定义宽和高
                planNote: '设置班次',//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#mtk3') //打开的内容
                /*content: 'index.jsp'//打开的内容 type为2*/
            });
        })
    })
    $(".mtk3-gb").click(function(){
        layer.close(layer.index);
    })
    $(".mtk3-qr").click(function(){
        var option = $("#to option").map(function(){
            return $(this).val();
        }).get().join(",");
        var optionText = $("#to option").map(function(){
            return $(this).html();
        }).get().join(",");
        $("#to option").clone().appendTo("#from");
        $("#to option").remove();
        $(".userId").val(optionText);
        $(".userIds").val(option);
        layer.close(layer.index);
    })
    /*！mtk3 模态框3的一些事件  */



    //选择一项
    $("#addOne").click(function(){
        $("#from option:selected").clone().appendTo("#to");
        $("#from option:selected").remove();
    });
    //选择全部
    $("#addAll").click(function(){
        $("#from option").clone().appendTo("#to");
        $("#from option").remove();
    });
    //移除一项
    $("#removeOne").click(function(){
        $("#to option:selected").clone().appendTo("#from");
        $("#to option:selected").remove();
    });
    //移除全部
    $("#removeAll").click(function(){
        $("#to option").clone().appendTo("#from");
        $("#to option").remove();
    });
    $.ajax({
        url:"/aNeed/selectName",
        data:"",
        type:"post",
        dataType:"json",
        success:function(data){
            $("#from1").html("");
            var a ="";
            for(lu=0;lu<data.length;lu++){
                a+="<option class='la' value='"+data[lu].DeptId+"'>"+data[lu].DeptName+"</option>"
            }
            $("#from1").append(a);
        }
    })
    $("body").on("click",".la",function () {
        alert($(this).val())
        $.ajax({
            url:"/Plan/selectpeople",
            type:"post",
            data:{
                people:$(this).val()
            },
            dataType:"json",
            success:function(all){
                var option1 = "";
                for (i=0;i<all.list.length;i++){
                    var obj = all.list;
                    option1 += "<option value='"+obj[i].persoId+"'>"+obj[i].PersonName+"</option>";
                }
                $("#from").html(option1);
            }
        })
    })
</script>
</html>
