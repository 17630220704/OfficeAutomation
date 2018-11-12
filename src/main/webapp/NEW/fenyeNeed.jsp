
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
<legend><center>招聘需求查询</center></legend>
<div style="margin-top: 17px;margin-left: 1103px;">
    <span>岗位搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入岗位进行模糊查询"/>
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
            ,url:'/fenye/showneedData?keyWord3='+kwx
            ,limit:4 //默认为10
            ,cols: [[
                {field:'needID', width:170, title: 'ID', sort: true} //sort：true页面可进行排序操作
                ,{field:'deptName', width:170, title: '部门'}
                ,{field:'jods', width:120, title: '岗位'}
                ,{field:'needDate', width:130, title: '时间', sort: true}
                ,{field:'needNumber', width:120, title: '人数'}
                ,{field:'needRequirements', width:120, title: '岗位要求'}
                ,{field:'remind', width:120, title: '提醒'}
                ,{field:'remark', width:120, title: '备注'}
            ]]
            ,page: true
            ,done:function(res, curr, count){
                //数据的回调用，可不写
            }
        });
    }
    $("#sear1").keyup(function(event){

        if(event.keyCode ==13){
            var keyWord3=$("#sear1").val();
            addData(keyWord3);
        }
    });
</script>

</body>
</html>
