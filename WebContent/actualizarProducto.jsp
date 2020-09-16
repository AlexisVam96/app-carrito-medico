<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
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
	
	<div class="container">
		<div class="card-body">
				<h2>Actualizar Producto</h2>
				<div class="row">
					<div class="col-sm-6 mt-4 ml-auto">	
						<img alt="" src="${producto.getFoto() }" width="400" height="400">		
						
					</div>
					<div class="col-sm-6 mt-4">
						<form action="Controlador?menu=ActualizarProducto&accion=Actualizar" method="POST" enctype="multipart/form-data">		
							<div class="form-group row">
							<label class="col-sm-2">Nombre:</label>
								<div class="col-sm-10">
									<input type="text" name="txtNombre" value="${producto.getNombre() }" class="form-control">
								</div>
							</div>
							<div class="form-group row">
							<label class="col-sm-2">Descripción:</label>
								<div class="col-sm-10">
									<input type="text" name="txtNombre" value="${producto.getDescripcion() }" class="form-control">
								</div>
							</div>
							<div class="form-group row">
							<label class="col-sm-2">Precio:</label>
								<div class="col-sm-10">
									<input type="text"  name="txtPrecio" value="${producto.getPrecio() }" class="form-control">
								</div>
							</div>
							<div class="form-group row">
							<label class="col-sm-2">Stock:</label>
								<div class="col-sm-10">
									<input type="text"  name="txtStock" value="${producto.getStock() }" class="form-control">
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
							<div class="form-group row">
								<label class="col-sm-2">Imagen:</label>
								<div class="col-sm-10 ml-auto">
									<input type="file"  name="fileImagen" >
								</div>
							</div>
							<div>
								<input type="submit" name="accion" value="Actualizar Producto" class="btn btn-success">
								<a href="Controlador?menu=Producto&accion=Listar" class="btn btn-secondary">regresar</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>