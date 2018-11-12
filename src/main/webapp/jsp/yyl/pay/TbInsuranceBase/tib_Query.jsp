<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>保险基数</title>
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
    .td3{
        text-align: left;
        font-weight: 800;
    }
    .body{
        text-align:center;
        margin:0 auto;
        width: 100%;
    }
</style>
<body>
<%--保险基数--%>
<div id="tdquery" class="body"></div>
</body>
<script>
    $(TbInsuranceBaseQuery());
    $(date1());
    function date1(){
        a = new Date();
        $(".date").val(a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate());
    }
    function TbInsuranceBaseQuery(){
        $.ajax({
            url:"/TbInsuranceBaseController/ti_bquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var i = 0;
                var a = "<form id='tib_Update'><table class='table table-striped' style='text-align: center;font-size: 12px;margin:0 auto;width: 600px'>" +
                    "<tr style='font-weight:800;'><td>保险类型</td><td>保险基数</td></tr>";
                    a+="<tr class='td3'><td colspan='2'>养老保险系数" +
                        "<input class='display_none' name='insurbaseId' value='"+data[i].insurbaseId+"'>"//
                        +"</td></tr><tr><td>个人支付</td><td><input name='yanglaoPerson' onkeyup='effect(this)' value='"+data[i].yanglaoPerson+"'>"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='yanglaoUnits' onkeyup='effect(this)' value='"+data[i].yanglaoUnits+"'>"//
                        +"</td></tr><tr class='td3'><td colspan='2'>医疗保险基数"//
                        +"</td></tr><tr><td>个人支付</td><td><input name='yiliaoPerson' onkeyup='effect(this)' value='"+data[i].yiliaoPerson+"'>"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='yiliaoUnits' onkeyup='effect(this)' value='"+data[i].yiliaoUnits+"'>"//
                        +"</td></tr><tr class='td3'><td colspan='2'>失业保险基数"//
                        +"</td></tr><tr><td>个人支付</td><td><input name='shiyePerson' onkeyup='effect(this)' value='"+data[i].shiyePerson+"'>"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='shiyeUnits' onkeyup='effect(this)' value='"+data[i].shiyeUnits+"'>"//
                        +"</td></tr><tr class='td3'><td colspan='2'>住房公积金基数"//
                        +"</td></tr><tr><td>个人支付</td><td><input name='zhufangPerson' onkeyup='effect(this)' value='"+data[i].zhufangPerson+"'>"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='zhufangUnits' onkeyup='effect(this)' value='"+data[i].zhufangUnits+"'>"//
                        +"</td></tr><tr class='td3'><td colspan='2'>工伤险基数"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='gongshangUnits' onkeyup='effect(this)' value='"+data[i].gongshangUnits+"'>"//
                        +"</td></tr><tr class='td3'><td colspan='2'>生育保险基数"//
                        +"</td></tr><tr><td>单位支付</td><td><input name='shengyuUnits' onkeyup='effect(this)' value='"+data[i].shengyuUnits+"'>"//
                        +"</td></tr><tr><td colspan='2'><button onclick='TbInsuranceBaseUpdate(this)'class='btn btn-primary' type='button' value='"+data[i].paymentId+"'>保存</button>"
                        +"</td></tr>";
                $("#tdquery").html(a+="</table></form>")
            }
        })
    }
    function TbInsuranceBaseUpdate(){
        $.ajax({
            url: "/TbInsuranceBaseController/ti_bupdate.do",
            type: "post",
            data:$("#tib_Update").serialize(),
            dataType: "json"
        }).always(function(){
            TbInsuranceBaseQuery();
        })
    }
    function effect(o) {
        o.value = o.value.replace(/[^\d.]/g,'');
        if(o.value>100){
            o.value=100;
        }else if(o.value<0){
            o.value=0;
        }
    }
</script>
</html>
