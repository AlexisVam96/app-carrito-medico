package com.modeloDao;

import java.util.*;

import com.modelo.Detalle;


public class prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List<Detalle> detalles=new ArrayList<>();
		CompraDao cdao=new CompraDao();
		
		detalles=cdao.listar_detalle_id(58);
		for (int i = 0; i < detalles.size(); i++) {
			System.out.println(detalles.get(i).getImagen()+ "\n");
		}
		

	}
		
}
