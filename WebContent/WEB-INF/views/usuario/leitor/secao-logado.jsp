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
	<div class="container">
		<c:forEach items="${noticias}" var="noticia">
		<div class="well">
	      <div class="media">
		  		<!-- Imagem noticia aqui -->
		    	<img class="media-object" width="180px" height="180px" src="">
		  		
		  		<div class="media-body">
		    		<a href="noticia?id=${noticia.id }">
		    			<h4 class="media-heading">${noticia.titulo}</h4>
		    		</a>
		    		<h5 class="media-heading">${noticia.subtitulo}</h5>
		          <p class="text-right">Por ${noticia.autor}</p>
		          <p align="justify">${noticia.texto}</p>
		           
		          <c:if test="${jornalistaLogado.nome==noticia.autor}">
			          <a href="excluirnoticia?id=${noticia.id }" class="btn btn-default">
			          	<span class="glyphicon glyphicon-comment"></span> Excluir
			          </a>
		          </c:if>
		       	</div>  
		    </div>		     
		  </div>
		  </c:forEach>
		</div>
		
	

	<!-- Rodapé -->
	<c:import url="../../rodape.jsp" />
</body>
</html>