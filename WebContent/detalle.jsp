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
</head>
<body>
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
					href="Controlador?menu=home&accion=Listar">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">Ofertas
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
					<a class="dropdown-item" href="#"><img src="" alt="60"
						height="60" /></a> <a class="dropdown-item" href="#">${cliente.getCorreo() }</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="Controlador?menu=home&accion=Compras">Mis Compras</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="Controlador?menu=home&accion=Salir">
						<i class="fas fa-arrow-right"> Salir</i>
					</a>
			</ul>
		</div>
	</nav>
	<div style="padding: 0 150px; padding-top: 15px;">
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
							<th>Nombre</th>
							<th>Imagen</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="det" items="${detalles}" varStatus="iterator">
							<tr>
								<td>${iterator.index+1 }</td>
								<td>${det.getNombre() }</td>
								<td><img src="${det.getImagen() }" width="100" height="100"></td>
								<td>${det.getPrecio() }</td>
								<td>${det.getCantidad() }</td>
								<td>${det.getSubtotal() }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="card-footer">
				<label style="margin-left: 1000px;">Sub Total: </label> 
				<input style="margin-left: 1000px;" type="text" value="${totalPago}" readonly="">
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