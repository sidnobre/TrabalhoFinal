<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" /> 
<link rel="stylesheet" type="text/javascript" href="<c:url value="/resources/js/bootstrap.js" />" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Jornalista</title>
</head>
<body  background="<c:url value="/resources/img/background.png" />">
	<!--Cabe�alho da pagina -->
	<c:import url="cabecalho-jornalista.jsp"></c:import>
	
	<!-- Formulario -->
	<div class="container" align="center">
	<div class="well">
		<form action="efetuar_cadastro_noticia" method="post">
		<h2>Cadastro de Not�cia</h2>
		<!-- Titulo -->
		<div class="control-group">
		  <label class="control-label" for="titulo">T�tulo</label>
		  <div class="controls">
		    <input id="titulo" name="titulo" type="text" class="inputlg"
		    	style="margin-left: 0px; margin-right: 0px; width: 774px;">
		    <form:errors path="noticia.titulo" cssStyle="color:red" />
		    
		  </div>
		</div>
		
		<!-- Subtitulo-->
		<div class="control-group">
		  <label class="control-label" for="subtitulo">Subt�tulo</label>
		  <div class="controls">
		    <input id="subtitulo" name="subtitulo" type="text" class="inputlg"
		    	style="margin-left: 0px; margin-right: 0px; width: 774px;" >
		    <form:errors path="noticia.subtitulo" cssStyle="color:red" />
		  </div>
		</div>
		<!-- Insere Imagem -->
		<div>
		  <label>Imagem</label>
		  <div>
		     <input type="file" name="file" accept="image/*">
		   </div>
		</div>
		
		<!-- Select Secao -->
		<div class="control-group">
		  <label class="control-label" for="idsecao">Se��o</label>
		  <div class="controls">                    
		     <select id="idsecao" name="idsecao" >
		     	<c:forEach items="${secoes}" var="secao">
		     		<option value=${secao.id}>${secao.titulo}</option>
		     	</c:forEach>
		     </select>
		  </div>
		</div>
		
		<!-- Text area -->
		<div class="control-group">
		  <label class="control-label" for="texto">Texto</label>
		  <div class="controls">                     
		    <textarea id="texto" name="texto" cols="50" rows="10" 
		    	style="margin-left: 0px; margin-right: 0px; width: 774px;"></textarea>
		    <form:errors path="noticia.texto" cssStyle="color:red" />
		  </div>
		</div>
		<input type="hidden" name="autor" value="${jornalistaLogado.login}">
		
		<!-- Button -->
		<div class="control-group">
		  <br>
		  <div class="controls">
		    <button class="btn btn-danger">Limpar</button>
		  
		    <button id="enviarNoticia" name="enviarNoticia" class="btn btn-success">Enviar</button>
		  </div>
		</div>
		</form>
	</div>
	</div>
	<!-- Rodap� -->
	<c:import url="../../rodape.jsp" />
</body>
</html>