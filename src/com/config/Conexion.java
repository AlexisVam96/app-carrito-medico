package com.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	String url="jdbc:mysql://localhost:3307/bdcarritocompras?autoReconnect=true&useSSL=false";
	String user="root";
	String pass="";
	Connection con;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
		}
		return con;
	}	
}
