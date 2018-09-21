<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@page import="com.ipartek.formacion.youtube.controller.HomeController"%>
<%@page import="com.ipartek.formacion.youtube.Video"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="en">

<head>

<!-- Comenza todas las URLs desde el href indicado -->
<base href="<%=request.getContextPath()%>/">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Youtube Video Play List</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link
	href="https://blackrockdigital.github.io/startbootstrap-shop-item/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="https://blackrockdigital.github.io/startbootstrap-shop-item/css/shop-item.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/styles.css">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Youtube PlayList</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>


			<%
				String fecha = "";
				String nomUsuario = "";
				String checked = "";
				Cookie[] cookies = request.getCookies();
				
				if(cookies!=null){
				
					for (Cookie c : cookies) {
						if ("cVisita".equals(c.getName())) {
							fecha = URLDecoder.decode(c.getValue(), "UTF-8");
							break;
						}
						
						if("nomUsuario".equals(c.getName())){
							nomUsuario = c.getValue();
							checked = "checked";
							break;
						}
					}
				}
			%>
			<span class="text-warning">Ultima visita <%=fecha%></span>
		
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active text-primary"><c:if test="${empty usuario}">
							<!-- formulario Login -->
							<form action="login" method="post"
								class="form-inline mt-2 mt-md-0">
								<input name="usuario" class="form-control mr-sm-2" type="text"
									placeholder="Nombre Usuario" value="<%= nomUsuario %>" required pattern=".{3,30}">
								<input name="pass" class="form-control mr-sm-2" type="password"
									placeholder="Contraseña" required pattern=".{2,50}">
								<li><input type="checkbox" name="recordar" value="recordar" <%= checked %> > Recordar usuario</li>
								<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Entrar</button>
							</form>
						</c:if> <c:if test="${not empty usuario}">
							<div class="nav-user">
								<i class="fas fa-user">${usuario.nombre}</i> <a
									href="backoffice/index.jsp">Acceder Backoffice</a> <a
									href="logout">Cerrar Session</a>
							</div>


							<!-- formulario Crear Video -->
							<form action="inicio" method="post"
								class="form-inline mt-2 mt-md-0">
								<input name="id" class="form-control mr-sm-2" type="text"
									placeholder="ID 11 caracerteres" title="11 caracteres" required
									pattern=".{11,11}"> <input name="nombre"
									class="form-control mr-sm-2" type="text"
									placeholder="Nombre minimo 2 letras" required
									pattern=".{2,125}">
								<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Añadir</button>
							</form>
						</c:if></li>
				</ul>
			</div>
			
			
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<c:if test="${empty alert}">
    		${alert = null };
    	
    	 </c:if>

		<c:if test="${not empty alert}">
			<div class="container">
				<div class="alert ${alert.tipo} alert-dismissible fade show"
					role="alert">
					<p>${alert.texto}</p>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</c:if>


		<div class="row">

			<div class="col-lg-3">
				<h4 class="my-4">Lista Reproduccion</h4>
				<ul class="list-group">
					<c:forEach items="${videos}" var="v">

						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<a href="inicio?id=${v.id}">${v.nombre}</a> <a
							href="inicio?id=${v.id}&op=<%=HomeController.OP_ELIMINAR%>"><i
								style="color: red;" class="float-right fas fa-trash-alt"></i></a>
						</li>
					</c:forEach>

				</ul>

				<hr>

				<h4 class="my-4">Videos Visualizados</h4>
				<ul class="list-group">


					<c:forEach items="${reproducidos}" var="r">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<a href="?id=${r.id}">${r.nombre}</a>
						</li>

					</c:forEach>


					<c:if test="${not empty reproducidos}">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							<p>*Por favor Inicia Session para guardar tus video
								reproducidos</p>
						</li>
					</c:if>
				</ul>

			</div>

			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div class="card mt-4">

					<iframe id="iframe" width="823" height="415"
						src="https://www.youtube.com/embed/${videoInicio.id}?autoplay=1"
						frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

					<div class="card-body">
						<h3 class="card-title">${videoInicio.nombre}</h3>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque
							facere, soluta. Totam id dolores, sint aperiam sequi pariatur
							praesentium animi perspiciatis molestias iure, ducimus!</p>
						<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
							&#9734;</span> 4.0 stars
					</div>
				</div>
				<!-- /.card -->
				<div class="card card-outline-secondary my-4">
					<div class="card-header">Comentarios</div>
					<div class="card-body">
						<c:forEach items="${videoInicio.comentarios}" var="c">
							<p>${c.comentario}</p>
							<small class="text-muted">Comentario de
								${c.usuario.nombre}</small>
							<hr>
						</c:forEach>

					</div>

					<c:if test="${not empty usuario}">

						<!-- .comentario -->
						<form method="post" action="crearComent">
							<label for="comentario"> Añade un comentario en publico </label>
							<br />
							<textarea name="comentario" id="comentario" rows="5" cols="80"></textarea>
							<input type="hidden" name="idVideoComentario"
								value="${videoInicio.id}">
							<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Comentar</button>
						</form>
					</c:if>

					<!-- /.comentario -->

				</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2017</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-shop-item/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://blackrockdigital.github.io/startbootstrap-shop-item/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>