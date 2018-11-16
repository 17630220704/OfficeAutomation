
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link  href="../bootstrap3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" >
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>--%>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
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
<input type="hidden" id="myuser" value="${username}">
<legend><center>职工表录用</center></legend>
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
                            <td class="td1">职员</td>
                            <td class="td2 xq0"></td>
                            <td class="td1">职位</td>
                            <td class="td2 xq1"></td>
                        </tr><tr>
                        <td class="td1">名称</td>
                        <td class="td2 xq2"></td>
                        <td class="td1">生日</td>
                        <td class="td2 xq3"></td>
                    </tr>
                        <tr>

                            <td class="td1">手机号</td>
                            <td class="td2 xq4"></td>
                        </tr><tr>
                        <td class="td1">办公电话</td>
                        <td class="td2 xq65></td>
                        <td class="td1">邮箱</td>
                        <td class="td2 xq6"></td>
                    </tr>
                        <tr>
                            <td class="td1">现住址</td>
                            <td class="td2 xq7"></td>
                            <td class="td1">备注</td>
                            <td class="td2 xq8"></td>
                        </tr><tr>
                        <td class="td1">现公司状态</td>
                        <td class="td2 xq9"></td>
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
<button class="btn btn-primary" data-toggle="modal" id="myuser1" data-target="#myModa2">招聘新录入</button>
<%--<button class="btn btn-primary" data-toggle="modal" id="myuser6" data-target="#myModa6">普通录入</button>--%>
<%--<form id="tj_tdquery"><input type="text" name="persoId"><button onclick="TdStaffQuery()">查询</button></form>--%>
<%--查询合同--%>
<div id="tdquery"></div>
<%--新建合同--%>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        新建员工
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">职位：</td>
                            <td class="td2">
                                <select id="select" class="form-control" name="posiId" >

                                </select></td>
                            <td class="td1">名称：</td>
                            <td class="td2">
                                <select id="selecthire" class="form-control" name="employedId"  >
                                </select></td>
                                    <%--
                                <input type="text" class="form-control" name="personName" placeholder="请输入本人姓名" onblur="isChinese(this.value)"></td>
--%>
                        </tr>
                        <tr>
                            <td class="td1">职员名称：</td>
                            <td class="td2">
                                <select class="form-control" name="personName" id="infopersonName">
                                </select></td>
                        </tr>
                        <tr>
                            <td class="td1">生日：</td>
                            <td class="td2"><input type="date" class="form-control" name="personBirth" ></td>
                            <td class="td1">头像：</td>
                            <td class="td2">
                                <%--<input type="text" class="form-control" name="personPicture" placeholder="请输入合同编号">--%>
                                <input type="file" class="form-control input-lg" style="width:200px" name="personPicture"/>
                                <p class="help-block">选择您需要的头像文件</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">手机号：</td>
                            <td class="td2"><input type="text" class="form-control" name="telephone" placeholder="请输入手机号" onblur="validatemobile(this.value)"></td>
                            <td class="td1">办公电话：</td>
                            <td class="td2"><input type="text" class="form-control" name="officePhone" placeholder="请输入电话号码（本地）" onblur="validatemobilephone(this.value)"></td>
                        </tr>
                        <tr>
                            <td class="td1">邮箱：</td>
                            <td class="td2"><input type="text" class="form-control" name="email" placeholder="请输入个人邮箱" onblur="testEmily(this.value)"></td>
                            <td class="td1">现住址：</td>
                            <td class="td2"><input type="text" class="form-control" name="nowAddress" placeholder="请输入详细地址"></td>
                        </tr>
                        <tr>
                            <td class="td1">操作人：</td>
                            <td class="td2"><input type="text" id="myuser2" class="form-control" name="remark" placeholder="请输入合同编号"></td>
                            <td class="td1">现公司状态：</td>
                            <td class="td2">
                                <select class="form-control" name="nowState">
                                    <option value="0">实习生</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">部门：</td>
                            <td class="td2"><select class="form-control" name="deptId" id="select2">
                            </select></td>
                            <td class="td1">角色：</td>
                            <td class="td2"><select class="form-control" name="rId" id="select3">
                            </select></td>
                             </tr>
                        <tr> <td class="td1">OA用户名：</td>
                        <td class="td2"><input type="text" class="form-control" name="uLoginName" placeholder="请输入OA登录账户" onblur="isChineseOA(this.value)"></td>

                    </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffAdd()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<%--<div class="modal fade" id="myModa6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from6">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        新建员工
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">职位：</td>
                            <td class="td2">
                                <select id="select6" class="form-control" name="posiId" >

                                </select></td>
                            <td class="td1">名称：</td>
                            <td class="td2">
