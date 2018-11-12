<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/23 0023
  Time: 上午 9:29
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
<div style="margin-top: 17px;margin-left: 1103px;">
    <span>名字搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入gangwei 进行模糊查询"/>
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
            ,url:'/fenye/showDataneed?keyWord3='+kwx
            ,limitneed:11 //默认为10
            ,cols: [[
                {field:'needId', width:170, title: '编号', sort: true} //sort：true页面可进行排序操作
                ,{field:'jods', width:170, title: '岗位'}
                ,{field:'needDate', width:120, title: '需求时间', sort: true}
                ,{field:'needNumber', width:130, title: '需求人数', sort: true}
                ,{field:'needRequirements',width:160, title: '要求'}
                ,{field:'remind',width:160, title: '提醒'}
                ,{field:'remark', width:130, title: '备注', sort: true}
            ]]
            ,page: true
            ,done:function(res, curr, count){
                //数据的回调用，可不写
            }
        });
    }
    $("#sear1").keyup(function(event){
        if(event.keyCode ==13){
            var keyWordneed=$("#sear1").val();
            addData(keyWordneed);
        }
    });
</script>
</body>
</html>
