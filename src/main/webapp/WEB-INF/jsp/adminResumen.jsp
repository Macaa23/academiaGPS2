<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>Administración, ADYC</title>

<!-- Bootstrap core CSS -->
<link href="bootstrapA/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="bootstrapA/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="bootstrapA/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="bootstrapA/css/sb-admin.css" rel="stylesheet">

</head>

<style>
.thead {
	float: left;
}

.thead th {
	display: block;
}

.tbody {
	float: right;
}

h5 {
	display: block;
	margin-top: 0.67em;
	margin-bottom: 0.67em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}
</style>
<body id="page-top">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar static-top navbar-toggleable-md navbar-inverse bg-inverse">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarExample"
		aria-controls="navbarExample" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#">Administración</a>
	<div class="collapse navbar-collapse" id="navbarExample">
		<ul class="sidebar-nav navbar-nav">
			<li class="nav-item"><a class="nav-link" href="adminIndex.html"><i
					class="fa fa-fw fa-dashboard"></i> Ranking</a></li>
			<li class="nav-item "><a class="nav-link"
				href="adminCursos.html"><i class="fa fa-fw fa-area-chart"></i>
					Situación por curso</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="adminResumen.html"><i class="fa fa-fw fa-table"></i>
					Resumen</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="logout.html"><i
					class="fa fa-fw fa-sign-out"></i> Salir</a></li>
		</ul>
	</div>
	</nav>
	<div class="content-wrapper py-3">

		<div class="container-fluid" id="print">
			<h5 align="center">Estadísticas por curso</h5>
			<table class="table">
				<thead class="thead-inverse">
					<tr>
						<th>#</th>
						<th>Curso</th>
						<th>Preinscritos</th>
						<th>En lista de espera</th>
						<th>Edad promedio</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>${cursos.get(0).getNombre()},${cursos.get(0).getNivel()}</td>
						<td>${pc0}</td>
						<td>${le0}</td>
						<td>${e0}</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>${cursos.get(1).getNombre()},${cursos.get(1).getNivel()}</td>
						<td>${pc1}</td>
						<td>${le1}</td>
						<td>${e1}</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>${cursos.get(2).getNombre()},${cursos.get(2).getNivel()}</td>
						<td>${pc2}</td>
						<td>${le2}</td>
						<td>${e2}</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>${cursos.get(3).getNombre()},${cursos.get(3).getNivel()}</td>
						<td>${pc3}</td>
						<td>${le3}</td>
						<td>${e3}</td>
					</tr>
				</tbody>
			</table>

			<h5 align="center">Otras estadísticas</h5>
			<table class="table">
				<thead class="thead-inverse">
					<tr>
						<th>#</th>
						<th>Título</th>
						<th>Cifra</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Cantidad de cursos</td>
						<td>${cursos.size()}</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Promedio de cursos inscritos por postulante</td>
						<td>${p_curso}</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Promedio de inscritos por curso</td>
						<td>${p_ins}</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>Primera inscripción hecha</td>
						<td>${f_first}</td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td>Última inscripción hecha</td>
						<td>${f_last}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- /.container-fluid -->
		<div class="container-fluid">
			<button id="print" onclick="printContent('print');">Imprimir</button>
		</div>
	</div>
	<!-- /.content-wrapper -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-chevron-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="bootstrapA/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrapA/vendor/tether/tether.min.js"></script>
	<script src="bootstrapA/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="bootstrapA/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="bootstrapA/vendor/chart.js/Chart.min.js"></script>
	<script src="bootstrapA/vendor/datatables/jquery.dataTables.js"></script>
	<script src="bootstrapA/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for this template -->
	<script src="bootstrapA/js/sb-admin.min.js"></script>
</body>
<script>
	function printContent(el) {
		var restorepage = $('body').html();
		var printcontent = $('#' + el).clone();
		$('body').empty().html(printcontent);
		window.print();
		//$('body').html(restorepage);
		location.reload();
	}
</script>
</html>
