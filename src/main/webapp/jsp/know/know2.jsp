<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>Title</title>
</head>
<body>
<table class="table">
    <tr>
        <td colspan="2">修改会议室</td>
    </tr>
    <tr>
        <td>ID</td>
        <td><input type="text" value="${param['coid'] }" id="id" class="btn btn-default"  disabled="disabled" ></td>
    </tr>
    <tr>
        <td>名称</td>
        <td><input type="text" value="${param['coname'] }" id="name" class="btn btn-default"></td>
    </tr>
    <tr>
        <td>管理员</td>
        <td><select id="gly" class="btn btn-default">


        </select></td>
    </tr>
    <tr>
        <td>
           状态
        </td>
        <td>  <select class="btn btn-default" id="state">
            <option value="正常">正常</option>
            <option value="故障">故障</option>
            <option value="停用">停用</option>
        </select></td>
    </tr>
    <tr>
        <td>描述</td>
        <td><input type="text" class="btn btn-default" id="ms"></td>
    </tr>
    <tr>
        <td><input type="button" onclick="update()" value="修改" class="btn btn-default"> </td>
        <td><a href="/jsp/know/know1.jsp" class="btn btn-default">返回</a></td>
    </tr>
</table>
</body>

<script>
    $(document).ready(function () {
        gly();
    })
    function update(){
        $.ajax({
            url : "know/update",
            type : "post",
            data : {"perid":$("#gly").val(),"coname":$("#name").val(), "costate":$("#state").val(),"covalue":$("#ms").val(), "coid":$("#id").val()},
            dataType : 'text',
            success : function(data) {
                alert("修改成功")
            }
        });
    }
    function gly() {
        $.ajax({
            url : "know/gly",
            type : "post",
            dataType : 'json',
            success : function(data) {
                var a = data.tb;
                var b="";
                for(i=0;i<a.length;i++){

                    b+="<option value ='"+a[i].persoid+"'>"+a[i].personname+"</option>";
                }
                $("#gly").html(b);
            }
        });
    }
</script>
</html>
