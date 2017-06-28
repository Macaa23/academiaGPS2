<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Academia de artes Danza y Cultura</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="datepicker/css/datepicker.css" rel="stylesheet" />
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />

<style>
.red {
	font-weight: bold;
	color: red;
}

.orange {
	font-weight: bold;
	color: orange;
	font-size: 1.3em;
}

.message {
	margin-bottom: 15px;
}

.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.row {
	margin-top: 40px;
	padding: 0 10px;
}

.clickable {
	cursor: pointer;
}

.panel-heading div {
	margin-top: -18px;
	font-size: 15px;
}

.panel-heading div span {
	margin-left: 5px;
}

.panel-body {
	display: none;
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
				<!--li><a href="/">Inicio</a></li-->
				<c:choose>
					<c:when test="${curPostulante == null}">
						<li><a href="signup.html">Registrarse</a></li>
						<li><a href="login.html">Ingresar</a></li>
					</c:when>
					<c:otherwise>
						<!--li><a href="students.html">Students</a></li-->
						<li><a href="addInscripcion.html">Inscribir Curso</a></li>
						<li class="active"><a href="verCursos.html">Ver
								inscripciones</a></li>
						<li><a href="deleteInscripcion.html">Eliminar Inscripcion</a></li>
						<li><a href="perfil.html">Perfil</a></li>
						<li><a href="logout.html">Salir</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<script src="jquery-1.8.3.js">
		
	</script>

	<script src="bootstrap/js/bootstrap.js">
		
	</script>

	<script src="datepicker/js/bootstrap-datepicker.js">
		
	</script>

	<script src="assets/js/valStudent.js">
		
	</script>


	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div>
					<h3>Bienvenido(a)!</h3>
					<p>En esta sección puede revisar tus cursos preinscritos y tu
						situación en la lista.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="col-lg-6">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Cursos inscritos</h3>
									</div>
									<div class="panel-body">
										<input type="text" class="form-control" id="dev-table-filter"
											data-action="filter" data-filters="#dev-table"
											placeholder="Filter Developers" />
									</div>
									<table class="table table-hover" id="dev-table">
										<thead>
											<tr>
												<th>#</th>
												<th>Nombre</th>
												<th>Nivel</th>
												<th>Situación</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cursos}" var="curso" varStatus="loop">
												<tr>
													<td>${(loop.index)+1}</td>
													<td>${curso.getNombre()}</td>
													<td>${curso.getNivel()}</td>
													<td>${curso.getEstado()}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

</body>
</html>
