package com.modeloDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.config.Conexion;
import com.modelo.Cliente;
import com.mysql.jdbc.PreparedStatement;


public class ClienteDao {
	Conexion cn=new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r=0;
	
	public Cliente listarId(int id) {
		String sql="select * from cliente where idCliente="+id;
		Cliente c=new Cliente();
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setDni(rs.getString(2));
				c.setNombre(rs.getString(3));
				c.setDireccion(rs.getString(4));
				c.setCorreo(rs.getString(5));
				c.setPassword(rs.getString(6));
				
			}
			
		}catch(Exception e) {
			
		}
		return c;
	}
	
	public Cliente validar(String email, String pass) {
		Cliente cl=new Cliente();
		String sql="select * from cliente where Email=? and Password=?";
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			while(rs.next()) {
				cl.setId(rs.getInt(1));
				cl.setDni(rs.getString(2));
				cl.setNombre(rs.getString(3));
				cl.setDireccion(rs.getString(4));
				cl.setCorreo(rs.getString(5));
				cl.setPassword(rs.getString(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cl;
	}
	
	public List<Object> listar() {
		String sql="Select * from cliente";
		List<Object> lista=new ArrayList<>();
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Cliente cl=new Cliente();
				cl.setId(rs.getInt(1));
				cl.setDni(rs.getString(2));
				cl.setNombre(rs.getString(3));
				cl.setDireccion(rs.getString(4));
				cl.setCorreo(rs.getString(5));
				cl.setPassword(rs.getString(6));
				lista.add(cl);
			}
			
		}catch(Exception e) {
			
		}
		return lista;
	}

	
	public int agregar(Cliente cl) {
		String sql="insert into cliente(Dni,Nombres,Direccion,Email,Password) values (?,?,?,?,?)";
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, cl.getDni());
			ps.setString(2, cl.getNombre());
			ps.setString(3, cl.getDireccion());
			ps.setString(4, cl.getCorreo());
			ps.setString(5, cl.getPassword());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return r;
	}
}
