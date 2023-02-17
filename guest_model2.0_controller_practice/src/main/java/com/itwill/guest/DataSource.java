package com.itwill.guest;

import java.sql.Connection;
import java.sql.DriverManager;
/*
 * Connection을 생성하고,해지하는역할을하는 클래스
 */
public class DataSource {
	public DataSource() {
		//System.out.println("3.DataSource객체생성:"+this);
	}
	public Connection getConnection() throws Exception{
		/*******************************************/
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@182.237.126.19:1521:xe";
		String user = "jdeveloper30";
		String password = "jdeveloper30";
		/*******************************************/
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
}
