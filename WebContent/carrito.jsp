<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="icon" href="img/descarga.ico"/>
	<title>Medifast: Atención rápida y segura</title>
	<style>
	@media print{
		.parte01, .parte02, .parte03, .btn, .accion{
			display: none;
			
		}
	}
</style>
</head>
<body style="font-family: serif; background-color: #F7F7F7;">
	
	<div class="text-center parte01" style="height: 40px; background-color: #F7F7F7; margin:0px; padding:0px;" >
		<p class="navbar-text text-center text-muted" style="align-items: center; font-family: serif;"><i class="fas fa-phone"></i>
    	Call-Center: 939 910 911
  		</p>
	</div>

	<nav class="parte02 navbar navbar-expand-lg navbar-light bg-light sticky-top">
		<a
			style="font-family: fantasy; font-size: xx-large; padding: 0px; margin: 0px; color: green;"
			class="navbar-brand "  data-toggle="dropdown" href="#"> <i style="color: red;" class="fas fa-plus"></i>
			MEDIFAST
		</a>
		<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="margin: 0 20px;">
			<a class="dropdown-item" href="Controlador?menu=${products}&accion=Listar">${products}</a>
			<a class="dropdown-item" href="Controlador?menu=home&accion=${sales}">${sales}</a>
		</div>
		
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto">
      			<li class="nav-item active">
       				<a class="nav-link" href="Controlador?menu=home&accion=Listar"><i class="fas fa-home"></i>Home <span class="sr-only">(current)</span></a>
      			</li>
      			<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-plus-circle"></i> Categorias </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:forEach var="c" items="${categorias}">
							<a class="dropdown-item" href="Controlador?menu=home&accion=Categoria&id=${c.getId() }">${c.getNombre() }</a>
						</c:forEach>
					</div>
				</li>
     			<li class="nav-item">
        			<a class="nav-link" href="#"><i class="fas fa-plus-circle"></i>Ofertas del Dia</a>
      			</li>
      			<li class="nav-item">
       				<a class="nav-link" href="Controlador?menu=home&accion=Listar" ><i class="fas fa-plus-circle"></i>Seguir Comprando</a>
      			</li>
    		</ul>
    		<ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
				<a style="cursor: pointer;" class="dropdown-toggle text-muted"
					data-toggle="dropdown"> <i class="fas fa-user-tie"></i>
					${cliente.getNombre()}
				</a>
				<div class="dropdown-menu text-center dropdown-menu-right">
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#myModal">${cliente.getCorreo()}</a>
					<a class="dropdown-item"
						href="Controlador?menu=home&accion=Compras">Mis Compras</a>
					<a class="dropdown-item" href="./Controlador?menu=Salir"> <i
						class="fas fa-arrow-right"> Salir</i></a>
				</div>
			</ul>
  		</div>
	</nav>
	<div class="parte03 container mt-4">
		<h3><i class="fas fa-cart-plus"></i>Carrito</h3><br>
		<div class="row">
			<div class="col-sm-8">
			 	<table class="table table-hover table-responsive">
			 		<thead>
			 			<tr>
			 				<th>ITEM</th>
			 				<th>PRODUCTO</th>
			 				<th>IMAGEN</th>
			 				<th>PRECIO</th>
			 				<th>CANTIDAD</th>
			 				<th>SUBTOTAL</th>
			 			</tr>
			 		</thead>
			 		<tbody>
			 			<c:forEach var="car" items="${carrito}" varStatus="iterator">
			 			<tr>
			 				<td>${iterator.index+1}</td>
			 				<td>${car.getDescripcion()}</td>
			 				<td>
			 					<img src="${car.getImagen() }" width="100" height="80">
			 				</td>
			 				<td>S/${car.getPrecioCompra()}0</td>
			 				<td>
			 					<input type="hidden" id="idpro" value="${car.getIdProducto() }">
			 					<input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control" min="1"  >
			 				</td>
			 				<td>S/${car.getSubTotal()}0</td>
			 				<td style="text-align:center;">
			 					<input type="hidden" id="idp" value="${car.getIdProducto()}">
			 					<a style="color: red;" href="#" id="btnDelete"><i class="fas fa-trash-alt"></i></a>
			 				</td>
			 			</tr>
			 			</c:forEach>
			 		</tbody>
			 	</table>
			</div>
			<div class="col-sm-4">
				<div class="card sticky-top" style="top: 150px;">
					<div class="card-header">
						<h3>Generar Compra</h3>
					</div>
					<div class="card-body">
						<label>Subtotal:</label>
						<input type="text" value="S/${totalPagar}0" readonly="" class="form-control">
						<label>Descuento:</label>
						<input type="text" value="S/0.00" readonly="" class="form-control">
						<label>Total a Pagar:</label>
						<input type="text" value="S/${totalPagar}0" readonly="" class="form-control">
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info btn-block" data-toggle="modal" data-target="#pago">Generar Compra</a>
						<!-- <a href="Controlador?menu=home&accion=GenerarCompra" class="btn btn-info btn-block">Generar Compra</a> -->
						<a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#factura">Realizar Factura</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- MODAL FACTURA -->
	
	<!-- Modal -->
	<div class="modal fade" id="factura" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content" id="areaImprimir">
	      <div class="modal-header">
	        <h4 class="modal-title" id="staticBackdropLabel"><i class="fas fa-file-invoice"></i> Factura Medifast</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
			      <div class="col-md-6 ml-auto">
			      	<div class="row mt-2">
						<div class="form-group col-md-6">
							<label >Fecha de Compra:</label>					
							<input type="text" name="txtNombre" value="${fecha }" readonly="" class="form-control">				
						</div>
						<div class="form-group col-md-6">
							<label >Nro. de Serie:</label>
							<input type="text" name="txt-Serie" value="17200280" readonly="" class="form-control">
						</div>
					</div>					      	      				      	
			      </div>
			</div>
	        <div class="row">
				<div class="form-group col-sm-3">
					<label >Cliente:</label>
					<input type="text" name="txtApellido" value="${cliente.getNombre() }" class="form-control">
				</div>
				<div class="form-group col-sm-3">
					<label >Telefono:</label>					
					<input type="text" name="txtNombre" value="939910911"  class="form-control">				
				</div>
				<div class="form-group col-sm-6">
					<label >Dirección:</label>
					<input type="text" name="txtApellido"  value="${cliente.getDireccion() }"  class="form-control">
				</div>
	        </div>
	      </div>
	      <div class="container">
		      <table class="table table-hover table-responsive">
				 	<thead>
						<tr>
							<th>ITEM</th>
							<th>PRODUCTO</th>
			 				<th>PRECIO</th>
			 				<th>CANTIDAD</th>
			 				<th>SUBTOTAL</th>
			 			</tr>
			 		</thead>
			 		<tbody>
			 			<c:forEach var="car" items="${carrito}" varStatus="iterator">
			 			<tr>
			 				<td class="text-center">${iterator.index+1}</td>
			 				<td>${car.getDescripcion()}</td>
			 				<td>S/${car.getPrecioCompra()}0</td>
			 				<td class="text-center">${car.getCantidad() }</td>
			 				<td>S/${car.getSubTotal()}0</td>
			 			</tr>
			 			</c:forEach>
			 		</tbody>
			 	</table>
    			<div class="row">
			      <div class="col-md-6 ml-auto">
			      	<div class="row form-group">
				      	<label class="col-md-4">Sub total:</label>	
				      	<div class="col-md">
				      		<input class="form-control" type="text" name="txtTotal" readonly="" value="S/${totalPagar }0">
				      	</div>		
			      	</div>					      	      				      	
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-md-6 ml-auto">
			      	<div class="row form-group">
				      	<label class="col-md-4">IGV (18%):</label>	
				      	<div class="col-md">
				      		<input class="form-control" type="text" name="txtTotal" readonly="" value="S/${igv }">
				      	</div>		
			      	</div>					      	      				      	
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-md-6 ml-auto">
			      	<div class="row form-group">
				      	<label class="col-md-4">Total a Pagar:</label>	
				      	<div class="col-md">
				      		<input class="form-control" type="text" name="txtTotal" readonly="" value="S/${total }">
				      	</div>		
			      	</div>					      	      				      	
			      </div>
			    </div>
			</div>
	      <div class="modal-footer">
	      	<a class="btn btn-secondary" href="Controlador?menu=home&accion=Carrito">Close</a>
	        <input type="button" class="btn btn-success" onclick="printDiv('areaImprimir')" value="Imprimir" />
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- MODAL PAGAR PRODUCTO -->
	

	<div  class="modal fade" id="pago" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-wallet"></i> Realizar Pago</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=home&accion=GenerarCompra" method="POST" >
						<div class="row">
							<div class="form-group col-sm-6">
								<label >NOMBRE:</label>					
								<input type="text" name="txtNombre"  class="form-control">				
							</div>
							<div class="form-group col-sm-6">
								<label >APELLIDO:</label>
								<input type="text" name="txtApellido"  class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>TARJETA:</label>
							<input type="text"  name="txtTarjeta" placeholder="**** **** **** ****" class="form-control">
    						<span ><img src="img/payment.png" width="250" height="50"></span>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<label >CSV:</label>					
								<input type="text" name="txtCodigo" placeholder="000" class="form-control">				
							</div>
							<div class="form-group col-sm-6">
								<label >FV:</label>
								<input type="text" name="txtFecha" placeholder="MM/AA" class="form-control">
							</div>
						</div>
						<div class="form-group right">
							<input type="submit" name="accion" value="Pagar S/${totalPagar}0"" class="btn btn-info btn-block">
						</div>
	        		</form>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	<!--  -->
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/funciones.js" type="text/javascript"></script>
</body>
</html>