package com.koreait.mooda.manager.db;

import java.sql.Connection;
import java.sql.DriverManager;
// conn 객체를 부르게 되면 mysql에 지정된 url uid upw로 접근시켜준다.
public class Dbconn {
	public static Connection getConnection() {
		Connection conn=null;
		
		try {
			String url = "jdbc:mysql://localhost:3306/mooda";
			String uid = "root";
			String upw = "donkii";
			
		   Class.forName("com.mysql.cj.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
		   conn = DriverManager.getConnection(url, uid, upw);
		   
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
