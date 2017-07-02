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
							//1.结果为xml格式，所以需要使用responsexml来获取
							var result=request.responseXML;
							//2.结果不能直接使用，必须先创建对应的节点，再把节点加入到details里面
							//目标格式为
							/*
							<h2><a href="andy@qq.com">Andy Budd</a></h2>
							<a href="http://anybudd.com">http://anybudd.com</a>
							*/
							var name=result.getElementsByTagName("name")[0].firstChild.nodeValue;
							var website=result.getElementsByTagName("website")[0].firstChild.nodeValue;
							var email=result.getElementsByTagName("email")[0].firstChild.nodeValue;
							//alert(name);
							//alert(website);
							//alert(email);
							var aNode=document.createElement("a");		
							aNode.appendChild(document.createTextNode(name));				
							aNode.href="mailto:"+email;
							
							var h2Node=document.createElement("h2");
							h2Node.appendChild(aNode);
							
							var aNode2=document.createElement("a");
							aNode2.appendChild(document.createTextNode(website));
							aNode2.href=website;
							
							var detailsNode=document.getElementById("details");
							detailsNode.innerHTML="";
							detailsNode.appendChild(h2Node);
							detailsNode.appendChild(aNode2);
							
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
    	<li><a href="files/andy.xml">Andy</a></li>
       	<li><a href="files/richard.xml">Richard</a></li>
       	<li><a href="files/jeremy.xml">Jeremy</a></li>
    </ul>
    <div id="details"></div>
  </body>
</html>
