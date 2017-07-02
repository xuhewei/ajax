<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.4.2.js"></script>
    <script type="text/javascript">
    	$(function(){
			$(":input[name='username']").change(function(){
				var val=$(this).val();
				val=$.trim(val);
				if(val!=""){
					var url="${pageContext.request.contextPath}/valiateUserName";
					var args={"username":val,"time":new Date()};
					$.post(url,args,function(data){
						$("#message").html(data);
					});
				}
			});
    	});
    	
    </script>
 
</head>
  
  <body>
    <form action="" method="post">
    	UserName:<input type="text" name="username"/>
    	<br/>
    	<div id="message"></div>
    	<br/>
    	<input type="submit" value="Submit"/>
    </form>
  </body>
</html>
