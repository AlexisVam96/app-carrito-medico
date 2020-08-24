<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body style="font-family: cursive;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="Controlador?menu=home&accion=Listar">Vampi
			Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=home&accion=Listar"><i class="fas fa-home"></i>Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-plus-circle"></i>Ofertas
						del Dia</a></li>
				<li class="nav-item"><a class="nav-link"
					href="Controlador?menu=home&accion=Listar">Seguir Comprando</a></li>
			</ul>
			<ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
				<a style="color: white; cursor: pointer" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fas fa-user-tie"></i>
					${cliente.getNombre() }
				</a>
				<div class="dropdown-menu text-center dropdown-menu-right">
					<a class="dropdown-item" href="Controlador?menu=home&accion=Salir">
						<i class="fas fa-arrow-right"> Salir</i>
					</a>
			</ul>
		</div>
	</nav>
	<div class="container col-sm-10" style="padding: 0 150px; padding-top: 15px;">
		<div class="card col-sm-12" style="padding: 0; margin: 0;">
			<div class="card-header">
				<h2>Detalle de mi Compra</h2>
				<a href="Controlador?menu=home&accion=Compras">Regresar</a>
			</div>
			<div class="card-body text-center table-responsive">
				<table class="table table-hover ">
					<thead>
						<tr>
							<th>Item</th>
							<th>Producto</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="det" items="${detalles}" varStatus="iterator">
							<tr>
								<td>00${iterator.index+1 }</td>
								<td>${det.getNombre() }
									<img style="display: block; margin:auto ;" src="${det.getImagen() }" width="80" height="80">
								</td>
								<td>S/${det.getPrecio() }0</td>
								<td>${det.getCantidad() }</td>
								<td>S/${det.getSubtotal() }0</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="card-footer">
				<label style="margin-left: 700px;">Monto Total: <i style="margin-left: 20px;">S/${totalPago}0</i> </label> 
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>