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
<!--Cabeçalho da pagina -->
	<div class="container">
		<table background="<c:url value="/resources/img/header.jpg" />">
			<tr height="100">
				<td width="50"></td>
				<td width="600">
				
					<img height="100" src="<c:url value="/resources/img/logo.png" />">
					
				</td><td align="right" width="1000">
					Bem vindo, <b>${jornalistaLogado.nome}</b>
				</td>
			</tr>
		</table>
		</div>
		<!-- Menu NAVBAR -->
		<div id="nav" class="container" >
		<ul class="nav nav-pills" >
				<li class="active"><a href="home">Home</a></li>
				<li class="active"><a href="jornalista/cadastra_noticia">Cadastrar Noticia</a></li>
				<li class="active"><a href="logout">Sair</a></li>
				</li>	
		</ul>
	</div>	
		
	
	<!-- Formulario -->
	<div class="container" align="center">
	<div class="well">
		<form action="efetuar_cadastro_noticia" method="post">
		<h2>Cadastro de Notícia</h2>
		<!-- Titulo -->
		<div class="control-group">
		  <label class="control-label" for="titulo">Título</label>
		  <div class="controls">
		    <input id="titulo" name="titulo" type="text" class="inputlg">
		    <form:errors path="noticia.titulo" cssStyle="color:red" />
		    
		  </div>
		</div>
		
		<!-- Subtitulo-->
		<div class="control-group">
		  <label class="control-label" for="subtitulo">Subtítulo</label>
		  <div class="controls">
		    <input id="subtitulo" name="subtitulo" type="text" class="inputlg" >
		    <form:errors path="noticia.subtitulo" cssStyle="color:red" />
		  </div>
		</div>
		<!-- Insere Imagem -->
		<div>
		  <label>Imagem</label>
		  <div>
		     <input class="inputlg" type="file" name="imagem" size="50000">
		   </div>
		</div>
		
		<!-- Select Secao -->
		<div class="control-group">
		  <label class="control-label" for="idsecao">Seção</label>
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
		    <textarea id="texto" name="texto" cols="50" rows="10"></textarea>
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
</body>
</html>