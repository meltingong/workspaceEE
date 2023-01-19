package com.itwill.address;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/*
 ?뜲?씠??踰좎씠?뒪 ?꽕?젙?젙蹂대?? ?궗?슜?빐?꽌
 Connection媛앹껜瑜? ?깮?꽦?븯怨?,?빐吏??븯?뒗 ?뿭?븷?쓣?븯?뒗 ?겢?옒?뒪
 (Dao媛앹껜?뱾?씠 ?궗?슜?븯?뒗媛앹껜)
 */
public class DataSource {
	/*********?뜲?씠??踰좎씠?뒪?젒?냽?젙蹂대?? ???옣?븷?븘?뱶******/
	private String driverClass;
	private String url;
	private String user;
	private String password;
	/***********************************************/
	public DataSource() throws Exception{
		/*****jdbc.properties ?뙆?씪?쓣 ?씫?뼱?꽌 ?뜲?씠??踰좎씠?뒪?젒?냽?젙蹂대?? ?븘?뱶?뿉???옣 *****/
		Properties properties=new Properties();
		InputStream propertiesInput = DataSource.class.getResourceAsStream("/jdbc.properties");
		properties.load(propertiesInput);
		this.driverClass=properties.getProperty("driverClass");
		this.url=properties.getProperty("url");
		this.user=properties.getProperty("user");
		this.password=properties.getProperty("password");
	}
	
	/*
	 * Connection 媛앹껜瑜? ?깮?꽦?빐?꽌 諛섑솚?븯?뒗硫붿룜?뱶
	 */
	public Connection getConnection() throws Exception{
		Class.forName(driverClass);
		Connection con=DriverManager.getConnection(url, user, password);
		return con;
	}
	/*
	 * Connection 媛앹껜瑜? close?븯?뒗 硫붿룜?뱶
	 */
	public void close(Connection con) throws Exception{
		con.close();
	}
	
	
}