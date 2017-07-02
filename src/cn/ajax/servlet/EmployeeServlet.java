package cn.ajax.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.codehaus.jackson.map.ObjectMapper;





import cn.itcast.beans.Department;
import cn.itcast.beans.Employee;
import cn.itcast.beans.Location;
import cn.itcast.utils.JdbcUtils;

public class EmployeeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String methodName=request.getParameter("method");
		if(methodName.equalsIgnoreCase("listLocations")){
				QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
				String sql="select location_id locationId, city from location";
				List<Location> locations;
				try {
					locations = (List) qr.query(sql, new BeanListHandler(Location.class));
					System.out.println("ddd");
					request.setAttribute("locations", locations);
					request.getRequestDispatcher("/WEB-INF/pages/employees.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}else if(methodName.equalsIgnoreCase("listDepartments")){
			String locationId=request.getParameter("locationId");
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
			String sql="select department_id departmentId,department_name departmentName from department d where d.location_id=?";
			List<Department> departments;
			try {
				departments = (List) qr.query(sql,locationId,new BeanListHandler(Department.class));
				request.setAttribute("departments", departments);
				ObjectMapper mapper=new ObjectMapper();
				String result=mapper.writeValueAsString(departments);
				System.out.println(result);
				response.setContentType("text/javascript");
				response.setCharacterEncoding("utf-8");
				
				response.getWriter().print(result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(methodName.equalsIgnoreCase("listEmployees")){
			String departmentId=request.getParameter("departmentId");
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
			String sql="select employee_id employeeId,name Name,email Email,salary Salary from employee e where e.department_id=?";
			List<Employee> employees;
			try {
				employees = (List) qr.query(sql,departmentId,new BeanListHandler(Employee.class));
				request.setAttribute("employees", employees);
				ObjectMapper mapper=new ObjectMapper();
				String result=mapper.writeValueAsString(employees);
				System.out.println(result);
				response.setContentType("text/javascript");
				response.setCharacterEncoding("utf-8");
				
				response.getWriter().print(result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(methodName.equalsIgnoreCase("listDetails")){
			String employeeId=request.getParameter("employeeId");
			QueryRunner qr=new QueryRunner(JdbcUtils.getDataSource());
			String sql="select employee_id employeeId,name Name,email Email,salary Salary from employee e where e.employee_id=?";
			List<Employee> employees;
			try {
				employees = (List) qr.query(sql,employeeId,new BeanListHandler(Employee.class));
				request.setAttribute("employees", employees);
				ObjectMapper mapper=new ObjectMapper();
				String result=mapper.writeValueAsString(employees);
				System.out.println("-----------");
				System.out.println(result);
				response.setContentType("text/javascript");
				response.setCharacterEncoding("utf-8");
				
				response.getWriter().print(result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
