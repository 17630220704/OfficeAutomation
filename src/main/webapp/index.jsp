<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>排班设置</title>
	<link rel="stylesheet" href="../resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/bootstrap-fileinput/4.4.8/css/fileinput.min.css">
	<link rel="stylesheet" href="../resources/permit-trees/layui-v2.4.4/layui/css/layui.css">
	<script src="../resources/jquery-3.1.1.min.js"></script>
	<script src="../resources/permit-trees/layui-v2.4.4/layui/layui.js"></script>
	<script src="../resources/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
	<script src="../resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	<script src="../resources/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
</head>
<body>
<div class="layui-row">
	<div class="layui-col-xs1">
	</div>
	<div class="layui-col-xs10">
		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
				<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
				<button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
			</div>
		</script>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
	</div>
	<div class="layui-col-xs1">
	</div>
</div>
</body>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:''
            ,toolbar: 'default'
            ,cols: [[
                 {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'username', width:80, title: '用户名'}
                ,{field:'sex', width:80, title: '性别', sort: true}
                ,{field:'city', width:80, title: '城市'}
                ,{field:'sign', title: '签名', minWidth: 150}
                ,{field:'experience', width:80, title: '积分', sort: true}
                ,{field:'score', width:80, title: '评分', sort: true}
                ,{field:'classify', width:80, title: '职业'}
                ,{field:'wealth', width:135, title: '财富', sort: true}
                ,
            ]]
            ,page: true
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    layer.open({
                        type: 2,
                        content: 'http://sentsin.com' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以
                        // content: ['http://sentsin.com', 'no']
                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            }
        });
    });
</script>
</html>
