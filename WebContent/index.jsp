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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body style="font-family: cursive;">

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<!-- <a class="navbar-brand" href="#" role="button" aria-haspopup="true"
			aria-expanded="false"> MEDIFAST </a> -->
		

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> MEDI FAST</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="Controlador?menu=${products}&accion=Listar">${products}</a>
						<a class="dropdown-item" href="Controlador?menu=home&accion=${sales}">${sales}</a>
					</div>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=home&accion=Listar"><i
						class="fas fa-home"></i>Home <span class="sr-only">(current)</span></a>
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
				<li class="nav-item"><a class="nav-link"
					href="Controlador?menu=home&accion=Carrito"><i class="fas fa-cart-plus">(<label style="color: orange;">${contador}</label>)
					</i>Carrito</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" id="txtBuscar">
					<button style="color: white;"
						class="btn btn-outline-info my-2 my-sm-0" id="btnBuscar">
						<i class="fas fa-search"></i> Buscar
					</button>
				</form>
			</ul>
			<ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
				<a class="btn btn-outline-info" style="color: white;"
					data-toggle="modal" data-target="#login"> <i
					class="fas fa-user-tie"></i> ${nombre_cliente}
				</a>
			</ul>
		</div>
	</nav>


	<div class="container mt-4">
		<h2>${nom_categoria }</h2>
		<div class="row">
			<c:forEach var="p" items="${productos}">
				<div class="col-sm-4">
					<div class="card mt-2">
						<img class="mt-2" style="display: block; margin: auto;"
							src="${p.getFoto()}" width="250" height="250">
						<div class="card-body">
							<h5 class="card-title">${p.getNombre()}</h5>
							<p class="h5">S/${p.getPrecio() }0</p>
							<p class="card-text">${p.getDescripcion()}</p>
							<div class="text-center">
								<a
									href="Controlador?menu=home&accion=AgregarCarrito&id=${p.getId()}"
									class="btn btn-outline-info">Agregar a carrito</a> <a
									href="Controlador?menu=home&accion=Comprar&id=${p.getId()}"
									class="btn btn-danger">Comprar ahora</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- -MODAL DE LOGGIN -->

	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<form class="form-sign" action="Controlador" method="POST">
						<div class="form-group text-center">
							<img src="img/img.png" height="80" width="80" />
						</div>
						<div class="form-group">
							<label>Email:</label> <input type="email" name="txtCorreo"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Password:</label> <input type="password" name="txtPass"
								class="form-control">
						</div>
						<div class="form-group">
							<input type="submit" name="menu" value="Login"
								class="btn btn-outline-dark btn-block">
						</div>
						<div class="form-group">
							<a class="btn btn-outline-dark btn-block " href="#"
								data-toggle="modal" data-target="#modalRegistrar">
								Registrese aquí </a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--  -->

	<!-- MODAL REGISTRO -->

	<div class="modal fade" id="modalRegistrar" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<form action="Controlador?menu=home" method="POST">
						<h4>Complete sus Datos</h4>
						<div class="form-group">
							<label>Nombres:</label> <input type="text" value=""
								name="txtNombres" class="form-control">
						</div>
						<div class="form-group">
							<label>DNI:</label> <input type="text" value="" name="txtDni"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Dirección:</label> <input type="text" value=""
								name="txtDireccion" class="form-control">
						</div>
						<div class="form-group">
							<label>Email:</label> <input type="email" value=""
								name="txtEmail" class="form-control">
						</div>
						<div class="form-group">
							<label>Contraseña:</label> <input type="password" value=""
								name="txtPassword" class="form-control">
						</div>
						<div class="form-group text-center">
							<input type="submit" name="accion" value="Registrar"
								class="btn btn-primary btn-block">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--  -->


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