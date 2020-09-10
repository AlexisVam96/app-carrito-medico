package com.modeloDao;

import java.sql.Connection;
import java.sql.ResultSet;
import com.config.Conexion;
import com.modelo.Pago;
import com.modelo.Pago;
import com.mysql.jdbc.PreparedStatement;

public class PagoDao {
	Conexion cn=new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r=0;
	
	public int idPago(String tarjeta) {
		int id=0;
		String sql="select idPago from pago where Tarjeta="+tarjeta;
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				id=rs.getInt("idPago");
			}
		} catch (Exception e) {
			System.out.println("Error al brindar el id del Pago: "+e.getMessage());
		}
		return id;
	}
	
	public Pago listarXtarjeta(String tarjeta) {
		String sql="select * from pago where Tarjeta="+tarjeta;
		Pago p=new Pago();
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				p.setId(rs.getInt(1));
				p.setCod_seguridad(rs.getString(2));
				p.setMonto(rs.getDouble(3));
				p.setTarjeta(rs.getString(4));
			}
			
		}catch(Exception e) {
			
		}
		return p;
	}
	
	public Pago listarPorCodigo(String codigo) {
		String sql="select * from pago where Codigo="+codigo;
		Pago p=new Pago();
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				p.setId(rs.getInt(1));
				p.setCod_seguridad(rs.getString(2));
				p.setMonto(rs.getDouble(3));
				p.setTarjeta(rs.getString(4));
			}
			
		}catch(Exception e) {
			
		}
		return p;
	}
	
	
	public int agregar(Pago pago) {
		String sql="insert into pago(Tarjeta,Codigo,Monto) values (?,?,?)";
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, pago.getTarjeta());
			ps.setString(2, pago.getCod_seguridad());
			ps.setDouble(3, pago.getMonto());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al registrar el pago"+e.getMessage());
		}
		return r;
	}

	
}
