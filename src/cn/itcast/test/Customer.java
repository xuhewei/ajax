package cn.itcast.test;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class Customer {
	private String name;
	private String id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Customer(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}
	public String getCity(){
		return "beijing";
	}
	@JsonIgnore
	public String getBirthday(){
		return "1980-12-12";
	}
	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
		//1.导入jar包
		//2.创建objectmappter对象
		ObjectMapper mapper=new ObjectMapper();
		//3.调用mapper的writeValueAsString()方法把一个对象或集合转为json字符串
		Customer customer=new Customer("aaa", "333");
		String jsonStr=mapper.writeValueAsString(customer);
		System.out.println(jsonStr);
		//4.注意：jackson使用getter方法来定位json对象的属性
		//5.可以通过添加注解JsonIgnore忽略某一个getter定义的属性
		List<Customer> customers=Arrays.asList(customer,new Customer("bb", "213"));
		jsonStr=mapper.writeValueAsString(customers);
		System.out.println(jsonStr);
	}
}
