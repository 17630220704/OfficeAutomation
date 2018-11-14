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
</head>
<body>
<div>
    <h1 style="text-align: center">垃圾箱</h1>
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
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">销毁</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">销毁</a>
</script>
<div id="motaikunag" style="display: none;">
    <table style="width: 100%;height: 100%">
        <tr>
            <td style="width: 20%">发件人:</td>
            <td id="persoId" style="width: 70%"></td>
        </tr>
        <tr>
            <td>收件人:</td>
            <td id="toid2"></td>
        </tr>
        <tr>
            <td>主题:</td>
            <td><input type="text" id="subject" readonly="readonly" required lay-verify="required" autocomplete="off"
                       class="layui-input"></td>
        </tr>
        <tr>
            <td>内容:</td>
            <td>
                <textarea id="content" readonly="readonly" required lay-verify="required"
                          class="layui-textarea"></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td id="sendTime" style="text-align: right"></td>
        </tr>
    </table>
</div>

</body>
</html>

<script>

    layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#test',
                id: 'weiyi'
                , url: '/dustbin?keyWord='
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , limit: 11
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'BODY_ID', width: 170, title: '主题', sort: true}
                    , {field: 'EmailId', width: 170, title: '编号', sort: true}
                    , {field: 'SUBJECT', width: 170, title: '主题'}
                    , {field: 'SEND_TIME', width: 130, title: '时间'}
                    , {field: 'READ_FLAG', width: 130, title: '状态'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo'}

                ]]
                , page: true,
                done: function (res, curr, count) {
                    $("[data-field='BODY_ID']").css('display', 'none');
                    $("[data-field='EmailId']").css('display', 'none');
                    $("[data-field='READ_FLAG']").children().each(function () {
                        if ($(this).text() == '0') {
                            $(this).text("未读").addClass("layui-badge layui-bg-orange");
                        } else if ($(this).text() == '1') {
                            $(this).text("已读").addClass("layui-badge layui-bg-green");
                        } else {
                            $(this).text("状态");
                        }
                    })
                }

            });
        $('#title').keyup(function () {
            var keyWord = $("#title").val();
            table.reload('weiyi', {
                url: '/dustbin' //数据接口
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
                                var emailId = data[i].EmailId;
                                $.ajax({
                                    url: "/LjUpdate",
                                    type: "post",
                                    data: {
                                        "emailId": emailId
                                    },
                                    dataType: "json",
                                    success: function (data) {
                                    }
                                })

                            }
                            table.reload(['weiyi'], function () {
                            });
                            break;
                    }
                });
            });
            //监听行工具事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;

                if (obj.event === 'del') {
                    layer.confirm('真的销毁行么', function (index) {
                        var emailId = data.EmailId;
                        obj.del();
                        layer.close(index);
                        $.ajax({
                            url: "/LjUpdate",
                            type: "post",
                            data: {
                                "emailId": emailId
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                            }
                        })
                    });

                } else if (obj.event === 'edit') {

                    layui.use(['layer'], function () {
                        var layer = layui.layer, $ = layui.$;
                        layer.open({
                            type: 1,//类型
                            area: ['600px', '500px'],//定义宽和高
                            title: '收件',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: $('#motaikunag')//打开的内容
                        });
                        var bodyId = data.BODY_ID;
                        var posiId = data.persoId;
                        $.ajax({
                            url: "/LjXq",
                            type: "post",
                            data: {
                                "bodyId": bodyId,
                                "posiId": posiId
                            },
                            dataType: "json",
                            success: function (data) {
                                $("#persoId").html(data[0].PersonName);
                                $("#toid2").html(data[0].toidname);
                                $("#subject").val(data[0].SUBJECT);
                                $("#content").html(data[0].CONTENT);
                                $("#sendTime").html(data[0].SEND_TIME);
                                table.reload(['weiyi'], function () {
                                })
                            }
                        });

                    })

                }
            });
        }
    );
</script>