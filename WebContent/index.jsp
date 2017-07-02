<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript">
    window.onload=function(){
		//1.获取a节点，并为其添加onclick响应函数
        document.getElementsByTagName("a")[0].onclick=function(){
			 //3.创建一个XMLHttpRequest对象
			 var request=new XMLHttpRequest();
			 //4.准备发送请求的数据：url
			 var url=this.href +"?time="+new Date();
			 var method="GET";
			 //var method="POST"
			 //5.调用xmlhttprequest对象的open方法
			 request.open(method,url);
			 //request.setRequestHeader("ContentType","application/x-www-form-urlencoded");
			 //6.调用xmlhttprequest对象的send方法
			 request.send(null);
			 //request.send("name='aaa'");
			 //7.为xmlhttprequest对象添加onreadystatechange响应函数
			 request.onreadystatechange=function(){
				//8.决断响应是否完成：xmlhttprequest对象的readystate属性值为4
				 if(request.readyState==4){
					//9.再决断响应是否可用：xmlhttprequest对象status属性值为200
					 if(request.status==200){
						//10.打印响应结果：responseText
						alert(request.responseText);
					 }
				 }
			 }
			 //2.取消a节点的默认行为
             return false;
        }
    }
    </script>
  </head>
  
  <body>
    <a href="helloAjax.txt">HelloAjax</a>
  </body>
</html>
