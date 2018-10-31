<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>权限角色</title>
    <link rel="stylesheet" href="/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/permit-trees/layui-v2.4.4/layui/css/layui.css" >
    <script src="/resources/jquery-3.1.1.min.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/layui.js"></script>
    <script src="/resources/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
    <script src="/resources/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <style>
        table tr td{
            font-size: 14px;
        }
    </style>
</head>
<body style="padding: 0px;margin: 0px; height: auto;">
<div class="container">
    <table class="table table table-hover">
        <thead>
        <tr>
            <th>角色编号</th>
            <th>角色名</th>
            <th>权限</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody class="showlistRole">

        </tbody>
    </table>
</div>
<!-- 模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
           <%-- <div class="modal-header">
                <h4 class="modal-title">模态框头部</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>--%>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择权限</label>
                        <div class="layui-input-block">
                            <div id="LAY-auth-tree-index"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-sm" type="submit" lay-submit lay-filter="LAY-auth-tree-submit">提交</button>
                            <button class="layui-btn layui-btn-primary layui-btn-sm" type="reset">重置</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

</div>
</body>
<script>
    $(function () {
        getRole();
        $("body").on("click",".updatepermit",function () {
            var rid = $(this).attr("id");
            getmodulTrees(rid);
        })
    });
    //获取角色数据
    function getRole(){
        $.post("/listRole.do").done(function (data) {
            $(".showlistRole tr").remove();
            var listRole = data.listRole;
            for (var i=0;i<listRole.length;i++){
                var  listadd = "<tr>";
                listadd+="<td>";
                listadd+=listRole[i].r_id;
                listadd+="</td>";
                listadd+="<td>";
                listadd+=listRole[i].r_Name;
                listadd+="</td>";
                listadd+="<td>";
                listadd+=listRole[i].m_Name;
                listadd+="</td>";
                listadd+="<td>";
                listadd+="<button id='"+listRole[i].r_id+"' class='updatepermit layui-btn layui-btn-primary layui-btn-sm' data-toggle='modal' data-target='#myModal'>修改</button>";
                listadd+="</td>";
                listadd+="</tr>";
                $(".showlistRole").append(listadd);
            }
            parent.document.getElementById("iframe").height=0;
            parent.document.getElementById("iframe").height=document.body.scrollHeight;
        })
    }
    /*获取权限数据*/
    function getmodulTrees(rid) {
        var $ = layui.jquery;
        var authtree = layui.authtree;
        var form = layui.form;
        var layer = layui.layer;
        layui.config({
            base: 'extends/',
        }).extend({
            authtree: 'authtree',
        });
        $.ajax({
            type: "Post",
            url: "/getModulTrees.do",
            dataType: "json",
            data:{
              'rid':rid
            },
            success: function (data) {
                var trees = data.getmodulTrees;
                authtree.render('#LAY-auth-tree-index', trees, {
                    layfilter: 'lay-check-auth',
                    autowidth: true,
                    autoclose: true,
                });
                authtree.on('change(lay-check-auth)', function (data) {
                    // 获取所有已选中节点
                    var checked = authtree.getChecked('#LAY-auth-tree-index');
                    console.log('checked', checked);
                });
            },
            error: function () {
                alert("树形结构加载失败！");
            }
        });
        form.on('submit(LAY-auth-tree-submit)', function(obj){
            var authids = authtree.getChecked('#LAY-auth-tree-index');
            alert(authids);
            return false;
        });

    }
</script>
<script>
    $(function () {
        $(".rolename").keyup(function () {
            getRole();
        })
    })
</script>
</html>
