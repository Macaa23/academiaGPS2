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


	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div>
					<h3>Bienvenido(a) al módulo de inscripción de cursos</h3>
					<p>Escoge el curso que te interesa a continuación.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<c:if test="${not empty message}">
							<div class="message orange">${message}</div>
						</c:if>
						<form:form id="myForm" method="post"
							class="bs-example form-horizontal" commandName="course">
							<fieldset>
								<legend>Formulario de inscripción de cursos</legend>
								<div class="form-group">
									<div class="col-lg-9">
										<select name="cursoId">
											<c:forEach items="${cursos}" var="curso">
												<option value="${curso.getId()}">${curso.getNombre()},
													${curso.getNivel()}</option>
											</c:forEach>
										</select>
										<button class="btn btn-primary" data-toggle="modal"
											data-target="#themodal">Inscribir</button>
										<div id="themodal" class="modal fade" data-backdrop="static">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h5>Formulario de inscripción de cursos</h5>
													</div>
													<div class="modal-body">
														<p>Estás seguro(a) de inscribir este curso?</p>
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
