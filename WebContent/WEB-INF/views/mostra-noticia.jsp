<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
	<!-- Noticias -->
	<div class="container">
	<div class="well">
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
	           
	          <!-- Botao Excluir Teste -->
		        <c:if test="${not empty editorLogado.login}">
		          	<div align="right">
			         <form action="excluirnoticia" method="post">
		          		<input type="hidden" name="login" value="${editorLogado.login}">
		          		<input type="hidden" name="tipo" value="editor">
		          		<input type="hidden" name="autor" value="${noticia.autor}">
		          		<input type="hidden" name="id" value=${noticia.id} />
		          		<button type="submit" class="btn btn-default">
		          			<i class="fa fa-trash-o fa-lg"></i>Excluir
		          		</button>
		          		</form>
			          <p>
			         </div>
		    	  </c:if>
		    	  
		          <c:if test="${jornalistaLogado.login eq noticia.autor}">
		          	<div align="right">
		          		<form action="excluirnoticia" method="post">
		          		<input type="hidden" name="login" value="${jornalistaLogado.login}">
		          		<input type="hidden" name="autor" value="${noticia.autor}">
		          		<input type="hidden" name="id" value=${noticia.id} />
		          		<button type="submit" class="btn btn-default">
		          			<i class="fa fa-trash-o fa-lg"></i>Excluir
		          		</button>
		          		</form>
			          <p>
			         </div>
		    	  </c:if>
	       </div>  
	    </div> 
	  </div>
	  </c:forEach>
	</div>
	</div>