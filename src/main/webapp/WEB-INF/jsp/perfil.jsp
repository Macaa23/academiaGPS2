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

.user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 72, 20);
}

.table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
}

.toppad {
	margin-top: 20px;
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: white
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
						<li><a href="addInscripcion.html">Inscribir
								Curso</a></li>
						<li><a href="verCursos.html">Ver inscripciones</a></li>
						<li><a href="deleteInscripcion.html">Eliminar Inscripcion</a></li>
						<li class="active"><a href="perfil.html">Perfil</a></li>
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


	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
<c:if test="${not empty message}">
							<div class="message orange">${message}</div>
						</c:if>

				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${postulante.getNombre()}</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<img alt="User Pic"
									src="http://www.free-icons-download.net/images/dancer-icon-70489.png"
									class="img-circle img-responsive">
							</div>
							<div class=" col-md-9 col-lg-9 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>Nombre de usuario:</td>
											<td>${postulante.getUserName()}</td>
										</tr>
										<tr>
											<td>RUT:</td>
											<td>${postulante.getRUT()}</td>
										</tr>
										<tr>
											<td>Correo</td>
											<td>${postulante.getEmailAddress()}</td>
										</tr>

										<tr>
										<tr>
											<td>Fecha de nacimiento</td>
											<td>${postulante.getSimpleDateOfBirth()}</td>
										</tr>
										<tr>
											<td>Género</td>
											<td>${postulante.getGenero()}</td>
										</tr>
										<tr>
											<td>Teléfono</td>
											<td>${postulante.getTelefono()}</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer">
							
							<a href="perfilEdit.html"
							data-original-title="Editar perfil" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-warning"><i
								class="glyphicon glyphicon-edit"></i></a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							var panels = $('.user-infos');
							var panelsButton = $('.dropdown-user');
							panels.hide();

							//Click dropdown
							panelsButton
									.click(function() {
										//get data-for attribute
										var dataFor = $(this).attr('data-for');
										var idFor = $(dataFor);

										//current button
										var currentButton = $(this);
										idFor
												.slideToggle(
														400,
														function() {
															//Completed slidetoggle
															if (idFor
																	.is(':visible')) {
																currentButton
																		.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
															} else {
																currentButton
																		.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
															}
														})
									});

							$('[data-toggle="tooltip"]').tooltip();
						});
	</script>

</body>
</html>
