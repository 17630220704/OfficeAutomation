<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
         #table{
             width: 60%;
             margin-left: 15%;
         }
        .btn-default{
            width: 50%;
        }
    </style>
</head>
<body>
<form id="form">
    <table class="table" align=“center" id="table" text >
        <tr>
            <th colspan="2"><center>会议申请</center></th>
        </tr>
        <tr></tr>
        <tr>
            <td><center>会议名称</center></td>
            <td><center><input type="text" id="mename" class="btn btn-default"></center></td>
        </tr>
        <tr>
            <td><center>会议简述</center></td>
            <td><center><textarea rows="10" cols="30" id="mevalue" class="btn btn-default"></textarea></center></td>
        </tr>
        <tr>
            <td><center>会议人数</center></td>
            <td><center><input type="text" id="menumber" class="btn btn-default"></center></td>
        </tr>
        <tr>
            <td><center>会议室选择</center></td>
            <td><center><select id="select" name="coid" class="btn btn-default"></select></center>  </td>
        </tr>
        <tr>
            <td><center>日期选择</center></td>
            <td><center><input type="date" class="btn btn-default"  onchange="inputOnBlur();" id="date"></center></td>
        </tr>
        <tr>
            <td><center>时间选择</center></td>
            <td id ="sj" style="text-align:center;vertical-align:middle;"><center></center></td>
        </tr>
        <tr>
            <td><center>是否可用</center></td>
            <td ><center><div id="time"></div></center></td>
        </tr>
        <tr>
           <td colspan="2"><center><input type="button" onclick="save()" class="btn btn-primary btn-lg" value="提交申请"></center></td>
        </tr>
    </table>

</form>
</body>
<script>
    function time(){
        var obj = document.getElementsByName("identity");
        for(var i=0; i<obj.length; i ++){
            if(obj[i].checked){
               var a= obj[i].value;
    }
         var ti={
                "tidate":$("#date").val(),
                "conferenceroom.coid":$("#select").val(),
                "tiid":a
            }
        }
        $.ajax({
            url : "meet/query4",
            type : "post",
            data :ti,
            dataType : 'json',
            success : function(data) {
                var b="<div>"+data.time+"</div>";
                $("#time").html(b);
            }
        });
    }
    function inputOnBlur() {
        var ti={
            "tidate":$("#date").val(),
            "conferenceroom.coid":$("#select").val()
        }
        $.ajax({
            url : "meet/query3",
            type : "post",
            data : ti,
            dataType : "json",
            success : function(data) {
                var a = data.sj;
                if (a ==1){
                    alert("时间选择错误")
                }
                var  c =0;
                var b="" ;
                for(i=0;i<a.length;i++){
                    b+=" <input type='radio' name='identity' value='1' onchange='time()' />8-10时" +
                        "<input type='radio' name='identity' value='2' onchange='time()' />10-12时"+
                        "<input type='radio' name='identity' value='3' onchange='time()' />14-16时"+
                        "<input type='radio' name='identity' value='4' onchange='time()' />16-18时";
                }
                $("#sj").html(b);
                }

            }
        );

    }
    window.onload = function query(){//查询出会议室选择项内容
        $.ajax({
            url : "meet/query",
            type : "post",
            dataType : "json",
            success : function(data) {
                var a = data.co;
                var b="";
                for(i=0;i<a.length;i++){

                    b+="<option value ='"+a[i].coid+"'>"+a[i].coname+"--管理人:"+a[i].personname+"</option>";
                }
                $("#select").html(b);

            }
        });
    }
    function save() {
        var obj = document.getElementsByName("identity");
        for(var i=0; i<obj.length; i ++){
            if(obj[i].checked){
                var a=obj[i].value;
            }
        }
        if($("#mename").val()==""||$("#mename").val()=="请输入会议名称"){
            $("#mename").val("请输入会议名称");
        }else if($("#mevalue").val()==""||$("#mevalue").val()=="请输入会议备注"){
            $("#mevalue").val("请输入会议备注");
        }else {
              $.ajax({
                           url: "meet/save",
                           type: "post",
                           data: {"tidate": $("#date").val(),"tiid":a,"coid":$("#select").val(), "mename": $("#mename").val(), "mevalue": $("#mevalue").val(),  "menumber": $("#menumber").val()},
                           dataType: 'json',
                           success: function (data) {
                               alert(data.mee)
                           }
                       });
        }

    }
</script>
</html>
