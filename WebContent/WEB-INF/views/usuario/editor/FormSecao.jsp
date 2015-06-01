<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Editor</title>
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
					Bem vindo, <b>${editorLogado.login}</b>
				</td>
			</tr>
		</table>
		</div>
	<!-- Menu NAVBAR -->
		<div id="nav" class="container" >
		<ul class="nav nav-pills" >
				<li class="active"><a href="home">Home</a></li>
				<li class="active"><a href="cadastro_jornalista">Cadastrar Jornalista</a></li>
				<li class="active"><a href="cadastro_classificado">Cadastrar Classificado</a></li>
				<li class="active"><a href="cadastro_secao">Cadastrar Secao</a></li>
				<li class="active"><a href="logout">Sair</a></li>
				</li>	
		</ul>
	</div>
	<!-- Formulario -->
	<div align="center" class="container">
	<div class="well">
	<form action="cadastraSecao" method="post">
		<table>
			<tr>
				<h2>Cadastro de Seção</h2>
			</tr>
			<tr>
				<td>Titulo:</td>
				<td><input type="text" name="titulo" /> <form:errors
						path="secao.titulo" cssStyle="color:red" /></td>
			</tr>

			<tr>
				<td>Descrição:</td>
				<td><input type="text" name="descricao"> <form:errors
						path="secao.descricao" cssStyle="color:red" /></td>

			<tr>
				<td></td>
				<td><input type="reset" value="Limpar" class="btn btn-danger" />
					<input type="submit" value="Confirmar" class="btn btn-success" />
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	
	<!-- Rodapé -->
	<c:import url="../../rodape.jsp" />
</body>
</html>