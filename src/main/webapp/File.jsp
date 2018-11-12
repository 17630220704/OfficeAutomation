
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>人事查询</title>
	<link rel="stylesheet" href="../../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<script src="../../resources/jquery-3.1.1.min.js"></script>
	<script src="../../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
<div id="body">
	<form id="tj_tpquery">
		<table cellspacing="0"cellpadding="0" style="margin:0 auto;">
			<tr>
				<td class="td1">姓名：</td>
				<td class="td2"><input type="text" class="form-control tbPersoninfoQuery persName" id="personName" name="personName" placeholder="请选择雇员"></td>
				<td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa5' style="cursor:pointer;" onclick="diosn()">+选择</a></td>

			</tr>

			<tr>
				<
				<td class="td1"></td>
				<td class="td2"></td>
			</tr>
			<tr>
				<td colspan="5" style="text-align: center"><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TbPersoninfoQuery()">查询</button></td>
			</tr>
		</table>
	</form>
</div>
<!-- 人员选择模态框（Modal） -->
<div class="modal fade" id="myModa5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					选择
				</h4>
			</div>
			<div class="modal-body">
				<div style="height: 400px;width: 100%">
					<div id="bumen_left1" class="div">
						<table class='table table-striped' style='text-align: center;font-size: 12px'>
							<tr style='font-weight:800;'><td>部门</td></tr>
						</table>
					</div>
					<div id="danwei_body1" class="div">
						<table class='table table-striped' style='text-align: center;font-size: 12px'>
							<tr style='font-weight:800;'><td>部门</td></tr>
						</table>
					</div>
					<div id="danwei_reght1" class="div">
						<table class='table table-striped' style='text-align: center;font-size: 12px'>
							<tr style='font-weight:800;'><td>人员</td></tr>
						</table>
					</div>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script>

    function diosn(){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:1},
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td>部门</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].DeptId+"</td>"
                        +"<td onclick='choice2(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#bumen_left1").html(a+="</tablel>")
            }
        })
    }
    function choice2(u,y){
        $.ajax({
            url:"/TbDeparmentController/tbPquery.do",
            type:"post",
            data:{deptNumber:y},
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td>部门</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].DeptId+"</td>"
                        +"<td onclick='shoh2(this,"+data[i].DeptId+")'style='cursor:pointer;'>"+data[i].DeptName+"</td></tr>"
                }
                $("#danwei_body1").html(a+="</tablel>")
            }
        }).always(function(){
            $.ajax({
                url:"/TbDeparmentController/tbDPquery.do",
                type:"post",
                data:{deptNumber : y},
                dataType:"json",
                success:function(data){
                    var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                        "<tr style='font-weight:800;'><td>人员</td></tr>"
                    for (var i = 0; i < data.length ; i++) {
                        a+="<tr><td class='display_none'>"+data[i].persoId+"</td>"
                            +"<td><button type='button' onclick='han2(this,"+data[i].persoId+")' value='"+1+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].PersonName+"</button></td></tr>"
                    }
                    $("#danwei_reght1").html(a+="</tablel>")
                }
            })
        })
    }
    function shoh2(u,d){
        $.ajax({
            url:"/TbDeparmentController/tbDPquery2.do",
            type:"post",
            data:{deptId : d},
            dataType:"json",
            success:function(data){
                var a = "<table class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'><td>人员</td></tr>"
                for (var i = 0; i < data.length ; i++) {
                    a+="<tr><td class='display_none'>"+data[i].persoId+"</td>"
                        +"<td><button type='button' onclick='han2(this,"+data[i].persoId+")' value='"+1+"' class='btn btn-default' data-dismiss='modal' style='cursor:pointer;'>"+data[i].PersonName+"</button></td></tr>"
                }
                $("#danwei_reght1").html(a+="</tablel>")
            }
        })
    }
    function han2(u,a){
        $(".persName").val($(u).html())
    }
</script>
</html>
