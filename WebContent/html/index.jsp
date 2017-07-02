<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  <script type="text/javascript">
  	window.onload=function(){
  	  	var aNodes=document.getElementsByTagName("a");
  	  	for(var i=0;i<aNodes.length;i++){
  	  	  	aNodes[i].onclick=function(){
				var request=new XMLHttpRequest();
				var method="GET";
				var url=this.href;
				request.open(method,url);
				request.send(null);
				request.onreadystatechange=function(){
					if(request.readyState==4){
						if(request.status==200){
							document.getElementById("details").innerHTML=request.responseText;
						}
					}
				}
  	  	  	  	return false;
  	  	  	}
  	  	}
  	}
  	  	  	
  </script>
  </head>
  
  <body>
    <h1>People</h1>
    <ul>
    	<li><a href="files/andy.html">Andy</a></li>
       	<li><a href="files/richard.html">Richard</a></li>
       	<li><a href="files/jeremy.html">Jeremy</a></li>
    </ul>
    <div id="details"></div>
  </body>
</html>
