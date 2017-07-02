<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  <!-- 
  1.获取当前页面所有的a节点，并为每一个a节点都添加onclick响应函数，同时取消其默认行为
  2.准备发送Ajax请求：Url(a节点的href属性值);args(时间戳)
  3.响应为一个json对象，包括：bookName,totalBookNumber,totalMoney
  4.把对应的属性添加到对应的位置
   -->
   
   <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.4.2.js"></script>
   <script type="text/javascript">
   		$(function(){
   	   		var isHasCart="${sessionScope.sc==null}";
   	   		//alert(isHasCart);
   	   		if(isHasCart){
				$("#cartstatus").hide();
   	   	   	}else{
   	   	  		$("#cartstatus").show();
   	   	  		$("#bookName").text("${sessionScope.sc.bookName}");
				$("#totalBookNumber").text("${sessionScope.sc.totalBookNumber}");
				$("#totalMoney").text("${sessionScope.sc.totalMoney}");
   	   	   	}
			$("a").click(function(){
				$("#cartstatus").show();
				var url=this.href;
				var args={"time":new Date()};
				$.getJSON(url,args,function(data){
					$("#bookName").text(data.bookName);
					$("#totalBookNumber").text(data.totalBookNumber);
					$("#totalMoney").text(data.totalMoney);
				});
				return false;
			});
   	   	})
   
   </script>
  </head>
  
  <body>
  	<div id="cartstatus">
          您已经将&nbsp;<span id="bookName"></span>&nbsp;加入到购物车中，
          购物车中的书有&nbsp;<span id="totalBookNumber"></span>&nbsp;本，
          总价格&nbsp;<span id="totalMoney"></span>&nbsp;钱
    </div>      <br/><br/>
    Java<a href="${pageContext.request.contextPath}/AddToCart?id=Java&price=300">加入购物车</a>
    <br/><br/>
    Oracle<a href="${pageContext.request.contextPath}/AddToCart?id=Oracle&price=200">加入购物车</a>
    <br/><br/>
    Struts2<a href="${pageContext.request.contextPath}/AddToCart?id=Struts2&price=100">加入购物车</a>
    <br/><br/>
  </body>
</html>
