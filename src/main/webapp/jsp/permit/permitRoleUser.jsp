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
                <form class="layui-form" action="" lay-filter="example">
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="无数据" class="layui-input usname" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录名</label>
                        <div class="layui-input-block">
                            <input type="text" name="uid" style="display: none" class="uid">
                            <input type="text" name="ruid" style="display: none" class="ruid">
                            <input type="text" name="uloginname" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input uploginname">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登陆密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="uloginpassword" placeholder="请输入密码" autocomplete="off" class="layui-input uploginpassword">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择部门</label>
                        <div class="layui-input-block">
                            <select name="deptid" lay-filter="aihao" class="updept">
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择角色</label>
                        <div class="layui-input-block">
                            <select name="rid" lay-filter="aihao" class="uprole">
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">是否锁定登陆</label>
                        <div class="layui-input-block">
                            <input name="ulocking" type="checkbox" lay-skin="switch" lay-text="锁定|解锁" class="upu_locking" value="1">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" data-dismiss="modal">立即提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
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
    <input type="checkbox" class="{{d.u_id}}" name="ulockingaa" value="{{d.u_locking}}" lay-skin="switch" lay-text="锁定|解锁" lay-filter="sexDemo" {{ d.u_locking == 1 ? 'checked' : '' }}>
</script>
<script>
    function showrole() {
        $.post("/listRole.do").done(function (data) {
            var date = data.listRole;
            for (i=0;i<date.length;i++){
                var op = "";
                op+="<option value='"+date[i].r_id+"'>";
                op+=date[i].r_Name;
                op+="</option>";
                $(".uprole").append(op);
            }
                form.render();
        })
    }
    function showdept() {
        $.post("/listDept.do").done(function (data) {
            var date = data.data;
            for (i=0;i<date.length;i++){
                var op = "";
                op+="<option value='"+date[i].DeptId+"'>";
                op+=date[i].DeptName;
                op+="</option>";
                $(".updept").append(op);
            }
            form.render();
        })
    }
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
                ,{field:'u_loginPassword',title:'登录密码',align: 'center',hide:"true"}
                ,{field:'PersonName',title:'用户名',align: 'center'}
                ,{field:'ru_id',title:'角色id',align: 'center' ,hide:"true"}
                ,{field:'r_Name',title:'角色名',align: 'center'}
                ,{field:'DeptId',title:'部门id',align: 'center',hide:"true"}
                ,{field:'DeptName',title:'部门',align: 'center'}
                ,{field:'u_locking',title:'是否锁定',templet: '#checkboxTpl', unresize: true}
                ,{fixed: 'right',title:'操作', templet: '#barDemo', unresize: true,fixed: 'right',}
            ]]
        });
        //获取角色
        showrole();
        //获取部门
        showdept();
        //监听锁定操作
            form.on('switch(sexDemo)', function(obj){
                /* layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);*/
                var chkval = this.value;
                var datalockingu_id = this.className;
                alert(datalockingu_id);
                alert(chkval);
                if(chkval==1){
                    $.post("/updatelocking.do",{'uid':datalockingu_id,'ulocking':chkval}).done(function (date) {
                        layer.msg(date.result,{time:800});
                        table.reload('roletable',{url:'/listRoleUser.do'});
                    });
                }else if (chkval ==0) {
                    $.post("/updatelocking.do",{'uid':datalockingu_id,'ulocking':chkval}).done(function (date) {
                        layer.msg(date.result,{time:800});
                        table.reload('roletable',{url:'/listRoleUser.do'});
                    });
                }
            });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var field = obj.field;
            var uid = data.u_id;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                //获取并重写表格数据
                $(".usname").val("");
                $(".uid").val("");
                $(".ruid").val("");
                $(".uploginname").val("");
                $(".uploginpassword").val("");
                $(".uprole").find("option").attr("selected",false);
                $(".updept").find("option").attr("selected",false);
                $(".usname").val(data.PersonName);
                $(".ruid").val(data.ru_id);
                $(".uid").val(data.u_id);
                $(".uploginname").val(data.u_loginName);
                $(".uploginpassword").val(data.u_loginPassword);
                //设置默认选中
                var ckru_id = data.ru_id;
                var ckdeptid = data.DeptId;
                $(".uprole").find("option[value='"+ckru_id+"']").attr("selected",true);
                $(".updept").find("option[value='"+ckdeptid+"']").attr("selected",true);
                //重载表单
                form.render();
                //提交监听
                form.on('submit(demo1)', function(data){
                    $.post("/updateRole.do",data.field).done(function (date) {
                        layer.msg("更新"+date.result+"",{time:500}, function () {
                            table.reload("roletable", {url:'/listRoleUser.do'});
                        })
                    });
                    return false;
                });
            }
        });
    });
</script>
</html>
