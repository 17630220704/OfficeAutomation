<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../resources/js_lcy/layui-v2.4.5/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../../resources/js_lcy/jquery-3.3.1.min.js"></script>
    <script src="../../resources/js_lcy/layui-v2.4.5/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js_lcy/ckeditor/ckeditor.js"></script>
</head>
<body>
<div>
    <h1 style="text-align: center">草稿箱</h1>
</div>
<div>
    <input type="text" name="title" id="title" lay-verify="title" placeholder="请输入主题" class="layui-input"
           style="width: 10%">
</div>
<div>
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>

<script>

    layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#test',
                id: 'weiyi'
                , url: '/rough'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , limit: 11
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'BODY_ID', width: 170, title: '主题', sort: true}
                    , {field: 'SUBJECT', width: 170, title: '主题'}
                    , {field: 'SEND_TIME', width: 130, title: '时间'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo'}

                ]]
                , page: true,
                done: function (res, curr, count) {
                    $("[data-field='BODY_ID']").css('display', 'none');

                }

            });
        $('#title').keyup(function () {
            var keyWord = $("#title").val();
            table.reload('weiyi', {
                url: '/rough' //数据接口
                , where: {"keyWord": keyWord}
            })
        });

            table.on('toolbar(test)', function (obj) {
                layer.confirm('真的删除么', function (index) {
                    layer.close(index);
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch (obj.event) {
                        case 'getCheckData':
                            var data = checkStatus.data;
                            for (var i = 0; i < data.length; i++) {
                                var bodyId = data[i].BODY_ID;
                                $.ajax({
                                    url: "/CGdEdelete",
                                    type: "post",
                                    data: {
                                        "bodyId": bodyId
                                    },
                                    dataType: "json",
                                    success: function (data) {
                                        table.reload(['weiyi'], function () {
                                        })
                                    }
                                })

                            }
                            break;
                    }
                });
            });
            //监听行工具事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;

                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        var bodyId = data.BODY_ID;
                        obj.del();
                        layer.close(index);
                        $.ajax({
                            url: "/CGdEdelete",
                            type: "post",
                            data: {
                                "bodyId": bodyId
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                            }
                        })
                    });

                } else if (obj.event === 'edit') {
                    var bodyId = data.BODY_ID;
                    window.location.href='/CGQueryt?bodyId='+bodyId+'';
                }
            });
        }
    );
</script>