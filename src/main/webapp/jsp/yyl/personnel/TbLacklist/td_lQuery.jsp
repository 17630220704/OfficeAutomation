<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/1
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>黑名单</title>
    <link rel="stylesheet" href="/resources/js_yyl/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/js_yyl/jquery-3.1.1.min.js"></script>
    <script src="/resources/js_yyl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
        overflow-y:scroll;
    }
</style>
<body>
<%--查询人事档案--%>
<div id="tp_query"></div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px;">
        <form id="tp_update">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        人事档案详情
                    </h4>
                </div>
                <div class="modal-body">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr><td class="display_none"><input class="xq0" name="persoId"></td>
                            <td class="td1">姓名</td>
                            <td class="td2 xq1"></td>
                            <td class="td1">编号</td>
                            <td class="td2 xq2"></td>
                        </tr><tr>
                        <td class="td1">手机号</td>
                        <td class="td2 xq3"></td>
                        <td class="td1">办公电话</td>
                        <td class="td2 xq4"></td>
                    </tr><tr>
                        <td class="td1">生日</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">邮箱</td>
                        <td class="td2 xq6"></td>
                    </tr><tr>
                        <td class="td1">现住址</td>
                        <td class="td2 xq7"></td>
                        <td class="td1">备注</td>
                        <td class="td2 xq8"></td>
                    </tr>
                    </table>
                </div>
                <div class="modal-footer" id="State"></div>
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
            url:"/TbLacklistController/tlquery.do",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px;'>"
                    +"<tr style='font-weight:800;'><td>姓名</td><td>职位</td><td>手机号</td><td>办公电话</td><td>生日</td><td>邮箱</td>" +
                    "<td>现住址</td><td>备注</td><td colspan='3'>操作</td></tr>";
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].persoId//职员ID-主键
                        +"</td><td>"+data[i].PersonName//姓名+在职状态0.在职1.离职
                        +"</td><td>"+data[i].POSIName//职位
                        +"</td><td>"+data[i].telephone//手机号
                        +"</td><td>"+data[i].officePhone//办公电话
                        +"</td><td>"+data[i].personBirth//生日
                        +"</td><td>"+data[i].Email//邮箱
                        +"</td><td>"+data[i].NowAddress//现住址
                        +"</td><td>"+data[i].remark//备注
                        +"</td><td><button class='btn btn-primary' style='cursor:pointer;' data-toggle='modal' data-target='#myModal' onclick='xiangqing1(this,"+data[i].PosiId+","+i+")' value='"+data[i].persoId+"'>详细信息</button>"
                        +"</td></tr>"
                }
                $("#tp_query").html(a+="</table>")
            }
        })
    }
    function xiangqing1(u,y,o) {
        $(".xq0").val($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(0).html());
        for(i=0;i<9;i++){
            $(".xq"+i).html($(u).parent().parent().parent().children().eq((parseInt(o)+1)).children().eq(i).html());
        }
        var a = "<button type='button' class='btn btn-primary' data-dismiss='modal'>关闭</button>";
        $("#State").html(a);
    }
</script>
</html>
