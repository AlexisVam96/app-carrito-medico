$(document).ready(function (){
	$("tr #btnDelete").click(function (){
		var idp =$(this).parent().find("#idp").val();
		swal({
			title: "Está seguro de eliminar el producto",
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