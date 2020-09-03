<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Insert title here</title>
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

	
	<div class="container mt-4" >
		<div class="card col-sm-12" style="padding:0; margin:0;">
			<div class="card-header">
				<h2>Nuestros Productos</h2>
				<a href="#" class="btn btn-success" data-toggle="modal" data-target="#agregarProducto">Agregar Producto</a>
				<a href="#" class="btn btn-info" data-toggle="modal" data-target="#categoria">Agregar Categoria</a>
			</div>
			<div class="card-body text-center">
				<table class="table table-striped table-responsive">
				<thead>
					<tr>
						<th>CODIGO</th>
						<th>NOMBRE</th>
						<th>IMAGEN</th>
						<th>DESCRIPCIÓN</th>
						<th>PRECIO</th>
						<th>STOCK</th>
						<th>ACCIÓN</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pro" items="${productos}">	
					<tr>
						<td>P00${pro.getId()}</td>
						<td>${pro.getNombre()}</td>
						<td><img src="${pro.getFoto()}" width="80" height="80"></td>
						<td>${pro.getDescripcion()}</td>	
						<td>S/${pro.getPrecio()}0</td>	
						<td>${pro.getStock()}</td>	
						<td>
							<a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&id=${pro.getId()}" >Editar</a>
							<a class="btn btn-danger" href="Controlador?menu=Producto&accion=Eliminar&id=${pro.getId()}">Delete</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
		<!-- MODAL AGREGAR PRODUCTO -->
		
	<div  class="modal fade" id="agregarProducto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h3 class="modal-title" id="exampleModalLabel">Añadir Producto</h3>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=Producto&accion=Agregar" method="POST" enctype="multipart/form-data">
	        			<div class="form-group row">
						<label class="col-sm-2">Nombre:</label>
							<div class="col-sm-10">
								<input type="text" name="txtNombre" class="form-control">
							</div>
						</div>
						<div class="form-group row">
						<label class="col-sm-2">Descripción:</label>
							<div class="col-sm-10">
								<textarea   name="txtDescripcion" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group row">
						<label class="col-sm-2">Precio:</label>
							<div class="col-sm-10">
								<input type="text"  name="txtPrecio" class="form-control">
							</div>
						</div>
						<div class="form-group row">
						<label class="col-sm-2">Stock:</label>
							<div class="col-sm-10">
								<input type="text"  name="txtStock" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">Categoría:</label>
							<div class="col-sm-10">
								<select name="txtCategoria" class="form-control">
								<option value="default" selected>--Agregue su categoria--</option>
								<c:forEach var="c" items="${categorias}">
									<option value="${c.getId()}">${c.getNombre() }</option>
								</c:forEach>
							</select>
							</div>
						</div>
						<div class="form-group">
							<label>Imagen del Producto:</label>
							<input type="file"  name="fileImagen" >
						</div>
						<div class="text-center">
							<input type="submit" name="accion" value="Agregar Producto" class="btn btn-info">
						</div>
					</form>
	      		</div>
	    	</div>
	  	</div>
	</div>
		
		<!-- MODAL ACTUALIZAR PRODUCTO -->
	
	<div  class="modal fade" id="actualizarProducto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h3 class="modal-title" id="exampleModalLabel">Actualice su producto</h3>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=ActualizarProducto&accion=Actualizar" method="POST" enctype="multipart/form-data">
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
						<input type="text" value="$.${producto.getPrecio() }0" name="txtPrecio" class="form-control">
					</div>
					<div class="form-group">
						<label>Stock:</label>
						<input type="text" value="${producto.getStock() }" name="txtStock" class="form-control">
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
	  	</div>
	</div>
	
		<!--  -->
	
	<div  class="modal fade" id="categoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h3 class="modal-title" id="exampleModalLabel">Categoria</h3>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=home&accion=AgregarCategoria" method="POST">
					<div class="form-group row">
						<div class="col-md-2">
							<label>Nombre:</label>
						</div>
						<div class="col-md-10">
							<input type="text" name="txtCategoria" class="form-control">
						</div>
					</div>
					<div>
						<input type="submit" name="accion" value="Agregar" class="btn btn-success">
					</div>
					
				</form>
	      		</div>
	      		<div class="modal-footer">
	      			<table class="table ">
	      				<thead>
	      					<tr>
	      						<th>item</th>
	      						<th>nombre</th>
	      						<th>acción</th>
	      					</tr>
	      				</thead>
	      				<tbody>
	      					<c:forEach var="c" items="${categorias}">
	      					<tr>
								<td>${c.getId() }</td>
	      						<td>${c.getNombre() }</td>
	      						<td><a class="btn btn-danger" href="Controlador?menu=home&accion=EliminarCategoria&id=${c.getId() }">eliminar</a></td>
	      					</tr>
	      					</c:forEach>
	      				</tbody>
	      			</table>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>