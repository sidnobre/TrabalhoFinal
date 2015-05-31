
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<title>Login</title>
</head>
<body background="<c:url value="/resources/img/background.png" />">
		<!--Cabeçalho da pagina -->
	<div class="container">
		<table background="<c:url value="/resources/img/header.jpg" />">
			<tr height="100">
				<td width="50"></td>
				<td width="600">
				
					<img height="100" src="<c:url value="/resources/img/logo.png" />">
					
				</td><td align="right" width="1000">
				</td>
			</tr><tr>
				<td>
					<img alt="" src="<c:url value="/resources/img/logo.png" />">
					<p>Você não está logado
				</td>
				
				<td></td>
			</tr>
		</table>
	</div>

	<div id="nav" class="container">
	<!-- Menu NAVBAR -->
		<ul class="nav nav-pills" >
				<li class="active"><a href="home">Home</a></li>
				<li class="active"><a href="menu_jornalista" >Menu Jornalista</a></li>
				<li class="active"><a href="menu_editor">Menu Editor</a></li>
				<li class="active" class="dropdown">
					 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					 	Seção
					 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu" >
					<c:forEach items="${secoes}" var="secao">
						<li><a href="#">${secao.titulo}</a></li>
					</c:forEach>
					</ul>
				</li>	
		</ul>
	</div>
	<!-- Formulario -->
	<div align="center">
	 <form action="efetuaLogin" method="post">
				
				<div class="input-group">
					<input type="text" name="login" class="form-control" placeholder="Login" aria-describedby="sizing-addon3"/>
					<p>
					<input type="password" name="senha" class="form-control" placeholder="Senha" aria-describedby="sizing-addon3"/>
				</div>
				<div class="input-group">
					<input type="submit" value="Entrar" class="btn"/>	
					<font size="2">Não tem conta? <a href="cadastrarLeitor">Cadastre-se</a></font>
				 
				</div>
				
	</form>
	</div>
</body>
</html>