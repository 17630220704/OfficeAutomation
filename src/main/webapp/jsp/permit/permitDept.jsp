<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/4
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>部门管理</title>
    <link rel="stylesheet" href="/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/permit-trees/layui-v2.4.4/layui/css/layui.css">
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/layui.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
    <script src="/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="layui-row" style="height: 900px;">
    <div class="layui-col-xs3" style="border-right: 1px solid #f2f2f2;height: 900px; ">
        <div class="grid-demo">
            <form class="layui-form adddept">
                <div>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>添加部门</legend>
                    </fieldset>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="dname" placeholder="请输入部门名" class="layui-input dname">
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">上级部门</label>
                        <div class="layui-input-inline">
                            <select name="quiz" class="showdept">
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn subsavedept">立即提交</button>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-col-xs9">
        <table class="layui-table" lay-data="{url:'/listDept.do', id:'test3'}" lay-filter="test3" id="test3">
            <thead>
            <tr>
                <th lay-data="{field:'DeptId', width:80, sort: true}">部门id</th>
                <th lay-data="{field:'DeptNumber', width:120, sort: true, edit: 'text'}">上级部门id</th>
                <th lay-data="{field:'DeptName', edit: 'text', minWidth: 150}">部门名称</th>
                <th lay-data="{fixed: 'right', toolbar: '#barDemo'}">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
<script>
    layui.use(['table', 'layer'], function () {//layui 模块引用，根据需要自行修改
        var layer = layui.layer, table = layui.table;
    });
</script>
<script>
    $(function () {
        showdept();
        $(".subsavedept").click(function () {
            savedept();
        })

    });
    function showdept() {
        $.post("/getDept.do").done(function (date) {
            var list = date.getDept;
            for (i=0;i<list.length;i++){
                var seleDept = "<option value='";
                seleDept+=list[i].DeptId;
                seleDept+="'>";
                seleDept+=list[i].DeptName;
                seleDept+="</option>";
                $(".showdept").append(seleDept);
            }
            form.render();
        })
    }
    function savedept() {
        var DeptNumber = 0;
        var DeptName = null;
        DeptNumber = $(".showdept").val();
        DeptName = $(".dname").val();
        $.post("/saveDept.do",{'DeptNumber':DeptNumber,'DeptName':DeptName}).done(function (date) {
            layer.msg(date.result, {time: 500},function () {
                var ii = layer.load(0, {shade: false});
                setTimeout(function(){
                    window.location.reload();
                    layer.close(ii);
                }, 800);
            });
            layer.close();
        });
    }
    //方法重载
    /*function reftable() {
        alert("方法重载开始");
        table.reload('test3', {
            url: '/listDept.do'
            //, where: {} //设定异步数据接口的额外参数
        });
        alert("方法重载结束");
    }*/
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听单元格编辑
        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段

            $.post("/updateDept.do",{'DeptId':data.DeptId,'DeptType':field,'DeptName':value},function (date) {
                layer.msg(date.result,{time:800});
            })
           /* layer.msg('[准备修改ID: '+ data.DeptId +'] '+'   /' + '欲修改属性名： '+field + '     /'+'更改为：'+ value,{time:1000});*/
        });
        //监听行工具事件
        table.on('tool(test3)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    $.post("/deleteDept.do",{"deptid":data.DeptId},function (data) {
                        layer.msg(data.result,{time:1000});
                        if (data.result==true){
                            obj.del();
                        }
                    });
                });
            }
        });
        parent.document.getElementById("iframe").height=0;
        parent.document.getElementById("iframe").height=document.body.scrollHeight;
    });
</script>
</html>
