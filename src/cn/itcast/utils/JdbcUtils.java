package cn.itcast.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static ComboPooledDataSource ds;
	private static Connection conn=null;
	static{
		ds=new ComboPooledDataSource("flx");
	}
	public static Connection getConnection() throws SQLException{
		
		conn=getDataSource().getConnection();
		return conn;
	}
	public static DataSource getDataSource(){
		return ds;
	}
	
}
