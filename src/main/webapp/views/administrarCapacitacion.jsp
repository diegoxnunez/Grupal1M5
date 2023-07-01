<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>APR - Dashboard</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('a[data-target="#deleteModal"]')
								.click(
										function() {
											var deleteId = $(this).data('id');
											var deleteUrl = "${pageContext.request.contextPath}/administrarcapacitacion?a=delete&id="
													+ deleteId;
											$('#deleteLink').attr('href',
													deleteUrl);
										});
					});
</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="snippet/sidebar.jsp"></jsp:include>
		<!-- End Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="snippet/topbar.jsp"></jsp:include>

				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Listado de capacitaciones</h1>
					<p class="mb-4">Listado de todas las capacitaciones del sistema</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Capacitaciones</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered dataTable" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Id</th>
											<th>Nombre</th>
											<th>Detalle</th>
											<th>Acciones</th>

										</tr>
									</thead>

									<tbody>

										<c:forEach var="capacitacion" items="${capacitaciones}">

											<tr>
												<td><c:out value="${capacitacion.getId()}"></c:out></td>
												<td><c:out value="${capacitacion.getName()}"></c:out></td>
												<td><c:out value="${capacitacion.getDetalle()}"></c:out></td>
												<td><a
													href="${pageContext.request.contextPath}/administrarcapacitacion?a=read&id=${capacitacion.getId()}"><i
														class="fa-solid fa-book-open"></i></a> <a
													href="${pageContext.request.contextPath}/administrarcapacitacion?a=edit&id=${capacitacion.getId()}"><i
														class="fa-solid fa-pen-to-square"></i></a> <a href="#"
													data-toggle="modal" data-id="${capacitacion.getId()}"
													data-target="#deleteModal"><i
														class="fa-solid fa-trash-can"></i></a></td>

											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>

			</div>
			<!-- End of Main Content -->

			    <!-- Footer -->
             <jsp:include page="snippet/footer_dos.jsp"></jsp:include>
            <!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Listo para
						salir?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Selecciona logout si quieres cerrar
					sesión.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="logout">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModal">Eliminar capacitacion</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				|
				<div class="modal-body">Seguro quieres borrar esta
					capacitacion?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancelar</button>
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/administrarcapacitacion?a=delete&id="
						id="deleteLink">Borrar</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script
		src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

	<script
		src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Page level custom scripts -->
	<script
		src="https://cdn.jsdelivr.net/gh/Grupo-6-awakelab/cdnjs@v1/datatable.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/sb-admin-2.min.js/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

</body>

</html>