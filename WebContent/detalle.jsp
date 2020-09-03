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
<body style="font-family: serif; background-color: #F7F7F7;">
	
	<div class="text-center" style="height: 40px; background-color: #F7F7F7; margin:0px; padding:0px;" >
		<p class="navbar-text text-center text-muted" style="align-items: center; font-family: serif;"><i class="fas fa-phone"></i>
    	Call-Center: 939 910 911
  		</p>
	</div>

	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
		<a
			style="font-family: fantasy; font-size: xx-large; padding: 0px; margin: 0px; color: green;"
			class="navbar-brand "  data-toggle="dropdown" href="#"> <i style="color: red;" class="fas fa-plus"></i>
			MEDIFAST
		</a>
		<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="margin: 0 20px;">
			<a class="dropdown-item" href="Controlador?menu=${products}&accion=Listar">${products}s</a>
			<a class="dropdown-item" href="Controlador?menu=home&accion=${sales}">${sales}</a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=home&accion=Listar"><i
						class="fas fa-home"></i>Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-plus-circle"></i>
						Categorias </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:forEach var="c" items="${categorias}">
							<a class="dropdown-item"
								href="Controlador?menu=home&accion=Categoria&id=${c.getId() }">${c.getNombre() }</a>
						</c:forEach>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-plus-circle"></i>Ofertas del Dia</a></li>
				<li class="nav-item"><a class="nav-link"
					href="Controlador?menu=home&accion=Carrito"><i
						class="fas fa-cart-plus">(<label style="color: red;">${contador}</label>)
					</i>Carrito</a></li>
			</ul>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<form class="form-inline my-2 my-lg-0"
					action="Controlador?menu=home" method="post">
					<input class="form-control mr-sm-2" type="text" name="txtBuscar">
					<button class="btn btn-success my-2 my-sm-0" type="submit"
						name="accion" value="Buscar">
						<i class="fas fa-search"></i> Buscar
					</button>
				</form>
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
	
	<div class="container col-sm-10 mt-4">
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
				<label style="margin-left: 1000px;">Monto Total: S/${totalPago}0 </label>
				
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