<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/10/29
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品类别</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 模态框（类型增加） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    新建办公类型
                </h4>
            </div>
            <div class="modal-body">
                <table id="table1">
                    <tr>
                        <td class="col-sm-2 control-label">用品库</td>
                        <td>
                            <select name="b_id" id="bId" class="form-control" style="width: 170px">
                    </select>

                        </td>
                    </tr>

        <tr>
            <td class="col-sm-2 control-label">类别名称</td>
            <td>
                <input type="text" name="sort_style" id="sortStyle" class="form-control" style="width: 170px;margin-top: 10px">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="增加" id="btn">

            </td>
            <td>
                <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
            </td>

        </tr>
             </table>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>





<!-- 模态框（Modal） 类型修改-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    类型修改
                </h4>
            </div>
            <div class="modal-body">
                <form id="form">
                    <table class="table table-bordered" style="width:100%">
                        <tr>
                            <td>类型编号:</td>
                            <td style="padding-left: 20px">
                                <input type="text" name="sortId" id="sortId" class="form-control" class="easyui-validatebox" required="true" readonly="readonly"/>
                            </td>
                        </tr>

                        <tr>
                            <td>用品类别<span style="color:red;">*</span></td>
                            <td style="padding-left: 20px">
                                <input type="text" name="sortStyle" id="sortStylee" class="form-control" class="easyui-validatebox" required="true"/>

                            </td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td style="padding-left: 20px"><input type="text" class="form-control" name="bank.deptid" id="deptid" readonly="readonly"></td>
                        </tr>
                        <tr>
                            <td>物品调度员</td>
                            <td style="padding-left: 20px"><input type="text" class="form-control" name="bank.useridone" id="useridone" readonly="readonly"></td>
                        </tr>
                    </table>
                </form>
                <p>
                    <a href="sort.jsp"><input type="button" value="返回"></a>
                    <input type="submit" id="up" value="修改">
                </p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->





<%-- 办公用品库类别查询--%>
<div class="container">
    <center>
        <p><h3>办公用品类别</h3></p>
    </center>
   <div class="pull-right">
       <a  href="bank.jsp"><input type="button" value="增加库"></a>
       <button class="btn btn-primary btn-4g" data-toggle="modal" data-target="#myModal1">
           新建办公用品类型
       </button>
   </div>
    <div class="container pull-left">
        <div class="navbar-header" >
            <a class="navbar-brand">类别名称查询：</a>
        </div>
        <div>
            <form class="navbar-form navbar-left" role="search" method="post">
                <div class="form-group">
                    <input type="text" class="form-control sortStyle" name="sortStyle" id="sortStyle1">
                    <input type="button" id="sub1" onclick="getQuerySort()" value="查询">
                </div>
            </form>
        </div>
    </div>

    <table class="table">
        <thead>
        <tr class="info">
            <th>序号</th>
            <th>办公用品库</th>
            <th>办公用品类别</th>
            <th>所属部门</th>
            <th>物品调度员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="list">
        </tbody>
    </table>
</div>
</body>

<%--<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>--%>
<script>
    <%--办公用品类型，库--查询--%>
    function getQuerySort(){
        $.ajax({
            url:"/worksurface/query_sort",
            data:{
                sortStyle:$("#sortStyle1").val()
            },
            type:"post",
            dataType:"json",
            success:function(data){
                var a=data;
                var b="";
                for(var i=0;i<a.length;i++){
                    b+="<tr><td>"+a[i].sort_id+
                        "</td><td>"+a[i].b_bankname+
                        "</td><td>"+a[i].sort_style+
                        "</td><td>"+a[i].deptid+
                        "</td><td>"+a[i].useridone+
                        "</td><td>"+
                        "<button class='btn btn-primary btn-5g upsort' data-toggle='modal' data-target='#myModal2' id='"+a[i].sort_id+"'>编辑</button>"+
                        "<input type='button' class='delete' value='删除'></td></tr>";
                }
                $("#list").html(b);
            }
        });
    }
    $(function(){
        getQuerySort();
        querybank();
    });
//办公用品类型，库--删除
    $(function(){
        var a="";
        $("#list").on("click",".delete",function () {
            a=$(this);
            var dele=a.parent().parent().children().eq(0).html();
            $.ajax({
                url:"/worksurface/delete_sort",
                type:"post",
                data:{
                    sortId:dele
                },
                dataType:"json",
                success:function (data) {
                    if(data.message=="删除成功"){
                        alert(data.message);
                        a.parent().parent().remove();
                    }else{
                        alert(data.message);
                        getQuerySort();
                    }
                }
            });
        });
    });


//办公用品类型，库--增加
    $(function() {
        $("#btn").click(function() {
            var b_id=$("#bId").val();
            var sort_number=$("#sortNumber").val();
            var sort_style=$("#sortStyle").val();
            $.ajax({
                url:"/worksurface/save_sort",
                type:"post",
                data:{
                    "bank.bId":b_id,
                    "sortNumber":sort_number,
                    "sortStyle":sort_style,
                },
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    $("#table1").css("display","none");
                    location.reload();
                }
            });
        });
    });

    //修改
    $("#up").click(function(){
        $.ajax({
            url:"/worksurface/update_sort",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json",
            success:function(data){
                if(data.message=="修改成功"){
                    alert(data.message);
                    $("#list").html("");
                    location.reload();
                }
            }
        })
    });

    //修改传值
    $("#list").on("click",".upsort",function(){
        var i=$(this).parent().parent().children().eq(0).html();
        /*var a=$(this).parent().parent().children().eq(1).html();*/
        var b=$(this).parent().parent().children().eq(2).html();
        var c=$(this).parent().parent().children().eq(3).html();
        var d=$(this).parent().parent().children().eq(4).html();
        $("#sortId").val(i);
        /*$("#bIdd").val(a);*/
        $("#sortStylee").val(b);
        $("#deptid").val(c);
        $("#useridone").val(d);

    });

    /*
    * 办公用品库
    * */
    //办公用品库--查询(类别用)
    function querybank(){
        $.ajax({
            url:"/worksurface/query_bank",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#bId").html("");

                var a ="";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].b_id+">"+data[i].b_bankname+"</option>";
                }
                $("#bId").append(a);

            }
        });
    }


</script>

</html>
