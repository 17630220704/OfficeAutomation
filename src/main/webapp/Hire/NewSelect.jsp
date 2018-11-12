<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/25 0025
  Time: 上午 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- 搜索/批量删除 -->
<div class="tools">
        <ul class="toolbar">
            <li><a href="senduserTo"><button type="button" class="layui-btn layui-btn-sm" id="getAll"><i class="layui-icon">&#xe608;</i> 添加</button></a></li>
            <li ><a><button type="button" class="layui-btn layui-btn-sm" onclick="return deleteAll()" ><i class="layui-icon">&#xe640;</i>批量删除</button></a></li>
        </ul>
        <ul class="searchform">
            
            <li> <form action="${path}/hire/findByName" method="post">
    <input type="text" name="search" placeholder="根据登陆账号查询" style="border: 1px solid #E6E6E6;;height:28px;width:120px;">
    <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i> 搜索</button>
</form></li>
            <%--    <li><a href="${path}/findByName"><button class="layui-btn layui-btn-small"><i class="layui-icon">&#xe615;</i> 搜索</button></a></li>
        <li><fr<input name="search" type="text" class="scinput" placeholder="请根据登录账号查询"  /></li> --%>
        </ul>
            
</div>

 

<table class="tablelist">
        <tr><th><input type="checkbox" name="selectall" id="selectall" onclick="checkAll()" id="selectall"/></th>
        <th>登陆账号</th><th>登陆密码</th><th>角色</th><th>创建日期</th><th>操作</th>
        <c:forEach items="${pageInfo.list}" var="emp">
        <tr>
            <td><input type="checkbox" name="empId" value="${emp.empId}"/></td>
            <td>${emp.empName}</td>
            <td>${emp.enpSex}</td>
            <td>${emp.homePlase}  </td>
        <%--     <td>${user.createtime}</td> --%>
            <td><fmt:formatDate value="${emp.birthTime}" pattern="yyyy年-MM月-dd日" /></td>
            <td><a href="updateUserTo?id=${emp.empId}"><button class="layui-btn-mini layui-btn">更改</button></a>
            <a href="deleteById?id=${emp.empId}" class="tablelink"><button class="layui-btn-danger layui-btn-mini layui-btn">删除</button></a></td>    
        </tr>
        </c:forEach>
        
</table>


    <!-- 显示分页信息 -->
     <div class="clear"></div>
      <div class="pagin">
     <div class="message">共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum }&nbsp;</i>页
     
     总<i class="blue">${pageInfo.pages }</i>页
     </div>
     <ul class="paginList">
           <li class="paginItem"><a href="${pageContext.request.contextPath}/UserPage?currentPage=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li  class="paginItem"><a href="${pageContext.request.contextPath}/UserPage?currentPage=${pageInfo.pageNum-1}"
                                > <span>&laquo;</span>
                            </a></li>
                        </c:if>
           <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <li class="paginItem"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <li class="paginItem"><a href="${pageContext.request.contextPath}/UserPage?currentPage=${page_Num }">${page_Num }</a></li>
                            </c:if>

                        </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
            <li class="paginItem"><a href="${pageContext.request.contextPath}/UserPage?currentPage=${pageInfo.pageNum+1 }"> <span>&raquo;</span></a></li>
            </c:if>
            <li class="paginItem"><a href="${pageContext.request.contextPath}/UserPage?currentPage=${pageInfo.pages}">末页</a></li>
            </ul>
      </div>
  <body>
</html>
