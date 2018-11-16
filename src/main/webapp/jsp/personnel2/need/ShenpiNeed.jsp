
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/jquery-3.1.1.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>需求审批</title>

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
        border: 1px solid #9d9d9d;
    }
    .td2{
        padding: 4px;
        width: 200px;
        font-size: 10px;
        border: 1px solid #9d9d9d;
    }
    #body{
        text-align:center;
        margin:0 auto;
        width: 100%;
    }
    .div{
        width: 30%;
        height:100%;
        float: left;
        border: 1px solid #9d9d9d;
        margin-right: 10px;
    }
</style>
<body>
<input type="hidden" id="myuser" value="${username}">
<legend><center>招聘需求审批</center></legend>
<div id="body">
    <%--<form id="tj_tpquery">
        <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
            <tr>
                <td class="td1">审批状态：</td>
                <td class="td2" >


                <select class="form-control remark" id="remark" name="remark" >
                    <option value="">---请选择---</option>
                    <option value="未审批">未审批</option>
                    <option value="审批">审批</option>
                    <option value="驳回">驳回</option>
                </select>
                </td>

                <td class="td1">操作员：</td>
                <td class="td2" ><input type="text" class="form-control tbPersoninfoQuery remind" id="remind" name="remind" placeholder="请输入操作员"></td>
            <tr>
                <td colspan="5" style="text-align: center"><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TbPersoninfoQuery()">查询</button></td>
            </tr>
        </table>
    </form>--%>
</div>
<div id="tp_query"></div>
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="xiugai_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        审批Need
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">需求编号：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="needId" disabled="disabled" placeholder="请选择雇员"></td>

                        </tr>

                        <tr>
                            <td class="td1">审批人：</td>
                            <td class="td2"><input type="text" class="form-control xg6" name="remind"  placeholder="请输入公司名"></td>

                            <td class="td1">审批状态：</td>
                            <td class="td2">
                                <select class="form-control xg7 "  name="remark">
                                <option value="">---请选择---</option>
                                <option value="未审批">未审批</option>
                                    <option value="通过">通过</option>
                                    <option value="驳回">驳回</option>
                                </select>
                            </td>
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
    $(TbPersoninfoQuery());
    function TbPersoninfoQuery(){
        alert($("#myuser").val());
        $.ajax({
            url:"/aNeed/selectShenhe",
            type:"post",
            data:{
                shenpi:$("#myuser").val()
            },
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
                    "<td>审批状态</td>" +
                    "<td colspan='3'>操作</td></tr>";
                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].needID
                        +"</td><td>"+data.list[i].DeptName
                        +"</td><td>"+data.list[i].jods
                        +"</td><td>"+data.list[i].needDate
                        +"</td><td>"+data.list[i].needNumber
                        +"</td><td>"+data.list[i].needRequirements
                        +"</td><td>"+data.list[i].remind
                        +"</td><td>"+data.list[i].remark
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"'  deptid1='"+data.list[i].DeptId+"' data-toggle='modal' data-target='#myModa3'>审批</buuton>" +"</td></tr>"
                }
                $("#tp_query").html(a+="</table>")
            }
        })
    }
    $('body').on('click','.xiugai',function () {
        for(i=0;i<12;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

    });
    function TSetaffUpdate(){
        alert($("#xiugai_from").serialize());
        $.ajax({
            url:"/aNeed/updateNeedshenpi",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TbPersoninfoQuery();
        })
    }
</script>
</html>
