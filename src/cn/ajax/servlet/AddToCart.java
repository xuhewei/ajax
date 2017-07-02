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
		//1.��ȡ������� id,price
		String bookName=request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("price"));
		System.out.println(bookName);
		//2.��ȡ���ﳵ����
		HttpSession session=request.getSession();
		ShoppingCart sc=(ShoppingCart) session.getAttribute("sc");
		if(sc==null){
			sc=new ShoppingCart();
			session.setAttribute("sc", sc);
		}
		//3.�ѵ����ѡ����뵽���ﳵ��
		sc.addToCart(bookName, price);
		//4.׼����Ӧ��json����
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
		//5.��Ӧjson����
		response.setContentType("text/javascript");
		//response.getWriter().print(result.toString());
		response.getWriter().print(mapper.writeValueAsString(sc));
	}

}
