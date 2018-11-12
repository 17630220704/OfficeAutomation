<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/2
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工资条</title>
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
<div>
    <button class='btn btn-primary' onclick="TpSalarySheetUpdate()">保存</button>
</div>
<div>
    <div style="width: 100%;text-align: center;padding-left: 30%;">
        <div style="height: 200px;width: 40%;">
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
    <div>
        <div id="tpsquery"></div>
    </div>
</div>
</body>
<script>
    /*var persoId = 0;
    var id = 0;
    $(TpSalarySheetQuery(persoId,id))*/
    $(date1())
    $(diosn())
    function date1(){
        a = new Date();
        $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
    }
    function TpSalarySheetQuery(persoId,id){
        $.ajax({
            url:"/TpSalarySheetController/td_squery.do",
            type:"post",
            data:{
                persoId1:persoId
            },
            dataType:"json",
            success:function(data){
                var tps = data.TpSalarySheetlist;//工资条
                var tpp = data.TpPaymentlist;//薪酬项目
                var tpb = data.TbPersoninfoBaselist;//员工保险
                var tib = data.TbInsuranceBaselist;//保险基数
                var b = "<tr><td>批量修改</td>";
                var a = "<form id='tpsadd'><table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;'>" +
                    "<tr style='font-weight:800;'><td width='150px'>员工</td>"
                    for (var i = 0; i < tpp.length; i++) {
                        a+="<td>"+tpp[i].paymentName+"</td>"
                        b+="<td><input class='form-control' onkeyup='sheet(this,"+i+")'></td>"
                    }
                    b+="<td><input class='form-control' onkeyup='Salary(this,"+tps.length+")'>"
                        +"</td><td><input class='form-control' onkeyup='yanglaoP(this)'>"
                        +"</td><td><input class='form-control' onkeyup='yanglaoU(this)'>"
                        +"</td><td><input class='form-control' onkeyup='yiliaoP(this)'>"
                        +"</td><td><input class='form-control' onkeyup='yiliaoU(this)'>"
                        +"</td><td><input class='form-control' onkeyup='shiyeP(this)'>"
                        +"</td><td><input class='form-control' onkeyup='shiyeU(this)'>"
                        +"</td><td><input class='form-control' onkeyup='zhufangP(this)'>"
                        +"</td><td><input class='form-control' onkeyup='zhufangU(this)'>"
                        +"</td><td><input class='form-control' onkeyup='gongshangU(this)'>"
                        +"</td><td><input class='form-control' onkeyup='shengyuU(this)'>"
                        +"</td>"
                    a+="<td>工资基数</td>"
                        +"<td>个人养老</td><td>单位养老</td><td>个人医疗</td><td>单位医疗</td><td>个人失业</td><td>单位失业</td>" +
                        "<td>个人住房</td><td>单位住房</td><td>单位工伤</td><td>单位生育</td><td>险后</td>"
                    a+=b+"</tr>";
                for (var i = 0; i < id; i++) {
                    if(tps[i]!=""){
                        var c = 0 ;//险后
                        a+="<tr><td class='display_none'><input name='sheetId1' value='"+tps[i][0].sheetId+"'><input name='persoId1' value='"+tps[i][0].persoId+"'>"
                            +"</td><td>"+tps[i][0].PersonName
                        for(var j = 0;j < data.a ; j++){
                            a+="</td><td><input class='form-control sheet"+j+"' name='sheet"+j+"' value='"+eval("tps[i][0].sheet"+j)+"'>"
                            c+=parseInt(eval("tps[i][0].sheet"+j));
                        }
                        var basicSalary =  (tpb[i][0].basicSalary/100)//员工基础工资
                        a+="<input class='display_none' name='persbaseId' value='"+tpb[i][0].persbaseId+"'>"//员工保险ID
                            +"<input class='display_none' id='c"+i+"' value='"+c+"'>"//项目薪资
                            +"</td><td><input name='perSalary' class='form-control perSalary' onkeyup='effect(this,"+i+","+c+")' value='"+tpb[i][0].basicSalary+"'>"//工资基数
                            +"</td><td><input name='yanglaoPerson'  class='form-control yanglaoPerson yanglaoPerson"+i+"' value='"+intToFloat(tib[0].yanglaoPerson*basicSalary)+"'>"//
                            +"</td><td><input name='yanglaoUnits' class='form-control yanglaoUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].yanglaoUnits*basicSalary)+"'>"//
                            +"</td><td><input name='yiliaoPerson' class='form-control yiliaoPerson yanglaoPerson"+i+"' value='"+intToFloat(tib[0].yiliaoPerson*basicSalary)+"'>"//
                            +"</td><td><input name='yiliaoUnits' class='form-control yiliaoUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].yiliaoUnits*basicSalary)+"'>"//
                            +"</td><td><input name='shiyePerson' class='form-control shiyePerson yanglaoPerson"+i+"' value='"+intToFloat(tib[0].shiyePerson*basicSalary)+"'>"//
                            +"</td><td><input name='shiyeUnits' class='form-control shiyeUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].shiyeUnits*basicSalary)+"'>"//
                            +"</td><td><input name='zhufangPerson' class='form-control zhufangPerson yanglaoPerson"+i+"' value='"+intToFloat(tib[0].zhufangPerson*basicSalary)+"'>"//
                            +"</td><td><input name='zhufangUnits' class='form-control zhufangUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].zhufangUnits*basicSalary)+"'>"//
                            +"</td><td><input name='gongshangUnits' class='form-control gongshangUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].gongshangUnits*basicSalary)+"'>"//
                            +"</td><td><input name='shengyuUnits' class='form-control shengyuUnits yanglaoPerson"+i+"' value='"+intToFloat(tib[0].shengyuUnits*basicSalary)+"'>"//
                        var riskBack = tpb[i][0].basicSalary-(tib[0].yanglaoPerson*basicSalary+tib[0].yiliaoPerson*basicSalary+tib[0].shiyePerson*basicSalary+tib[0].zhufangPerson*basicSalary);
                        a+="</td><td><input name='riskBack' id='riskBack"+i+"' class='form-control' value='"+(riskBack+c)+"'>"//
                        a+="</td></tr><tr class='display_none'><td id='yanglaoPerson"+i+"'>" +tib[0].yanglaoPerson
                            +"</td><td id='yiliaoPerson"+i+"'>" +tib[0].yiliaoPerson
                            +"</td><td id='shiyePerson"+i+"'>" +tib[0].shiyePerson
                            +"</td><td id='zhufangPerson"+i+"'>" +tib[0].zhufangPerson
                            +"</td></tr>"
                    }
                }
                $("#tpsquery").html(a+="</table></form>")
            }
        })
    }
    function TpSalarySheetUpdate(){
        $.ajax({
            url:"/TpSalarySheetController/td_update.do",
            type:"post",
            data:$("#tpsadd").serialize(),
            dataType:"json",
            success:function(data){
            }
        })
    }
    function sheet(u,i){
        $(".sheet"+i).val($(u).val())
    }
    function intToFloat(o){
        return new Number(o).toFixed(2)
    }
    function effect(p,s,u) {
        var i = parseInt(s)
        var basicSalary =  (intToFloat(p.value)/100);//员工基础工资
        var yanglaoPerson = $("#yanglaoPerson"+i).html()*basicSalary;
        $(".yanglaoPerson"+i).val(yanglaoPerson);
        var yanglaoUnits = $("#yanglaoUnits"+i).html()*basicSalary;
        $(".yanglaoUnits"+i).val(yanglaoUnits);
        var yiliaoPerson = $("#yiliaoPerson"+i).html()*basicSalary;
        $(".yiliaoPerson"+i).val(yiliaoPerson);
        var yiliaoUnits = $("#yiliaoUnits"+i).html()*basicSalary;
        $(".yiliaoUnits"+i).val(yiliaoUnits);
        var shiyePerson = $("#shiyePerson"+i).html()*basicSalary;
        $(".shiyePerson"+i).val(shiyePerson);
        var shiyeUnits = $("#shiyeUnits"+i).html()*basicSalary;
        $(".shiyeUnits"+i).val(shiyeUnits);
        var zhufangPerson = $("#zhufangPerson"+i).html()*basicSalary;
        $(".zhufangPerson"+i).val(zhufangPerson);
        var zhufangUnits = $("#zhufangUnits"+i).html()*basicSalary;
        $(".zhufangUnits"+i).val(zhufangUnits);
        var gongshangUnits = $("#gongshangUnits"+i).html()*basicSalary;
        $(".gongshangUnits"+i).val(gongshangUnits);
        var shengyuUnits = $("#shengyuUnits"+i).html()*basicSalary;
        $(".shengyuUnits"+i).val(shengyuUnits);
        var riskBack = p.value-(yanglaoPerson+yiliaoPerson+shiyePerson+zhufangPerson);
        $("#riskBack"+i).val(riskBack+parseInt(u));

    }
    function Salary(o,s){$(".perSalary").val($(o).val());for (var i = 0; i < s; i++) {effect(o,i,$("#c"+i).val());}}
    function yanglaoP(o){$(".yanglaoPerson").val($(o).val())}
    function yanglaoU(o){$(".yanglaoUnits").val($(o).val())}
    function yiliaoP(o){$(".yiliaoPerson").val($(o).val())}
    function yiliaoU(o){$(".yiliaoUnits").val($(o).val())}
    function shiyeP(o){$(".shiyePerson").val($(o).val())}
    function shiyeU(o){$(".shiyeUnits").val($(o).val())}
    function zhufangP(o){$(".zhufangPerson").val($(o).val())}
    function zhufangU(o){$(".zhufangUnits").val($(o).val())}
    function gongshangU(o){$(".gongshangUnits").val($(o).val())}
    function shengyuU(o){$(".shengyuUnits").val($(o).val())}
    /*---------------------------*/
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
                url:"/TbDeparmentController/tbDPquery.do",
                type:"post",
                data:{deptNumber : y},
                dataType:"json",
                success:function(data){
                    var persoId = "";
                    var id = 0;
                    var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                        "<tr style='font-weight:800;'><td style='background-color: #efefef;'>人员</td></tr>"
                    for (var i = 0; i < data.length ; i++) {
                        if(data[i].NowState!=1) {
                            a += "<tr><td class='display_none'>" + data[i].persoId + "</td>"
                                + "<td><button type='button' onclick='han2(this," + data[i].persoId + ")' value='" + 1 + "' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>" + data[i].PersonName + "</button></td></tr>"
                            persoId += data[i].persoId + ","
                            id++
                        }
                    }
                    TpSalarySheetQuery(persoId,id);
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
                var persoId="";
                var id = 0;
                var a = "<table class='table' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td style='background-color: #efefef;'>人员</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    if(data[i].NowState!=1){
                    a+="<tr><td class='display_none'>"+data[i].persoId+"</td>"
                        +"<td><button type='button' onclick='han2(this,"+data[i].persoId+")' value='"+1+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].PersonName+"</button></td></tr>"
                    persoId+=data[i].persoId+",";
                    id++
                    }
                }
                TpSalarySheetQuery(persoId,id);
                $("#danwei_reght1").html(a+="</tablel>")
            }
        })
    }
    function han2(u,a){
        $(".persName").val($(u).html())
        $(".persoId").val(a)
        TbDeparmentquery();
    }
    /*function TpSalarySheetAdd(){
        $.ajax({
            url:"/TpSalarySheetController/td_sadd.do",
            type:"post",
            data:{
                //persoId: 给这里传个新建的职员ID
                persoId:4
            },
            dataType:"json",
            success:function(data){
            }
        })
    }*/
</script>
</html>
