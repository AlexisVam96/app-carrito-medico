<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<body style="background-color: #F7F7F7;">
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10" style="margin-top: 150px;">
			<div class="card-body">
				<form action="Controlador" method="POST" >
					<div style="font-family: fantasy; font-size: xx-large;"
						class="form-group text-center">
						<span style="color:red;"><i class="fas fa-plus-circle"></i></span>
						<h3 style="font-family: fantasy; font-size: xx-large; color: green;">MEDIFAST</h3>
					</div>
					<div class="text-center">
						<p class="login-box-msg">Inicia sesión para ingresar a Medifast </p>
					</div>
					<div class="input-group mb-3">
						<input type="email" class="form-control" placeholder="Email"
							name="txtCorreo">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password"
							name="txtPass">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="alert alert-${danger}">${info }</div>
					<input type="submit" name="menu" value="Login"
						class="btn btn-primary btn-block">
					<div class="text-center">
						<a href="Controlador?menu=home&accion=Registrar">registrase
							aquí</a>
					</div>
				</form>
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