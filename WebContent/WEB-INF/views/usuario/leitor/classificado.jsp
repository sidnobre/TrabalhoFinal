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
<title>Classificados</title>
</head>

<body background="<c:url value="/resources/img/background.png" />">
		<!--Cabeçalho da pagina -->
	<c:if test="${empty usuarioLogado.login and empty jornalistaLogado.login and empty editorLogado.login}">
		<c:import url="../../cabecalho-login.jsp" />
	</c:if>
	<c:if test="${not empty usuarioLogado.login or not empty jornalistaLogado.login or not empty editorLogado.login}">
		<c:import url="../../cabecalho-logado.jsp" />
	</c:if>
	<!-- Classificados -->	
	<c:import url="mostra-classificado.jsp"></c:import>

	
	<!-- Rodapé -->
	<c:import url="../../rodape.jsp" />
</body>
</html>