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
						<!--li><a href="students.html">Students</a></li-->
						<li class="active"><a href="addInscripcion.html">Inscribir
								Curso</a></li>
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


	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
				<!--form action="/action_page.php">
					First name: <input type="text" name="fname"><br> Last
					name: <input type="text" name="lname"><br> <input
						type="submit" value="Submit">
				</form-->

				<form:form id="myForm" method="post"
					class="bs-example form-horizontal" commandName="postulantePerfil">

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
													<td><input type="email" class="form-control"
														path="emailAddress" name="emailAddress" id="emailAddressInput"
														placeholder="Correo electrónico"></td>
													<form:errors path="emailAddress" cssClass="error" />
											</tr>

											<tr>
											<tr>
												<td>Fecha de nacimiento</td>
												<td>${postulante.getDateOfBirth().toString()}</td>
											</tr>
											<tr>
												<td>Género</td>
												<td>${postulante.getGenero()}</td>
											</tr>
											<tr>
												<td>Teléfono</td>
												<td><input type="text" class="form-control" name="telefono" path="telefono"
											id="telefonoInput" placeholder="Teléfono"></td>
													<form:errors path="emailAddress" cssClass="error" />
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="panel-footer">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#themodal">Actualizar</button>
							<div id="themodal" class="modal fade" data-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h5>Editar perfil</h5>
										</div>
										<div class="modal-body">
											<p>Estás seguro(a) los cambios?</p>
											<div class="progress progress-striped active">
												<div id="doitprogress" class="progress-bar"></div>
											</div>
										</div>
										<div class="modal-footer">
											<a href="#" class="btn btn-default" data-dismiss="modal">Cerrar</a>
											<input type="submit" value="Sí!" id="yesbutton"
												class="btn btn-primary" data-loading-text="Guardando.."
												data-complete-text="Finalizado">
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</form:form>
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
	<script>
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};
				setTimeout(countDown, 100);
			});
		});
	</script>
</body>
</html>