&lt;%&ndash;
                                <input type="text" class="form-control" name="personName" placeholder="请输入本人姓名" onblur="isChinese(this.value)">
&ndash;%&gt;
                                <select id="selecthire" class="form-control" name="employedId" >
                                </select>
                            </td>

                                    &lt;%&ndash;
                                                           <select id="selectname6" class="form-control" name="personName" >
                                    &ndash;%&gt;
                        </tr>
                        <tr>
                            <td class="td1">生日：</td>
                            <td class="td2"><input type="date" class="form-control" name="personBirth" ></td>
                            <td class="td1">头像：</td>
                            <td class="td2">
                                &lt;%&ndash;<input type="text" class="form-control" name="personPicture" placeholder="请输入合同编号">&ndash;%&gt;
                                <input type="file" class="form-control input-lg" style="width:200px" name="personPicture"/>
                                <p class="help-block">选择您需要的头像文件</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">手机号：</td>
                            <td class="td2"><input type="text" class="form-control" name="telephone" placeholder="请输入手机号" onblur="validatemobile(this.value)"></td>
                            <td class="td1">办公电话：</td>
                            <td class="td2"><input type="text" class="form-control" name="officePhone" placeholder="请输入电话号码（本地）" onblur="validatemobilephone(this.value)"></td>
                        </tr>
                        <tr>
                            <td class="td1">邮箱：</td>
                            <td class="td2"><input type="text" class="form-control" name="email" placeholder="请输入个人邮箱" onblur="testEmily(this.value)"></td>
                            <td class="td1">现住址：</td>
                            <td class="td2"><input type="text" class="form-control" name="nowAddress" placeholder="请输入详细地址"></td>
                        </tr>
                        <tr>
                            <td class="td1">操作人：</td>
                            <td class="td2"><input type="text" id="myuser66" class="form-control" name="remark" placeholder="请输入合同编号"></td>
                            <td class="td1">现公司状态：</td>
                            <td class="td2">
                                <select class="form-control" name="nowState">
                                    <option value="5">实习生</option>
                                    <option value="0">入职</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">部门：</td>
                            <td class="td2"><select class="form-control" name="deptId" id="select62">
                            </select></td>
                            <td class="td1">角色：</td>
                            <td class="td2"><select class="form-control" name="rId" id="select63">
                            </select></td>
                        </tr>
                        <tr> <td class="td1">OA用户名：</td>
                            <td class="td2"><input type="text" class="form-control" name="uLoginName" placeholder="请输入OA登录账户" onblur="isChineseOA(this.value)"></td>

                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffAddinfo()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>--%>
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
                            <td class="td1">id：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="persoId" disabled="disabled" placeholder="请选择雇员"></td>
                            <td class="td1">职位：</td>
                            <td class="td2"><select id="select1" name="posiId" ></select></td>
                        </tr>
                        <tr>
                            <td class="td1">名称：</td>
                            <td class="td2"><input type="text" class="form-control xg2" name="personName" placeholder="请输入公司名"></td>
                            <td class="td1">生日：</td>
                            <td class="td2"><input type="date" class="form-control xg3" name="personBirth" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">手机号：</td>
                            <td class="td2"><input type="text" class="form-control xg4" name="telephone" placeholder="请选择雇员"></td>
                        </tr>
                        <tr>
                            <td class="td1">办公电话：</td>
                            <td class="td2"><input type="text" class="form-control xg5" name="officePhone" placeholder="请输入公司名"></td>
                            <td class="td1">邮箱：</td>
                            <td class="td2"><input type="text" class="form-control xg6" name="email" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">现住址：</td>
                            <td class="td2"><input type="text" class="form-control xg7" name="nowAddress" placeholder="请选择雇员"></td>
                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control xg8" name="remark" placeholder="请选择雇员"></td>
                        </tr>
                        <tr>
                            <td class="td1">现公司状态：</td>
                            <td class="td2"><input type="text" class="form-control xg9" disabled="disabled" name="nowState" placeholder="请输入公司名"></td>
                           <%-- <td class="td1">现公司状态：</td>
                            <td class="td2"><input type="text" class="form-control xg10" name="shaixuan" placeholder="请输入公司名"></td>
