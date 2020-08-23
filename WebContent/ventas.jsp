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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Vampi Store </a>
  		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
       		<a  class="dropdown-item" href="Controlador?menu=Producto&accion=Listar">Productos</a>
       		<div  class="dropdown-divider"></div>
          	<a class="dropdown-item" href="#">Clientes</a>
         	<div  class="dropdown-divider"></div>
          	<a class="dropdown-item" href="Controlador?menu=Ventas&accion=Listar">Ventas</a>
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
	<h2 style="text-align:center;">TABLA DE VENTAS</h2>
	<div class="col-sm-12" style="text-align:center;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NOMBRE DEL CLIENTE</th>
						<th>NOMBRE DEL PRODUCTO</th>
						<th>PRECIO</th>
						<th>CANTIDAD</th>
						<th>MONTO TOTAL</th>
						<th>FECHA DE COMPRA</th>
						<th>ACCION</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="venta" items="${ventas}">	
					<tr>
						<td>${venta.getId_cliente()}</td>
						<td>${venta.getNom_cliente()}</td>
						<td>${venta.getNom_producto()}</td>
						<td>${venta.getPrecio()}</td>	
						<td>${venta.getCantidad()}</td>	
						<td>${venta.getMonto()}</td>	
						<td>${venta.getFechaCompra()}</td>
						<td>
							<input type="hidden" id="idc" value="${venta.getFechaCompra()}">
							<a href="#" id="btnEliminar">eliminar</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>		
		</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/funciones.js" type="text/javascript"></script>
</body>
</html>