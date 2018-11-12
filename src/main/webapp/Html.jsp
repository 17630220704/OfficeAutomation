<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5 0005
  Time: 下午 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>


<style>
    .int {
        width: 200px;
        padding: 12px;
        background-color: silver;
    }
    .container {
        width: 240px;
        align-content: center;
        display: block;
    }
    .high {
        color: red;
    }
</style>
</head>
<body>
<a href="Hire/Fenye.jsp">人才库查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/fenyeInfo.jsp">职员查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/fenyeNeed.jsp">需求查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/fenyePlan.jsp">计划查询</a><br/><p></p>
<a href="NEW/AHire.jsp">人才库操作</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/ANeed.jsp">招聘需求操作</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/APlan.jsp">招聘计划操作</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/AEmploy.jsp">招聘录用操作</a><br/><p></p>
<a href="NEW/NEWJSP.jsp">招聘jihua审批</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/ShaiInfo1.jsp">招聘筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="NEW/APersoninfo.jsp">录入职工</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="index.jsp">测试</a>

<div align="center" class="container">
    <form method="post" action="">
        <fieldset>
            <legend>表单详情</legend>
            <div class="int">
                <label for="username">用户名：</label>
                <input type="text" id="username" class="required" />
            </div>
            <div class="int">
                <label for="email">邮&nbsp;箱：</label>
                <input type="email" id="email" class="required">
            </div>
            <%--<div class="int">
                <label for="persininfo">个人资料</label>
                <textarea type="text" id="personinfo" ></textarea>
            </div>--%>
            <div class="sub">
                <input type="submit" value="提交" id="send">
                <input type="reset" id="res">
            </div>
        </fieldset>
    </form>
</div>
<script>
    // 首先添加非空验证小红点
    $("form :input.required").each(function(){
        var $required = $("<strong class='high'>*</strong>");
        $(this).parent().append($required);
    });


    // 下面添加每个元素的特定的验证规则
    $("form :input").blur(function(){
        var $parent = $(this).parent();
        // 验证用户名
        if($(this).is("#username")){
            if(this.value=="" || this.value.length<6){
                var errmsg = "请至少输入6位的用户名！";
                $parent.append("<span class='error'>"+errmsg+"</span>");
            }else{
                var rightmsg = "输入数据正确!";
                $parent.append("<span>"+rightmsg+"</span>");
            }
        }

        // 验证邮箱
        if($(this).is("#email")){
            if(this.value==""|| (this.value!=""&& !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value))){
                var errmsg = "请输入正确的邮箱格式！";
                $parent.append("<span class='error'>"+errmsg+"</span>");
            }else{
                var rightmsg = "输入正确！";
                // $parent.append("<span>"+rightmsg+"</span>");
                $parent.append("<span>"+rightmsg+"</span>");
            }
        }
    });

    // 失去焦点之后删除之前的数据提示
    $("form :input.required").blur(function(){
        var $parent = $(this).parent();
        // $parent.find(".error").remove();
        if($(this).is("#username")){
            if(this.value=="" || this.value.length<6){
                // var errmsg = "请至少输入6位的用户名！";
                // $parent.append("<span class='error'>"+errmsg+"</span>");
            }else{
                $parent.find(".error").remove();
            }
        }

        // 验证邮箱
        if($(this).is("#email")){
            if(this.value==""|| (this.value!=""&& !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value))){
                // var errmsg = "请输入正确的邮箱格式！";
                // $parent.append("<span class='error'>"+errmsg+"</span>");
            }else{
                $parent.find(".error").remove();
            }
        }
    })
</script>
</body>
</html>

