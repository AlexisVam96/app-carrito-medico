package com.config;


import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	//String url= "jdbc:mysql://localhost:3306/bd_carrito_medico?useSSL=false";
	//String user="root";
	//String pass="root";
	
	String url= "jdbc:mysql://nwhazdrp7hdpd4a4.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/lwyfaxy3th7es6l9?useSSL=false";
	String user="gxjnymeb9oacejp0";
	String pass="ahwd3ymwkohefjho";
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
