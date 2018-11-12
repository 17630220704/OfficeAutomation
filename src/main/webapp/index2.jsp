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
	  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <form>
	  <div class="form-group">
		  <label>Username</label>
		  <input type="text" class="form-control" name="username" />
	  </div>
	  <div class="form-group">
		  <label>Email address</label>
		  <input type="text" class="form-control" name="email" />
          <input type="text" class="form-control" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('不能为空!')" />
	  </div>
	  <div class="form-group">
		  <button type="submit" name="submit" class="btn btn-primary">Submit</button>
	  </div>
  </form>
  </body>
  <script type="text/javascript">
      $(function () {
          $('form').bootstrapValidator({
              message: 'This value is not valid',
              feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              },
              fields: {
                  username: {
                      message: '用户名验证失败',
                      validators: {
                          notEmpty: {
                              message: '用户名不能为空'
                          }
                      }
                  },
                  email: {
                      validators: {
                          notEmpty: {
                              message: '邮箱地址不能为空'
                          }
                      }
                  }
              }
          });
      });
  </script>
</html>
