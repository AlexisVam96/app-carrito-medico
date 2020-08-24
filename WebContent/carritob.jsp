<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<title>Insert title here</title>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body style="font-family: cursive;">

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				<!--  -->
		<a class="navbar-brand" href="#"  role="button"aria-haspopup="true" aria-expanded="false"> MEDIFAST </a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
  		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=USER&accion=Listar"><i class="fas fa-home"></i>Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="#"><i class="fas fa-plus-circle"></i>Ofertas
						del Dia</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=USER&accion=Carrito"><i
						class="fas fa-cart-plus">(<label style="color: orange;">${contador}</label>)
					</i>Carrito</a></li>
			</ul>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" id="txtBuscar">
					<button class="btn btn-outline-info my-2 my-sm-0" id="btnBuscar">
						<i class="fas fa-search"></i> Buscar
					</button>
				</form>
			</ul>
			<ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
				<a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown"> <i class="fas fa-user-tie"></i>${cliente.getNombre()}</a>
				<div class="dropdown-menu text-center dropdown-menu-right">
					<a class="dropdown-item" href="Controlador?menu=USER&accion=Salir">
						<i class="fas fa-arrow-right"> Salir</i>
					</a>
				</div>
			</ul>
		</div>
	</nav>
	<div class="container mt-4">
		<h3>Carrito</h3><br>
		<div class="row">
			<div class="col-sm-8">
			 	<table class="table table-hover ">
			 		<thead>
			 			<tr>
			 				<th>ITEM</th>
			 				<th>NOMBRES</th>
			 				<th>DESCRIPCION</th>
			 				<th>PRECIO</th>
			 				<th>CANTIDAD</th>
			 				<th>SUBTOTAL</th>
			 				<th>ACCION</th>
			 			</tr>
			 		</thead>
			 		<tbody>
			 			<c:forEach var="car" items="${carrito}" varStatus="iterator">
			 			<tr>
			 				<td>00${iterator.index+1}</td>
			 				<td>${car.getNombres()}</td>
			 				<td style="font-size: x-small;">${car.getDescripcion()}
			 					<img src="${car.getImagen() }" width="100" height="80">
			 				</td>
			 				<td>S/${car.getPrecioCompra()}0</td>
			 				<td>
			 					<input type="hidden" id="idpro" value="${car.getIdProducto() }">
			 					<input type="number" id="CantidadB" value="${car.getCantidad()}" class="form-control" min="1"  >
			 				</td>
			 				<td>S/${car.getSubTotal()}0</td>
			 				<td style="text-align:center;">
			 					<input type="hidden" id="idp" value="${car.getIdProducto()}">
			 					<a class="btn btn-outline-dark" href="#" id="btnDeleteb"><img src="https://img.icons8.com/ios-filled/50/000000/delete.png" width="20" height="20"/></a>
			 				</td>
			 			</tr>
			 			</c:forEach>
			 		</tbody>
			 	</table>
			</div>
			<div class="col-sm-4">
				<div class="card">
					<div class="card-header">
						<h3>Generar Compra</h3>
					</div>
					<div class="card-body">
						<label>Subtotal:</label>
						<input type="text" value="S/${totalPagar}0" readonly="" class="form-control">
						<label>Descuento:</label>
						<input type="text" value="S/0.00" readonly="" class="form-control">
						<label>Total Pagar:</label>
						<input type="text" value="S/${totalPagar}0" readonly="" class="form-control">
					</div>
					<div class="card-footer">
						<a href="Controlador?menu=USER&accion=GenerarCompra" class="btn btn-info btn-block">Generar Compra</a>
						<!-- ACTIVA EL MODAL -->
						<a href="#" class="btn btn-danger btn-block" data-toggle="modal" data-target="#exampleModal">Realizar Pago</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- MODAL PAGAR PRODUCTO -->
	

	<div  class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">Realizar Pago</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=USER&accion=Pagar" method="POST" >
						<div class="form-group">
							<label>Nombres:</label>
							<input type="text"  name="txtNombres" value="${cliente.getNombre() }" readonly="" class="form-control">
						</div>
						<div class="form-group">
							<label>Tarjeta:</label>
							<input type="text"  name="txtTarjeta" placeholder="9999-9999-9999-9999" class="form-control">
    						<span ><img src="img/payment.png" width="250" height="50"></span>
						</div>
						<div class="form-group">
							<label>CSV:</label>
							<input type="text" name="txtCodigo" placeholder="123" class="form-control">
						</div>
						<div class="form-group">
							<input type="submit" name="accion" value="Pagar $.${totalPagar}0"" class="btn btn-info btn-block">
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