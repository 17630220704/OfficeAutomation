
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layUI/css/layui.css">
    <script type="text/javascript" src="../layUI/layui.js"></script>
</head>


<STYLE>
    #table input {
        text-align: right;
    }
</STYLE>
<body>
<div style="margin-left: 30%; width: 50%; float: left;">

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-warm tjry">添加人员</button>
            <input type="text" name="title" lay-verify="required" readonly="readonly" autocomplete="off" placeholder="人员"
                   class="layui-input userId">
          <%--  <input type="text" class="userIds b12" value="" style="display:none;">--%>
            <!--触发模态框按钮-->

        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div id="mtk3" style="display: none;" class="modal-content">
    <div class="modal-body">
        <div class="col-xs-2" >
            <select name="from1" id="from1" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">

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
    /*mtk3 模态框3的一些事件  */
    $(".tjry").click(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['50%', '38%'],//定义宽和高
                title: '设置班次',//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#mtk3') //打开的内容
                /*content: 'index.jsp'//打开的内容 type为2*/
            });
        })
    })
    $(".mtk3-gb").click(function(){
        layer.close(layer.index);
    })
    $(".mtk3-qr").click(function(){
        var option = $("#to option").map(function(){
            return $(this).val();
        }).get().join(",");
        var optionText = $("#to option").map(function(){
            return $(this).html();
        }).get().join(",");
        $("#to option").clone().appendTo("#from");
        $("#to option").remove();
        $(".userId").val(optionText);
        $(".userIds").val(option);
        layer.close(layer.index);
    })
    /*！mtk3 模态框3的一些事件  */



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
        url:"/aNeed/selectName",
        data:"",
        type:"post",
        dataType:"json",
        success:function(data){
            $("#from1").html("");
            var a ="";
            for(lu=0;lu<data.length;lu++){
                a+="<option class='la' value='"+data[lu].DeptId+"'>"+data[lu].DeptName+"</option>"
            }
            $("#from1").append(a);
        }
    })
    $("body").on("click",".la",function () {
        alert($(this).val())
        $.ajax({
            url:"/Plan/selectpeople",
            type:"post",
            data:{
                people:$(this).val()
            },
            dataType:"json",
            success:function(all){
                var option1 = "";
                for (i=0;i<all.list.length;i++){
                    var obj = all.list;
                    option1 += "<option value='"+obj[i].persoId+"'>"+obj[i].PersonName+"</option>";
                }
                $("#from").html(option1);
            }
        })
    })
</script>
</html>
