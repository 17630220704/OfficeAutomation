<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <div class="row">
        <div class="col-sm-3">
            <%@include file="/WEB-INF/views/common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">部门编辑</h1>
                </div>
            </div>
            <div class="row" align="left">
                <form class="form-horizontal" action="/department/saveOrUpdate.do" method="post">
                    <input type="hidden" name="id" value="${entity.id}">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">部门名称：</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入部门名称" value="${entity.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sn" class="col-sm-2 control-label">部门编号：</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="sn" name="sn" placeholder="请输入部门编号" value="${entity.sn}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">保存</button>
                            <a href="/department/list.do" class="btn btn-default">取消</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>