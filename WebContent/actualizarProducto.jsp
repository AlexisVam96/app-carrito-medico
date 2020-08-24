<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
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
					href="Controlador?menu=ADMIN&accion=Listar"><i class="fas fa-home"></i>Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="#"><i class="fas fa-plus-circle"></i>Ofertas
						del Dia</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Controlador?menu=ADMIN&accion=Carrito"><i
						class="fas fa-cart-plus">(<label style="color: orange;">${contador}</label>)
					</i>Carrito</a></li>
				<li class="nav-item active"><a class="nav-link" href="Controlador?menu=Producto&accion=Listar"><i class="fas fa-plus-circle"></i>Productos</a></li>
				<li class="nav-item active"><a class="nav-link" href="Controlador?menu=home&accion=Ventas"><i class="fas fa-plus-circle"></i>Ventas</a></li>
			</ul>
			<ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
				<a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown"> <i class="fas fa-user-tie"></i>${cliente.getNombre()}</a>
				<div class="dropdown-menu text-center dropdown-menu-right">
					<a class="dropdown-item" href="Controlador?menu=ADMIN&accion=Salir">
						<i class="fas fa-arrow-right"> Salir</i>
					</a>
				</div>
			</ul>
		</div>
	</nav>
	<div class="d-flex">
		<div class="card col-sm-4">
			<div class="card-body">
				<form action="Controlador?menu=ActualizarProducto&accion=Actualizar" method="POST" enctype="multipart/form-data">
					<h2>Actualizar Producto</h2>
					<div class="form-group">
						<label>Nombres:</label>
						<input type="text" value="${producto.getNombre() }" name="txtNombre" class="form-control">
					</div>
					<div class="form-group">
						<label>Descripción:</label>
						<input type="text" value="${producto.getDescripcion() }" name="txtDescripcion" class="form-control">
					</div>
					<div class="form-group">
						<label>Precio:</label>
						<input type="text" value="${producto.getPrecio()}" name="txtPrecio" class="form-control">
					</div>
					<div class="form-group">
						<label>Stock:</label>
						<input type="text" value="${producto.getStock()}" name="txtStock" class="form-control">
					</div>
					<div class="form-group">
						<label>Imagen del Producto:</label>
						<input type="file"  name="fileImagen" >
					</div>
					<div>
						<input type="submit" name="accion" value="Actualizar Producto" class="btn btn-success">
					</div>
					
				</form>
			</div>
		</div>
		<div class="col-sm-8" style="text-align:center;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NOMBRE</th>
						<th>IMAGEN</th>
						<th>DESCRIPCIÓN</th>
						<th>PRECIO</th>
						<th>STOCK</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pro" items="${productos}">	
					<tr>
						<td>${pro.getId()}</td>
						<td>${pro.getNombre()}</td>
						<td><img src="${pro.getFoto()}" width="80" height="80"></td>
						<td>${pro.getDescripcion()}</td>	
						<td>$.${pro.getPrecio()}0</td>	
						<td>${pro.getStock()}</td>	
					</tr>
					</c:forEach>
				</tbody>
			</table>		
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>