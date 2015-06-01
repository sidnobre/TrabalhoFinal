<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
	<!-- Comentarios -->
	
	
	<c:forEach items="${comentarios}" var="comentario">
      <div class="well">	  		
	  		  		
	    		<h6 class="media-heading">${comentario.texto}</h6>
	          	  <p class="text-right">Por ${comentario.autor}</p>
	       
	    </div> 
	  </c:forEach>
