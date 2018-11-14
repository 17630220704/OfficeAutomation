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
<table class="table" border="0">
    <tr>
        <th colspan="3"><center><h3>会议记录</h3></center></th>
    </tr>
    <tr>
        <th>查询状态<select id="select" class="btn btn-default">
              <option value="已批准">已批准</option>
              <option value="已退回">已退回</option>
              <option value="已结束">已结束</option>
            </select>
        <input type="button" onclick="query1()" class="btn btn-default" value="查询"></th>
        <th>查询日期<input type="date"  class="btn btn-default"  id="date">--<input type="date"  class="btn btn-default"  id="date1"><input type="button" onclick="query2()" class="btn btn-default" value="查询"></th>
        <th>查询申请人<input type="text" class="btn btn-default" value="申请人姓名" onfocus="if (value =='申请人姓名'){value =''}" onblur="if (value ==''){value='申请人姓名' }" id="name"><input type="button" onclick="query3()" class="btn btn-default" value="查询"></th>
    </tr>
</table>
<div id="table"> </div>
<div id="page" align="center"></div>
</body>
<script>
    $(document).ready(function () {
        query();
        updatestate();
    });
    function updatestate() {
        $.ajax({
            url : "meet/updatestate",
            type : "post",
            dataType : "json",
            success : function(data) {
            }
        });
    }

    function query(a,b,c) {
        if (a > b) {
            a = b
        }
        if (a < c) {
            a = c
        }
        $.ajax({
            url : "meet/query7",
            data:{"startPage":a},
            type : "post",
            dataType : "json",
            success : function(data) {
                var a = data.meeting;
                var d =data.pi;
                var  b="" +
                    "<table class='table'>" +
                    " <tr>" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
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
    function query1(a,b,c) {
        if (a > b) {
            a = b
        }
        if (a < c) {
            a = c
        }
        var d = $("#select").val();
        $.ajax({
            url : "meet/query8",
            type : "post",
            data:{"lx":d,"startPage":a},
            dataType : "json",
            success : function(data) {
                var a = data.meeting1;
                var d = data.pi;
                var  b="" +
                    "<table class='table'>" +
                    " <tr>" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
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
                        "</tr>"
                }
                b+="</table>";
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query1("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query1("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query1("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query1("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#table").html(b);

            }
        });
    }
    function query2(a,b,c) {
        if (a > b) {
            a = b
        }
        if (a < c) {
            a = c
        }
        var d = $("#date").val();
        var e = $("#date1").val();
        $.ajax({
            url : "meet/query9",
            type : "post",
            data:{"date":d,"startPage":a,"date1":e},
            dataType : "json",
            success : function(data) {
                var a = data.meeting2;
                var d = data.pi;
                var  b="" +
                    "<table class='table'>" +
                    " <tr>" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
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
                        "</tr>"
                }
                b+="</table>";
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query2("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query2("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query2("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query2("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#table").html(b);

            }
        });
    }
    function query3(a,b,c) {
        if (a > b) {
            a = b
        }
        if (a < c) {
            a = c
        }
        var d = $("#name").val();
        $.ajax({
            url : "meet/query10",
            type : "post",
            data:{"name":d,"startPage":a},
            dataType : "json",
            success : function(data) {
                var a = data.meeting3;
                var d = data.pi;
                var  b="" +
                    "<table class='table'>" +
                    " <tr>" +
                    "        <th>会议标识</th>" +
                    "        <th>会议名称</th>" +
                    "        <th>会议人数</th>" +
                    "        <th>申请时间</th>" +
                    "        <th>会议室</th>" +
                    "        <th>使用时间</th>" +
                    "        <th>申请人</th>" +
                    "        <th>申请状态</th>" +
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
                        "</tr>"
                }
                b+="</table>";
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query3("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query3("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query3("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query3("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#table").html(b);

            }
        });
    }
</script>
</html>
