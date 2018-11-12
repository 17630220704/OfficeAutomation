<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/22 0022
  Time: 下午 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" href="../layUI/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../layUI/layui.all.js"></script>
<script type="text/javascript" src="../layUI/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>招聘需求添加</title>
</head>
<body>
<div class="container">
<form class="layui-form" action="/hire/saveTbRecruitmentneed">
    <div class="layui-form-item">
        <label class="layui-form-label">岗位</label>
        <div class="layui-input-block">
            <input type="text" name="jods" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
            <input type="date" name="needDate" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人数</label>
        <div class="layui-input-block">
            <input type="text" name="needNumber" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">岗位要求</label>
        <div class="layui-input-block">


            <textarea name="needRequirements" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select id="select" name="deptId" lay-verify="required">

            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">提醒</label>
        <div class="layui-input-block">
            <textarea name="remind" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
</body>
<script type="text/javascript">

    $(function(){
        $.ajax({
            url:"/aNeed/selectName",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select").html("");
                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].DeptId+"'>"+data[i].DeptName+"</option>"
                }
                $("#select").append(a);
            }
        })
    })
</script>
</html>
