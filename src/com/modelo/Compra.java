package com.modelo;

import java.util.List;

public class Compra {
	private int id;
	private int id_cliente;
	private int idpago;
	private String fecha;
	private Double monto;
	private String estado;
	
	private List<Carrito> detalleCompras;
	
	public Compra() {
		super();
	}
	public Compra( int id_cliente, int idpago, String fecha, Double monto, String estado,
			List<Carrito> detalleCompras) {
		super();
		this.id_cliente = id_cliente;
		this.idpago = idpago;
		this.fecha = fecha;
		this.monto = monto;
		this.estado = estado;
		this.detalleCompras = detalleCompras;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public int getIdpago() {
		return idpago;
	}

	public void setIdpago(int idpago) {
		this.idpago = idpago;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public List<Carrito> getDetalleCompras() {
		return detalleCompras;
	}

	public void setDetalleCompras(List<Carrito> detalleCompras) {
		this.detalleCompras = detalleCompras;
	}
	
	
}
