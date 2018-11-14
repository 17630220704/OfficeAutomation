<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>排班设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="/resources/js_sunxin/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/js_sunxin/layui-v2.4.5/layui/css/layui.css">
    <link rel="stylesheet" href="/resources/js_sunxin/layui-v2.4.5/layui/js/formSelects-v4.css">
    <script src="/resources/js_sunxin/permit-trees/llayui-v2.4.5/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
    <script src="/resources/js_sunxin/layui-v2.4.5/layui/layui.js"></script>
    <script src="/resources/js_sunxin/permit-trees/layui-v2.4.4/layui/extends/authtree.js"></script>
</head>
<body>
<div class="layui-row" style="min-height: 800px;">
        <table class="layui-hide" id="test" lay-filter="test"></table>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <script type="text/html" id="checkboxTpl">
            <input type="checkbox" class="{{d.scheduleId}}" name="ulockingaa" value="{{d.scheduleState}}" lay-skin="switch" lay-text="启用|停用" lay-filter="sexDemo" {{ d.scheduleState == '1' ? 'checked' : '' }}>
        </script>
</div>
<div class="layui-row" id="showschedule" style="display: none;width: 100%;height: 100%;">
    <div class="layui-form-item">
        <label class="layui-form-label">周一时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rmonday"  value="00:00" name="rmonday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input pmonday" value="00:00" name="pmonday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周二时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rtuesday"  value="00:00" name="rtuesday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input ptuesday" value="00:00" name="ptuesday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周三时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rwednesday"  value="00:00" name="rwednesday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input pwednesday" value="00:00" name="pwednesday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周四时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rthursday"  value="00:00" name="rthursday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input pthursday" value="00:00" name="pthursday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周五时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rfriday"  value="00:00" name="rfriday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input pfriday" value="00:00" name="pfriday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周六时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rsaturday"  value="00:00" name="rsaturday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input psaturday" value="00:00" name="psaturday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">周日时间：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input rsunday"  value="00:00" name="rsunday" >
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline">
            <input type="text" class="layui-input psunday" value="00:00" name="psunday">
        </div>
    </div>
</div>
<div class="layui-row" id="updateschedule" style="display: none;width: 100%;height: 100%;">
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">排班名称：</label>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input upscheduleId" name="upscheduleId" >
                <input type="text" class="layui-input upscheduleName" name="upscheduleName" >
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">日期范围</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input update" id="test6" placeholder=" -">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择框</label>
            <div class="layui-input-block">
                <select class="scheduleType" lay-verify="required">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周一时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprmonday"  value="00:00" name="uprmonday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppmonday" value="00:00" name="uppmonday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周二时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprtuesday"  value="00:00" name="uprtuesday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input upptuesday" value="00:00" name="upptuesday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周三时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprwednesday"  value="00:00" name="uprwednesday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppwednesday" value="00:00" name="uppwednesday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周四时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprthursday"  value="00:00" name="uprthursday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppthursday" value="00:00" name="uppthursday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周五时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprfriday"  value="00:00" name="uprfriday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppfriday" value="00:00" name="uppfriday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周六时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprsaturday"  value="00:00" name="uprsaturday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppsaturday" value="00:00" name="uppsaturday">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">周日时间：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uprsunday"  value="00:00" name="uprsunday" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input uppsunday" value="00:00" name="uppsunday">
            </div>
        </div>
    </form>
</div>
<div class="layui-row" id="saveschedule" style="display: none;width: 100%;height: 100%;">
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">排班名称：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input savescheduleName" name="savescheduleName" >
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">日期范围</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input savedate test-item" placeholder=" - ">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班次选择</label>
            <div class="layui-input-block">
                <select class="scheduleType savescheduleType" lay-verify="required">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排班人员</label>
            <div class="layui-input-block">
                <select name="city" xm-select="showPerson" xm-select-search="" xm-select-search-type="dl" class="showPersonName">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否启用</label>
            <div class="layui-input-block">
                <input class="savescheduleState" type="checkbox" name="switch" lay-skin="switch" lay-text="启用|停用" checked value="1">
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    //全局定义一次, 加载formSelects
    layui.config({
        base: '/resources/js_sunxin/layui-v2.4.5/layui/js/' //此处路径请自行处理, 可以使用绝对路径
    }).extend({
        formSelects: 'formSelects-v4'
    });
    //加载模块
    layui.use(['jquery', 'formSelects'], function(){
        var formSelects = layui.formSelects;
        /*重载多选下拉框数据*/
        layui.formSelects.data('showPerson', 'server', { url: '/listpersoninfo.do'});
    });
