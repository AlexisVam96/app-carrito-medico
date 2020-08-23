package com.modelo;

public class Pago {
	private int id;
	private String tarjeta;
	private String cod_seguridad;
	private Double monto;
	
	public Pago() {
		super();
	}
		
	public Pago(int id, String tarjeta, String cod_seguridad, Double monto) {
		super();
		this.id = id;
		this.tarjeta = tarjeta;
		this.cod_seguridad = cod_seguridad;
		this.monto = monto;
	}
	
	public String getTarjeta() {
		return tarjeta;
	}

	public void setTarjeta(String tarjeta) {
		this.tarjeta = tarjeta;
	}

	public String getCod_seguridad() {
		return cod_seguridad;
	}

	public void setCod_seguridad(String cod_seguridad) {
		this.cod_seguridad = cod_seguridad;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Double getMonto() {
		return monto;
	}
	public void setMonto(Double monto) {
		this.monto = monto;
	}
		
}
