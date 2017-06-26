<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />

<style>
.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

.red {
	font-weight: bold;
	color: red;
}
</style>
<title>Academia de artes Danza y Cultura</title>
</head>
<body>
	<script src="jquery-1.8.3.js">
		
	</script>

	<script src="bootstrap/js/bootstrap.js">
		
	</script>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav navbar-center">
				<li><a href="logout.html">Inicio</a></li>
				<c:choose>
					<c:when test="${curPostulante == null}">
						<li><a href="signup.html">Registrarse</a></li>
						<li class="active"><a href="login.html">Ingresar</a></li>
					</c:when>
					<c:otherwise>
						<!-- li><a href="students.html">Students</a></li-->
						<li><a href="addInscripcion.html">Inscribir curso</a></li>
						<li><a href="logout.html">Salir</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>
	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div>
					<h3>Inicia sesión</h3>
					<p>Ingresa tus datos para acceder al sitio.</p>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">

						<form:form id="myForm" method="post"
							class="bs-example form-horizontal" commandName="postulanteLogin">
							<fieldset>
								<legend>Inicia sesión con tus datos</legend>
								<c:if test="${not empty message}">
									<div class="message red">${message}</div>
								</c:if>
								<div class="form-group">
									<label for="userNameInput" class="col-lg-3 control-label">Nombre
										de usuario</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="userName"
											id="userNameInput" placeholder="Nombre de usuario"
											required="required" />
										<form:errors path="userName" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Contraseña</label>
									<div class="col-lg-9">
										<form:input type="password" class="form-control"
											path="password" id="passwordInput" placeholder="Contraseña" />
										<form:errors path="password" cssClass="error"
											required="required" />
									</div>
								</div>

								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancelar</button>

									<button class="btn btn-primary">Acceder</button>
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>