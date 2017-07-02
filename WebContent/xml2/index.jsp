<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  <script type="text/javascript" src="../scripts/jquery-1.4.2.js"></script>
  <script type="text/javascript">
  	$(function(){
		$("a").click(function(){
			var url=this.href;
			var args={"time":new Date()};
			$.get(url,args,function(data){
				var name=$(data).find("name").text();
				var email=$(data).find("email").text();
				var website=$(data).find("website").text();
				$("#details").empty()
						.append("<h2><a href='mailto:"+email+"'>"+name+"</a></h2>")
						.append("<a href='"+website+"'>"+website+"</a>");
				});
			return false;

		});
  	})	  	
  </script>
  </head>
  
  <body>
    <h1>People</h1>
    <ul>
    	<li><a href="files/andy.xml">Andy</a></li>
       	<li><a href="files/richard.xml">Richard</a></li>
       	<li><a href="files/jeremy.xml">Jeremy</a></li>
    </ul>
    <div id="details"></div>
  </body>
</html>
