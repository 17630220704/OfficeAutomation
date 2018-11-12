<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/11 0011
  Time: 下午 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<html>
<head>
    <title>Title</title>
    <script>
        $.validator.setDefaults({
            submitHandler: function() {
                alert("提交事件!");
            }
        });
        $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
            $("#signupForm").validate({
                rules: {
                    firstname: "required",

                    telphone1:{
                        required:true,
                        rangelength:[11,11]

                    },


                    email: {
                        required: true,
                        email: true
                    }


                },
                messages: {
                    firstname: "请输入您的名字",

                    telphone1:{
                        required:"输入电话号码",
                        rangelength:"shuruzhengqude"
                    },

                    email: "请输入一个正确的邮箱",

                }
            });
        });
    </script>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body>
<form class="cmxform" id="signupForm" method="get" action="">
    <fieldset>
        <legend>验证完整的表单</legend>
        <p>
            <label for="firstname">名字</label>
            <input id="firstname" name="firstname" type="text">
        </p>
        <p>
            <label for="telphone">shouji</label>
            <input id="telphone" name="telphone1" type="text">
        </p>

        <p>
            <label for="email">Email</label>
            <input id="email" name="email" type="email">
        </p>


        <p>
            <input class="submit" type="submit" value="提交">
        </p>
    </fieldset>
</form>
</body>
</html>
