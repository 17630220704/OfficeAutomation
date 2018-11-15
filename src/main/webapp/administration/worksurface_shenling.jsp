<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/10/31
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品申领</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/layui/css/layui.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="../resources/layui/layui.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript"  src="jquery-3.1.1.min.js"></script>
</head>

<%--$(".selector1").change(function(){

     // 先清空第二个

      $(".selector2").empty();

     // 实际的应用中，这里的option一般都是用循环生成多个了

      var option = $("<option>").val(1).text("pxx");

          $(".selector2").append(option);

    });--%>

<body>
    <center>
        <h3>新建办公用品申领</h3>
        <form id="myfrom" method="post">

        <table id="table" class="table table-bordered" style="width: 500px">
            <tr>
                <td>
                    登记类型：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td>
                    <select class="form-control" name="applyStyle" id="apply_style">
                        <option value="" selected="selected">请选择</option>
                        <option value="领用">领用</option>
                        <%--<option value="借用">借用</option>--%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    办公用品库：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td>
                    <select class="form-control" name="bank.bId" id="b_id" >
                      <%--  <option value="" placeholder="请选择">请选择</option>--%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    办公用品类别：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td>
                        <select class="form-control" name="sort.sortId" id="sort_id">
                        </select>
                </td>
            </tr>
            <tr>
                <td>
                    办公用品：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td>
                        <select class="form-control" name="worksurface.workId" id="work_id">
                        </select>
                </td>
            </tr>
            <tr>
                <td>
                    单价：
                </td>
                <td><input type="text" name="applyPrice" id="apply_price" class="form-control" style="width: 250px" /></td><%--readonly--%>
            </tr>
            <tr>
                <td>
                    申请数量：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td>
                    <input type="number" min="0" name="applyNumber" id="apply_number" class="form-control" style="width: 250px"/>
                    <div id="diva"></div>
                    <%--<input id="input" >--%>
                   <%-- <p id="p"></p>--%>
                </td>
            </tr>
            <tr>
                <td>
                    申请人：
                    <font style="color: red;padding-left: 1px;">*</font>
                </td>
                <td><input type="text" name="applyPeople" id="apply_people" class="form-control" style="width: 250px"/></td>
            </tr>
            <tr>
                <td>
                    审批人：
                </td>
                <td><input type="text" name="userid" id="userid" class="form-control" style="width: 250px"/></td>
            </tr>
            <tr>
                <td>
                    备注：
                </td>
                <td>
                    <textarea class="form-control" rows="3" name="applyComment" id="apply_comment" style="width: 250px"></textarea>
                </td>

            </tr>
        </table>
        </form>
                <p><input type="button" value="提交" id="tijiao" onclick="tijiao()">
                <input type="button" value="重置" id="chongzhi"></p>
    </center>



</body>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;
    });
</script>

<%--<script>
    //存取数字一的容器
    var num="";
    //给所有数字添加点击事件
    $(".number input").click(function(){
        //获取当前点击的value值
        var value = $(this).val();
        //因为 value和num是字符串，加号在这里是连接字符串，然后存进变量num里面
        num = num+value;
        //把变量num在input里面输出
        $("input[type='text']").val(num);
    })
</script>--%>
<script>
/*申请提交*/
    $(function() {
        $("#tijiao").click(function() {
            var apply_style=$("#apply_style").val();
            var b_id=$("#b_id").val();
            var sort_id=$("#sort_id").val();
            var work_id=$("#work_id").val();
            var apply_price=$("#apply_price").val();
            var apply_number=$("#apply_number").val();
            var userid=$("#userid").val();
            var apply_comment=$("#apply_comment").val();
            var apply_people=$("#apply_people").val();
            //var myfrom = $("#myfrom").serialize();
            $.ajax({
                url:"/worksurface/save_apply",
                type:"post",
                data:{
                    "applyStyle":apply_style,
                    "bank.bId":b_id,
                    "sort.sortId":sort_id,
                    "worksurface.workId":work_id,
                    "applyPrice":apply_price,
                    "applyNumber":apply_number,
                    "userid":userid,
                    "applyComment":apply_comment,
                    "applyPeople":apply_people,
                },
                dataType:"json",
                success:function(data){
                    layer.msg(data.message,{time:1000},function () {
                        location.href="/administration/success.jsp";
                    });
                },
                /*error:function (xhr,status) {
                    alert("错误:"+xhr);
                    alert("错误代码:"+xhr.status);
                }*/
            });
        });
    });


//重置
    $("#chongzhi").click(function () {
        window.location.reload();
    });
    //办公用品库--查询(申请用)
    function getquerybank(){
        $.ajax({
            url:"/worksurface/query_bank",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#b_id").html("");
                var a ="";
                a+="<option  selected='selected'>请输入</option>";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].b_id+">"+data[i].b_bankname+"</option>";
                }
                $("#b_id").append(a);
            }
        });
    }
//办公用品类别--查询(申请用)
    function getquerysort(){
        $.ajax({
            url:"/worksurface/query_sort",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#sort_id").html("");
                var a ="";
                a+="<option  selected='selected'>请输入</option>";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].sort_id+">"+data[i].sort_style+"</option>";
                }
                $("#sort_id").append(a);
            }
        });
    }
//办公用品--查询(申请用)
    function getworksurface(){
        $.ajax({
            url:"/worksurface/query_worksurface",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#work_id").html("");
                var a ="";
                a+="<option  selected='selected'>请输入</option>";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].work_id+">"+data[i].work_name+"</option>";
                }
                $("#work_id").append(a);

            }
        });
    }
//办公用品库存
    function getkucun(){
        $.ajax({
            url:"/worksurface/update_kucun",
            type:"post",
            dataType:"json",
            success:function (data) {

            }
        })
    }



    /*单价*/
    $("#work_id").change(function () {
        /*alert($('#work_id option:selected').text())*/
        $.ajax({
            url:"/worksurface/query_worksurface",
            type:"post",
            dataType:"json",
            data:{
                workName:$('#work_id option:selected').text()
            },
            success:function(data){
                /*alert(data[0].work_repertory);*/
                $("#apply_price").html();
                $("#apply_price").val(data[0].work_sprice);
            }
        });
    });
//bind方法绑定当前页面符合条件的元素
$("#apply_number").bind("input propertychange", function(){
    /*alert($('#work_id option:selected').text())*/
    $.ajax({
        url:"/worksurface/query_worksurface",
        type:"post",
        dataType:"json",
        data:{
            workName:$('#work_id option:selected').text()
        },
        success:function (data) {
            /*alert(data[0].work_repertory);*/
            $("#diva").html("原库存为:"+data[0].work_repertory+",剩余库存为:"+(data[0].work_repertory-$("#apply_number").val()))
            }
    });
    var num=$(this).val();
    var price=$("#apply_price").val();
    var result=num*price;
    if(num>0){
        $("#apply_price").html();
        $("#apply_price").val(result);
    }
});



/*此方法涵盖了按键输入、复制输入、选择输入三种情况的事件触发。*/


    $(function(){
        getquerybank();
        getquerysort();
        getworksurface();
    });

</script>
</html>
