<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
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
				<li><a href="logout.html">Inicio</a></li>
				<c:choose>
					<c:when test="${curPostulante == null}">
						<li class="active"><a href="signup.html">Registrarse</a></li>
						<li><a href="login.html">Ingresar</a></li>
					</c:when>
					<c:otherwise>
						<!-- li><a href="cursos.html">Cursos</a></li-->
						<li><a href="addInscripcion.html">Inscribir curso</a></li>
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

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
					<div>
						<h3>Bienvenido(a) al m�dulo de registro de postulantes</h3>
						<p>Ingresa tus datos a continuaci�n</p>
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
							class="bs-example form-horizontal" commandName="postulante">
							<fieldset>
								<legend>Formulario de registro para postulantes</legend>

								<div class="form-group">
									<label for="userNameInput" class="col-lg-3 control-label">Nombre
										de usuario</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="userName"
											id="userNameInput" placeholder="Nombre de usuario" required="required"/>
										<form:errors path="userName" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Contrase�a</label>
									<div class="col-lg-9">
										<form:input type="password" class="form-control"
											path="password" id="passwordInput" placeholder="Contrase�a" required="required" />
										<form:errors path="password" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="RUTInput" class="col-lg-3 control-label">RUT</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="RUT"
											id="RUTInput" placeholder="RUT sin puntos ni gui�n" required="required"/>
										<form:errors path="RUT" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="emailAddressInput" class="col-lg-3 control-label">Correo</label>
									<div class="col-lg-9">
										<form:input type="email" class="form-control"
											path="emailAddress" id="emailAddressInput"
											placeholder="Correo electr�nico" required="required" />
										<form:errors path="emailAddress" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="NombreInput" class="col-lg-3 control-label">Nombre
										completo</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="Nombre"
											id="NombreInput" placeholder="Nombre completo" required="required"/>
										<form:errors path="Nombre" cssClass="error" />
									</div>
								</div>


								<!--div class="form-group date" data-provide="datepicker-inline">
									<label for="dateOfBirthInput" class="col-lg-3 control-label">Fecha
										de nacimiento</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control"
											path="dateOfBirth" id="dateOfBirthInput"/>
										<form:errors path="dateOfBirth" cssClass="error" />
									</div>
								</div-->

								<div class="form-group">
									<label for="dateOfBirthInput" class="col-lg-3 control-label">Fecha
										de nacimiento</label>
									<div class="date form_date col-lg-9"
										data-date-format="dd/mm/yyyy" data-date-viewmode="years">

										<fmt:formatDate value="${postulante.dateOfBirth}" type="date"
											pattern="dd/MM/yyyy" var="theFormattedDate" />
										<form:input type="text" class="form-control"
											path="dateOfBirth" id="dateOfBirthInput"
											placeholder="Date of Birth" value="${theFormattedDate}" required="required"/>
										<form:errors path="dateOfBirth" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="generoInput" class="col-lg-3 control-label">G�nero</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="genero"
											id="generoInput" placeholder="G�nero" required="required"/>
										<form:errors path="genero" cssClass="error" />
									</div>
								</div>

								<div class="form-group">
									<label for="telefonoInput" class="col-lg-3 control-label">Tel�fono</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="telefono"
											id="telefonoInput" placeholder="Tel�fono" required="required"/>
										<form:errors path="telefono" cssClass="error" />
									</div>
								</div>

								<div class="col-lg-9 col-lg-offset-3">

									<button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Enviar</button>
										
											<div id="themodal" class="modal fade" data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>Formulario de registro para postulantes</h3>
												</div>
												<div class="modal-body">
													<p>�Est�s seguro(a)?</p>
													<div class="progress progress-striped active">
														<div id="doitprogress" class="progress-bar"></div>
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn btn-default" data-dismiss="modal">Cerrar</a>
													<input type="submit" value="S�" id="yesbutton"
														class="btn btn-primary" data-loading-text="Guardando.."
														data-complete-text="Finalizado">
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$('#dateOfBirthInput').datepicker();
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