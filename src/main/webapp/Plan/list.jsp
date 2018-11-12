<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <%-- <%@include file="/WEB-INF/views/common/header.jsp"%>--%>

    <script type="text/javascript">
        $(function(){
            $("#pagination").twbsPagination({
                totalPages:${result.totalPage},
                visiblePages:${result.pageSize},
                startPage:${qo.currentPage},
                first:"首页",
                prev:"上一页",
                next:"下一页",
                last:"尾页",
                onPageClick:function(event,page){
                    $("#currentPage").val(page);
                    $("#searchForm").submit();
                }
            });

            /*$("#query").click(function(){
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });*/
        });
    </script>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <div class="row">
        <div class="col-sm-3">
          <%--  <%@include file="/WEB-INF/views/common/menu.jsp"%>--%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">部门管理</h1>
                </div>
            </div>
            <a class="btn btn-info btn-default" href="/department/input.do">
                <span class="glyphicon glyphicon-plus"></span>添加
            </a>
            <form id="searchForm" action="/department/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage">
                <input type="hidden" name="pageSize" value="${qo.pageSize}">
            </form>
            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>部门名称</th>
                        <th>部门编码</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <c:forEach items="${result.list}" var="d" varStatus="vs">
                   <tr>
                       <td>${vs.count}</td>
                       <td>${d.planName}</td>
                       <td>${d.sn}</td>
                       <td>
                           <a class="btn btn-info btn-xs" href="/department/input.do?id=${d.id}">
                               <span class="glyphicon glyphicon-pencil"></span>编辑
                           </a>
                           <a href="/department/delete.do?id=${d.id}" class="btn btn-danger btn-xs" >
                               <span class="glyphicon glyphicon-trash"></span>删除
                           </a>
                       </td>
                   </tr>
               </c:forEach>
            </table>
            <div style="text-align: center;">
                <ul id="pagination" class="pagination"></ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>