</script>
<script>
    $(function () {
        showscheduleType();
    });
    function showscheduleType() {
        $.post("/scheduleType.do").done(function (date) {
            var  result = date.result;
            $(".scheduleType").html("");
            for (i=0;i<result.length;i++){
                var sdtype = "<option value='"+result[i].sd_id+"'>";
                sdtype+=result[i].sd_name;
                sdtype+="</option>";
                $(".scheduleType").append(sdtype);
            }
        })
    }

</script>
<script>
    layui.use(['layer', 'form','laydate','table','jquery', 'formSelects'], function(){
        var table = layui.table;
        var layer = layui.layer
            ,laydate = layui.laydate
            ,form = layui.form;
        var formSelects = layui.formSelects;

        table.render({
            id:'listschedule'
            ,elem: '#test'
            ,url:'/listschedule.do'
            ,toolbar: 'default'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'scheduleId', title: '排班ID', sort: true}
                ,{field:'scheduleName',title: '排班名'}
                ,{field:'PersonName',title: '排班人员'}
                ,{field:'Date_start',title: '排班开始时间'}
                ,{field:'Date_end',title: '排班结束时间'}
                ,{field:'scheduleState',title: '排班状态',templet: '#checkboxTpl'}
                ,{field:'scheduleType', title: '排班类型'}
                ,{fixed: 'right', width: 170, align:'center', toolbar: '#barDemo'}
            ]]
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.scheduleId + ' 的查看操作');
                var monday=data.monday.split(',');
                var tuesday=data.tuesday.split(',');
                var wednesday=data.wednesday.split(',');
                var thursday=data.thursday.split(',');
                var friday=data.friday.split(',');
                var saturday=data.saturday.split(',');
                var sunday=data.sunday.split(',');
                $(".rmonday").val(monday[0]);
                $(".pmonday").val(monday[1]);
                $(".rtuesday").val(tuesday[0]);
                $(".ptuesday").val(tuesday[1]);
                $(".rwednesday").val(wednesday[0]);
                $(".pwednesday").val(wednesday[1]);
                $(".rthursday").val(thursday[0]);
                $(".pthursday").val(thursday[1]);
                $(".rfriday").val(friday[0]);
                $(".pfriday").val(friday[1]);
                $(".rsaturday").val(saturday[0]);
                $(".psaturday").val(saturday[1]);
                $(".rsunday").val(sunday[0]);
                $(".psunday").val(sunday[1]);
                var openadd = layer.open({
                    type: 1
                    ,area:["900px","auto"]
                    ,content: $("#showschedule")
                });
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                /*重新渲染*/
                form.render('select');
                /*初始化赋值*/
                var upscheduleName = data.scheduleName;
                var monday=data.monday.split(',');
                var tuesday=data.tuesday.split(',');
                var wednesday=data.wednesday.split(',');
                var thursday=data.thursday.split(',');
                var friday=data.friday.split(',');
                var saturday=data.saturday.split(',');
                var sunday=data.sunday.split(',');
                var update = data.Date_start+" - "+data.Date_end;
                $(".upscheduleId").val(data.scheduleId);
                $(".upscheduleName").val(upscheduleName);
                $(".updateStart").val(data.Date_start);
                $(".updateEnd").val(data.Date_end);
                $(".uprmonday").val(monday[0]);
                $(".uppmonday").val(monday[1]);
                $(".uprtuesday").val(tuesday[0]);
                $(".upptuesday").val(tuesday[1]);
                $(".uprwednesday").val(wednesday[0]);
                $(".uppwednesday").val(wednesday[1]);
                $(".uprthursday").val(thursday[0]);
                $(".uppthursday").val(thursday[1]);
                $(".uprfriday").val(friday[0]);
                $(".uppfriday").val(friday[1]);
                $(".uprsaturday").val(saturday[0]);
                $(".uppsaturday").val(saturday[1]);
                $(".uprsunday").val(sunday[0]);
                $(".uppsunday").val(sunday[1]);
                /*渲染时间选择器*/
                layui.use(['layer', 'form','laydate'], function(){
                    var layer = layui.layer
                        ,laydate = layui.laydate
                        ,form = layui.form;
                    //日期范围
                    laydate.render({
                        elem: '#test6'
                        ,format: 'yyyy-MM-dd'
                        ,theme: '#393D49'
                        ,range: true
                        ,value:update
                    });

                });
                /*弹出层*/
                var openadd = layer.open({
                    type: 1
                    ,area:["900px","auto"]
                    ,btn: ['更新']
                    ,yes: function(layero, index){
                        /*获取数据*/
                       var upscheduleId=  $(".upscheduleId").val();
                       var upscheduleName =  $(".upscheduleName").val();
                       var upmonday = $(".uprmonday").val()+","+$(".uppmonday").val();
                       var uptuesday = $(".uprtuesday").val()+","+$(".upptuesday").val();
                       var upwednesday = $(".uprwednesday").val()+","+$(".uppwednesday").val();
                       var upthursday = $(".uprthursday").val()+","+$(".uppthursday").val();
                       var upfriday = $(".uprfriday").val()+","+$(".uppfriday").val();
                       var upsaturday = $(".uprsaturday").val()+","+$(".uppsaturday").val();
                       var upsunday = $(".uprsunday").val()+","+$(".uppsunday").val();
                       var scheduleType = $(".scheduleType").val();
                       /*分割时间范围*/
                       var datetimese = $(".update").val().split(' - ');
                       var dateStart = datetimese[0];
                       var dateEnd =  datetimese[1];
                        $.post("/updateschedule.do",{
                            'scheduleId':upscheduleId,
                            'scheduleName':upscheduleName,
                            'scheduleType':scheduleType,
                            'dateStart':dateStart,
                            'dateEnd':dateEnd,
                            'monday':upmonday,
                            'tuesday':uptuesday,
                            'wednesday':upwednesday,
                            'thursday':upthursday,
                            'friday':upfriday,
                            'saturday':upsaturday,
                            'sunday':upsunday
                            }
                         ).done(function (date) {
                            layer.msg(date.result,{time:1000});
                            layer.close(openadd);
                            table.reload("listschedule",{url:'/listschedule.do'});
                        })
                    }
                    ,content: $("#updateschedule")
                });
            }
        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    form.render();
                    layui.use(['layer', 'form','laydate'], function(){
                        var layer = layui.layer
                            ,laydate = layui.laydate
                            ,form = layui.form;
                        //日期范围
                        lay('.test-item').each(function(){
                            laydate.render({
                                elem: this
                                ,trigger: 'click'
                                ,range: true
                            });
                        });
                    });
                    var saveschedule = layer.open({
                        type: 1
                        ,area:["900px","auto"]
                        ,btn: ['添加']
                        ,yes: function(layero, index){
                            var persoId = layui.formSelects.value('showPerson', 'valStr');
                            var scheduleState = $(".savescheduleState").val();
                            var savescheduleName = $(".savescheduleName").val();
                            var savescheduleType = $(".savescheduleType").val();
                            var datetimese = $(".savedate").val().split(' - ');
                            var dateStart = datetimese[0];
                            var dateEnd =  datetimese[1];
                            alert(scheduleState);
                            if(savescheduleType!=null&&savescheduleType!=''){
                                $.post("/saveschedule.do",{
                                    'scheduleName':savescheduleName
                                    ,'scheduleType':savescheduleType
                                    ,'persoId':persoId
                                    ,'scheduleState':scheduleState
                                    ,'dateStart':dateStart
                                    ,'dateEnd':dateEnd
                                }).done(function (date) {
                                    layer.msg(date.result,{time:1000});
                                    layer.close(saveschedule);
                                    table.reload("listschedule",{url:'/listschedule.do'})
                                })
                            }else {
                                layer.msg("所有项为必填项",{time:1000});
                            }
                        }
                        ,content: $("#saveschedule")
                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].scheduleId);
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
        //监听锁定操作
        form.on('switch(sexDemo)', function(obj){
            var chkval = this.value;
            var datalockingu_id = this.className;
            alert(datalockingu_id);
            alert(chkval);
            table.reload('listschedule',{url:'/listschedule.do'});
            /*if(chkval==1){
                $.post("/updatelocking.do",{'uid':datalockingu_id,'ulocking':chkval}).done(function (date) {
                    layer.msg(date.result,{time:800});
                    table.reload('roletable',{url:'/listRoleUser.do'});
                });
            }else if (chkval ==0) {
                $.post("/updatelocking.do",{'uid':datalockingu_id,'ulocking':chkval}).done(function (date) {
                    layer.msg(date.result,{time:800});
                    table.reload('roletable',{url:'/listRoleUser.do'});
                });
            }*/
        });
    });
</script>
</html>
