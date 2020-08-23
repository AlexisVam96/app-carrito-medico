package com.modeloDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.config.Conexion;
import com.modelo.Venta;



public class VentaDao {
	Conexion cn=new Conexion();
	Connection con=null;
	PreparedStatement ps;
	ResultSet rs;
	
	public List<Venta> listarVentas(){
		List<Venta> lista = new ArrayList<>();
		String sql="SELECT c.idCliente, c.Nombres AS CLIENTE, p.Nombres aS PRODUCTO, PrecioCompra, Cantidad, Monto, FechaCompras "
				+ "from cliente c inner join compras co on c.idCliente=co.idCliente "
				+ "INNER JOIN detalle_compras de on co.idCompras=de.idCompras "
				+ "INNER join producto p on p.idProducto=de.idProducto";
		try {
			con=cn.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Venta v=new Venta();
				v.setId_cliente(rs.getInt(1));
				v.setNom_cliente(rs.getString(2));
				v.setNom_producto(rs.getString(3));
				v.setPrecio(rs.getDouble(4));
				v.setCantidad(rs.getInt(5));
				v.setMonto(rs.getDouble(6));
				v.setFechaCompra(rs.getString(7));
				lista.add(v);
			}
		} catch (Exception e) {
			System.out.println("Error al Listar Ventas: "+ e.getMessage());
		}
		return lista;
	}
}
