
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="icon" href="img/descarga.ico"/>
<title>Medifast: Atención rápida y segura</title>
</head>
<body style="font-family: serif; background-color: #F7F7F7;">
	
	<div class="text-center" style="height: 40px; background-color: #F7F7F7; margin:0px; padding:0px;" >
		<p class="navbar-text text-center text-muted"><i class="fas fa-phone"></i>
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
			<a class="dropdown-item" href="Controlador?menu=${products}&accion=Listar">${products}</a>
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
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-plus-circle"></i>Ofertas del Dia</a></li>
				<li class="nav-item"><a class="nav-link"
					href="Controlador?menu=home&accion=Carrito"><i
						class="fas fa-cart-plus"><span class="badge badge-danger" >${contador}</span>
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
				<li class="nav-item">
					<a style="cursor: pointer;" class="dropdown-toggle text-muted nav-link"
						data-toggle="dropdown"> <i class="fas fa-user-tie"></i>
						${cliente.getNombre()}
					</a>
					<div class="dropdown-menu text-center dropdown-menu-right">
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#myModal">${cliente.getCorreo()}</a>
						<a class="dropdown-item"
							href="Controlador?menu=home&accion=Compras">Mis Compras</a>
						<a class="dropdown-item" href="#" id="btnSalir"> <i
							class="fas fa-arrow-right"> Salir</i></a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item">
				<img src="https://i.ibb.co/0CXzvLn/panel3.jpg" class="d-block w-100 img-fluid" alt="..." height="370">
			</div>
			<div class="carousel-item active">
				<img src="https://i.ibb.co/5L64DjR/panel4.jpg" class="d-block w-100 img-fluid" alt="..."  height="370">
			</div>
			<div class="carousel-item">
				<img src="https://i.ibb.co/xS21n5n/panel5.jpg" class="d-block w-100 img-fluid" alt="..." height="370">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


	<div class="container mt-4">
		<h2 class="badge badge-secondary" style="font-size:x-large;">${nom_categoria }</h2>
		<div class="row">
			<c:forEach var="p" items="${productos}">
				<div class="col-sm-3">
					<div class="card mt-2 mx-2" style="border: none;">
						<img class="mt-2" style="display: block; margin: auto;"
							src="${p.getFoto()}" width="200" height="200">
						<div class="card-body">
							<!-- <h5 class="card-title">${p.getNombre()}</h5> -->
							<p class="h5">S/${p.getPrecio() }0</p>
							<p class="card-text text-muted">${p.getDescripcion()}</p>
							<div class="text-center">
								<a
									href="Controlador?menu=home&accion=AgregarCarrito&id=${p.getId()}"
									class="btn btn-outline-info btn-block btn-sm"><i class="fas fa-cart-plus"></i>Agregar al carrito</a> <a
									href="Controlador?menu=home&accion=Comprar&id=${p.getId()}"
									class="btn btn-success btn-block btn-sm">Comprar ahora</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="container mt-4">
		<div class="row">
			<c:forEach var="c" items="${categorias}">
				<div class="col-sm-4" style="border: none;">
					<div class="card text-center mt-3" style="border: none; border-radius: 20px;">
						<a class="dropdown-item"
								href="Controlador?menu=home&accion=Categoria&id=${c.getId() }" style="border-radius: 20px; height:150px; background: #ADA996;
							background: -webkit-linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996); 
							background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);">
						<h3 style="margin-top: 55px; font-size: x-large; font-family: monospace;">${c.getNombre() }</h3>	
						</a>
					</div>			
				</div>
			</c:forEach>
		</div>
	</div>
	
	<footer class="footer mt-4 py-3" style=" background-color : #E4E4E4;">
  		<div class="container mt-4">
  			<div class="row">
  				<div class="col-sm-3">
  					<div class="card mt-2" style=" background-color : #E4E4E4; border: none;">
	  					<p >Sobre Medifast</p>
	  					<p class="text-muted">Libro de reclamaciones</p>
	  			 		<p class="text-muted">Sobre nosotros</p>
	  			 		<p class="text-muted">Nuestros clientes</p>
	  			 		<p class="text-muted">Terceros encargados de tratamientos</p>
	  			 	</div>
  				</div>
  				<div class="col-sm-3">
  					<div class="card mt-2" style=" background-color : #E4E4E4; border: none;">
  			 			<p >Medifast digital</p>
	  					<p class="text-muted">Zonas de cobertura</p>
	  			 		<p class="text-muted">Legales de campaña</p>
	  			 		<p class="text-muted">Terminos y condiciones</p>
	  			 		<p class="text-muted">Politicas de privacidad</p>
	  			 	</div>
  				</div>
  				<div class="col-sm-3">
  					<div class="card mt-2" style=" background-color : #E4E4E4; border: none;">
  			 			<p >Contáctanos</p>
	  					<p class="text-muted">Consultas y sugerencias</p>
	  			 		<p class="text-muted">Call Center (Lima)- (939) 910 911</p>
	  			 		<p class="text-muted">Medi fono (Lima) -(01) 485 9511</p>
	  			 	</div>
  				</div>
  				<div class="col-sm-3">
  					<div class="card mt-2" style="background-color : #E4E4E4; border: none;">
  			 			<p >Síguenos</p>
  			 			<div class="row">
  			 				<div class="col-sm-1 mx-2">
  			 					<p class=" h2 "><i class="fab fa-facebook-square"></i></p>
  			 				</div>
  			 				<div class="col-sm-1 mx-2">
  			 					<p class="h2"><i class="fab fa-instagram"></i></p>
  			 				</div>
  			 			</div>
	  					<p class="h5 mt-4"><i class="fas fa-book-open"></i> Libro de reclamaciones</p>
	  			 	</div>
  				</div>
  			</div>
  			<div class="dropdown-divider" style="background-color: #F7F7F7;"></div>
  			<div>
  				<div class="text-center" style="height: 40px; background-color: #E4E4E4; margin:0px; padding:0px;" >
					<p class="navbar-text text-center text-muted" style="font-size: small;">Copyright <i class="far fa-copyright"></i>
    					Medifast 2020 todos los derechos reservados
  					</p>
				</div>
  			</div>
 		</div>
	</footer>

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
		
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/funciones.js" type="text/javascript"></script>
</body>
</html>