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
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  		<a class="navbar-brand" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> MEDIFAST </a>
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
       				<a class="nav-link" href="Controlador?menu=home&accion=Carrito" ><i class="fas fa-cart-plus">(<label style="color: orange;">${contador}</label>)</i>Carrito</a>
      			</li>
    		</ul>
    		<form class="form-inline my-2 my-lg-0" >
      			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
   			</form>
   			<ul class="navbar-nav">
   				<li class="nav-item active dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Ingresar Usuario </a>
        			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          				<a class="dropdown-item" href="login.jsp">Iniciar Session</a>
          				<a class="dropdown-item" href="#">Another action</a>
         				<div class="dropdown-divider"></div>
          				<a class="dropdown-item" href="#">Cerrar Session</a>
        			</div>
      			</li>
   			</ul>
  		</div>
	</nav>
	
	<div class="d-flex" style="padding: 0 150px; padding-top:15px;">
		<div class="card col-sm-12" style="padding:0; margin:0;">
			<div class="card-header">
				<h2>Producto</h2>
				<a href="#" class="btn btn-success" data-toggle="modal" data-target="#agregarProducto">Agregar Producto</a>
			</div>
			<div class="card-body text-center">
				<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
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
						<td>${pro.getId()}</td>
						<td>${pro.getNombre()}</td>
						<td><img src="${pro.getFoto()}" width="80" height="80"></td>
						<td>${pro.getDescripcion()}</td>	
						<td>$.${pro.getPrecio()}0</td>	
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
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h3 class="modal-title" id="exampleModalLabel">Agregué su producto</h3>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	        		<form action="Controlador?menu=Producto&accion=Agregar" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label>Nombre:</label>
							<input type="text"  name="txtNombre" class="form-control">
						</div>
						<div class="form-group">
							<label>Descripción:</label>
							<input type="text"  name="txtDescripcion" class="form-control">
						</div>
						<div class="form-group">
							<label>Precio:</label>
							<input type="text"  name="txtPrecio" class="form-control">
						</div>
						<div class="form-group">
							<label>Stock:</label>
							<input type="text"  name="txtStock" class="form-control">
						</div>
						<div class="form-group">
							<label>Imagen del Producto:</label>
							<input type="file"  name="fileImagen" >
						</div>
						<div style="text-align: center;">
							<input type="submit" name="accion" value="Agregar Producto" class="btn btn-info btn-block">
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
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>