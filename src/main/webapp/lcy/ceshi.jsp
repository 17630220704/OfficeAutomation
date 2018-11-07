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
    <link rel="stylesheet" href="../resources/layui-v2.4.5/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
    <script src="../resources/layui-v2.4.5/layui/layui.js"></script>
</head>
<body>
<div>
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<div id="motaikunag" style="display: none;">
    <div class="layui-row">
        <div class="layui-col-md9">

            <div class="layui-col-md9">
                <table>
                    <tr>
                        <td>发件人:</td>
                        <td id="persoId"></td>
                    </tr>
                    <tr>
                        <td>收件人:</td>
                        <td id="toid2"></td>
                    </tr>
                    <tr>
                        <td>主题:</td>
                        <td id="subject"></td>
                    </tr>
                    <tr>
                        <td>内容:</td>
                        <td id="content"></td>
                    </tr>
                    <tr>
                        <td>时间:</td>
                        <td id="sendTime"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>

    layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#test',
                id: 'weiyi'
                , url: '/showData?keyWord='
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , limit: 11
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'BODY_ID', width: 170, title: '主题', sort: true}
                    , {field: 'EmailId', width: 170, title: '编号', sort: true}
                    , {field: 'persoId', width: 170, title: '发件人', sort: true} //sort：true页面可进行排序操作
                    , {field: 'SUBJECT', width: 170, title: '主题'}
                    , {field: 'SEND_TIME', width: 130, title: '时间'}
                    , {field: 'READ_FLAG', width: 130, title: '状态'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo'}

                ]]
                , page: true,
                done:function (res,curr,count) {
                    $("[data-field='READ_FLAG']").children().each(function () {
                        if ($(this).text()=='1'){
                            $(this).text("已读").addClass("layui-badge layui-bg-green");
                        }else{
                            $(this).text("未读").addClass("layui-badge layui-bg-orange");
                        }
                    })
                }

            });

            table.on('toolbar(test)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;

                        for (var i = 0; i < data.length; i++) {
                            var emailId = data[i].EmailId;
                            $.ajax({
                                url: "/mailUpdate",
                                type: "post",
                                data: {
                                    "emailId": emailId
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
            //监听行工具事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;

                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        var emailId = data.EmailId;

                        obj.del();
                        layer.close(index);
                        $.ajax({
                            url: "/mailUpdate",
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
                            area: ['400px', '300px'],//定义宽和高
                            title: '收件',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: $('#motaikunag')//打开的内容
                        });
                        var bodyId = data.BODY_ID;
                        var posiId = data.persoId;
                        $.ajax({
                            url: "/mailXq",
                            type: "post",
                            data: {
                                "bodyId": bodyId,
                                "posiId": posiId
                            },
                            dataType: "json",
                            success: function (data) {
                                $("#persoId").html(data[0].PersonName);
                                $("#toid2").html(data[0].toidname);
                                $("#subject").html(data[0].SUBJECT);
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