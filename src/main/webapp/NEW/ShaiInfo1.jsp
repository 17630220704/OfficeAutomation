
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>录用筛选一</title>

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
<a href="../Html.jsp">首页</a>
<legend><center>招聘录用筛选</center></legend>
<div id="body">
    <form id="tj_tpquery">
        <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
            <tr>
                <td class="td1">筛选状态：</td>
                <td class="td2" ><input type="text" class="form-control tbPersoninfoQuery shaixuan" id="shaixuan" name="shaixuan" placeholder="请选择雇员"></td>

                <td class="td1">操作员：</td>
                <td class="td2" ><input type="text" class="form-control tbPersoninfoQuery headid" id="headid" name="headid" placeholder="请选择雇员"></td>
                <tr>
                <td colspan="5" style="text-align: center"><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TbPersoninfoQuery()">查询</button></td>
            </tr>
        </table>
    </form>
</div>
<div id="tp_query"></div>
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="xiugai_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        筛选NO.1
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">id：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="employedId" placeholder="请选择雇员"></td>

                            <td class="td1">名称：</td>
                            <td class="td2"><input type="text" class="form-control xg1"  placeholder="请输入公司名"></td>
                             </tr>

                        <tr>
                            <td class="td1">筛选：</td>
                            <td class="td2"><input type="text" class="form-control xg8" name="shaixuan" placeholder="请输入公司名"></td>

                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control xg9" placeholder="请选择雇员"></td>
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
    $(function(){
            a = new Date();
    var b = a.getFullYear()+"-"+a.getMonth()+"-"+a.getDate();
    }
    );
    $(TbPersoninfoQuery());
    function TbPersoninfoQuery(){
        $.ajax({
            url:"/employ/findbyShaixuan",
            type:"post",
            data:{
                shaixuan:$("#shaixuan").val(),
                headid:$("#headid").val()/*,
                nowState:$("#nowState").val()*/
            },
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>计划名称</td>"+
                    "<td>待选人</td>"+
                    "<td>所属部门</td>" +
                    "<td>录用负责人</td>" +
                    "<td>录用日期</td>" +
                    "<td>正式入职时间</td>" +
                    "<td>正式起薪时间</td>" +
                    "<td>筛选</td>" +
                    "<td>备注</td>" +
                    "<td colspan='1'>操作</td></tr>";
                for (i = 0; i < data.length ; i++) {
                    a+="<tr ><td>"+data[i].EmployedID
                        +"</td><td>"+data[i].planName
                        +"</td><td>"+data[i].empName
                        +"</td><td>"+data[i].DeptName
                        +"</td><td>"+data[i].headid
                        +"</td><td>"+data[i].HireDate
                        +"</td><td>"+data[i].workEndTime
                        +"</td><td>"+data[i].officialSalary
                        +"</td><td>"+data[i].Shaixuan
                        +"</td><td>"+data[i].remark
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>筛选</buuton>"
                        +"</td></tr>"
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
            url:"/employ/updatbyShaixuan",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TbPersoninfoQuery();
        })
    }
</script>
</html>
