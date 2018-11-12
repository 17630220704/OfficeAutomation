<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/26 0026
  Time: 上午 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="box-positon">
    <div class="rpos">当前位置: 品牌管理 - 列表</div>
    <form class="ropt">
        <input class="add" type="button" value="添加"
               onclick="javascript:window.location.href='add.jsp'" />
    </form>
    <div class="clear"></div>
</div>
<div class="body-box">
    <form action="v_list.shtml" id="brandForm" method="post"
          style="padding-top: 5px;">
        品牌名称: <input type="text" name="name" /> <select>
        <option value="1">是</option>
        <option>不是</option>
    </select> <input type="submit" class="query" value="查询" />
    </form>
    <table cellspacing="1" cellpadding="0" border="0" width="100%"
           class="pn-ltable">
        <thead class="pn-lthead">
        <tr>
            <th width="20"><input type="checkbox"
                                  onclick="checkBox('ids',this.checked)" /></th>
            <th>品牌ID</th>
            <th>品牌名称</th>
            <th>品牌图片</th>
            <th>品牌描述</th>
            <th>排序</th>
            <th>是否可用</th>
            <th>操作选项</th>
        </tr>
        </thead>
        <tbody class="pn-ltbody">
        <c:forEach items="${page.plans}" var="brand">
            <tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'"
                onmouseout="this.bgColor='#ffffff'">
                <td><input type="checkbox" name="ids" value="${brand.id }" /></td>
                <td align="center">${plans.planName }</td>
                <td align="center">${brand.name }</td>
                <td align="center"><img src="${brand.imgUrl}" width="40"
                                        height="40" /></td>
                <td align="center">${brand.description}</td>
                <td align="center">${brand.sort}</td>
                <td align="center"><c:if test="${brand.isDisplay == 1 }">可用</c:if>
                    <c:if test="${brand.isDisplay == 0 }">不可用</c:if></td>
                <td align="center"><a href="javascript:void(0);"
                                      class="pn-opt">修改</a> | <a href=" javascript:void(0);"
                                                                 onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--分页部分-->

    <tr align="left">
        <td><sapn id=pagelink>
            <div style="line-height: 20px;height: 20px;text-align: center;font-size: 18px ">
                共 [ ${page.totalCount} ] 条记录,共 [ ${page.totalPage} ] 页

                <c:if test="${ page.pageCode > 1 }">
                    [ <A href="/brand/list.action?pageCode=${page.pageCode-1}&sizePage=5">前一页</A> ]
                </c:if>
                <c:if test="${ page.pageCode <=1 }">
                    [ 前一页 ]
                </c:if>
                ,当前第 [ ${page.pageCode} ] 页
                <c:if test="${ page.pageCode < page.totalPage }">
                    ,[ <A href="/brand/list.action?pageCode=${page.pageCode+1}&sizePage=5">后一页</A> ]
                </c:if>
                <c:if test="${ page.pageCode >= page.totalPage }">
                    [ 后一页 ]
                </c:if>
            </div>
            </span></td>
    </tr>
    <div style="margin-top: 15px;">
        <input class="del-button" type="button" value="删除"
               onclick="optDelete();" />
    </div>
</div>

</body>
</html>
