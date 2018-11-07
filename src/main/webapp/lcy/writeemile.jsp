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
                <td style="width: 85%">
                    <input type="text" class="form-control" style="Float:left;display: none" id="toId1">
                    <input type="text" class="form-control" style="width: 70%; Float:left" id="toId2">
                    <button class="btn btn-primary btn-lg btn-xs" data-toggle="modal" data-target="#myModal"
                            id="Eselect">
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
                        <textarea rows="30" cols="50" name="content" id="content" class="ckeditor"></textarea>
                    </div>
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
                    <input type="button" value="立即发送" id="btnadd"><input type="button" value="保存草稿箱" id="btnBox">
                </td>
            </tr>
        </table>
    </div>

</div>

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
                <div class="col-xs-5">
                    <select name="from" id="from" multiple="multiple" class="multiselect form-control" size="8"
                            style="height:150px">

                    </select>
                </div>
                <div class="col-xs-2">
                    <button type="button" id="addAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i>
                    </button>
                    <button type="button" id="addOne" class="btn btn-block"><i
                            class="glyphicon glyphicon-chevron-right"></i></button>
                    <button type="button" id="removeOne" class="btn btn-block"><i
                            class="glyphicon glyphicon-chevron-left"></i></button>
                    <button type="button" id="removeAll" class="btn btn-block"><i
                            class="glyphicon glyphicon-backward"></i></button>
                </div>
                <div class="col-xs-5">
                    <select name="to" id="to" multiple="multiple" class="form-control" size="8"
                            style="height:150px"></select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="guanbi">关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="xz">
                    确认选择
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
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
    function getContent() {
        return CKEDITOR.instances.content.getData();    //获取textarea的值
    }

    $(function () {
        $("#btnadd").click(function () {
            var persoId = $("#persoId").val();
            var toId2 = $("#toId1").val();
            var toidname = $("#toId2").val();
            var subject = $("#subject").val();
            var content = getContent();
            var attachmentId = 1;
            var attachmentName = 1;
            var size = 100;
            alert(content)
            $.ajax({
                url: "/mailAdd",
                type: "post",
                data: {
                    "persoId": persoId,
                    "toId2": toId2,
                    "toidname": toidname,
                    "subject": subject,
                    "size": size,
                    "content": content,
                    "attachmentId": attachmentId,
                    "attachmentName": attachmentName
                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            });
        });
    });
    $(function () {
        //选择一项
        $("#addOne").click(function () {
            $("#from option:selected").clone().appendTo("#to");
            $("#from option:selected").remove();
        });
        //选择全部
        $("#addAll").click(function () {
            $("#from option").clone().appendTo("#to");
            $("#from option").remove();
        });
        //移除一项
        $("#removeOne").click(function () {
            $("#to option:selected").clone().appendTo("#from");
        });
        //移除全部
        $("#removeAll").click(function () {
            $("#to option").clone().appendTo("#from");
            $("#to option").remove();
        });

    });

    $(function () {
        $("#Eselect").click(function () {
            $.ajax({
                url: "/emailQuery",
                type: "post",
                dataType: "json",
                success: function (data) {
                    $("#from").empty();
                    $("#to").empty();
                    for (var i = 0; i < data.length; i++) {

                        $("#from").append(
                            "<option value=" + data[i].persoId + ">" + data[i].personName
                            + "</option>");
                    }
                }
            });
        });
    });
    $("#xz").click(function () {
        var aaa = [];
        $("#to option").each(function () {
            aaa.push($(this).text());
        });
        $("#toId2").val(aaa);
        var bbb = [];
        $("#to option").each(function () {
            bbb.push($(this).val());
        });
        $("#toId1").val(bbb);

    });
    /*保存草稿邮件*/
    $(function () {
        $("#btnBox").click(function () {

            var persoId = $("#persoId").val();
            var toId2 = $("#toId1").val();
            var toidname = $("#toId2").val();
            var subject = $("#subject").val();
            var content = getContent();
            var attachmentId = 1;
            var attachmentName = 1;
            var size = 100;
            alert(content)
            $.ajax({
                url: "/mailAddBox",
                type: "post",
                data: {
                    "persoId": persoId,
                    "toId2": toId2,
                    "toidname": toidname,
                    "subject": subject,
                    "size": size,
                    "content": content,
                    "attachmentId": attachmentId,
                    "attachmentName": attachmentName
                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            });
        });
    });
</script>
