<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/7
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工薪资批量设置</title>
    <link rel="stylesheet" href="/resources/js_yyl/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/js_yyl/jquery-3.1.1.min.js"></script>
    <script src="/resources/js_yyl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    .display_none{
        display: none;
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
<form id='tib_Update'>
    <table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;width: 600px'>
        <tr>
            <td colspan="2" style='font-weight:800;'>选择批量设置的人员范围</td>
        </tr>
        <tr>
            <td>按角色设置：</td>
            <td>
                <textarea name="posiId1" id="posiId" class="display_none"></textarea>
                <textarea name="" id="posiName"readonly="readonly"></textarea>
                <a data-toggle='modal' data-target='#myModa4' style="cursor:pointer;" onclick="choice()">+选择</a>
                <a style="cursor:pointer;" onclick="detle()">-清空</a>
            </td>
        </tr>
    </table>
    <table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;width: 600px'id="TpPaymentQuery">
        <tr style='font-weight:800;'><td>项目类型</td><td>金额</td></tr>
    </table>
    <table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;width: 600px'>
        <tr style='font-weight:800;'><td>保险类型</td><td>保险基数</td></tr>
        <tr><td>基本工资:</td><td><input name='perSalary' onkeyup="jisuan(this)">
        </td></tr><tr><td>个人养老:</td><td><input name='yanglaoPerson' id="yanglaoPerson" >
        </td></tr><tr><td>单位养老:</td><td><input name='yanglaoUnits' id="yanglaoUnits" >
        </td></tr><tr><td>个人医疗:</td><td><input name='yiliaoPerson' id="yiliaoPerson" >
        </td></tr><tr><td>单位医疗:</td><td><input name='yiliaoUnits' id="yiliaoUnits" >
        </td></tr><tr><td>个人失业:</td><td><input name='shiyePerson' id="shiyePerson" >
        </td></tr><tr><td>单位失业:</td><td><input name='shiyeUnits' id="shiyeUnits" >
        </td></tr><tr><td>个人住房:</td><td><input name='zhufangPerson' id="zhufangPerson" >
        </td></tr><tr><td>单位住房:</td><td><input name='zhufangUnits' id="zhufangUnits" >
        </td></tr><tr><td>单位工伤:</td><td><input name='gongshangUnits' id="gongshangUnits" >
        </td></tr><tr><td>单位生育:</td><td><input name='shengyuUnits' id="shengyuUnits">
        </td></tr><tr><td>险后:</td><td><input name='riskBack' id="riskBack">
        </td></tr><tr><td colspan='2'><button onclick='TbPersoninfoBaseUpdate(this)'class='btn btn-primary' type='button'>保存</button>
        </td></tr>
    </table></form>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModa4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="margin-top: 100px;">
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
</body>
<script>
    $(TpPaymentQuery());
    function TpPaymentQuery(){
        $.ajax({
        url:"/TbPersoninfoBaseController/tp_bquery.do",
        type:"post",
        dataType:"json",
        success:function(data){
        var tpp = data.TpPaymentlist;//薪酬项目
        var tib = data.TbInsuranceBaselist;//保险基数
        var a = "";
            var c = 0;
                for (var i = 0; i < tpp.length; i++) {
                a+="<tr><td>"+tpp[i].paymentName+"</td>"
                +"<td><input id='sheet"+i+"' name='sheet"+i+"'></td></tr>"
                }
            a+="<tr class='display_none'><td><input name='yanglaoPerson'  class='form-control yanglaoPerson' value='"+tib[0].yanglaoPerson+"'>"//
                +"</td><td><input name='yanglaoUnits' class='form-control yanglaoUnits' value='"+tib[0].yanglaoUnits+"'>"//
                +"</td><td><input name='yiliaoPerson' class='form-control yiliaoPerson' value='"+tib[0].yiliaoPerson+"'>"//
                +"</td><td><input name='yiliaoUnits' class='form-control yiliaoUnits' value='"+tib[0].yiliaoUnits+"'>"//
                +"</td><td><input name='shiyePerson' class='form-control shiyePerson' value='"+tib[0].shiyePerson+"'>"//
                +"</td><td><input name='shiyeUnits' class='form-control shiyeUnits' value='"+tib[0].shiyeUnits+"'>"//
                +"</td><td><input name='zhufangPerson' class='form-control zhufangPerson' value='"+tib[0].zhufangPerson+"'>"//
                +"</td><td><input name='zhufangUnits' class='form-control zhufangUnits' value='"+tib[0].zhufangUnits+"'>"//
                +"</td><td><input name='gongshangUnits' class='form-control gongshangUnits' value='"+tib[0].gongshangUnits+"'>"//
                +"</td><td><input name='shengyuUnits' class='form-control shengyuUnits' value='"+tib[0].shengyuUnits+"'>"//
                +"<input id='tpp_length' value='"+tpp.length+"'>"
                +"</td></tr>";
                $("#TpPaymentQuery").append(a);
            }
        })
    }
    function TbPersoninfoBaseUpdate(){
        $.ajax({
            url: "/TbPersoninfoBaseController/tp_bupdate.do",
            type: "post",
            data:$("#tib_Update").serialize()
        }).always(function () {
            alert("修改成功")
        })
    }
    function jisuan(u){
        var basicSalary =  (parseInt(u.value)/100);//员工基础工资
        var yanglaoPerson = parseInt($(".yanglaoPerson").val())*basicSalary;
        $("#yanglaoPerson").val(yanglaoPerson);
        var yanglaoUnits = parseInt($(".yanglaoUnits").val())*basicSalary;
        $("#yanglaoUnits").val(yanglaoUnits);
        var yiliaoPerson = parseInt($(".yiliaoPerson").val())*basicSalary;
        $("#yiliaoPerson").val(yiliaoPerson);
        var yiliaoUnits = parseInt($(".yiliaoUnits").val())*basicSalary;
        $("#yiliaoUnits").val(yiliaoUnits);
        var shiyePerson = parseInt($(".shiyePerson").val())*basicSalary;
        $("#shiyePerson").val(shiyePerson);
        var shiyeUnits = parseInt($(".shiyeUnits").val())*basicSalary;
        $("#shiyeUnits").val(shiyeUnits);
        var zhufangPerson = parseInt($(".zhufangPerson").val())*basicSalary;
        $("#zhufangPerson").val(zhufangPerson);
        var zhufangUnits = parseInt($(".zhufangUnits").val())*basicSalary;
        $("#zhufangUnits").val(zhufangUnits);
        var gongshangUnits = parseInt($(".gongshangUnits").val())*basicSalary;
        $("#gongshangUnits").val(gongshangUnits);
        var shengyuUnits = parseInt($(".shengyuUnits").val())*basicSalary;
        $("#shengyuUnits").val(shengyuUnits);
        var tpp_length = $("#tpp_length").val();
        var tpp = 0;
        for (let i = 0; i < tpp_length; i++) {
            if($("#sheet"+i).val()==""){
                tpp+=0;
            }else{
                tpp += parseInt($("#sheet"+i).val());
            }
        }
        var riskBack = parseInt(u.value)-(yanglaoPerson+yiliaoPerson+shiyePerson+zhufangPerson)+tpp;
        $("#riskBack").val(riskBack);
    }
    /*---------------------------*/
    function choice(){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:1},
            dataType:"json",
            success:function(data){
                var a = "<table class='table' style='text-align: center;font-size: 12px;'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>部门</td></tr>";
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
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>部门</td></tr>";
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
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>单位</td></tr>";
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].PosiId+"</td>"
                        +"<td><button type='button' onclick='han(this,"+data[i].PosiId+")' value='"+$(u).html()+"' class='btn btn-default' style='cursor:pointer;'>"+data[i].POSIName+"</button></td></tr>"
                }
                $("#danwei_reght").html(a+="</tablel>")
            }
        })
    }
    function han(u,a){
        $(u).css("display","none");
        $("#posiId").append(a+",");
        $("#posiName").append($(u).html()+",")
    }
    function detle(){
        $("#posiId").html("");
        $("#posiName").html("");
    }
</script>
</html>
