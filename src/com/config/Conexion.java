package com.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	String url="jdbc:mysql://localhost:3306/bd_carrito_medico?autoReconnect=true&useSSL=false";
	String user="root";
	String pass="root";
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
