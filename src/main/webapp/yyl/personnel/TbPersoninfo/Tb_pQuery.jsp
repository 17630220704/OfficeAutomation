<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/25
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事查询</title>
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
<div id="body">
<form id="tj_tpquery">
    <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
        <tr>
            <td class="td1">姓名：</td>
            <td class="td2"><input type="text" class="form-control tbPersoninfoQuery persName" id="personName" name="personName" placeholder="请选择雇员"></td>
            <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa5' style="cursor:pointer;" onclick="diosn()">+选择</a></td>
            <td class="td1">职位：</td>
            <td class="td2" id="zhiwei"></td>
        </tr>
        <tr>
            <td class="td1">手机号：</td>
            <td class="td2" colspan="2"><input type="text" class="form-control" id="telephone" name="telephone" placeholder="手机号"></td>
            <td class="td1">现住址：</td>
            <td class="td2"><input type="text" class="form-control" id="nowAddress" name="nowAddress" placeholder="现住址"></td>
        </tr>
        <tr>
            <td class="td1">是否显示离职人员：</td>
            <td class="td2" colspan="2">
                <select id="nowState" name="nowState">
                    <option value="0">不显示</option>
                    <option value="">显示</option>
                </select>
            </td>
            <td class="td1"></td>
            <td class="td2"></td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center"><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TbPersoninfoQuery()">查询</button></td>
        </tr>
    </table>
</form>
</div>
<%--查询人事档案--%>
<div id="tp_query"></div>
<!-- 人事档案详情模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px;">
        <form id="tp_update">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    人事档案详情
                </h4>
            </div>
            <div class="modal-body">
                <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                    <tr><td class="display_none"><input class="xq0" name="persoId"></td>
                        <td class="td1">姓名</td>
                        <td class="td2 xq1"></td>
                        <td class="td1">职务</td>
                        <td class="td2 xq2"></td>
                    </tr><tr>
                        <td class="td1">手机号</td>
                        <td class="td2 xq3"></td>
                        <td class="td1">办公电话</td>
                        <td class="td2 xq4"></td>
                    </tr><tr>
                        <td class="td1">生日</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">邮箱</td>
                        <td class="td2 xq6"></td>
                    </tr><tr>
                        <td class="td1">现住址</td>
                        <td class="td2 xq7"></td>
                        <td class="td1">备注</td>
                        <td class="td2 xq8"></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2"></td>
                        <td class="td1">加入黑名单</td>
                        <td class="td2"><input class="xq0" type="checkbox" name="uId" value=""></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" id="State"></div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<!-- 修改档案模态框（Modal） -->
