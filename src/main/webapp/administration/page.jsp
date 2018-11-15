<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="<%=basePath %>/resources/layui/css/layui.css">
</head>


<%--弹出框--%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<%=basePath %>/resources/layui/css/layui.css"  media="all">


<script type="text/javascript" src="<%=basePath %>/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/resources/layui/layui.js"></script>
<script src="<%=basePath %>/resources/layui/lay/modules/form.js"></script>
<body>
<%--模糊搜索--%>
<div style="margin-top: 20px;margin-left: 80px;">
    <span>标题：</span>
    <input type="text" style="height: 27px;width: 200px;" id="chaxun" placeholder="请输入标题进行模糊查询"/>
</div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<div id="motaikunag" style="display:none;">
</div>

</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    layui.use(['form','table','laydate',], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery;
        var a = "";
        fall(a);
    });
    function fall(kwx) {
        var table = layui.table; //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where:{"name":kwx},
            url: '/worksurface/pageWorksurface.do',
            limit: 1,  //默认为10(每页条数)
            title: '公告表',
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'work_id', width: 80, title: '类型号'},
                {field: 'sort_number', width: 80, title: '公告号'},  //sort：true页面可进行排序操作
                {field: 'work_name', width: 100, title: '发布人'},
                {field: 'work_unit', width: 150, title: '类型', sort: true},
                {field: 'work_supplier', width: 180, title: '发布范围',sort: true},
                {field: 'work_gline', width: 100, title: '标题',sort: true},
                {field: 'work_repertory', width: 160, title: '发布时间', sort: true},
                {field: 'setid', width: 160, title: '生效日期', sort: true},
                {fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示   分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
            }
        });



        // 编辑 删除 操作
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
        })
    }
    $(document).ready(function(){
        $("#chaxun").on("keyup",function(cha){
            if (cha.keyCode==13){
                var keyWord=$("#chaxun").val();
                fall(keyWord);
            }
        });
        $("#chaxun").on("blur",function(cha){
            var keyWord=$("#chaxun").val();
            fall(keyWord);
        });
    });
</script>