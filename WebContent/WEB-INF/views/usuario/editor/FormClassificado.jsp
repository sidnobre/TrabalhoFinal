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
	<c:import url="cabecalho-editor.jsp"></c:import>

	<!-- Formulario -->
	<div class="container" align="center">
	<div class="well">
	<form action="cadastraClassificado" method="post">
		<table>
				<tr>
					<h2>Cadastro de Classificado</h2>
				</tr>
				<tr>
					<td>Título:</td>
					<td><input type="text" name="titulo" /> <form:errors
							path="classificado.titulo" cssStyle="color:red" /></td>
				</tr>
	
				<tr>
					<td>Descrição:</td>
					<td><input type="text" name="texto"> <form:errors
							path="classificado.texto" cssStyle="color:red" /></td>
				</tr>
				
				<tr>
					<td>Telefone: </td>
					<td><input type="text" name="telefone" /> <form:errors
							path="classificado.telefone" cssStyle="color:red" /></td>
				</tr>
				
				<tr>
					<td>Preço:</td>
					<td><input type="number" step="0.01" name="preco" /> <form:errors
							path="classificado.preco" cssStyle="color:red" /></td>
				</tr>
				
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