<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/18
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Bootstrap 实例 - 面板标题</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--引入ckeditor的网页上加入ckeditor.j--%>
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <%--Bootstrap 实例 - 面板标题--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
</head>
<body>


<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title" align="center">
            写邮件
        </h3>
    </div>
    <div class="panel-body">
        <table border="1px" style="width: 100%">
            <tr>
                <td style="width: 15%">发件人：</td>
                <td style="width: 85%">
                    <input type="text" class="form-control" style="width: 70%; Float:left" id="persoId">
                </td>
            <tr>
                <td style="width: 15%">收件人：</td>
                <td style="width: 85%"><input type="text" class="form-control" style="width: 70%; Float:left" id="toId2">
                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        添加
                    </button>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">邮件主题：</td>
                <td style="width: 85%">
                    <input type="text" class="form-control" style="width: 70%;Float:left" id="subject">
                </td>
            </tr>
            <tr>
                <td style="width: 15%">邮件内容：</br>
                                  字数：
                </td>
                <td style="width: 85%">
                    <div>
                        <textarea rows="30" cols="50" name="content" id="content">111a</textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">时间：</td>
                <td style="width: 85%">
                    <input id="sendTime" class="form-control" style="width: 70%;Float:left" type="date">
                </td>
            </tr>
            <tr>
                <td style="width: 15%">附件：</td>
                <td style="width: 85%">
                <input id="attachmentId" class="form-control" style="width: 70%;Float:left">
                </td>
            </tr>
            <tr>
                <td style="width: 15%">附件选择：</td>
                <td style="width: 85%">

                </td>
            </tr>
            <tr>
                <td style="width: 15%">提醒：</td>
                <td style="width: 85%">
                    <input checked type="radio" name="" value='1' onclick="chkRadio1(this)"/>发送事务提醒
                    <input type="radio" name="" value='1' onclick="chkRadio2(this)"/> 请求阅读收条
                    <input type="radio" name="" value='1' onclick="chkRadio3(this)"/> 请求回复
                </td>
            </tr>
            <tr>
                <td style="width: 15%"></td>
                <td style="width: 85%">
                    <input type="button" value="立即发送" id="btnadd"><input type="button" value="保存草稿箱">
                </td>
            </tr>
        </table>
    </div>

</div>

<!--以上是主要内容  以下是   -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>
            </div>
            <div class="modal-body">
                在这里添加一些文本
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



</body>
</html>
<script type="text/javascript">
    CKEDITOR.replace('content');
    var flag = true;

    function chkRadio1(id) {
        id.checked = flag;
        flag = !flag;
    }

    function chkRadio2(id) {
        id.checked = flag;
        flag = !flag;
    }

    function chkRadio3(id) {
        id.checked = flag;
        flag = !flag;
    }
    /*添加邮件*/

    $(function() {
        $("#btnadd").click(function() {
            alert($("#content").html());

            var persoId = $("#persoId").val();
            var toId2 = $("#toId2").val();
            var subject = $("#subject").val();
            var content = $("#content").text();
            var sendTime = $("#sendTime").val();
            var attachmentId = 1;
            var attachmentName = 1;
            var size = 100;
            $.ajax({
                url : "/mailAdd",
                type : "post",
                data : {
                    "persoId" : persoId,
                    "toId2" : toId2,
                    "subject" : subject,
                    "size" : size,
                    "content" : content,
                    "sendTime" : sendTime,
                    "attachmentId" : attachmentId,
                    "attachmentName" : attachmentName
                },
                dataType : "json",
                success : function(data) {
                    alert(data.message);
                }
            });
        });
    });
</script>
