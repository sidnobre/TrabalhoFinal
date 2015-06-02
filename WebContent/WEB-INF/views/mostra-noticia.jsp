<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
	<!-- Noticias -->
	<div class="container">
	<c:forEach items="${noticias}" var="noticia">
	<div class="well">
      <div class="media">
	  		<!-- Imagem noticia aqui -->
	    	<img class="media-object" width="180px" height="180px" src="">
	  		
	  		<div class="media-body">
	    		<a href="noticia?id=${noticia.id }">
	    			<h4 class="media-heading">${noticia.titulo}</h4>
	    		</a>
	    		<h5 class="media-heading">${noticia.subtitulo}</h5>
	          <p class="text-right">Por ${noticia.autor}</p>
	          <p align="justify">${noticia.texto}</p>
	           
	          <c:if test="${jornalistaLogado.nome==noticia.autor}">
		          <a href="excluirnoticia?id=${noticia.id }" class="btn btn-default">
		          	<span class="glyphicon glyphicon-comment"></span> Excluir
		          </a>
	          </c:if>
	       </div>  
	    </div> 
	  </div>
	  </c:forEach>
	</div>
