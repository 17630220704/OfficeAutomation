<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<title>Title</title>
</head>

<style>
    .aa{
        width: 50%;
    }
</style>
<body>
<table id="list" class="table">

</table>
<div id="page"></div>
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   添加会议室
                </h4>
            </div>
            <div class="modal-body">
                <table class="table">
                   <tr>
                       <td>名称</td>
                       <td><input type="text" class="btn btn-default" class="aa" id="name"></td>
                   </tr>
                    <tr>
                        <td>管理员</td>
                        <td><select id="gly" class="btn btn-default">


                        </select></td>
                    </tr>
                    <tr>
                        <td>状态</td>
                        <td><select class="btn btn-default" id="state" class="aa">
                            <option value="正常">正常</option>
                            <option value="故障">故障</option>
                            <option value="停用">停用</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>描述</td>
                        <td><input type="text" class="btn btn-default" class="aa" id="ms"></td>
                    </tr>
                    <tr>
                        <td><input type="button" onclick="save()" value="添加" class="btn btn-default"></td>
                        <td><button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(document).ready(function () {
        query();
        gly();
    })
    function gly() {
        $.ajax({
            url : "know/gly",
            type : "post",
            dataType : 'json',
            success : function(data) {
                var a = data.tb;
                var b="";
                for(i=0;i<a.length;i++){

                    b+="<option value ='"+a[i].persoid+"'>"+a[i].personname+"</option>";
                }
                $("#gly").html(b);
            }
        });
    }
    function query(a,b,c){
        if(a>b){a=b};
        if(a<c){a=c};
        $.ajax({
            url : "know/query",
            type : "post",
            data:{"startPage":a},
            dataType : "json",
            success : function(data) {
                var d =data.pi;
                var a = data.conferenceroom;
                var b="" +
                    "<tr>" +
                    "<th><button  data-toggle='modal' class='btn btn-default' data-target='#myModal'>添加</button></th>" +
                    "<th colspan='3'><center>会议室管理</center></th>" +
                    "<th> </th>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>会议室编号</td>" +
                    "<td>会议室名称</td>" +
                    "<td>会议管理员</td>" +
                    "<td>会议室状态</td>" +
                    "<td>会议室描述</td>" +
                    "<td>会议室操作</td>" +
                    "</tr>";
                for(i=0;i<a.length;i++){

                    b+="<tr><td>"+a[i].coid+"</td><td>"+a[i].coname+"</td><td>"+a[i].personname+"</td><td>"+a[i].costate+"</td><td>"+a[i].covalue+"</td><td><input type='button' onclick='delet("+a[i].coid+")'  class='btn btn-default' value='删除'/> "+
                        "<a href='/jsp/know/know2.jsp?coid="+a[i].coid+"&&coname="+a[i].coname+" ' class='btn btn-default'>修改</a></td></tr>";
                }
                var c = "<table class='table'><tr><td colspan='3'><center>" +
                    "<input type='button' onclick='query("+d.firstPage+","+d.lastPage+","+d.firstPage+")' value='首页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.pageNum+"-1,"+d.lastPage+","+d.firstPage+")' value='上一页'  class='btn btn-default'/> </center></td>" +
                    "<td colspan='2'><center><span>"+d.pageNum+"/"+d.lastPage+"</span></center></td>" +
                    "<td colspan='3'><center><input type='button' onclick='query("+d.pageNum+"+1,"+d.lastPage+","+d.firstPage+")' value='下一页' class='btn btn-default' />" +
                    "<input type='button' onclick='query("+d.lastPage+","+d.lastPage+","+d.firstPage+")' value='尾页'   class='btn btn-default'/>" +
                    "</center></td></tr><table>";
                $("#page").html(c);
                $("#list").html(b);

            }
        });
    }
    function delet(a) {
        $.ajax({
            url : "know/delete",
            type : "post",
            data : {"deletecoid":a},
            dataType : 'text',
            success : function(data) {
                alert("删除成功")
                query();
            }
        });
    }
    function save() {
        $.ajax({
            url : "know/save",
            type : "post",
            data :{"perid":$("#gly").val(),"coname":$("#name").val(), "costate":$("#state").val(),"covalue":$("#ms").val()},
            dataType : 'text',
            success : function(data) {
                alert("添加成功")
                query();
            }
        });
    }
</script>
</html>
