 <%@ include file="includes/header.jsp"  %>
 <%@ include file="includes/navbar.jsp"  %>

	<!-- .CONTAINER -->
	<div class="container">
	
		<!-- ALERT -->
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
		<!-- / ALERT -->

		<div class="row">

			<div class="col-lg-3">
				<h4 class="my-4"><fmt:message key="lista.reproduccion"/></h4>
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

 <%@ include file="includes/footer.jsp"  %>	