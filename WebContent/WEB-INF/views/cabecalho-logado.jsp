<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NewsWatch</title>
</head>
<body background="<c:url value="/resources/img/background.png" />">
		<!--Cabeçalho da pagina -->
	
	<div class="container">
	<div class="well">
		<table>
			<tr height="50">
				<td width="100"></td>
				<td width="600">
				
					<img height="100" src="<c:url value="/resources/img/logo.png" />">
					
				</td><td align="right" width="1000">
					<!-- Bem vindo e Logout -->
					 <font size="2pp">
						Bem vindo, <b>${usuarioLogado.nome}${jornalistaLogado.nome}${editorLogado.nome}</b>
					</font>
				</td>
				<td width="50"></td>
			</tr>
		</table>
		<!-- Menu NAVBAR -->
			<div id="nav" class="container">
				<ul class="nav nav-pills" >
						<li class="active"><a href="home">Home</a></li>
						<li class="active"><a href="classificado">Classificados</a></li>
						 <li class="active">
							<a href=>Seções <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu" >
							<c:forEach items="${secoes}" var="secao">
								<li class="active" ><a href="secao?idsecao=${secao.id}">${secao.titulo}</a></li>
							</c:forEach>
							</ul>
						</li>
						<li class="active"><a href="logout">Sair</a></li>
				</ul>
			</div>
	</div>
	</div>

</body>
</html>