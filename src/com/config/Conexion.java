package com.config;


import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	//String url= "jdbc:mysql://localhost:3306/bd_carrito_medico?useSSL=false";
	//String user="root";
	//String pass="root";
	
	String url= "jdbc:mysql://bijvhlrivyj0vjydczqe-mysql.services.clever-cloud.com:3306/bijvhlrivyj0vjydczqe?useSSL=false";
	String user="ulh4lpnjdrlrqadq";
	String pass="A5kOGzsGlFfvHUteUzIx";
	Connection con = null;
	public Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
		}
		return con;
	}
	
}
