<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />     
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NewsWatch</title>
</head>
<body background="<c:url value="/resources/img/background.png" />">
		<!--Cabeçalho da pagina -->
	<c:import url="../../cabecalho-logado.jsp" />
	
	<!-- Noticias -->
	<c:import url="../../mostra-noticia.jsp"/>
	
	<!-- Comentarios -->
	<div class="container">
	<div class="well">
		<h5>Comentarios</h5>
		<c:import url="comentario.jsp"></c:import>
		<div class="well">
		<form action="comentar">
			<input class="input-large" type="text" name="texto" placeholder="Comente aqui!" />
			<input type="hidden" name="idNoticia" value=${noticia.id} />
			<input type="hidden" name="autor" value="${usuarioLogado.login}" />
			<button id="enviarComentario" class="btn" name="enviarComentario">Comentar</button>		
		</form>
		</div>
	</div>
	</div>
	
	

	<!-- Rodapé -->
	<c:import url="../../rodape.jsp" />
</body>
</html>