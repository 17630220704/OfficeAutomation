<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/11 0011
  Time: 下午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    选择部门
                </h4>
            </div>
            <div class="modal-body">
                <div class="col-xs-5" >
                    <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8" style="height:150px">
                        <option value="1">1</option>
                        <option value="1">1</option>
                        <option value="1">1</option>
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
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    确认选择
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<input type="text" name="title" lay-verify="required" readonly="readonly" autocomplete="off" placeholder="人员"
       class="layui-input userId">
<input type="text" class="userIds b12" value="" style="display:none;">
<!--触发模态框按钮-->
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
<button class="btn btn-primary btn-lg btn-xs" data-toggle="modal" data-target="#myModal"  style="">
    部门
</button>


<!--JQuery代码 -->

<script>
    $(function(){
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
    });
    $("#buttonMultiple").click(function () {
        var option = $("#to option").map(function(){
            return $(this).val();
        }).get().join(",");
        var optionText = $("#to option").map(function(){
            return $(this).html();
        }).get().join(",");
        $("#to option").clone().appendTo("#from");
        $("#to option").remove();
    });
        $.ajax({
            url:"/aNeed/selectName",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#from").html("");
                var a ="";
                for(lu=0;lu<data.length;lu++){
                    a+="<option value='"+data[lu].DeptId+"'>"+data[lu].DeptName+"</option>"
                }
                $("#from").append(a);
            }
        })

</script>


</body>
</html>
