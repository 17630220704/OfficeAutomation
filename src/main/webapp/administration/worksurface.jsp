<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/10/23
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>办公用品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .error {color: #FF0000;}
    </style>
</head>
<body>
<%--<input type="text" id="myuse" name="workName" value="1" >--%>
    <div class="container">
        <div class="pull-left"><h3>办公用品列表</h3></div>
        <div class="pull-right">
            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                新建办公用品
            </button>

        </div>
    </div>


    <!-- 模态框（Modal） 办公用品添加-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新建办公用品
                    </h4>
                </div>
                <div class="modal-body">
                   <form action="demo_form.php" method="post">
                       <table id="table">
                           <tr>
                               <td>用品名称<span style="color:red;">*</span></td>
                               <td style="padding-left: 20px">
                                   <input type="text" name="work_name" id="work_name" class="form-control" <%--required="required"--%>/>
                               </td>
                               <td style="padding-left: 100px"></td>
                               <td>规格/型号<span style="color:red;">*</span></td>
                               <td style="padding-left: 20px"><input type="text" name="work_specification" id="work_specification" class="form-control"></td>
                            </tr>
                           <tr>

                               <td>计量单位</td>
                               <td style="padding-left: 20px"><input type="text" class="form-control" name="work_unit" id="work_unit"></td>
                               <td style="padding-left: 100px"> </td>
                               <td>创建人</td>
                               <td style="padding-left: 20px"><input type="text" class="form-control" name="setid" id="setid"></td>
                           </tr>
                           <tr>
                               <td>用品库<span style="color:red;">*</span></td>
                               <td style="padding-left: 20px">
                                   <select class="form-control" name="bId" id="bId">
                                   </select>
                               </td>
                               <td style="padding-left: 100px"></td>
                               <td>单价</td>
                               <td style="padding-left: 20px"><input type="number" class="form-control" name="work_sprice" id="work_sprice"></td>
                           </tr>
                           <tr>
                               <td>用品类别<span style="color:red;">*</span></td>
                               <td style="padding-left: 20px">
                                   <select class="form-control" name="sort.sortId" id="sort_id2">

                                   </select>
                               </td>
                               <td style="padding-left: 100px"></td>
                               <td>供应商</td>
                               <td style="padding-left: 20px"><input type="text" class="form-control" name="work_supplier" id="work_supplier"></td>
                           </tr>
                           <tr>
                               <td>当前库存<span style="color:red;">*</span></td>
                               <td style="padding-left: 20px"><input type="number" class="form-control" name="work_repertory" id="work_repertory"></td>
                               <td style="padding-left: 100px"></td>
                               <td>最高警戒库存</td>
                               <td style="padding-left: 20px"><input type="number" class="form-control" name="work_gline" id="work_gline"></td>
                           </tr>
                           <tr>
                               <td>最低警戒库存</td>
                               <td style="padding-left: 20px"><input type="number" class="form-control" name="work_dline" id="work_dline"></td>
                               <td style="padding-left: 100px"></td>

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
                   </form>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->






    <!-- 模态框（Modal） 办公用品编辑-->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        办公用品修改
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="form">
                        <table class="table table-bordered" style="width:100%">
                            <tr>
                                <td>用品编号:</td>
                                <td style="padding-left: 20px">
                                    <input type="text" name="workId" id="work_id1" class="form-control work_name" class="easyui-validatebox" readonly="readonly"/>
                                </td>
                            </tr>
                            <tr>
                                <td>用品名称<span style="color:red;">*</span></td>
                                <td style="padding-left: 20px">
                                     <input type="text" name="workName" id="work_name1" class="form-control work_name" class="easyui-validatebox"/>
                                </td>
                            </tr>

                            <tr>
                                <td>计量单位</td>
                                <td style="padding-left: 20px"><input type="text" class="form-control work_unit" name="workUnit" id="work_unit1"></td>
                            </tr>
                            <tr>
                                <td>供应商</td>
                                <td style="padding-left: 20px"><input type="text" class="form-control work_supplier" name="workSupplier" id="work_supplier1"></td>
                            </tr>
                            <tr>
                                <td>最高警戒库存</td>
                                <td style="padding-left: 20px"><input type="number" min="0" class="form-control work_gline" name="workGline" id="work_gline1"></td>
                            </tr>
                            <tr>
                                <td>当前库存<span style="color:red;">*</span></td>
                                <td style="padding-left: 20px"><input type="number" min="0" class="form-control work_repertory" name="workRepertory" id="work_repertory1"></td>
                            </tr>
                            <tr>
                                <td>创建人</td>
                                <td style="padding-left: 20px"><input type="text" class="form-control setid" name="setid" id="setid1"></td>
                            </tr>
                        </table>
                    </form>
                    <p>
                        <a href="worksurface.jsp"><input type="button" value="返回"></a>
                        <input type="submit" id="up" value="修改">
                    </p>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <%-- 办公用品查询--%>
    <div class="container">
            <div class="navbar-header">
        <a class="navbar-brand">用品名称查询：</a>
    </div>
        <div>
            <form class="navbar-form navbar-left" role="search" method="post">
                <div class="form-group">
                    <input type="text" class="form-control workName" name="workName" id="workName">
                    <input type="button" id="sub1" onclick="getqueryworksurface()"  value="查询">
                </div>
            </form>
        </div>

        <table class="table">
            <thead>
            <tr class="info">
                <th>办公用品编号</th>
                <th>办公用品名称</th>
                <th>办公用品类别</th>
                <th>计量单位</th>
                <th>供应商</th>
                <th>警戒库存</th>
                <th>当前库存</th>
                <th>创建人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">
            </tbody>
        </table>


    </div>
</body>
<script>

    //查询
    function getqueryworksurface(){
        $.ajax({
            url:"/worksurface/query_worksurface",
           data:{
                workName:$("#workName").val()
            },
            type:"post",
            dataType:"json",
            success:function(data){
                var a=data;
                var b="";
                for(var i=0;i<a.length;i++){
                    b+="<tr><td id='wid'>"+a[i].work_id;
                    b+= "</td><td>"+a[i].work_name;
                    b+= "</td><td>"+a[i].sort_style;
                    b+= "</td><td>"+a[i].work_unit;
                    b+= "</td><td>"+a[i].work_supplier;
                    b+=  "</td><td>"+a[i].work_gline;
                    b+=  "</td><td>"+a[i].work_repertory;
                    b+= "</td><td>"+a[i].setid;
                    b+=  "</td><td><button class='btn btn-primary btn-5g update_work' data-toggle='modal' data-target='#myModal2' id='"+a[i].work_id+"'>编辑" +
                        "</button><input type='button' class='delete' value='删除'></td></tr>";
                }
                $("#list").html(b);
            }
        });
    }
    $(function(){
        getqueryworksurface();
        getquerybank();
        getquerysort();
    });



    //修改
    $("#up").click(function(){
        $.ajax({
            url:"/worksurface/update_worksurface",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json",
            success:function(data){
                if(data.message=="修改成功"){
                    alert(data.message);
                    location.reload();
                    $("#list").html("")
                }
            }
        })
    });

    //修改传值
    $("#list").on("click",".update_work",function(){
        var i=$(this).parent().parent().children().eq(0).html();
        var a=$(this).parent().parent().children().eq(1).html();
        /*var b=$(this).parent().parent().children().eq(2).html();*/
        var c=$(this).parent().parent().children().eq(3).html();
        var d=$(this).parent().parent().children().eq(4).html();
        var e=$(this).parent().parent().children().eq(5).html();
        var f=$(this).parent().parent().children().eq(6).html();
        var g=$(this).parent().parent().children().eq(7).html();
        $("#work_id1").val(i);
        $("#work_name1").val(a);
        /*$("#sort_id1").val(b);*/
        $("#work_unit1").val(c);
        $("#work_supplier1").val(d);
        $("#work_gline1").val(e);
        $("#work_repertory1").val(f);
        $("#setid1").val(g);

    });




/*添加数据*/
$(function() {
    $("#btn").click(function() {
        var work_name=$("#work_name").val();
        var work_unit=$("#work_unit").val();
        var work_supplier=$("#work_supplier").val();
        var work_gline=$("#work_gline").val();
        var work_repertory=$("#work_repertory").val();
        var setid=$("#setid").val();
        var work_specification=$("#work_specification").val();
        var work_style=$("#work_style").val();
        var b_id=$("#bId").val();
        var work_sprice=$("#work_sprice").val();
        var sort_id=$("#sort_id2").val();
        var work_dline=$("#work_dline").val();
        $.ajax({
            url:"/worksurface/save_worksurface",
            type:"post",
            data:{
             /*   "sort_number":sort_number,*/
                "workName":work_name,
                "workUnit":work_unit,
                "workSupplier":work_supplier,
                "workGline":work_gline,
                "workRepertory":work_repertory,
                "setid":setid,
                "workSpecification":work_specification,
                "workStyle":work_style,
                "bank.bId":b_id,
                "workSprice":work_sprice,
                "sort.sortId":sort_id,
                "workDline":work_dline,
            },
            dataType:"json",
            success:function(data){
                alert(data.message);
                $("#table").css("display","none");
               location.reload();
            }
        });
    });
});

//办公用品--删除
$(function(){
    var a="";
    $("#list").on("click",".delete",function () {
        a=$(this);
        var dele=a.parent().parent().children().eq(0).html();
        $.ajax({
            url:"/worksurface/delete_worksurface",
            type:"post",
            data:{
                workId:dele
            },
            dataType:"json",
            success:function (data) {
                if(data.message=="删除成功"){
                    alert(data.message);
                    a.parent().parent().remove();
                    location.reload();
                }else{
                    alert(data.message);
                    getqueryworksurface();
                }
            }
        });
    });
});

//办公用品库--查询(用品用)
function getquerybank(){
    $.ajax({
        url:"/worksurface/query_bank",
        type:"post",
        dataType:"json",
        success:function(data){
            $("#bId").html("");
            var a ="";
            a+="<option  selected='selected'>请输入</option>";
            for(var i=0;i<data.length;i++){
                a+="<option value="+data[i].b_id+">"+data[i].b_bankname+"</option>";
            }
            $("#bId").append(a);
        }
    });
}
    //办公用品类别--查询(用品用)
function getquerysort(){
    $.ajax({
        url:"/worksurface/query_sort",
        type:"post",
        dataType:"json",
        success:function(data){
            $("#sort_id1").html("");
            $("#sort_id2").html("");
            var a ="";
            a+="<option  selected='selected'>请输入</option>";
            for(var i=0;i<data.length;i++){
                a+="<option value="+data[i].sort_id+">"+data[i].sort_style+"</option>";
            }
            $("#sort_id1").append(a);
            $("#sort_id2").append(a);
        }
    });
}

</script>
</html>
