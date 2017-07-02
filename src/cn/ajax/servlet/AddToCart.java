package cn.ajax.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import cn.itcast.beans.ShoppingCart;

public class AddToCart extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取请求参数 id,price
		String bookName=request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("price"));
		System.out.println(bookName);
		//2.获取购物车对象
		HttpSession session=request.getSession();
		ShoppingCart sc=(ShoppingCart) session.getAttribute("sc");
		if(sc==null){
			sc=new ShoppingCart();
			session.setAttribute("sc", sc);
		}
		//3.把点击的选项加入到购物车中
		sc.addToCart(bookName, price);
		//4.准备响应的json对象
//		StringBuilder result=new StringBuilder();
//		result.append("{")
//		.append("\"bookName\":\""+bookName+"\"")
//		.append(",")
//		.append("\"totalBookNumber\":"+sc.getTotalBookNumber())
//		.append(",")
//		.append("\"totalMoney\":"+sc.getTotalMoney())
//		.append("}");
		ObjectMapper mapper=new ObjectMapper();
		String result=mapper.writeValueAsString(sc);
		System.out.println(result);
		//5.响应json对象
		response.setContentType("text/javascript");
		//response.getWriter().print(result.toString());
		response.getWriter().print(mapper.writeValueAsString(sc));
	}

}
