
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
<legend><center>招聘计划查询</center></legend>
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
            ,url:'/fenye/showDataplan?keyWord2='+kwx
            ,limit:4 //默认为10
            ,cols: [[
                {field:'PlanID', width:170, title: '编号', sort: true} //sort：true页面可进行排序操作
                ,{field:'empName', width:170, title: '人才'}
                ,{field:'planName', width:120, title: '计划名称'}
                ,{field:'dictionaryID', width:130, title: '招聘渠道', sort: true}
                ,{field:'startTime', width:120, title: '开始时间'}
                ,{field:'endTime', width:120, title: '结束时间'}
                ,{field:'budget', width:120, title: '预算费用'}
                ,{field:'PlanInstructions', width:120, title: '招聘说明'}
                ,{field:'PlanNote', width:120, title: '招聘备注'}
                ,{field:'NoteRemind', width:120, title: '招聘提醒'}
                ,{field:'approvalStatus', width:120, title: '招聘状态'}
            ]]
            ,page: true
            ,done:function(res, curr, count){
                //数据的回调用，可不写
            }
        });
    }
    $("#sear1").keyup(function(event){

        if(event.keyCode ==13){
            var keyWord2=$("#sear1").val();
            addData(keyWord2);
        }
    });
</script>

</body>
</html>
