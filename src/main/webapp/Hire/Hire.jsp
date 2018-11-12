<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/22 0022
  Time: 上午 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" href="../layUI/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../layUI/layui.all.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table class="layui-table" style="width: 800px">
    <thead>
    <tr>
        <th>ID</th>
        <th>用户名</th>
        <th>密码</th>
        <th>电话</th>
        <th>地址</th>
        <th>分数</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>
<div id="page1"></div>
</body>
<script type="text/javascript">
    $(function(){
        //方法一直接使用独立的laypage插件，具体分页实现请看core.js里面，缺点：不好自定义颜色样式
        //core.getUserListByPage();
    });

    //方法二则直接使用layui-v2.0.2里面的分页功能，没有用到core.js里面的方法
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        var url = "hire/user/list";
        var config = {page:1,pageSize:4};
        $.getJSON(url,config,function(res){
            laypage.render({
                elem: 'page1',
                count: res.total, //总条数
                limit:4, //每页条数
                theme: '#FFB800', //自定义颜色
                jump: function(obj, first){
                    if(!first){ //首次则不进入
                        config.page = obj.curr;
                        getUserListByPage(url,config);
                    }
                }
            });
            parseUserList(res,config.page);
        });

    });
    //点击页数从后台获取数据
    function getUserListByPage(url,config){
        $.getJSON(url,config,function(res){
            parseUserList(res,config.page);
        });
    }

    //解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
    function parseUserList(res,currPage){
        var content = "";
        $.each(res.rows, function (i, o) {
            content += "<tr>";
            content += "<td>"+o.empID+"</td>";
            content += "<td>"+o.empName+"</td>";
            content += "<td>"+o.enpSex+"</td>";
            content += "<td>"+o.birthTime+"</td>";
            content += "<td>"+o.homePlase+"</td>";
            content += "<td>"+o.nation+"</td>";
            content += "<td><a>删除</a></td>";
            content += "</tr>";
        });
        $('#tbody').html(content);
    }

</script></body>
</html>