--%>
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
    $(TdStaffQuery());
    function TdStaffQuery(){
        $.ajax({
            url:"/info/selectinfo",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>职员</td>" +
                    "<td>职位</td>" +
                    "<td>名称</td>" +
                    "<td>生日</td>" +
                    "<td>手机号</td>" +
                    "<td>办公电话</td>" +
                    "<td>邮箱</td>" +
                    "<td>现住址</td>" +
                    "<td>备注</td>" +
                    "<td>现公司状态</td>" +
                    "<td colspan='3'>操作</td></tr>";
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].persoId
                        +"</td><td>"+data.list[i].POSIName
                        +"</td><td>"+data.list[i].PersonName
                        +"</td><td>"+data.list[i].personBirth
                        +"</td><td>"+data.list[i].telephone
                        +"</td><td>"+data.list[i].officePhone
                        +"</td><td>"+data.list[i].Email
                        +"</td><td>"+data.list[i].NowAddress
                        +"</td><td>"+data.list[i].remark
                        +"</td><td>"+data.list[i].NowState
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>修改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdConfigDelete(this)'class='btn btn-primary'  deptid1='"+data.list[i].DeptId+"' type='button' value='"+data.list[i].persoId+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $(function(){

        $.ajax({
            url:"/info/selectinfoname",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select").html("");
                $("#select1").html("");
                $("#select6").html("");
                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].posiId+"'>"+data[i].posiName+"</option>"
                }
                $("#select").append(a);
                $("#select1").append(a);
                $("#select6").append(a);
            }
        })
    });
    $(function(){

        $.ajax({
            url:"/employ/selectAllemployshaixuan",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#selectname").html("");
                var a ="";
                for(i=0;i<data.list.length;i++){
                    a+="<option value='"+data.list[i].empName+"'>"+data.list[i].empName+"</option>"
                }
                $("#selectname").append(a);
            }
        })
    });
    $(function(){

        $.ajax({
            url:"/info/selectinfodept",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select2").html("");
                $("#select62").html("");

                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].deptId+"'>"+data[i].deptName+"</option>"
                }
                $("#select2").append(a);
                $("#select62").append(a);
            }
        })
    });
    $(function(){

        $.ajax({
            url:"/employ/selectAllemployshaixuan",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#selecthire").html("");

                var a ="";
                for(i=0;i<data.list.length;i++){
                    a+="<option value='"+data.list[i].EmployedID+"'>"+data.list[i].empName+"</option>"
                }
                $("#selecthire").append(a);
            }
        })
    });
    $(function(){

        $.ajax({
            url:"/employ/selectAllemployshaixuan",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#infopersonName").html("");

                var a ="";
                for(i=0;i<data.list.length;i++){
                    a+="<option value='"+data.list[i].empName+"'>"+data.list[i].empName+"</option>"
                }
                $("#infopersonName").append(a);
            }
        })
    });
    $(function(){

        $.ajax({
            url:"/info/selectinforole",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select3").html("");
                $("#select63").html("");

                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].r_id+"'>"+data[i].r_Name+"</option>"
                }
                $("#select3").append(a);
                $("#select63").append(a);
            }
        })
    });
    $('body').on('click','.xiangqing',function () {
        /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<11;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    });
    $('body').on('click','.xiugai',function () {
        for(i=0;i<11;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

    });
    function tdConfigDelete(obj){
        if(confirm("确定删除数据")) {

            $.ajax({
                url: "/info/deleteinfo",
                type: "post",
                data: {persoId: $(obj).val()},
                dataType: "json"
            }).always(function () {
                TdStaffQuery();
            })
        }
    }
    $(function () {
        // 绑定单击事件
        $('#myuser1').click(function () {
            // 获取文本框的值
            var value = $('#myuser').val();
            // 设置文本框的值
            $('#myuser2').val(value+":");

        });
        $('#myuser6').click(function () {
            // 获取文本框的值
            var value = $('#myuser').val();
            // 设置文本框的值

            $('#myuser66').val(value+":");
        });
    });
    function TSetaffAdd(){
      $.ajax({
            url:"/info/insertinfo",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffAddinfo(){
        $.ajax({
            url:"/info/insertinfoAdd",
            type:"post",
            data:$("#test_from6").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffUpdate(){
        alert($("#xiugai_from").serialize());
        $.ajax({
            url:"/info/updateinfo",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }

</script>
<script language="javascript">
    function testEmily(obj){
//对电子邮件的验证
        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test(obj))
        {
            alert('请输入有效的邮箱！');
            return false;
        }
    }

    function validatemobile(mobile)
    {
        if(mobile.length==0)
        {
            alert('手机号码不能为空！');
            return false;
        }
        if(mobile.length!=11)
        {
            alert('请输入有效的手机号码，需是11位！');
            return false;
        }}
    function validatemobilephone(mobile)
        {
            if(mobile.length==0)
            {
                alert('电话号码不能为空！');
                return false;
            }
            if(mobile.length!=7)
            {
                alert('请输入有效的电话号码，需是7位！');
                return false;
            }

    }
    function isChinese(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }}

    //验证只能是字母
    function isChineseOA(zm){
        var zmReg=/^[a-zA-Z]*$/;
        if(zm!=""&&!zmReg.test(zm)){
            alert("只能是英文字母！");
            return false;
        }
    }
</script>
</html>

