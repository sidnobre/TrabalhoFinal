<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" /> 
</head>
<body background="<c:url value="/resources/img/background.png" />">
	<!--Cabeçalho da pagina -->
	<c:import url="../../cabecalho-login.jsp" />
	
	<!-- Formulario -->
	<div align="center" class="container">
	<div class="well">
	<form action="cadastraLeitor" method="post">
		<h2>Cadastre-se</h2>
		<table background="">
			<tr>
				<td>Nome Completo:</td>
				<td><input name="nome" type="text" tabindex="1" /> <form:errors
						path="leitor.nome" cssStyle="color:red" /></td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input name="email" type="text" tabindex="2"> <form:errors
						path="leitor.email" cssStyle="color:red" /></td>
			</tr>

			<tr>
				<td>Login:</td>
				<td><input name="login" type="text" tabindex="3" /> <form:errors
						path="leitor.login" cssStyle="color:red" /></td>
			</tr>

			<tr>
				<td>Senha:</td>
				<td><input name="senha" type="password" tabindex="4" /> <form:errors
						path="leitor.senha" cssStyle="color:red" /></td>
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