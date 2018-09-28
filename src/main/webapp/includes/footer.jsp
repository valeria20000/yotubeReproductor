<!-- FOOTER-->
<footer class="py-5 bg-dark">

	<div class="container">
		<c:set var="anyo" value="<%=new java.util.Date()%>" />
		<p class="m-0 text-center text-white">
			Copyright &copy; Your Website
			<fmt:formatDate type="both" pattern="yyyy" value="${anyo}" />
		</p>
	</div>

</footer>
<!-- /.FOOTER -->

<!-- Bootstrap core JavaScript -->
	<script src="https://blackrockdigital.github.io/startbootstrap-shop-item/vendor/jquery/jquery.min.js"></script>
	<script src="https://blackrockdigital.github.io/startbootstrap-shop-item/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
	
		function showModalEliminar( idVideo, operacion ){
			console.log('showModalEliminar id=' + idVideo);
			$('#modalEliminar').modal('show');
			var btn = document.getElementById('btnEliminar');
			btn.href = 'inicio?id='+ idVideo + '&op=' + operacion;			
		}
	
	</script>
</body>
</html>