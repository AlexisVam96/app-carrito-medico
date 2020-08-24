$(document).ready(function (){
	$("tr #btnDelete").click(function (){
		var idp =$(this).parent().find("#idp").val();
		swal({
			title: "Esta seguro de eliminar el producto",
			text: "Desea eliminar el producto",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
				if (willDelete) {
					eliminar(idp);
					swal("Producto Eliminado", {
					icon: "success",
					}).then((WillDelete) => {
						if(WillDelete){
							parent.location.href="Controlador?menu=home&accion=Carrito";
						}
					});
				} else {
					swal("Producto no Eliminado");
				}
			});
	});
	
	$("tr #btnDeletea").click(function (){
		var idp =$(this).parent().find("#idp").val();
		swal({
			title: "Esta seguro de eliminar el producto",
			text: "Desea eliminar el producto",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
				if (willDelete) {
					eliminarAdmin(idp);
					swal("Producto Eliminado", {
					icon: "success",
					}).then((WillDelete) => {
						if(WillDelete){
							parent.location.href="Controlador?menu=ADMIN&accion=Carrito";
						}
					});
				} else {
					swal("Producto no Eliminado");
				}
			});
	});
	
	$("tr #btnDeleteb").click(function (){
		var idp =$(this).parent().find("#idp").val();
		swal({
			title: "Esta seguro de eliminar el producto",
			text: "Desea eliminar el producto",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
				if (willDelete) {
					eliminarUser(idp);
					swal("Producto Eliminado", {
					icon: "success",
					}).then((WillDelete) => {
						if(WillDelete){
							parent.location.href="Controlador?menu=USER&accion=Carrito";
						}
					});
				} else {
					swal("Producto no Eliminado");
				}
			});
	});
	
	function eliminar(idp){
		var url="Controlador?menu=home&accion=Delete";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp="+idp,
			success: function(data, textStatus, jqXHR){
			}
		})
	}
	
	function eliminarAdmin(idp){
		var url="Controlador?menu=ADMIN&accion=Delete";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp="+idp,
			success: function(data, textStatus, jqXHR){
			}
		})
	}

	function eliminarUser(idp){
		var url="Controlador?menu=USER&accion=Delete";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp="+idp,
			success: function(data, textStatus, jqXHR){
			}
		})
	}
	
	
	$("tr #Cantidad").click(function(){
		var idp = $(this).parent().find("#idpro").val();
		var cantidad = $(this).parent().find("#Cantidad").val();
		var url = "Controlador?menu=home&accion=ActualizarCantidad";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp=" + idp + "&Cantidad=" + cantidad,
			success: function (data,textStatus,jqXHR){
				location.href="Controlador?menu=home&accion=Carrito";
				
			}
		})
	})
		
	$("tr #CantidadA").click(function(){
		var idp = $(this).parent().find("#idpro").val();
		var cantidad = $(this).parent().find("#CantidadA").val();
		var url = "Controlador?menu=ADMIN&accion=ActualizarCantidad";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp=" + idp + "&CantidadA=" + cantidad,
			success: function (data,textStatus,jqXHR){
				location.href="Controlador?menu=ADMIN&accion=Carrito";
				
			}
		})
	})
	
	$("tr #CantidadB").click(function(){
		var idp = $(this).parent().find("#idpro").val();
		var cantidad = $(this).parent().find("#CantidadB").val();
		var url = "Controlador?menu=USER&accion=ActualizarCantidad";
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp=" + idp + "&CantidadB=" + cantidad,
			success: function (data,textStatus,jqXHR){
				location.href="Controlador?menu=USER&accion=Carrito";
				
			}
		})
	})
	
})