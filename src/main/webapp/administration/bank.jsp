<%--
  Created by IntelliJ IDEA.
  User: tianshanshan
  Date: 2018/10/30
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品库</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript"  src="/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<!-- 模态框（库增加） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新建办公库
                </h4>
            </div>
            <div class="modal-body">
                <table id="table">
                    <tr>
                        <td>职员</td>
                        <td>
                            <select name="persoId" id="persoId" class="form-control" style="width: 170px">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>库名称</td>
                        <td><input type="text" name="b_bankname" id="bBankname" class="form-control" style="width: 170px;margin-top: 10px" placeholder="请输入库名称"></td>
                    </tr>
                        <tr>
                            <td>所属部门</td>
                            <td><input type="text" name="deptid" id="deptid" class="form-control" style="width: 170px;margin-top: 10px" placeholder="请输入所属部门"></td>
                        </tr>
                        <tr>
                            <td>物品调度员</td>
                            <td><input type="text" name="useridone" id="useridone" class="form-control" style="width: 170px;margin-top: 10px"  placeholder="请输入物品调度员"></td>
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


<!-- 模态框（修改） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    修改用品库
                </h4>
            </div>
            <div class="modal-body">
                <form id="form">
                <table id="table1">
                    <tr>
                        <td>序号</td>
                        <td><input type="text" name="bId" id="bId" class="form-control" style="width: 170px;margin-top: 10px" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>库名称</td>
                        <td><input type="text" name="bBankname" id="bBankname11" class="form-control" style="width: 170px;margin-top: 10px"></td>
                    </tr>
                    <tr>
                        <td>所属部门</td>
                        <td><input type="text" name="deptid" id="deptid1" class="form-control" style="width: 170px;margin-top: 10px"></td>
                    </tr>
                    <tr>
                        <td>物品调度员</td>
                        <td><input type="text" name="useridone" id="useridone1" class="form-control" style="width: 170px;margin-top: 10px"></td>
                    </tr>
                </table>
                </form>
                <p>
                    <a href="bank.jsp"><input type="button" value="返回"></a>
                    <input type="submit" value="修改" id="bt">
                </p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--办公用品库查询--%>
<div class="container">
    <center>
        <p><h3>办公用品库</h3></p>
    </center>
    <!-- 按钮触发模态框 -->
    <div class="pull-right">
     <button class="btn btn-primary btn-4g" data-toggle="modal" data-target="#myModal">
         新建办公用品库
     </button>
    </div>
    <div class="container pull-left">
        <div class="navbar-header" >
            <a class="navbar-brand">库名称查询：</a>
        </div>
        <div>
            <form class="navbar-form navbar-left" role="search" method="post">
                <div class="form-group">
                    <input type="text" class="form-control bBankname" name="bBankname" id="bBankname1">
                    <input type="button" id="sub1" onclick="getquerybank()" value="查询">
                </div>
            </form>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr class="info">
            <th>序号</th>
            <th>职员</th>
            <th>库名称</th>
            <th>所属部门</th>
            <th>物品调度员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="kulist">
        </tbody>
    </table>
</div>

</body>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script>
    /*
   * 办公用品库--查询
   * */

    function getquerybank(){
        $.ajax({
            url:"/worksurface/query_bank1",
            data:{
                bBankname:$("#bBankname1").val()
            },
            type:"post",
            dataType:"json",
            success:function(data){
                var a=data;
                var b="";
                for(var i=0;i<a.length;i++){
                    b+="<tr><td>"+a[i].b_id+
                        "</td><td>"+a[i].PersonName+
                        "</td><td>"+a[i].b_bankname+
                        "</td><td>"+a[i].deptid+
                        "</td><td>"+a[i].useridone+
                        "</td><td><button class='btn btn-primary btn-4g upbank' data-toggle='modal' data-target='#myModal2' id='"+a[i].b_id+"'>修改</button>" +
                        "<input type='button' class='delete' value='删除'></td></tr>";
                }
                $("#kulist").html(b);
            }
        });
    }
    $(function(){
        getquerybank();
        query_tbPersoninfo();
    });

    //办公用品库--修改

    $("#bt").click(function(){
        $.ajax({
            url:"/worksurface/update_bank",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json",
            success:function(data){
                if(data.message=="修改成功"){
                    alert(data.message);
                    $("#kulist").html("");
                    location.reload();

                }
            }
        })
    });

    //修改传值
    $("#kulist").on("click",".upbank",function(){
        var i=$(this).parent().parent().children().eq(0).html();

        var b=$(this).parent().parent().children().eq(2).html();
        var c=$(this).parent().parent().children().eq(3).html();
        var d=$(this).parent().parent().children().eq(4).html();
        $("#bId").val(i);

        $("#bBankname11").val(b);
        $("#deptid1").val(c);
        $("#useridone1").val(d);

    });

    /*
   * 办公用品库--增加
   * */
    $(function() {
        $("#btn").click(function() {
            var persoId=$("#persoId").val();
            var b_bankname=$("#bBankname").val();
            var deptid=$("#deptid").val();
            var useridone=$("#useridone").val();
            $.ajax({
                url:"/worksurface/save_bank",
                type:"post",
                data:{
                    "tbPersoninfo.persoId":persoId,
                    "bBankname":b_bankname,
                    "deptid":deptid,
                    "useridone":useridone,
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

    //办公用品库--删除
    $(function(){
        var a="";
        $("#kulist").on("click",".delete",function () {
            a=$(this);
            var dele=a.parent().parent().children().eq(0).html();
            $.ajax({
                url:"/worksurface/delete_bank",
                type:"post",
                data:{
                    bId:dele
                },
                dataType:"json",
                success:function (data) {
                    if(data.message=="删除成功"){
                        alert(data.message);
                        a.parent().parent().remove();
                    }else{
                        alert(data.message);
                        getquerybank();
                    }
                }
            });
        });
    });

//职员--查询(库用)
    function query_tbPersoninfo(){
        $.ajax({
            url:"/worksurface/query_tbPersoninfo",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#persoId").html("");

                var a ="";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].persoId+">"+data[i].PersonName+"</option>";
                }
                $("#persoId").append(a);

            }
        });
    }

</script>
</html>
