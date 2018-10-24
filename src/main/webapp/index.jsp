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

  <a href="../../../../../Desktop/OfficeAutomation/src/main/webapp/know/know1.jsp">文件夹管理</a>
  <a href="../../../../../Desktop/OfficeAutomation/src/main/webapp/know/know3.jsp">会议</a>
  <a href="../../../../../Desktop/OfficeAutomation/src/main/webapp/know/know4.jsp">会议 审批页面</a>
  </body>
  <script type="text/javascript">
  
 	$(".tianjia1").click(function(){
 		$("#table1").css("display","block");
 	})
  
  //查询函数
function a(){
  	$.ajax({
  			url:"a1/select",
  			data:"",
  			type:"post",
  			dataType:"json",
			success:function(data){
				$("#table").html("");
				var a ="";
					a+="<tr><td>id</td>"
					a+="<td>账号</td>"
					a+="<td>密码</td></tr>"
				for(i=0;i<data.list.length;i++){
					var b = data.list[i]
					a+="<tr class='id'><td>"+b.shopno+"</td>"
					a+="<td>"+b.shopname+"</td>"
					a+="<td>"+b.shopprice+"</td>"				
				}
				$("#table").append(a);
			}  			
  		})
  }
  	//执行查询函数
  	$(a());
  	//添加提交按钮函数
  	$(".tianjia").click(function(){
  		var shopname=$("#shopname").val();
  		var shopprice=$("#shopprice").val();
  		$.ajax({
  			url:"a1/insert",
  			data:{
  				"shopname":shopname,
  				"shopprice":shopprice
  			},
  			type:"post",
  			dataType:"json",
			success:function(data){
			if(data.a==1){
				$("#table1").css("display","none");
				alert("成功");
				a();
			}else{
				alert("失败");
			}
			}  			
  		})
  	})
  	  </script>
</html>
