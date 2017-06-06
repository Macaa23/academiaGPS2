<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Academia de artes Danza y Cultura</title>
	<link href="assets/css/bootstrap-united.css" rel="stylesheet" />
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
	<style>
		body {
			height: 100%;
			margin: 0;
			background: url(assets/img/books.jpg);
			background-size: 1920px 1080px;
			background-repeat: no-repeat;
			display: compact;
		}
	</style>
</head>
<body>
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
			<li class="active"><a href="#">Inicio</a></li>
			<c:choose>
				<c:when test="${curPostulante == null}">
					<li><a href="signup.html">Registrarse</a></li>
					<li><a href="login.html">Ingresar</a></li>
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
<div class="container">
	<div class="jumbotron">
		<c:choose>
			<c:when test="${curPostulante == null}">
				<div>
					<h3>Bienvenido al sistema de preinscripciones de nuestra academia</h3>
					<p>Regístrate o ingresa al sitio para preinscribir cursos.</p>
				</div>
				<a class="btn btn-primary" href="signup.html">Registrarse >> </a>
				<a class="btn btn-primary" href="login.html">Ingresar >> </a>
			</c:when>
			<c:otherwise>
				<div>
					<h3>Bienvenido al sistema de preinscripciones de nuestra academia</h3>
					<p>Has iniciado sesión exitosamente.</p>
				</div>
				<a class="btn btn-primary" href="logout.html">Salir >> </a>
				<a class="btn btn-primary" href="addInscripcion.html">Inscribir curso >> </a>
				<!-- a class="btn btn-primary" href="students.html">Students >> </a-->
			</c:otherwise>
		</c:choose>
	</div>

	<div></div>
</div>
<script src="jquery-1.8.3.js">
</script>

<script src="bootstrap/js/bootstrap.js">
</script>

</body>
</html>