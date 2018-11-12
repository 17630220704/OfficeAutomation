
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" href="../layUI/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../layUI/layui.all.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="../Html.jsp">首页</a>
<legend><center>职员查询操作</center></legend>
<div style="margin-top: 17px;margin-left: 1103px;">
    <span>岗位搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入岗位进行模糊查询"/>
</div>

<div class="layui-card-body">
    <table class="layui-hide" id="test"></table>
</div>
<script>
    layui.use('table', function(){
        var kw='';
        addData(kw);
    });
    function addData(kwx){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/fenye/showDatainfo?keyWord1='+kwx
            ,limit:4 //默认为10
            ,cols: [[
                {field:'persoId', width:170, title: '职员ID', sort: true} //sort：true页面可进行排序操作
                ,{field:'POSIName', width:170, title: '职位'}
                ,{field:'PersonName', width:120, title: '名称'}
                ,{field:'personBirth', width:130, title: '生日', sort: true}
                ,{field:'personPicture', width:120, title: '头像'}
                ,{field:'telephone', width:120, title: '手机号'}
                ,{field:'officePhone', width:120, title: '办公电话'}
                ,{field:'Email', width:120, title: '邮箱'}
                ,{field:'NowAddress', width:120, title: '现住址'}
                ,{field:'remark', width:120, title: '备注'}
                ,{field:'NowState', width:120, title: '现公司状态'}
            ]]
            ,page: true
            ,done:function(res, curr, count){
                //数据的回调用，可不写
            }
        });
    }
    $("#sear1").keyup(function(event){

        if(event.keyCode ==13){
            var keyWord1=$("#sear1").val();
            addData(keyWord1);
        }
    });
</script>

</body>
</html>
