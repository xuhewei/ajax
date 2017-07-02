<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript" src="scripts/jquery-1.4.2.js"></script>
    <script type="text/javascript">
    	$(function(){
        	$("a").click(function(){
            	//使用load方法处理ajax
            	var url=this.href;
            	var args={"time":new Date()};
            	$("#content").load(url,args);
        		return false;
            	});
        });
        	
    </script>
  </head>
  
  <body>
    <a href="helloAjax.txt">hello ajax</a>
    <div id="content"></div>
  </body>
</html>
