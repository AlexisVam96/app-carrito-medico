package com.config;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FechaHora {
	
	public static LocalDateTime localDate= LocalDateTime.now();
	private static String fechaHora;
	public FechaHora() {
		
	}
	public static String fechaHoraBD() {
		DateTimeFormatter dtf= DateTimeFormatter.ofPattern("dd MMMM YYYY - hh:mm a");
		fechaHora = dtf.format(localDate);
		return fechaHora;
	}
	
	public static void main(String args[]) {
		System.out.println(fechaHoraBD());
	}
}
