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