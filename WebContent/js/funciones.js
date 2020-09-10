
//imprime una etiquta determinada
function printDiv(nombreDiv) {
    var contenido= document.getElementById(nombreDiv).innerHTML;
    var contenidoOriginal= document.body.innerHTML;

    document.body.innerHTML = contenido;

    window.print();

    document.body.innerHTML = contenidoOriginal;
}

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
	
	$("tr #btnDeleteProducto").click(function (){
		var idp =$(this).parent().find("#idp").val();
		swal({
			title: "Esta seguro de eliminar el producto",
			text: "Desea eliminar el producto",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
				if (willDelete) {
					eliminarProducto(idp);
					swal("Producto Eliminado", {
					icon: "success",
					}).then((WillDelete) => {
						if(WillDelete){
							parent.location.href="Controlador?menu=Producto&accion=Listar";
						}
					});
				} else {
					swal("Producto no Eliminado");
				}
			});
	});
	
	$("form #btnAgregar").click(function (){
		swal("Producto Agregado!", "You clicked the button!", "success");
	});
	
	$("ul #btnSalir").click(function (){
		swal({
			title: "Desea salir del sistema",
			text: "Medi Fast",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
				if (willDelete) {
					swal("Saliendo del sistema", {
					icon: "success",
					}).then((WillDelete) => {
						if(WillDelete){
							parent.location.href="Controlador?menu=Salir";
						}
					});
				} else {
					swal("No salio del sistema");
				}
			});
	});
	
	function validar(email, pass){
		var email = document.getElementById("email").value;
		var pass = document.getElementById("pass").value;
		var url="Controlador?menu=Login";
		$.ajax({
			type: 'POST',
			url: url,
			data: "txtCorreo=" + email + "&txtPass=" + pass,
			success: function(data, textStatus, jqXHR){
			}
		})
	}
	
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
	
	function eliminarProducto(idp){
		var url="Controlador?menu=Producto&accion=Delete";
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
		
	
})