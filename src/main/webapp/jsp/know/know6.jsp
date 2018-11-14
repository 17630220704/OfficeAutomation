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
    <head>
        <title>Title</title>
    </head>
<body>
<div id="table">

</div>
<div id="page"></div>
</body>
<script>
    $(document).ready(function () {
        query();
    });
    function  query(a,b,c) {
        if (a > b) {
            a = b
        }
        if (a < c) {
            a = c
        }
        $.ajax({
            url : "know/query1",
            data:{"startPage":a},
            type : "post",
            dataType : "json",
            success : function(data) {
                var a = data.me;
                var d =data.pi;
                var  b="" +
                    "<table class='table'>" +
                    "<tr>" +
                    "<th colspan='9'><center><h3>会议取消</h3></center></th>" +
                    "</tr>" +
                    " <tr>" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
                    "        <th>操作</th>" +
                    "    </tr>";
                for(i=0;i<a.length;i++){

                    b+="<tr>" +
                        "<td>"+a[i].meid+"</td>" +
                        "<td>"+a[i].mename+"</td>" +
                        "<td>"+a[i].menumber+"</td>" +
                        "<td>"+a[i].medate+"</td>" +
                        "<td>"+a[i].coname+"</td>" +
                        "<td>"+a[i].metime+"</td>" +
                        "<td>"+a[i].PersonName+"</td>" +
                        "<td>"+a[i].mestate+"</td>" +
                        "<td><input type='button'  value='取消' class='btn btn-default' onclick='ch("+a[i].meid+")'></td>" +
                        "</tr>"
                }

                b+= "</table>";
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#table").html(b);

            }
        });
    }
    function ch(a) {
        $.ajax({
            url : "know/query2",
            type : "post",
            data:{"meid":a},
            dataType : "json",
            success : function(data) {
                alert(data.me);
                query();
            }
        });
    }
</script>
</html>
