<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24 0024
  Time: 上午 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String appPath = request.getContextPath(); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入 Bootstrap -->
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<html>
<head>
    <title>Title</title>
</head>
<body>


<html>


<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>论文列表 —— 显示所有论文</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path}/tbRecruitmentplan/toAddtbRecruitmentplan">新增</a>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>论文编号</th>
                    <th>论文名字</th>
                    <th>论文数量</th>
                    <th>论文详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tbRecruitmentplan" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${tbRecruitmentplan.planId}</td>
                        <td>${tbRecruitmentplan.planName}</td>
                        <td>
                            <a href="${path}/tbRecruitmentplan/toUpdatetbRecruitmentplan?planId=${tbRecruitmentplan.planId}">更改</a> |
                            <a href="<%=appPath%>/paper/del/${tbRecruitmentplan.planId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
