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
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<a class="navbar-brand" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Vampi Store </a>
  		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
       		<a  class="dropdown-item" href="Controlador?menu=Producto&accion=Listar">Productos</a>
       		<div  class="dropdown-divider"></div>
          	<a class="dropdown-item" href="#">Clientes</a>
         	<div  class="dropdown-divider"></div>
          	<a class="dropdown-item" href="Controlador?menu=Ventas">Ventas</a>
        </div>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto">
      			<li class="nav-item active">
       				<a class="nav-link" href="Controlador?menu=home&accion=Listar">Home <span class="sr-only">(current)</span></a>
      			</li>
     			<li class="nav-item">
        			<a class="nav-link" href="#">Ofertas del Dia</a>
      			</li>
      			<li class="nav-item">
       				<a class="nav-link" href="Controlador?menu=home&accion=Listar" >Seguir Comprando</a>
      			</li>
    		</ul>
    		<form class="form-inline my-2 my-lg-0" >
      			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
   			</form>
   			<ul class="navbar-nav">
   				<li class="nav-item active dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ${nom } </a>
        			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          				<a class="dropdown-item" href="#">Accion 1</a>
          				<a class="dropdown-item" href="#">Accion 2</a>
         				<div class="dropdown-divider"></div>
          				<a class="dropdown-item" href="#">Accion 3</a>
        			</div>
      			</li>
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
						<label>Descripci�n:</label>
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
		<div class="col-sm-8" style="text-align:center;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NOMBRE</th>
						<th>IMAGEN</th>
						<th>DESCRIPCI�N</th>
						<th>PRECIO</th>
						<th>STOCK</th>
						<th>ACCI�N</th>
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
						<td>
							<a class="btn btn-warning" href="Controlador?accion=EditarProducto&id=${pro.getId()}">Editar</a>
							<a class="btn btn-danger" href="Controlador?accion=EliminarProducto&id=${pro.getId()}">Delete</a>
						</td>
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