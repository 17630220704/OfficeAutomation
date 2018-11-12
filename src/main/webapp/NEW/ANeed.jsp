<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/27 0027
  Time: 上午 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link  href="../bootstrap3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" >
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>--%>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    jodsADD: "required",

                    getBookTimeADD:{
                        required:true

                    },


                    needNumberADD: {
                        required: true,
                        number:true
                    }


                },
                messages: {
                    jodsADD: "请输入需求岗位",

                    getBookTimeADD:{
                        required:"输入时间"

                    },

                    needNumberADD: "请输正确",

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
<style>
    .display_none{
        display: none;
    }
    .td1{
        padding: 10px;
        width: 190px;
        background-color: #f2f2f2;
        font-size: 10px;
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
    }

</style>
<body>
<a href="../Html.jsp">首页</a>
<input type="text" id="myuser" value="小路">
<legend><center>招聘需求操作</center></legend>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    详情信息
                </h4>
            </div>
            <div class="modal-body">
                <div style="border: 1px solid #9c9c9c;">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">需求编号</td>
                            <td class="td2 xq0"></td>
                            <td class="td1">招聘部门</td>
                            <td class="td2 xq1"></td>
                        </tr><tr>
                        <td class="td1">提供岗位</td>
                        <td class="td2 xq2"></td>
                        <td class="td1">需求时间</td>
                        <td class="td2 xq3"></td>
                    </tr><tr>
                        <td class="td1">需求人数</td>
                        <td class="td2 xq4"></td>
                        <td class="td1">岗位要求</td>
                        <td class="td2 xq5"></td>
                    </tr><tr>
                        <td class="td1">提醒</td>
                        <td class="td2 xq6"></td>
                        <td class="td1">备注</td>
                        <td class="td2 xq7"></td>
                    </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<button class="btn btn-primary" data-toggle="modal" id="myuser1" data-target="#myModa2">新建合同</button>
<%--<form id="tj_tdquery"><input type="text" name="persoId"><button onclick="TdStaffQuery()">查询</button></form>--%>
<form >
    <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
        <tr>
            <td class="td1">岗位：</td>
            <td class="td2" >

                <select class="form-control jods" id="jods" name="jods">
                    <option value="">---请选择---</option>
                    <option value="学徒工">学徒工</option>
                    <option value="普通工">普通工</option>
                    <option value="技工">技工</option>
                    <option value="技师">技师</option>
                </select>
           </td>
            <td class="td1">开始时间：</td>
            <td class="td2" ><input type="date" class="form-control  small" id="small" name="small" placeholder=""></td>

            <td class="td2" ><input type="date" class="form-control  big" id="big" name="big" placeholder=""></td>
            <td ><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TdStaffQuery()">查询</button></td>


        </tr>
    </table>
</form>
<%--查询合同--%>
<div id="tdquery"></div>
<%--新建合同--%>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from" id="signupForm" <%--action="/aNeed/insertNeed" method="post"--%>>
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        新建需求
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">招聘部门：</td>
                            <td class="td2"> <select id="select" name="deptId" class="form-control"></select></td>
                            <td class="td1">提供岗位：</td>
                            <td class="td2">
                                <select class="form-control "  name="jods" onblur="CheckForm(this.value)">
                                    <option value="">---请选择---</option>
                                    <option value="学徒工">学徒工</option>
                                    <option value="普通工">普通工</option>
                                    <option value="技工">技工</option>
                                    <option value="技师">技师</option>
                                    <option value="管理员">管理员</option>
                                    <option value="秘书">秘书</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">需求时间：</td>
                            <td class="td2"><input type="date"  id="getBookTime" class="form-control" name="needDate" onblur="CheckFormdate(this.value)" placeholder="请输入公司名"></td>
                            <td class="td1">需求人数：</td>
                            <td class="td2"><input type="text" class="form-control"  name="needNumber" placeholder="请输入数字" onblur="CheckFormnumber(this.value)"></td>

                        </tr>
                        <tr>
                            <td class="td1">招聘需求：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="needRequirements" rows="3" placeholder="请输入招聘要求"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">提醒：</td>
                            <td class="td2" colspan="3">
                            <textarea class="form-control" name="remind" placeholder="请输入要提醒的内容"></textarea>
                            </td>

                        </tr>
                        <tr>
                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control" id="myuser2" name="remark" placeholder="请输入公司名"></td>
                             </tr>

                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <input type="submit"  class="btn btn-primary" data-dismiss="modal" onclick="TSetaffAdd()" value="提交">
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="xiugai_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                       修改需求
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">需求编号：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="needId" placeholder="请选择雇员"></td>
                            <td class="td1">招聘部门：</td>
                            <td class="td2"><select id="select2" name="deptId"  class="form-control">
                            </select></td>
                        </tr>
                        <tr>
                            <td class="td1">提供岗位：</td>
                            <td class="td2"><input type="text" class="form-control xg2" name="jods" placeholder="请输入公司名"></td>
                            <td class="td1">需求时间：</td>
                            <td class="td2"><input type="text" class="form-control xg3" name="needDate" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">需求人数：</td>
                            <td class="td2"><input type="text" class="form-control xg4" name="needNumber" placeholder="请输入公司名"></td>
                            <td class="td1">岗位要求：</td>
                            <td class="td2"><input type="text" class="form-control xg5" name="needRequirements" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">提醒：</td>
                            <td class="td2"><input type="text" class="form-control xg6" name="remind" placeholder="请输入公司名"></td>
                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control xg7" name="remark" placeholder="合同类型"></td>
                        </tr>


                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffUpdate()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(TdStaffQuery())
    function TdStaffQuery(){

        $.ajax({
            url:"/aNeed/selectAll",
            data:{
                jods:$("#jods").val()/*,
                small:$("#small").val(),
                big:$("#big").val()*/
            },
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>需求编号</td>" +
                    "<td>招聘部门</td>" +
                    "<td>提供岗位</td>" +
                    "<td>需求时间</td>" +
                    "<td>需求人数</td>" +
                    "<td>招聘需求</td>" +
                    "<td>提醒</td>" +
                    "<td>备注</td>" +
                    "<td colspan='3'>操作</td></tr>"
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].needID
                        +"</td><td>"+data.list[i].DeptName
                        +"</td><td>"+data.list[i].jods
                        +"</td><td>"+data.list[i].needDate
                        +"</td><td>"+data.list[i].needNumber
                        +"</td><td>"+data.list[i].needRequirements
                        +"</td><td>"+data.list[i].remind
                        +"</td><td>"+data.list[i].remark
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"'  deptid1='"+data.list[i].DeptId+"' data-toggle='modal' data-target='#myModa3'>修改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdConfigDelete(this)'class='btn btn-primary'  type='button' value='"+data.list[i].needID+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
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
                $("#select2").append(a);
            }
        })
    })
    $('body').on('click','.xiangqing',function () {
       /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<10;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    })
    $('body').on('click','.xiugai',function () {
        for(i=0;i<10;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

        var html1 =$(this).attr("deptid1");
        alert(html1)
        $("#select2 option[value='"+html1+"']").attr("selected","selected");

    })
    function tdConfigDelete(obj){
        if(confirm("确定删除数据")) {

            $.ajax({
                url: "/aNeed/deleteNeed",
                type: "post",
                data: {needId: $(obj).val()},
                dataType: "json"
            }).always(function () {
                TdStaffQuery();
            })
        }
    }

    function TSetaffAdd(){

        $.ajax({
            url:"/aNeed/insertNeed",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }

    $(function () {
        // 绑定单击事件
        $('#myuser1').click(function () {
            // 获取文本框的值
            var value = $('#myuser').val();
            // 设置文本框的值
            $('#myuser2').val(value);
        });
    });
    function TSetaffUpdate(){
        $.ajax({
            url:"/aNeed/updateNeed",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }

</script>
<%--<script>
    window.onload = function(){
        function getDate(){
            debugger;
            var today = new Date();
            var date;
            date = (today.getFullYear()) +"-" + (today.getMonth() + 1 ) + "-" + today.getDate() ;
            return date;
        }
        window.setInterval(function(){
            document.getElementById("getBookTime").value=getDate();
        }, 1000);
    }
</script>--%>
<script language="javascript">
    function CheckForm(obj)
    {
        if (obj.length == 0){
            alert("岗位不能为空!");
            return false;
        }
        /* return true;
         alert("岗位不能为空!");*/
    }
    function CheckFormdate(obj)
    {
        if (obj.length == 0) {
            alert("时间不能为空!");
            return false;
        }
    }
    //验证只能为数字
    function CheckFormnumber(obj){
        var reg = /^[0-9]+$/;
        if (obj.length == 0) {
            alert("不能为空!");
            return false;
        }
        if(obj!=""&&!reg.test(obj)){
            alert('只能输入数字！');
            return false;
        }
    }
</script>
</html>

