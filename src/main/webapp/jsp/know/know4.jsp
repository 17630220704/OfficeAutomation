<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
</head>
<body>
<div id="list"></div>
<div id="page"></div>
</body>
<script>
    $(document).ready(function () {
           query();
    })
     function query(a,b,c){
         if(a>b){a=b};
         if(a<c){a=c};
        $.ajax({
            url : "meet/query1",
            type : "post",
            data:{"startPage":a},
            dataType : "json",
            success : function(data) {
                var a = data.me;
                var d = data.pi;
                var b="" +
                    "<table class='table'>" +
                    "<tr> " +
                    "<td colspan='10'><center><center><h3>会议审核</h3></center></td>" +
                    "</tr>" +
                    " <tr>\n" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议简述</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
                    "        <th>审核操作</th>" +
                    "    </tr>";
                for(i=0;i<a.length;i++){

                    b+="<tr>" +
                        "<td>"+a[i].meid+"</td>" +
                        "<td>"+a[i].mename+"</td>" +
                        "<td>"+a[i].mevalue+"</td>" +
                        "<td>"+a[i].menumber+"</td>" +
                        "<td>"+a[i].medate+"</td>" +
                        "<td>"+a[i].coname+"</td>" +
                        "<td>"+a[i].metime+"</td>" +
                        "<td>"+a[i].PersonName+"</td>" +
                        "<td>"+a[i].mestate+"</td>" +
                        "<td><a  onclick='onjh("+a[i].meid+","+a[i].coid+")' class='btn btn-default'>审核</a><input type='button' onclick='th("+a[i].meid+")' value='退回'  class='btn btn-default'></td>" +
                        "</tr>";
                }
                b+="</table>";
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#list").html(b);

            }
        });
    }
    function  onjh(a,b) {
        $.ajax({
            url : "meet/query5",
            type : "post",
            data:{"meid":a,"coid":b},
            dataType : "json",
            success : function(data) {
                alert(data.sh)
                query();
            }
    })
        }
    function querym(a) {
        var  id = a;
        $.ajax({
            url : "meet/query2",
            type : "post",
            data : id,
            dataType : "json",
            success : function(data) {
                var a = data.query;
                var b="";
                for(i=0;i<a.length;i++){

                    b+="<option value ='"+a[i].meid+"'>"+a[i].mename+"</option>";
                }
                $("#query").html(b);

            }
        });

    }
    function fmtDate(inputTime) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
    }
    function th(a) {
       var meid = a;
       var name;
       name=prompt("备注");
        $.ajax({
            url : "meet/updateth",
            type : "post",
            data : {"meid":meid,"bz":name},
            dataType : "json",
            success : function(data) {
                alert(data.th)
                query();
            }
        });


    }
</script>
</html>
