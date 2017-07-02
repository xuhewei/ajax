<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  	<script type="text/javascript" src="scripts/jquery-1.7.2.js"></script>
 	<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
  <!-- 
  1.获取#city，添加change响应函数
  2.使#department只保留第一个option子节点
  3.获取#city选择的值，若该值为“”，即选择的是“请选择...”，此时不需要发送ajax请求
  4.若值不为"",说明的确是city发生了改变，准备ajax请求
  4.1 url:employeeServlet?method=listdempartments
  4.2 args:locationid,time
  5.返回的是一个json数组
  5.1若返回的数组中的元素为0：提示：“当前城市没有部门”
  5.2若返回的数组中元素不为0：遍历，创建<option value="departmentId">departmentName</option>
  	并把新创建的option节点加为#department的子节点
   -->
  	<script type="text/javascript">
  		$(function(){
  	  		//使用blockUI
  	  		$(document).ajaxStart(function(){
	  	  		$.blockUI({
					message:$('#loading'),
					css:{
						top:($(window).height()-400)/2+'px',
						left:($(window).width()-400)/2+'px',
						width:'400px',
						border:'none'					
	  	  			},
	  	  			overlayCSS:{backgroundColor:'#fff'}
	  	  		})
  	  	    }).ajaxStop($.unblockUI);
			$("#city").change(function(){
				document.getElementById("empdetails").style.display="none";
				$("#department option:not(:first)").remove();
				$("#employee option:not(:first)").remove();
				var city=$(this).val();
				if(city!=""){
					var url="EmployeeServlet?method=listDepartments";
					var args={"locationId":city,"time":new Date()};
					$.getJSON(url,args,function(data){
						if(data.length==0){
							alert("当前城市没有部门");
						}else{
							for(var i=0;i<data.length;i++){
								var deptId=data[i].departmentId;
								var deptName=data[i].departmentName;
								$("#department").append("<option value='"+deptId+"'>"+deptName+"</option>");
							}
						}
					});
				}
			});

			$("#department").change(function(){
				document.getElementById("empdetails").style.display="none";
				$("#employee option:not(:first)").remove();
				var department=$(this).val();
				if(department!=""){
					var url="EmployeeServlet?method=listEmployees";
					var args={"departmentId":department,"time":new Date()};
					$.getJSON(url,args,function(data){
						if(data.length==0){
							alert("当前部门没有用户");
						}else{
							for(var i=0;i<data.length;i++){
								var empId=data[i].employeeId;
								var empName=data[i].name;
								$("#employee").append("<option value='"+empId+"'>"+empName+"</option>");
							}
						}
					});
				}
			});


			$("#employee").change(function(){
				document.getElementById("empdetails").style.display="";
				var employee=$(this).val();
				if(employee!=""){
					var url="EmployeeServlet?method=listDetails";
					var args={"employeeId":employee,"time":new Date()};
					$.getJSON(url,args,function(data){
							for(var i=0;i<data.length;i++){
								var empId=data[i].employeeId;
								var empName=data[i].name;
								var email=data[i].email;
								var salary=data[i].salary;
								
								var f=document.getElementById("id");
								f.innerHTML=empId;
								var f=document.getElementById("name");
								f.innerHTML=empName;
								var f=document.getElementById("email");
								f.innerHTML=email;
								var f=document.getElementById("salary");
								f.innerHTML=salary;
							}
					});
				}

			});
  		})
  	
  	</script>
  
  </head>
  
  <body>
    <img alt="" id="loading" src="images/loading.gif" style="display:none"/>
    <CENTER>
    	<br/><br/>
    	City:
    	<select id="city">
    		<option value="">请选择....</option>
    		<c:forEach items="${locations }" var="location">
    			<option value="${location.locationId}">${location.city }</option>
    		</c:forEach>
    	</select>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      Department:
      <select id="department">
         <option value="">请选择....</option>
      </select>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
     Employee:
      <select id="employee">
         <option value="">请选择....</option>
      </select>
      <br/><br/>
      <table id="empdetails" border="1" cellspacing="0" cellpadding="5" style="display: none">
      	<tr>
      		<th>Id</th>
      		<th>Name</th>
      		<th>Email</th>
      		<th>Salary</th>
      	</tr>
      	<tr>
      		<td id="id"></td>
      		<td id="name"></td>
      		<td id="email"></td>
      		<td id="salary"></td>
      	</tr>
      </table>
    </CENTER>
  </body>
</html>
