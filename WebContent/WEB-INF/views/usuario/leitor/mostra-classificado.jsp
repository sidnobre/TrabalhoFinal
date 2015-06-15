<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/classificado.css" />" />

	<!-- Classificados -->
	<div class="container">
	<div class="well">
	<c:forEach items="${classificados}" var="classificado">
	<div class="col-md-2 column productbox">
	    <div class="producttitle">${classificado.titulo}</div>
	    <div class="productprice">
	    	<b>Descrição: </b>
	    	<p>${classificado.texto}
	    	<p>
	    	<div class="pull-right">
	    		<c:if test="${not empty usuarioLogado.login}">
		    		<form action="ofertar_classificado" method="post">
		    			<div align="right">
	
			    		<input name="valor" type="number" step="0.01" />
			    		<input name="id" type="hidden" value=${classificado.id} />
					 	<input name="melhorOferta" type="hidden" value=${classificado.melhorOferta} />
					 	<input name="autorOferta" type="hidden" value="${usuarioLogado.login}" />

						<input type="submit" value="Ofertar" class="btn btn-success" />
						</div>
		    		</form>
	    		</c:if>
	    	</div>
	    	<div class="pricetext">R$ ${classificado.preco}</div>
	    	<c:if test="${not empty classificado.autorOferta}">
	    	<div>
	       		Melhor Oferta R$ ${classificado.melhorOferta}
	    		<p>Por ${classificado.autorOferta}</p>
	    		Ofertado dia: ${classificado.dataOferta}
	    	</div>
	    	</c:if>
	    	<p>
	    </div>
	</div>
	  </c:forEach>
	</div>
	</div>
	