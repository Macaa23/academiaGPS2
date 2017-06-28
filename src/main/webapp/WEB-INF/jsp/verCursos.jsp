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
				<div class="row">
					<div class="col-lg-6">

						<div class="container">
							<h1>
								Click the filter icon <small>(<i
									class="glyphicon glyphicon-filter"></i>)
								</small>
							</h1>
							<div class="row">
								<div class="col-md-6">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">Developers</h3>
											<div class="pull-right">
												<span class="clickable filter" data-toggle="tooltip"
													title="Toggle table filter" data-container="body"> <i
													class="glyphicon glyphicon-filter"></i>
												</span>
											</div>
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
												<tr>
													<td>1</td>
													<td>Kilgore</td>
													<td>Trout</td>
													<td>kilgore</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Bob</td>
													<td>Loblaw</td>
													<td>boblahblah</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Holden</td>
													<td>Caulfield</td>
													<td>penceyreject</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="col-md-6">
									<div class="panel panel-success">
										<div class="panel-heading">
											<h3 class="panel-title">Tasks</h3>
											<div class="pull-right">
												<span class="clickable filter" data-toggle="tooltip"
													title="Toggle table filter" data-container="body"> <i
													class="glyphicon glyphicon-filter"></i>
												</span>
											</div>
										</div>
										<div class="panel-body">
											<input type="text" class="form-control"
												id="task-table-filter" data-action="filter"
												data-filters="#task-table" placeholder="Filter Tasks" />
										</div>
										<table class="table table-hover" id="task-table">
											<thead>
												<tr>
													<th>#</th>
													<th>Task</th>
													<th>Assignee</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Site Wireframes</td>
													<td>John Smith</td>
													<td>in progress</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Mobile Landing Page</td>
													<td>Kilgore Trout</td>
													<td>completed</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Add SEO tags</td>
													<td>Bob Loblaw</td>
													<td>failed qa</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Migrate to Bootstrap 3</td>
													<td>Emily Hoenikker</td>
													<td>in progress</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Update jQuery library</td>
													<td>Holden Caulfield</td>
													<td>deployed</td>
												</tr>
												<tr>
													<td>6</td>
													<td>Issues in IE7</td>
													<td>Jane Doe</td>
													<td>failed qa</td>
												</tr>
												<tr>
													<td>7</td>
													<td>Bugs from Sprint 14</td>
													<td>Kilgore Trout</td>
													<td>completed</td>
												</tr>
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
	</div>

	<script>
		(function() {
			'use strict';
			var $ = jQuery;
			$.fn
					.extend({
						filterTable : function() {
							return this
									.each(function() {
										$(this)
												.on(
														'keyup',
														function(e) {
															$(
																	'.filterTable_no_results')
																	.remove();
															var $this = $(this), search = $this
																	.val()
																	.toLowerCase(), target = $this
																	.attr('data-filters'), $target = $(target), $rows = $target
																	.find('tbody tr');

															if (search == '') {
																$rows.show();
															} else {
																$rows
																		.each(function() {
																			var $this = $(this);
																			$this
																					.text()
																					.toLowerCase()
																					.indexOf(
																							search) === -1 ? $this
																					.hide()
																					: $this
																							.show();
																		})
																if ($target
																		.find(
																				'tbody tr:visible')
																		.size() === 0) {
																	var col_count = $target
																			.find(
																					'tr')
																			.first()
																			.find(
																					'td')
																			.size();
																	var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
																	$target
																			.find(
																					'tbody')
																			.append(
																					no_results);
																}
															}
														});
									});
						}
					});
			$('[data-action="filter"]').filterTable();
		})(jQuery);

		$(function() {
			// attach table filter plugin to inputs
			$('[data-action="filter"]').filterTable();

			$('.container').on('click', '.panel-heading span.filter',
					function(e) {
						var $this = $(this), $panel = $this.parents('.panel');

						$panel.find('.panel-body').slideToggle();
						if ($this.css('display') != 'none') {
							$panel.find('.panel-body input').focus();
						}
					});
			$('[data-toggle="tooltip"]').tooltip();
		})
	</script>

</body>
</html>
