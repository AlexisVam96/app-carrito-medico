package com.modelo;

public class Venta {
	int id_cliente;
	String nom_cliente;
	String nom_producto;
	double precio;
	int cantidad;
	double monto;
	String FechaCompra;
	
	public Venta() {
		super();
	}
	
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	public String getNom_cliente() {
		return nom_cliente;
	}
	public void setNom_cliente(String nom_cliente) {
		this.nom_cliente = nom_cliente;
	}
	public String getNom_producto() {
		return nom_producto;
	}
	public void setNom_producto(String nom_producto) {
		this.nom_producto = nom_producto;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public String getFechaCompra() {
		return FechaCompra;
	}
	public void setFechaCompra(String fechaCompra) {
		FechaCompra = fechaCompra;
	}
	
	
}
