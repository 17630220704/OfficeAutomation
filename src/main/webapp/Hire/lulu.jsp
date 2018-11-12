
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<STYLE>
    #table input {
        text-align: right;
    }
</STYLE>
<body>
<div style="margin-left: 30%; width: 50%; float: left;">
    <div class="layui-inline">
        <label class="layui-form-label">月份</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input b13" id="test3" placeholder="yyyy-MM">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">设置人员</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="required" readonly="readonly" autocomplete="off" placeholder="人员"
                   class="layui-input userId">
            <input type="text" class="userIds b12" value="" style="display:none;">
            <!--触发模态框按钮-->
            <button type="button" class="layui-btn layui-btn-warm tjry">添加人员</button>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div id="mtk3" style="display: none;" class="modal-content">
    <div class="modal-body">
        <div class="col-xs-2" >
            <select name="from" id="from1" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-3" >
            <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

            </select>
        </div>
        <div class="col-xs-2">
            <button type="button" id="addAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
            <button type="button" id="addOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
            <button type="button" id="removeOne" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
            <button type="button" id="removeAll" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>
        </div>
        <div class="col-xs-5">
            <select name="to" id="to" multiple="multiple" class="form-control" size="8" style="height:150px"></select>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default mtk3-gb" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary mtk3-qr">确认选择</button>
    </div>
</div><!-- /.modal-content -->
</body>
<script>


        //选择一项
        $("#addOne").click(function(){
            $("#from option:selected").clone().appendTo("#to");
            $("#from option:selected").remove();
        });
        //选择全部
        $("#addAll").click(function(){
            $("#from option").clone().appendTo("#to");
            $("#from option").remove();
        });
        //移除一项
        $("#removeOne").click(function(){
            $("#to option:selected").clone().appendTo("#from");
            $("#to option:selected").remove();
        });
        //移除全部
        $("#removeAll").click(function(){
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
        });
        $.ajax({
            url:"userdeptselect",
            type:"post",
            dataType:"json",
            success:function(all){
                var option = "";
                for (i=0;i<all.list.length;i++){
                    var obj = all.list;
                    option += "<option class='la' value='"+obj[i].DeptId+"'>"+obj[i].DeptName+"</option>";
                }
                $("#from1").html(option);
            }
        })
        $("body").on("click",".la",function () {
            $.ajax({
                url:"Usersurfaceid",
                type:"post",
                data:{
                    "deptId":$(this).val()
                },
                dataType:"json",
                success:function(all){
                    var option1 = "";
                    for (i=0;i<all.list.length;i++){
                        var obj = all.list;
                        option1 += "<option value='"+obj[i].UserId+"'>"+obj[i].UserName+"</option>";
                    }
                    $("#from").html(option1);
                }
            })
        })

</script>
</html>
