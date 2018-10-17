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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  </head>
  
  <body>
    <!--异步查询出的数据  -->
  	<table id="table"></table>
  	
  	<form id="form">
  		<table>
  			<tr>
  				<td>名字</td>
  				<td><input type="text" name="shopname" value=""/></td>
  			</tr>
  			<tr>
  				<td>类型</td>
  				<td><select id="select" name="tyshop.tyshopno"></select></td>
  			</tr>
  			<tr>
  				<td><button id="tianjia" class="tianjia">添加</button></td>
  			</tr>
  		</table>
  	</form>
  	
  	<!--更改数据  -->
	 <form id="form1">
		<table id="table1" style="display: none;">
			<tr>
  				<td>id</td>
  				<td><input type="text" name="shopno" value=""/></td>
  			</tr>
  			<tr>
  				<td>名字</td>
  				<td><input type="text" name="shopname" value="1"/></td>
  			</tr>
  			<tr>
  				<td>类型</td>
  				<td><select id="select1" name="tyshop.tyshopno"></select></td>
  			</tr>
  			<tr>
  				<td><button id="geng" class="geng">更改</button></td>
  			</tr>
  		</table>
	</form> 
  </body>
  <script type="text/javascript">
  	//查询
  	function a(){
	  	$.ajax({
	  			url:"a1/select1",
	  			type:"post",
	  			dataType:"json",
				success:function(data){
					$("#table").html("");
					var a ="";
						a+="<tr><td>id</td>"
						a+="<td>名字</td>"
						a+="<td>类型</td></tr>"
					for(i=0;i<data.list.length;i++){
						var b = data.list[i]
						a+="<tr class='id'><td>"+b.shopno+"</td>"
						a+="<td>"+b.shopname+"</td>"
						a+="<td>"+b.tyshop.tyshopname+"</td>"
						 a+="<td><button id='"+b.shopno+"' class='shanchu'>删除</button></td>"
						a+="<td><button id='"+b.tyshop.tyshopno+"' class='genggai'>更改</button></td>" 
					}
					$("#table").append(a);
				}  			
	  		})
	  }
  	//执行查询函数
  	$(function(){
  		a();
  	});
  	//商品类型
  	$(function(){
  		$.ajax({
  			url:"a1/select2",
  			data:"",
  			type:"post",
  			dataType:"json",
			success:function(data){
				$("#select").html("");
				var a ="";
				for(i=0;i<data.length;i++){
					a+="<option value='"+data[i].tyshopno+"'>"+data[i].tyshopname+"</option>"
				}
				$("#select").append(a);
				$("#select1").append(a);
			}  			
  		})
  	})
  	//添加
  	$(".tianjia").click(function(){
  		$.ajax({
  			url:"a1/insert1",
  			data:$("#form").serialize(),
  			type:"post",
  			dataType:"json",
			success:function(data){
				a();
			}  			
  		})
  	})
  	//删除
  	$("body").on("click",".shanchu",function(){
	  	if(confirm("确定删除数据")){
			var b="";
	  	    b=$(this);
	  		var id = b.attr("id");
	  		$.ajax({
	  			url:"a1/delete1",
	  			type:"post",
	  			data:{"shopno":id},
	  			dataType:"json",
	  			success:function(data){
	  				a();
	  				/* b.parent().parent().remove();
	  				alert("111"); */
	  			}
	  		})
		}
  	})
  	//更改
  	$("body").on("click",".genggai",function(){
  			$("#table1").css("display","block");
  			for(i=0;i<2;i++){
  				var html = $(this).parent().parent().children().eq(i).html();
  				$("#table1").find("tr").eq(i).find("td").eq(1).children().val(html);
  			}
  			var html1 = $(this).attr("id");
  			$("#select1 option[value='"+html1+"']").attr("selected","selected");
  	})
  	$(".geng").click(function(){
  		$.ajax({
  			url:"a1/update1",
  			type:"post",
  			data:$("#form1").serialize(),
  			dataType:"json",
  			success:function(data){
  				alert(data.update1);
  			}
  		})
  	})
  	
  </script>
</html>
