<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/10/21
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="../resources/jquery-3.1.1.min.js"></script>
<body>
    <div id="tdquery"></div>
</body>
<script>
    $(Td_cQuery());
    //查询排班类型
    function Td_cQuery() {
        $.ajax({
            url:"/TdConfigController/tdquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<form id='form'><table border='1px'><tr><td>编号</td><td>班次说明</td>" +
                    "<td>第一次签到</td><td>第一次签退</td><td>第二次签到</td><td>第二次签退</td><td>第三次签到</td><td>第三次签退</td>" +
                    "<td>操作</td></tr>"
                for(var i=0;i<data.length;i++){
                    if(typeof(data[i].DUTY_TIME3)=="undefined"){var DUTY_TIME3 = "";}
                    if(typeof(data[i].DUTY_TIME4)=="undefined"){var DUTY_TIME4 = "";}
                    if(typeof(data[i].DUTY_TIME5)=="undefined"){var DUTY_TIME5 = "";}
                    if(typeof(data[i].DUTY_TIME6)=="undefined"){var DUTY_TIME6 = ""; }
                    a+="<tr><td>"+data[i].DUTY_TYPE
                    +"</td><td>"+data[i].DUTY_NAME
                    +"</td><td>"+data[i].DUTY_TIME1
                    +"</td><td>"+data[i].DUTY_TIME2
                    +"</td><td>"+data[i].DUTY_TIME3
                    +"</td><td>"+data[i].DUTY_TIME4
                    +"</td><td>"+DUTY_TIME5
                    +"</td><td>"+DUTY_TIME6
                    +"</td><td><input type='button' onclick='' value='编辑'>"
                    +"</td><td><button onclick='tdConfigDelete(this)' value='"+data[i].DUTY_TYPE+"'>删除</button>"
                    +"</td></tr>"
                }
                    $("#tdquery").html(a+="</table></form>");
            }
        })
    }
    function tdConfigAdd() {
        $.ajax({
            url:"/TdConfigController/tdadd.do",
            type:"post",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    alert(data[i].DUTY_BEFORE)
                }
            }
        })
    }
    function tdConfigUpdate() {
        $.ajax({
            url:"/TdConfigController/tdupdate.do",
            type:"post",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    alert(data[i].DUTY_BEFORE)
                    alert()
                }
            }
        })
    }
    function tdConfigDelete(i) {
        alert(i)
        $.ajax({
            url:"/TdConfigController/tddelete.do",
            type:"post",
            data:{"tc_id":$(this).value()},
            dataType:"json",
            success:function(data){
                Td_cQuery()
            }
        })
    }
</script>
</html>
