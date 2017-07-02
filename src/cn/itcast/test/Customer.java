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
		//1.����jar��
		//2.����objectmappter����
		ObjectMapper mapper=new ObjectMapper();
		//3.����mapper��writeValueAsString()������һ������򼯺�תΪjson�ַ���
		Customer customer=new Customer("aaa", "333");
		String jsonStr=mapper.writeValueAsString(customer);
		System.out.println(jsonStr);
		//4.ע�⣺jacksonʹ��getter��������λjson���������
		//5.����ͨ�����ע��JsonIgnore����ĳһ��getter���������
		List<Customer> customers=Arrays.asList(customer,new Customer("bb", "213"));
		jsonStr=mapper.writeValueAsString(customers);
		System.out.println(jsonStr);
	}
}
