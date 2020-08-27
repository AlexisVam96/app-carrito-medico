package com.modeloDao;

import java.util.List;


import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.config.Conexion;
import com.modelo.Categoria;
import com.modelo.Producto;




public class ProductoDao {
	Connection con;
	Conexion cn=new Conexion();
	PreparedStatement ps;
	ResultSet rs;
	int r=0;
	
	public void actualizar(Producto p) {
		String sql="update producto set Nombres=?, Foto=?, Descripcion=?, Precio=?, Stock=? where idProducto=?";

		try {
			con=cn.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, p.getNombre());
			ps.setString(2, p.getFoto());
			ps.setString(3, p.getDescripcion());
			ps.setDouble(4, p.getPrecio());
			ps.setInt(5, p.getStock());
			ps.setInt(6, p.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Erro al actualizar el Producto: "+e.getMessage());
		}
	}
	
	public void eliminar(int id) {
		String sql="delete from producto where idProducto="+id;
		try {
			con=cn.getConnection();
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar el Producto "+e.getMessage());
		}
	}
	
	public int actualizarstock(int id, int stock) {
		String sql="update producto set Stock=? where idProducto=?";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			ps.setInt(1, stock);
			ps.setInt(2, id);
			ps.executeUpdate();
		}catch(Exception e) {
			
		}
		return r;
	}
	
	public int agregar(Producto p) {
		String sql="insert into producto(Nombres,Foto,Descripcion,Precio,Stock) values(?,?,?,?,?)";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			ps.setString(1, p.getNombre());
			ps.setString(2, p.getFoto());
			ps.setString(3, p.getDescripcion());
			ps.setDouble(4, p.getPrecio());
			ps.setInt(5, p.getStock());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return r;
	}
	
	public Producto listarId(int id) {
		String sql="select idProducto, Nombres, Foto, Descripcion, Precio, Stock from producto where idProducto="+id;
		Producto p=new Producto();
		try {
			con=cn.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				p.setId(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setFoto(rs.getString(3));
				p.setDescripcion(rs.getString(4));
				p.setPrecio(rs.getDouble(5));
				p.setStock(rs.getInt(6));
			}
			
		}catch(Exception e) {
			
		}
		return p;
	}
	
	public List<Producto> listarPorCategoria(int id_categoria){
		List<Producto> productos = new ArrayList<>();
		String sql = "select idProducto, Nombres, Foto, Descripcion, Precio, Stock  from producto where idCategoria ="+ id_categoria;
		try {
			con= cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Producto p = new Producto();
				p.setId(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setFoto(rs.getString(3));
				p.setDescripcion(rs.getString(4));
				p.setPrecio(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				productos.add(p);
			}
		} catch (Exception e) {
			System.out.println("Erro al listar por categoria "+ e.getMessage());
		}
		return productos;
	}
	
	public List<Categoria> listarCategorias() {
		List<Categoria> categorias=new ArrayList<>();
		String sql="select * from categorias";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Categoria c = new Categoria();
				c.setId(rs.getInt(1));
				c.setNombre(rs.getString(2));
				categorias.add(c);
			}
		}catch(Exception e) {
			System.out.println("Error al listar las categorias en la bd: "+e.getMessage());
		}
		return categorias;
	}
	
	public List<Producto> listar() {
		List<Producto> productos=new ArrayList<>();
		String sql="select idProducto, Nombres, Foto, Descripcion, Precio, Stock  from producto";
		try {
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Producto p=new Producto();
				p.setId(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setFoto(rs.getString(3));
				p.setDescripcion(rs.getString(4));
				p.setPrecio(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				productos.add(p);
			}
		}catch(Exception e) {
		}
		return productos;
	}
	
	public String urlImg(int id) {
		String url=null;
		String sql="select Foto from producto where idProducto="+id;
		try {
			con=cn.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				url=rs.getString("Foto");
			}
		} catch (Exception e) {
			System.out.println("Error al devolver la url: "+e.getMessage());
		}
		return url;
	}
	
	public void listarImg(int id,HttpServletResponse response)  {
	
		String sql="select * from producto where idProducto="+id;
		InputStream inputStream=null;
		OutputStream outputStream=null;
		BufferedInputStream bufferedInputStream=null;
		BufferedOutputStream bufferedOutputStream=null;
		try {
			outputStream=response.getOutputStream();
			con=cn.getConnection();
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				inputStream=rs.getBinaryStream("Foto");
			}
			bufferedInputStream = new BufferedInputStream(inputStream);
			bufferedOutputStream = new BufferedOutputStream(outputStream);
			int i=0;
			while((i=bufferedInputStream.read())!=-1) {
				bufferedOutputStream.write(i);
			}
		}catch(Exception e) {
			
		}
	}
	
	
	
	
	
}
