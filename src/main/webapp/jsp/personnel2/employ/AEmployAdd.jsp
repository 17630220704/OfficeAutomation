<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link  href="../bootstrap3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" >
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>--%>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <input type="hidden" id="myuser" value="${username}">
    <title>Title录用</title>
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
<legend><center>招聘录用操作</center></legend>
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
                            <td class="td1">id</td>
                            <td class="td2 xq0"></td>
                            <td class="td1">计划名称</td>
                            <td class="td2 xq1"></td>
                        </tr><tr>
                        <td class="td1">所属部门</td>
                        <td class="td2 xq2"></td>
                        <td class="td1">录用人</td>
                        <td class="td2 xq3"></td>
                    </tr>
                       <%-- <tr>
                            <td class="td1">录用日期</td>
                            <td class="td2 xq4"></td>
                            <td class="td1">正式入职时间</td>
                            <td class="td2 xq5"></td>
                        </tr><tr>
                        <td class="td1">正式起薪时间</td>
                        <td class="td2 xq6"></td>
                        <td class="td1">备注</td>
                        <td class="td2 xq7"></td>
                    </tr>--%>
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
<button class="btn btn-primary" data-toggle="modal" id="myuser1" data-target="#myModa2">录入</button>
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
                        录入
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">待筛选人员：</td>
                            <td class="td2"><select id="select3" class="form-control"  name="empId" >

                            </select></td>
                            <td class="td1">待面试部门：</td>
                            <td class="td2"><select id="select" class="form-control " name="deptId" ></select></td>
                        </tr>
                       <tr>
                            <td class="td1">录用人：</td>
                            <td class="td2"><input type="text" class="form-control" id="myuser2" name="headid" placeholder="请输入公司名"></td>
                            </tr>
                        <tr>
                         <td class="td1">操作日期：</td>
                            <td class="td2"><input type="date" class="form-control" name="hireDate" placeholder="请输入合同编号"></td>

                          <%--  <td class="td1">正式入职日期：</td>
                            <td class="td2"><input type="date" class="form-control" name="workEndTime" placeholder="请输入公司名"></td>
                            <td class="td1">正式起薪时间：</td>
                            <td class="td2"><input type="date" class="form-control" name="officialSalary" placeholder="请输入合同编号"></td>
                        </tr><tr>--%>
                        <td class="td1">备注：</td>
                        <td class="td2"><input type="text" class="form-control" name="remark" placeholder="请输入公司名"></td>
                    </tr>

<tr> <td class="td1">备注：</td>
    <td class="td2">
       <%-- <input type="text" class="form-control"  placeholder="请输入公司名">--%>
    <select  class="form-control"  name="shaixuan">
        <option value="1">待筛选</option>

    </select>
    </td>
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
                            <td class="td2"><input type="text" class="form-control xg0" name="employedId" disabled="disabled" placeholder="请输入公司名"></td>
                            <td class="td1">计划名称：</td>
                            <td class="td2"><select id="select4" class="form-control " name="empId" ></select></td>
                        </tr>
                        <tr>
                            <td class="td1">待面试部门：</td>
                            <td class="td2"><select id="select2" class="form-control " name="deptId" ></select></td>
                            <td class="td1">录用负责人：</td>
                            <td class="td2"><input type="text" class="form-control xg3" name="headid" placeholder="合同类型"></td>
                        </tr>
                      <%--  <tr>
                            <td class="td1">录用如期：</td>
                            <td class="td2"><input type="date " class="form-control xg4" name="hireDate" placeholder="请输入公司名"></td>
                            <td class="td1">正式入职时间：</td>
                            <td class="td2"><input type="date " class="form-control xg5" name="workEndTime" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">正式起薪时间：</td>
                            <td class="td2"><input type="date " class="form-control xg6" name="officialSalary" placeholder="请输入公司名"></td>
                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control xg7" name="remark" placeholder="合同类型"></td>
                        </tr>--%>
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
            url:"/employ/selectAllemploy",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>人员名称</td>" +
                    "<td>计划名称</td>" +
                    "<td>待面试部门</td>" +
                    "<td>录用负责人</td>" +
                    "<td colspan='3'>操作</td></tr>";
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].EmployedID
                        +"</td><td>"+data.list[i].empName
                        +"</td><td>"+data.list[i].planName
                        +"</td><td>"+data.list[i].DeptName
                        +"</td><td>"+data.list[i].headid
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>整改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdConfigDelete(this)'class='btn btn-primary'  deptid1='"+data.list[i].DeptId+"' type='button' value='"+data.list[i].EmployedID+"'>删除</button>"
                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $(function(){
        $.ajax({
            url:"/employ/employname",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select").html("");
                $("#select2").html("");
                var a ="";
                for(i=0;i<data.length;i++){
                    a+="<option value='"+data[i].DeptId+"'>"+data[i].DeptName+"</option>"
                }
                $("#select").append(a);
                $("#select2").append(a);
            }
        })
    });
    $(function(){
        $.ajax({
            url:"/employ/employnamep",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#select3").html("");
                $("#select4").html("");
                var b ="";

                for(i=0;i<data.length;i++){
                    b+="<option value='"+data[i].empID+"'>"+data[i].empName+"</option>"
                }
                $("#select3").append(b);
                $("#select4").append(b);
            }
        })
    });
    $('body').on('click','.xiangqing',function () {
        /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<9;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    });
    $('body').on('click','.xiugai',function () {
        for(i=0;i<9;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

       /* var html1 =$(this).attr("deptid1");
        alert(html1)
        $("#select2 option[value='"+html1+"']").attr("selected","selected");*/

    });
    function tdConfigDelete(obj){
        if(confirm("确定删除数据")) {

            $.ajax({
                url: "/employ/deleteemploy",
                type: "post",
                data: {employedId: $(obj).val()},
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
            $('#myuser2').val(value);
        });
    });
    function TSetaffAdd(){
        $.ajax({
            url:"/employ/insertemployAdd",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffUpdate(){
        $.ajax({
            url:"/employ/updateemploy",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }

</script>
</html>

