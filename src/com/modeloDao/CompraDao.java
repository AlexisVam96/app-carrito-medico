package com.modeloDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.config.Conexion;
import com.modelo.Carrito;
import com.modelo.Compra;
import com.modelo.Detalle;

public class CompraDao {
	
	Connection con;
	Conexion cn=new Conexion();
	PreparedStatement ps;
	ResultSet rs;
	int r=0;
	
	public List<Compra> listar_compras_id(int id_cliente){
		List<Compra> compras=new ArrayList<>();
		String sql="select * from compras where idCliente="+id_cliente;
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Compra c=new Compra();
				c.setId(rs.getInt(1));
				c.setId_cliente(rs.getInt(2));
				c.setIdpago(rs.getInt(3));
				c.setFecha(rs.getString(4));
				c.setMonto(rs.getDouble(5));
				c.setEstado(rs.getString(6));
				compras.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error al listar la compra x id del cliente"+e.getMessage());
		}
		return compras;
	}
	
	public List<Detalle> listar_detalle_id(int id){
		List<Detalle> detalles=new ArrayList<>();
		String sql="SELECT p.Nombres,p.Foto, p.Precio, c.Cantidad, c.Cantidad*p.Precio from producto p INNER JOIN detalle_compras c on p.idProducto=c.idProducto where c.idCompras="+id;
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Detalle d=new Detalle();
				d.setNombre(rs.getString(1));
				d.setImagen(rs.getString(2));
				d.setPrecio(rs.getDouble(3));
				d.setCantidad(rs.getInt(4));
				d.setSubtotal(rs.getDouble(5));
				detalles.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error al listar el detalle de compra "+e.getMessage());
		}
		return detalles;
	}
	
	/*public List<Detalle> listar_detalle(){
		List<Detalle> detalles=new ArrayList<>();
		String sql="select * from detalle_compras";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Detalle d=new Detalle();
				d.setId(rs.getInt(1));
				d.setId_producto(rs.getInt(2));
				d.setId_compras(rs.getInt(3));
				d.setCantidad(rs.getInt(4));
				d.setPrecio(rs.getDouble(5));
				detalles.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error al listar el detalle de compra "+e.getMessage());
		}
		return detalles;
	}*/
	
	public List<Compra> listar_compras(){
		List<Compra> compras=new ArrayList<>();
		String sql="select * from compras";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Compra c=new Compra();
				c.setId(rs.getInt(1));
				c.setId_cliente(rs.getInt(2));
				c.setIdpago(rs.getInt(3));
				c.setFecha(rs.getString(4));
				c.setMonto(rs.getDouble(5));
				c.setEstado(rs.getString(6));
				c.setDomicilio(rs.getString(7));
				compras.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error al listar la compra "+e.getMessage());
		}
		return compras;
	}
	
	public int GenerarCompra(Compra compra) {
		int idcompras;
		String sql="insert into compras (idCliente,FechaCompras,Monto,Estado,Domicilio,idPago) values (?,?,?,?,?,?)";
		try {
			con=cn.getConnection();
			ps=(PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, compra.getId_cliente());
			ps.setString(2, compra.getFecha());
			ps.setDouble(3, compra.getMonto());
			ps.setString(4, compra.getEstado());
			ps.setString(5, compra.getDomicilio());
			ps.setInt(6, compra.getIdpago());
			r=ps.executeUpdate();
			
			sql="select @@IDENTITY AS idCompras";
			rs=ps.executeQuery(sql);
			rs.next();
			idcompras = rs.getInt("idCompras");
			rs.close();
			for (Carrito detalle : compra.getDetalleCompras()) {
				sql="insert into detalle_compras(idProducto,idCompras,Cantidad,PrecioCompra) values (?,?,?,?)";
				ps=(PreparedStatement) con.prepareStatement(sql);
				ps.setInt(1, detalle.getIdProducto());
				ps.setInt(2, idcompras);
				ps.setInt(3, detalle.getCantidad());
				ps.setDouble(4, detalle.getPrecioCompra());
				r=ps.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("eror al insertar la compra en la bd: " +e.getMessage());
		}
		return r;
	}
}
