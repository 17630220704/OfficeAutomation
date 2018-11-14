<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/9
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>排班时间设置</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="/resources/js_sunxin/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/js_sunxin/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="/resources/js_sunxin/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <script src="/resources/js_sunxin/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="/resources/js_sunxin/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
</head>
<body style="min-height: 600px;">
<div class="showscheduledate">
    <table class="layui-hide" id="test" lay-filter="test"></table>
    <script type="text/html" id="bar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>
<div class="layui-row" id="add_date" style="display: none;width: 100%;height: 100%;">
    <div class="layui-col-md10">
        <form class="layui-form" id="addscheduledate">
            <div class="layui-form-item">
                <label class="layui-form-label">班次名称：</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="sdId" class="layui-input sdId" >
                    <input type="text" name="sdName" class="layui-input sdName">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">上午时间：</label>
                    <div class="layui-input-inline">
                        <input type="time" class="layui-input sdAmstartdate"  value="08:00" name="sdAmstartdate">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline">
                        <input type="time" class="layui-input sdAmenddate" value="12:00" name="sdAmenddate">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">下午时间：</label>
                    <div class="layui-input-inline">
                        <input type="time" name="sdPmstartdate" value="01:00"  class="layui-input sdPmstartdate">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline">
                        <input type="time" name="sdPmenddate" value="05:00"  class="layui-input sdPmenddate">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">晚上时间：</label>
                    <div class="layui-input-inline">
                        <input type="time" name="sdNmstartdate" value="00:00"  class="layui-input sdNmstartdate">
                    </div>
                    <div class="layui-form-mid">-</div>

                    <div class="layui-input-inline">
                        <input type="time" name="sdNmenddate" value="00:00"  class="layui-input sdNmenddate">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="/resources/js_sunxin/layui-v2.4.5/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            id:'listscheduledate'
            ,elem: '#test'
            ,url:'/listscheduledate.do'
            ,toolbar:'default'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'sd_id' ,title: '班次ID', sort: true}
                ,{field:'sd_name', title: '班次名称'}
                ,{field:'sd_amstartdate', title: '上午签到时间', sort: true}
                ,{field:'sd_amenddate',  title: '上午签离时间',sort: true}
                ,{field:'sd_pmstartdate',  title: '下午签到时间', sort: true}
                ,{field:'sd_pmenddate', title: '下午签离时间', sort: true}
                ,{field:'sd_nmstartdate',  title: '晚班签到时间', sort: true,hide:"true"}
                ,{field:'sd_nmenddate', title: '晚班签离时间', sort: true,hide:"true"}
                ,{title:'操作',fixed: 'right', width: 165, align:'center', toolbar: '#bar'}
            ]]
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });
        //监听头工具栏事件
        table.on('toolbar(test)', function(obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    var openadd = layer.open({
                        type: 1
                        ,area:["900px","auto"]
                        ,btn: ['提交']
                        ,yes: function(layero, index){
                            var sdName = $(".sdName").val();
                            var sdAmstartdate = $(".sdAmstartdate").val();
                            var sdAmenddate = $(".sdAmenddate").val();
                            var sdPmstartdate = $(".sdPmstartdate").val();
                            var sdPmenddate = $(".sdPmenddate").val();
                            var sdNmstartdate = $(".sdNmstartdate").val();
                            var sdNmenddate = $(".sdNmenddate").val();
                            $.post("/savescheduledate.do",
                                {
                                    'sdName':sdName
                                    ,'sdAmstartdate':sdAmstartdate
                                    ,'sdAmenddate':sdAmenddate
                                    ,'sdPmstartdate':sdPmstartdate
                                    ,'sdPmenddate':sdPmenddate
                                    ,'sdNmstartdate':sdNmstartdate
                                    ,'sdNmenddate':sdNmenddate
                                })
                                .done(function (date) {
                                layer.msg(date.result,{time:500});
                                table.reload("listscheduledate",{url:'/listscheduledate.do'});
                            });
                            layer.close(openadd);
                        },
                        content: $("#add_date")
                    });
                    break;
                case 'update':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        $(".sdId").val(data[0].sd_id);
                        $(".sdName").val(data[0].sd_name);
                        $(".sdAmstartdate").val(data[0].sd_amstartdate);
                        $(".sdAmenddate").val(data[0].sd_amenddate);
                        $(".sdPmstartdate").val(data[0].sd_pmstartdate);
                        $(".sdPmenddate").val(data[0].sd_pmenddate);
                        $(".sdNmstartdate").val(data[0].sd_nmstartdate);
                        $(".sdNmenddate").val(data[0].sd_nmenddate);
                        var openupdate = layer.open({
                            type: 1
                            ,area:["900px","auto"]
                            ,btn: ['更新']
                            ,yes: function(layero, index){
                                var sdId = $(".sdId").val();
                                var sdName = $(".sdName").val();
                                var sdAmstartdate = $(".sdAmstartdate").val();
                                var sdAmenddate = $(".sdAmenddate").val();
                                var sdPmstartdate = $(".sdPmstartdate").val();
                                var sdPmenddate = $(".sdPmenddate").val();
                                var sdNmstartdate = $(".sdNmstartdate").val();
                                var sdNmenddate = $(".sdNmenddate").val();
                                $.post("/updatescheduledate.do",
                                    {
                                        'sdId':sdId
                                        ,'sdName':sdName
                                        ,'sdAmstartdate':sdAmstartdate
                                        ,'sdAmenddate':sdAmenddate
                                        ,'sdPmstartdate':sdPmstartdate
                                        ,'sdPmenddate':sdPmenddate
                                        ,'sdNmstartdate':sdNmstartdate
                                        ,'sdNmenddate':sdNmenddate
                                    })
                                    .done(function (date) {
                                        layer.msg(date.result,{time:500});
                                        table.reload("listscheduledate",{url:'/listscheduledate.do'});
                                    });
                                layer.close(openupdate);
                            },
                            content: $("#add_date")
                        });
                    }
                    break;
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除行么', function(index) {
                            layer.msg('删除 [id]：' + checkStatus.data[0].sd_id, {time: 1000});
                            table.reload("listscheduledate",{url:'/listscheduledate.do'});
                        });
                    }
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    var sdid = data.sd_id;
                    $.post("/deletescheduledate.do",{'sdid':sdid}).done(function (date) {
                        layer.msg(date.result,{time:600});
                        if(date.result=='删除成功'){
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                 $(".sdId").val(data.sd_id);
                 $(".sdName").val(data.sd_name);
                 $(".sdAmstartdate").val(data.sd_amstartdate);
                 $(".sdAmenddate").val(data.sd_amenddate);
                 $(".sdPmstartdate").val(data.sd_pmstartdate);
                 $(".sdPmenddate").val(data.sd_pmenddate);
                 $(".sdNmstartdate").val(data.sd_nmstartdate);
                 $(".sdNmenddate").val(data.sd_nmenddate);
                var openupdate = layer.open({
                    type: 1
                    ,area:["900px","auto"]
                    ,btn: ['更新']
                    ,yes: function(layero, index){
                        var sdId = $(".sdId").val();
                        var sdName = $(".sdName").val();
                        var sdAmstartdate = $(".sdAmstartdate").val();
                        var sdAmenddate = $(".sdAmenddate").val();
                        var sdPmstartdate = $(".sdPmstartdate").val();
                        var sdPmenddate = $(".sdPmenddate").val();
                        var sdNmstartdate = $(".sdNmstartdate").val();
                        var sdNmenddate = $(".sdNmenddate").val();
                        $.post("/updatescheduledate.do",
                            {
                                'sdId':sdId
                                ,'sdName':sdName
                                ,'sdAmstartdate':sdAmstartdate
                                ,'sdAmenddate':sdAmenddate
                                ,'sdPmstartdate':sdPmstartdate
                                ,'sdPmenddate':sdPmenddate
                                ,'sdNmstartdate':sdNmstartdate
                                ,'sdNmenddate':sdNmenddate
                            })
                            .done(function (date) {
                                layer.msg(date.result,{time:500});
                                table.reload("listscheduledate",{url:'/listscheduledate.do'});
                            });
                        layer.close(openupdate);
                    },
                    content: $("#add_date")
                });
            }
        });
    });
</script>
</html>
