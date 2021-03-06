<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.js" />"></script>

		<!--Cabe�alho da pagina -->
	
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
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle"  data-toggle="dropdown">
                            Se��es
                            <b class="caret"></b>
                            </a>                            
                            <ul class="dropdown-menu">
                                <c:forEach items="${secoes}" var="secao">
									<li class="active" ><a href="secao?idsecao=${secao.id}">${secao.titulo}</a></li>
								</c:forEach>
                            </ul>
                        </li>
                        
                        <c:if test="${not empty jornalistaLogado.login}">
							<li class="active"><a href="jornalista/menu_jornalista">Menu Jornalista</a></li>
						</c:if>
						
						<c:if test="${not empty editorLogado.login}">
							<li class="active"><a href="editor/menu_editor">Menu Editor</a></li>
                        </c:if>
                        
                        <li class="active"><a href="logout">Sair</a></li>
                    
				</ul>
			</div>
	</div>
	</div>
