<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/22 0022
  Time: 下午 5:07
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
<a href="../Html.jsp">首页</a>
<div style="margin-top: 17px;margin-left: 1103px;">
    <span>名字搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入名字进行模糊查询"/>
</div>

<div class="layui-card-body">
    <table class="layui-hide" id="test"></table>
</div>
<script>
    layui.use('table', function(){
        var kw='';
        addData(kw);
    });
    function addData(kwx){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/fenye/showData?keyWord='+kwx
            ,limit:4 //默认为10
            ,cols: [[
                {field:'empId', width:170, title: '编号', sort: true} //sort：true页面可进行排序操作
                ,{field:'empName', width:170, title: '名称'}
                ,{field:'enpSex', width:120, title: '性别'}
                ,{field:'birthTime', width:130, title: '生日', sort: true}
                ,{field:'homePlase',width:160, title: '住址'}
                ,{field:'nation', width:130, title: '民族'}
            ]]
            ,page: true
            ,done:function(res, curr, count){
                //数据的回调用，可不写
            }
        });
    }
    $("#sear1").keyup(function(event){

        if(event.keyCode ==13){
            var keyWord=$("#sear1").val();
            addData(keyWord);
        }
    });

</script>

</body>
</html>
