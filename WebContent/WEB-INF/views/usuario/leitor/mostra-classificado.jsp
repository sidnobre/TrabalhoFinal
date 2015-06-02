<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/classificado.css" />" />
	<!-- Classificados -->
	<div class="container">
	<div class="well">
	<c:forEach items="${classificados}" var="classificado">
	<div class="col-md-2 column productbox">
	    <div class="producttitle">${classificado.titulo}</div>
	    <div class="productprice"><div class="pull-right"><a href="ofertar?id=${classificado.id}" class="btn btn-danger btn-sm" role="button">Ofertar</a></div><div class="pricetext">R$ ${classificado.preco}</div></div>
	</div>
	  </c:forEach>
	</div>
	</div>
	