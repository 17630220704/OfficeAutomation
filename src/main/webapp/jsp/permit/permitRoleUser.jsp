<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>角色用户</title>
    <link rel="stylesheet" href="/resources/permit-trees/layui-v2.4.4/layui/css/layui.css">
    <link rel="stylesheet" href="/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/layui.js"></script>
    <script src="/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
</head>
<body style="height: 100%;min-height: 800px;">
<div style="padding-left: 10%;">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                在这里添加一些文本
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" data-toggle="modal" data-target="#myModal">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="checkboxTpl">
    <input type="checkbox" disabled="" name="sex" value="{{d.u_locking}}" lay-skin="switch" lay-text="锁定|解锁" lay-filter="sexDemo" {{ d.u_locking == 1 ? 'checked' : '' }}>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table
        ,form = layui.form;
        table.render({
            id:'roletable'
            ,elem: '#test'
            ,url:'/listRoleUser.do'
            ,method:'post'
            ,cellMinWidth: 80
            ,toolbar: '#toolbarDemo'
            ,width:900
            ,cols: [[
                 {field:'u_id', title:'ID',fixed: 'left', unresize: true, sort: true}
                ,{field:'u_loginName',title:'登录名',align: 'center'}
                ,{field:'PersonName',title:'用户名',align: 'center'}
                ,{field:'ru_id',title:'角色id',align: 'center' ,hide:"true"}
                ,{field:'r_Name',title:'角色名',align: 'center'}
                ,{field:'DeptId',title:'部门id',align: 'center',hide:"true"}
                ,{field:'DeptName',title:'部门',align: 'center'}
                ,{field:'u_locking',title:'是否锁定',templet: '#checkboxTpl', unresize: true}
                ,{fixed: 'right',title:'操作', templet: '#barDemo', unresize: true,fixed: 'right',}
            ]]
        });
        //监听锁定操作
        form.on('checkbox(lockDemo)', function(obj){
            layer.tips(this.value);
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var uid = data.u_id;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.msg(uid,function () {
                });
                /*layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });*/
            }
        });
    });
</script>
</html>
