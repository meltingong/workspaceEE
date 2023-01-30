package com.itwill.user.test;

import java.io.FileInputStream;
import java.util.Properties;

import com.itwill.user.UserDao;

public class PropertiesFileLoadMain {

	public static void main(String[] args) throws Exception{
		Properties properties=new Properties();
		/*
		  *.properties 파일을 loading해서 Properties객체[HashMap]를 만들어준다
		 */
		/*
		FileInputStream fis=
				new FileInputStream("C:\\2022-05-JAVA-DEVELOPER\\eclipse-workspaceEE\\user_model1\\src\\main\\java\\com\\itwill\\user\\jdbc.properties");
		properties.load(fis);
		*/
		
		properties.load(UserDao.class.getResourceAsStream("jdbc.properties"));
		System.out.println(properties);
		System.out.println(properties.getProperty("driverClassName"));
		System.out.println(properties.getProperty("url"));
		System.out.println(properties.getProperty("username"));
		System.out.println(properties.getProperty("password"));
	}

}