<div class="modal fade" id="myModa8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px;">
        <form id="tp_update8">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        修改档案
                    </h4>
                </div>
                <div class="modal-body">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr><td class="display_none"><input class="xg0" name="persoId"></td>
                            <td class="td1">姓名</td>
                            <td class="td2"><input class="form-control xg9" name="personName" placeholder="姓名"></td>
                            <td class="td1">职务</td>
                            <td class="td2"><input class="form-control xg2" name="" placeholder="职务"></td>
                        </tr><tr>
                        <td class="td1">手机号</td>
                        <td class="td2"><input class="form-control xg3" name="telephone" placeholder="手机号"></td>
                        <td class="td1">办公电话</td>
                        <td class="td2"><input class="form-control xg4" name="officePhone" placeholder="办公电话"></td>
                    </tr><tr>
                        <td class="td1">生日</td>
                        <td class="td2"><input class="form-control xg5" name="personBirth" placeholder="生日"></td>
                        <td class="td1">邮箱</td>
                        <td class="td2"><input class="form-control xg6" name="email" placeholder="邮箱"></td>
                    </tr><tr>
                        <td class="td1">现住址</td>
                        <td class="td2"><input class="form-control xg7" name="nowAddress" placeholder="现住址"></td>
                        <td class="td1">备注</td>
                        <td class="td2"><input class="form-control xg8" name="remark" placeholder="备注"></td>
                    </tr>
                    </table>
                </div>
                <div class="modal-footer" id="State8"></div>
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
    $(function(){
        a = new Date();
        var b = a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate();
        }
    )
    function TbPersoninfoQuery(){
        $.ajax({
                url:"/TbPersoninfoController/tpquery.do",
                type:"post",
                data:{
                    posiId:$("#posiId").val(),
                    persoId:$("#persoId").val(),
                    personName:$("#personName").val(),
                    telephone:$("#telephone").val(),
                    nowAddress:$("#nowAddress").val(),
                    nowState:$("#nowState").val()
                },
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
                            d = "<b style='color: #20ff15;'>(在职)</b>"
                            f = "<button class='btn btn-primary' style='cursor:pointer;' data-toggle='modal' data-target='#myModal' onclick='xiangqing1(this,"+data[i].PosiId+","+i+")' value='"+data[i].persoId+"'>详细信息</button>"
                        }else if(c==2){
                            d = "<b style='color: #999;'>(待审批)</b>"
                            f = "<button class='btn btn-primary' style='cursor:pointer;' data-toggle='modal' data-target='#myModal' onclick='xiangqing1(this,"+data[i].PosiId+","+i+")' value='"+data[i].persoId+"'>详细信息</button>"
                        }else if(c==1){
                            d = "<b style='color: red;'>(离职)</b>"
                            f = "<button class='btn btn-primary' style='cursor:pointer;' data-toggle='modal' data-target='#myModal' onclick='xiangqing2(this),"+i+"' value='"+data[i].persoId+"'>详细信息</button>"
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
                        +"</td><td class='display_none'>"+data[i].PersonName//姓名+在职状态0.在职1.离职
                        +"</td><td>"+f
                        +"</td><td><button class='btn btn-primary' style='cursor:pointer;' data-toggle='modal' data-target='#myModa8' onclick='xiangqing3(this,"+data[i].PosiId+","+i+")' value='"+data[i].NowState+"'>修改</button>"
                        +"</td></tr>"
                }
                $("#tp_query").html(a+="</table>")
            }
        })
    }
    $(TbPositionQuery())
    function TbPositionQuery(){
        $.ajax({
            url:"/TbPositionController/tbPquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<select id='posiId' name='posiId'>"+
                    "<option value='0'>全部</option>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<option value='"+data[i].PosiId+"'>"+data[i].POSIName+"</option>"
                }
                $("#zhiwei").html(a+="</select>")
            }
        })
    }
    function xiangqing1(u,y,o) {
        $(".xq0").val($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(0).html());
        for(i=0;i<9;i++){
            $(".xq"+i).html($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(i).html());
        }
        var a = "<button type='button' class='btn btn-primary' data-dismiss='modal'>关闭</button>"
            +"<input id='nowState1' name='nowState' value='2' class='display_none'>&nbsp;&nbsp;&nbsp;&nbsp;"
            +"<input name='posiId' value='"+y+"' class='display_none'>&nbsp;&nbsp;&nbsp;&nbsp;"
            +"<button type='button' class='btn btn-default' onclick='tbPersoninfoUpdate()' data-dismiss='modal'  >申请离职</button>"
        $("#State").html(a);
    }
    function xiangqing2(u,o) {
        $(".xq0").val($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(0).html());
        for(i=0;i<9;i++){
            $(".xq"+i).html($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(i).html());
        }
        var a = "<button type='button' class='btn btn-primary' data-dismiss='modal'>关闭</button>"
        $("#State").html(a);
    }
    function tbPersoninfoUpdate() {
        if(confirm("确认要申请离职？")){
            $.ajax({
                url:"/TbPersoninfoController/tpupdate.do",
                type:"post",
                data:$("#tp_update").serialize(),
                dataType:"json"
            }).always(function(){
                TbPersoninfoQuery();
            })
        }else{

        }
    }
    function xiangqing3(u,y,o) {
        for(i=0;i<10;i++){
            $(".xg"+i).val($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(i).html());
        }
        var a = "<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>"
            +"<input id='nowState1' name='nowState' value='"+$(u).val()+"' class='display_none'>&nbsp;&nbsp;&nbsp;&nbsp;"
            +"<input name='posiId' value='"+y+"' class='display_none'>&nbsp;&nbsp;&nbsp;&nbsp;"
            +"<button type='button' class='btn btn-primary' onclick='tbPersoninfoUpdate8()' data-dismiss='modal'>保存</button>"
        $("#State8").html(a);
    }
    function tbPersoninfoUpdate8(){
        $.ajax({
            url:"/TbPersoninfoController/tpupdate.do",
            type:"post",
            data:$("#tp_update8").serialize(),
            dataType:"json"
        }).always(function(){
            TbPersoninfoQuery();
        })
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
    }
</script>
</html>
