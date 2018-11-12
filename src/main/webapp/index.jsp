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
	  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <a href="Html.jsp">首页</a>
  <div class="container">
	  <form role="form" class="form-inline">
		  <div class="form-group">
			  <label class="sr-only">用户名</label>
			  <input type="text" class="form-control" placeholder="用户名/邮箱/手机号"/>
		  </div>
		  <div class="form-group">
			  <label class="sr-only">密码</label>
			  <input type="password" class="form-control" placeholder="输入6-14位英文和数字组合密码"/>
		  </div>
		  <div class="form-group">
			  <label class="sr-only">生日</label>
			  <input type="date" class="form-control" placeholder="出生年月"/>
		  </div>
		  <div class="form-group">
			  <label class="sr-only">上传头像</label>
			  <input type="file" class="form-control input-lg"/>
			  <p class="help-block">选择您需要的头像文件</p>
		  </div>
	  </form>
	  <form role="form" class="form-horizontal">
		  <div class="form-group">
			  <label class="col-sm-4 control-label">用户名</label>
			  <div class="col-sm-8">
				  <input type="text" class="form-control" placeholder="用户名/邮箱/手机号"/>
			  </div>

		  </div>
		  <div class="form-group">
			  <label class="col-sm-4 control-label">密码</label>
			  <div class="col-sm-8">
				  <input type="password" class="form-control" placeholder="输入6-14位英文和数字组合密码"/>
			  </div>
		  </div>
		  <div class="form-group">
			  <label class="col-sm-4 control-label">生日</label>
			  <div class="col-sm-8">
				  <input type="date" class="form-control" placeholder="出生年月"/>
			  </div>
		  </div>
		  <div class="form-group">
			  <div class="col-sm-offset-4 col-sm-8">
				  <div class="checkbox">
					  <label>
						  <input type="checkbox"/>记住密码
					  </label>
				  </div>
			  </div>
		  </div>
		  <div class="form-group">
			  <div class="col-sm-offset-4 col-sm-8">
				  <button class="btn btn-default">登录</button>
			  </div>
		  </div>
	  </form>
	  <form role="form" class="form-horizontal">
		  <div class="form-group">
			  <label>喜欢的球队</label>
			  <div class="checkbox">
				  <label>
					  <input type="checkbox"/>广州恒大
				  </label>
				  <label>
					  <input type="checkbox"/>上海上港
				  </label>
				  <label>
					  <input type="checkbox"/>北京国安
				  </label>
			  </div>
		  </div>
		  <div class="form-group">
			  <label>性别</label>
			  <div class="radio">
				  <label>
					  <input type="radio" checked name="gender"/>男
				  </label>
				  <label>
					  <input type="radio" name="gender"/>女
				  </label>
			  </div>
		  </div>
		  <div class="form-group">
			  <label>所属城市</label>
			  <select class="form-control" multiple>
				  <option>北京</option>
				  <option>上海</option>
				  <option>广州</option>
			  </select>
		  </div>
		  <div class="form-group">
			  <label class="sr-only"></label>
			  <textarea class="form-control" rows="5" placeholder="请文明用语"></textarea>
		  </div>
		  <p class="form-control-static">请按照邮箱格式输入：hello@163.com</p>
		  <div class="form-group">
			  <label>密码</label>
			  <input class="form-control" type="password"  disabled/>
		  </div>
		  <div class="form-group">
			  <label>昵称</label>
			  <input class="form-control" type="text" placeholder="胖虎" readonly/>
		  </div>
		  <div class="form-group has-error has-feedback">
			  <label>用户名</label>
			  <input class="form-control" type="text" />
			  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			  <label>用户名</label>
			  <input class="form-control" type="text" />
			  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
		  </div>
		  <div class="form-group has-warning has-feedback">
			  <label>用户名</label>
			  <input class="form-control" type="text" />
			  <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
		  </div>
	  </form>
  </div>

  </body>

  

</html>
