<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">     
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
		        
		        <!-- Botao Excluir Teste -->
		        <c:if test="${not empty editorLogado.login}">
		          	<div align="right">
			          <a href="excluirnoticia?id=${noticia.id}" class="btn btn-default">
			          	<i class="fa fa-trash-o fa-lg"></i>Excluir
			          </a>
			          <p>
			         </div>
		    	  </c:if>
		          <c:if test="${jornalistaLogado.login eq noticia.autor}">
		          	<div align="right">
			          <a href="excluirnoticia?id=${noticia.id}" class="btn btn-default">
			          	<i class="fa fa-trash-o fa-lg"></i>Excluir
			          </a>
			          <p>
			         </div>
		    	  </c:if>
		       	</div>
		    </div>

	    <!-- Comentarios -->	
		<div class="well">
			<h5>Comentarios</h5>
			<c:import url="comentario.jsp"></c:import>
			<div class="well" align="right">
			<form action="comentar_notica?idnotica=${noticia.id}" method="post">
				<textarea id="texto" name="texto" rows="3" placeholder="Comente aqui!" 
					style="margin: 0px 0px 10px; width: 803px; height: 60px;"></textarea>
				
				<input type="hidden" name="idNoticia" value=${noticia.id} />
				<c:if test="${not empty usuarioLogado.login}">
				<input type="hidden" name="autor" value="${usuarioLogado.login}" />
				</c:if>
				
				<c:if test="${not empty jornalistaLogado.login}">
					<input type="hidden" name="autor" value="${jornalistaLogado.login}" />
				</c:if>
				
				<c:if test="${not empty editorLogado.login}">
					<input type="hidden" name="autor" value="${editorLogado.login}" />
				</c:if>
				<p>
				<button id="enviarComentario" class="btn" name="enviarComentario">Comentar</button>		
			</form>
			</div>
		</div>
	
		     
		  </div>
		  </c:forEach>
		</div>
		
	

	<!-- Rodapé -->
	<c:import url="../../rodape.jsp" />
</body>
</html>